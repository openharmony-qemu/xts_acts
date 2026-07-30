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

export function ObjectKeys2Test001() {
    const obj = { a: 1 };
    Object.defineProperty(obj, 'b', { value: 2, enumerable: false });

    const keys = Object.keys(obj);
    const ownProps = Object.getOwnPropertyNames(obj);

    let a = keys;
    let b = ownProps;
    return [a, b];
}

export function ObjectKeys2Test002() {
    const obj = { a: 1, [Symbol('s')]: 2 };
    Object.defineProperty(obj, 'b', { value: 3, enumerable: false });

    const keys = Object.keys(obj);
    const ownProps = Object.getOwnPropertyNames(obj);
    const symProps = Object.getOwnPropertySymbols(obj);

    let a = keys;
    let b = ownProps;
    let c = JSON.stringify(symProps);
    return [a, b, c];
}

export function ObjectKeys2Test003() {
    const obj = { a: 1, [Symbol('x')]: 2, b: 3, [Symbol('y')]: 4 };

    const stringKeys = Object.keys(obj);
    const symbolKeys = Object.getOwnPropertySymbols(obj);

    let log1 = stringKeys;
    let log2 = JSON.stringify(symbolKeys);

    const allKeys = [...stringKeys, ...symbolKeys];
    let log3 = allKeys.length;
    return [log1, log2, log3];
}

export function ObjectKeys2Test005() {
    const obj = Object.create({ inherited: 1 });
    obj.own = 2;

    const keys = Object.keys(obj);
    const ownKeysFiltered = keys.filter(key => obj.hasOwnProperty(key));

    let log1 = keys;
    let log2 = ownKeysFiltered;
    return [log1, log2];
}

export function ObjectKeys2Test006() {
    const obj = { a: 1, b: 2 };
    const keys = Object.keys(obj);
    const allEnumerable = keys.every(key => obj.propertyIsEnumerable(key));

    let log1 = allEnumerable;
    return log1;
}

export function ObjectKeys2Test007() {
    const obj = { a: 1, b: 2, c: 3 };
    const keys = Object.keys(obj);
    const jsonStr = JSON.stringify(obj);
    const parsed = JSON.parse(jsonStr);
    const parsedKeys = Object.keys(parsed);

    let log1 = JSON.stringify(keys);
    let log2 = JSON.stringify(parsedKeys);
    return [log1, log2];
}

export function ObjectKeys2Test008() {
    const jsonStr = '{"name":"test","age":18}';
    const obj = JSON.parse(jsonStr);
    let log1 = Object.keys(obj);
    return log1;
}

export function ObjectKeys2Test009() {
    const obj = { a: 1, b: 2, c: 3 };
    let logArr = [];
    Object.keys(obj).forEach(key => {
        logArr.push(`${key}: ${obj[key]}`);
    });
    return logArr;
}

export function ObjectKeys2Test010() {
    const obj = { a: 1, b: 2, c: 3 };
    const upperKeys = Object.keys(obj).map(key => key.toUpperCase());
    let log1 = upperKeys;
    return log1;
}

export function ObjectKeys2Test011() {
    const obj = { a1: 1, a2: 2, b1: 3, b2: 4 };
    const aKeys = Object.keys(obj).filter(key => key.startsWith('a'));
    let log1 = aKeys;
    return log1;
}

export function ObjectKeys2Test012() {
    const obj = { a: 1, b: 2, c: 3 };
    const sum = Object.keys(obj).reduce((acc, key) => acc + obj[key], 0);
    let log1 = sum;
    return log1;
}

export function ObjectKeys2Test013() {
    const obj = { a: 1, b: 2, c: 3 };
    const foundKey = Object.keys(obj).find(key => obj[key] === 2);
    let log1 = foundKey;
    return log1;
}

export function ObjectKeys2Test014() {
    const obj = { a: 1, b: 2, c: 3 };
    const hasEven = Object.keys(obj).some(key => obj[key] % 2 === 0);
    const allPositive = Object.keys(obj).every(key => obj[key] > 0);
    let log1 = hasEven;
    let log2 = allPositive;
    return [log1, log2];
}

export function ObjectKeys2Test015() {
    const obj = {};
    Object.defineProperty(obj, 'a', { value: 1, enumerable: true, configurable: true });
    let log1 = Object.keys(obj);
    return log1;
}

export function ObjectKeys2Test016() {
    const obj = { a: 1 };
    let log1 = Object.keys(obj);

    Object.defineProperty(obj, 'a', { enumerable: false });
    let log2 = Object.keys(obj);

    Object.defineProperty(obj, 'a', { enumerable: true });
    let log3 = Object.keys(obj);
    return [log1, log2, log3];
}

export function ObjectKeys2Test017() {
    const obj = {};
    Object.defineProperties(obj, {
        a: { value: 1, enumerable: true },
        b: { value: 2, enumerable: true },
        c: { value: 3, enumerable: false }
    });
    let log1 = Object.keys(obj);
    return log1;
}

export function ObjectKeys2Test018() {
    const obj = Object.create(null, {
        a: { value: 1, enumerable: true },
        b: { value: 2, enumerable: false }
    });
    let log1 = Object.keys(obj);
    return log1;
}

export function ObjectKeys2Test019() {
    const target = { a: 1 };
    const source1 = { b: 2 };
    const source2 = { c: 3 };
    const result = Object.assign(target, source1, source2);
    let log1 = Object.keys(result);
    return log1;
}

export function ObjectKeys2Test020() {
    const target = { a: 1, b: 2 };
    const source = { b: 3, c: 4 };
    const result = Object.assign(target, source);
    let log1 = Object.keys(result);
    return log1;
}

export function ObjectKeys2Test021() {
    const obj = { a: 1, b: 2, c: 3 };
    const [first, second] = Object.keys(obj);
    let log1 = first;
    let log2 = second;
    return [log1, log2];
}

export function ObjectKeys2Test022() {
    const obj = { a: 1, b: 2 };
    const newObj = { ...obj, c: 3 };
    let log1 = Object.keys(newObj);
    return log1;
}

export function ObjectKeys2Test024() {
    const str = 'Hello World';
    const subStr = str.substring(0, 5);
    let log1 = Object.keys(subStr);
    return log1;
}

export function ObjectKeys2Test025() {
    const arr = [];
    arr['abc'] = 111;
    arr['aaa'] = 222;
    arr[0] = 'value';
    let log1 = Object.keys(arr);
    return log1;
}

export function ObjectKeys2Test026() {
    const arr = [72, 101, NaN, Infinity, 108, 111];
    let log1 = Object.keys(arr);
    return log1;
}

export function ObjectKeys2Test027() {
    const arr = [72, 'abc', true, null, undefined, 108];
    let log1 = Object.keys(arr);
    return log1;
}

export function ObjectKeys2Test028() {
    const arr = [256, 65536, 32768];
    let log1 = Object.keys(arr);
    return log1;
}

export function ObjectKeys2Test029() {
    const obj = {};
    for (let i = -128; i <= 127; i++) {
        obj[i] = i;
    }
    const keys = Object.keys(obj);
    let log1 = keys.length;
    return log1;
}

export function ObjectKeys2Test030() {
    const obj = {};
    obj[-32768] = 'min';
    obj[0] = 'zero';
    obj[32767] = 'max';
    let log1 = Object.keys(obj);
    return log1;
}

export function ObjectKeys2Test031() {
    const obj = {};
    obj[-2147483648] = 'min';
    obj[2147483647] = 'max';
    let log1 = Object.keys(obj);
    return log1;
}

export function ObjectKeys2Test032() {
    const obj = {};
    obj[-9223372036854775808] = 'min';
    obj[9223372036854775807] = 'max';
    let log1 = Object.keys(obj);
    return log1;
}

export function ObjectKeys2Test033() {
    const obj = {};
    obj[BigInt(0xdecafafecacefade).toString()] = 'big';
    let log1 = Object.keys(obj);
    return log1;
}

export function ObjectKeys2Test034() {
    const obj = { '1e3': 1000, '2.5e-2': 0.025 };
    let log1 = Object.keys(obj);
    return log1;
}

export function ObjectKeys2Test035() {
    const obj = { 'true': 1, 'false': 0 };
    let log1 = Object.keys(obj);
    return log1;
}

export function ObjectKeys2Test036() {
    const obj = { '0': 'zero', 'NaN': 'nan', '': 'empty', 'null': 'null', 'undefined': 'undefined' };
    let log1 = Object.keys(obj);
    return log1;
}

export function ObjectKeys2Test037() {
    const obj = {};
    for (let i = 32; i < 127; i++) {
        obj[String.fromCharCode(i)] = i;
    }
    let log1 = Object.keys(obj).length;
    return log1;
}

export function ObjectKeys2Test038() {
    const specialChars = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
    const obj = {};
    specialChars.split('').forEach(c => obj[c] = c);
    let log1 = Object.keys(obj).length;
    return log1;
}

export function ObjectKeys2Test039() {
    const obj = { '👆': 'up', '👿': 'devil', '👀': 'eyes', '💯': '100' };
    let log1 = Object.keys(obj);
    return log1;
}

export function ObjectKeys2Test040() {
    const obj = { '\ud83d\udc46': 'up', '\ud83d\udc7f': 'devil' };
    let log1 = Object.keys(obj);
    return log1;
}

export function ObjectKeys2Test041() {
    const obj = { '\\a': 'bell', '\\b': 'backspace', '\\n': 'newline', '\\t': 'tab' };
    let log1 = Object.keys(obj);
    return log1;
}

export function ObjectKeys2Test046() {
    const obj = { a: 1, b: 2, c: 3 };
    const keys1 = Object.keys(obj);
    const keys2 = Object.keys(obj);
    const keys3 = Object.keys(obj);

    let log1 = keys1 === keys2;
    let log2 = JSON.stringify(keys1) === JSON.stringify(keys2);
    return [log1, log2];
}

export function ObjectKeys2Test047() {
    const obj = { a: 1, b: 2 };
    obj.a = 100;
    let log1 = Object.keys(obj);
    return log1;
}

export function ObjectKeys2Test048() {
    const obj = { a: 1, b: 2 };
    const keys = Object.keys(obj);
    let log1 = Array.isArray(keys);
    let log2 = keys.constructor === Array;
    return [log1, log2];
}

export function ObjectKeys2Test049() {
    const obj = { a: 1 };
    const keys1 = Object.keys(obj);
    const keys2 = Object.keys(obj);
    let log1 = keys1 !== keys2;
    return log1;
}

export function ObjectKeys2Test050() {
    const obj = { a: 1, b: 2, c: 3 };
    Object.defineProperty(obj, 'd', { value: 4, enumerable: false });
    const keys = Object.keys(obj);
    let log1 = keys.length;
    return log1;
}

export function ObjectKeys2Test051() {
    const obj = { 1: 'a', 2: 'b', name: 'test' };
    const keys = Object.keys(obj);
    const allStrings = keys.every(key => typeof key === 'string');
    let log1 = allStrings;
    return log1;
}

export function ObjectKeys2Test052() {
    const sym = Symbol('key');
    const obj = { [sym]: 1, a: 2 };
    const keys = Object.keys(obj);
    const noSymbols = keys.every(key => typeof key !== 'symbol');
    let log1 = noSymbols;
    return log1;
}

export function ObjectKeys2Test053() {
    const obj = { a: 1, b: 2, c: 3 };
    const keys = Object.keys(obj);
    const uniqueKeys = [...new Set(keys)];
    let log1 = keys.length === uniqueKeys.length;
    return log1;
}

export function ObjectKeys2Test054() {
    const obj = { a: 1, b: 2 };
    const keys = Object.keys(obj);
    keys.push('newKey');
    keys[0] = 'modified';
    let log1 = keys;
    let log2 = Object.keys(obj);
    return [log1, log2];
}

export function ObjectKeys2Test055() {
    const obj = { b: 1, a: 2, c: 3 };
    const keys = Object.keys(obj);
    keys.sort();
    let log1 = keys;
    let log2 = Object.keys(obj);
    return [log1, log2];
}

export function ObjectKeys2Test056() {
    const obj = { a: 1, b: 2, c: 3 };
    const keys = Object.keys(obj);
    keys.splice(0, 1);
    let log1 = keys.length;
    let log2 = Object.keys(obj).length;
    return [log1, log2];
}

export function ObjectKeys2Test058() {
    const obj = { a: 1, b: 2, c: 3 };
    const keys = Object.keys(obj);
    let logForOf = [];
    let logForEach = [];

    for (const key of keys) {
        logForOf.push(key);
    }

    keys.forEach(key => logForEach.push(key));
    return [logForOf, logForEach];
}

export function ObjectKeys2Test059() {
    const keys = Object.keys({});
    let log1 = keys.length;
    let log2 = Array.isArray(keys);
    return [log1, log2];
}

export function ObjectKeys2Test060() {
    const keys = Object.keys([]);
    let log1 = keys.length;
    let log2 = Array.isArray(keys);
    return [log1, log2];
}

export function ObjectKeys2Test061() {
    let log1 = Object.keys(123).length;
    let log2 = Object.keys(NaN).length;
    let log3 = Object.keys(Infinity).length;
    return [log1, log2, log3];
}

export function ObjectKeys2Test062() {
    let log1 = Object.keys(true).length;
    let log2 = Object.keys(false).length;
    return [log1, log2];
}

export function ObjectKeys2Test063() {
    const user = { name: 'John', age: 30, email: 'john@example.com' };
    const propertyCount = Object.keys(user).length;
    let log1 = propertyCount;
    return log1;
}

export function ObjectKeys2Test064() {
    const prices = { apple: 1.5, banana: 0.8, orange: 1.2 };
    const total = Object.keys(prices).reduce((sum, key) => sum + prices[key], 0);
    let log1 = total;
    return log1;
}

export function ObjectKeys2Test065() {
    const data = { id: 1, name: 'test', password: 'secret', token: 'abc' };
    const safeKeys = Object.keys(data).filter(key => !['password', 'token'].includes(key));
    const safeData = {};
    safeKeys.forEach(key => safeData[key] = data[key]);
    let log1 = safeData;
    return log1;
}

export function ObjectKeys2Test066() {
    const oldObj = { oldName1: 1, oldName2: 2 };
    const newObj = {};
    Object.keys(oldObj).forEach(key => {
        newObj[key.replace('old', 'new')] = oldObj[key];
    });
    let log1 = newObj;
    return log1;
}

export function ObjectKeys2Test067() {
    const original = { a: 1, b: { c: 2 } };
    const shallowClone = {};
    Object.keys(original).forEach(key => {
        shallowClone[key] = original[key];
    });
    let log1 = shallowClone;
    let log2 = shallowClone !== original;
    let log3 = shallowClone.b === original.b;
    return [log1, log2, log3];
}

export function ObjectKeys2Test068() {
    const nested = {
        level1: {
            level2: {
                level3: {
                    value: 'deep'
                }
            }
        },
        other: 'test'
    };
    let log1 = Object.keys(nested);
    let log2 = Object.keys(nested.level1);
    let log3 = Object.keys(nested.level1.level2);
    let log4 = Object.keys(nested.level1.level2.level3);
    return [log1, log2, log3, log4];
}

export function ObjectKeys2Test069() {
    const mixed = {
        obj: { a: 1 },
        arr: [1, 2, 3],
        func: () => {},
        num: 123,
        str: 'test',
        bool: true,
        null: null,
        undef: undefined
    };
    let log1 = Object.keys(mixed);
    return log1;
}

export function ObjectKeys2Test070() {
    const obj = { a: 1, b: 2, c: 3 };
    const keys = Object.keys(obj);
    const values = Object.values(obj);
    const entries = Object.entries(obj);

    let logForEach1 = [];
    keys.forEach((key, i) => {
        logForEach1.push(`${key}: ${values[i]}`);
    });

    let logForEach2 = [];
    entries.forEach(([key, value]) => {
        logForEach2.push(`${key}: ${value}`);
    });
    return [logForEach1, logForEach2];
}

export function ObjectKeys2Test071() {
    const obj = { a: 1, b: 2 };
    let logArr = [];
    Object.keys(obj).forEach(key => {
        if (obj.hasOwnProperty(key)) {
            logArr.push(`自有属性: ${key}`);
        }
    });
    return logArr;
}

export function ObjectKeys2Test072() {
    const obj = { a: 1, b: 2 };
    let logArr = [];
    Object.keys(obj).forEach(key => {
        logArr.push(`${key} 可枚举: ${obj.propertyIsEnumerable(key)}`);
    });
    return logArr;
}

export function ObjectKeys2Test073() {
    const isEmpty = (obj) => Object.keys(obj).length === 0;
    let log1 = isEmpty({});
    let log2 = isEmpty({ a: 1 });
    let log3 = isEmpty(Object.create(null));
    return [log1, log2, log3];
}

export function ObjectKeys2Test074() {
    const hasProperties = (obj, count) => Object.keys(obj).length >= count;
    const obj = { a: 1, b: 2, c: 3 };
    let log1 = hasProperties(obj, 2);
    let log2 = hasProperties(obj, 5);
    return [log1, log2];
}

export function ObjectKeys2Test075() {
    const getKeys = (val) => {
        try {
            return Object.keys(val);
        } catch (e) {
            return `Error: ${e.message}`;
        }
    };

    let log1 = getKeys({ a: 1 });
    let log2 = getKeys([1, 2]);
    let log3 = getKeys('str');
    let log4 = getKeys(123);

    return [log1, log2, log3, log4];
}

export function ObjectKeys2Test077() {
    const malicious = {
        __proto__: { injected: 'evil' },
        constructor: { prototype: { hacked: 'bad' } },
        normal: 'safe'
    };
    let log1 = Object.keys(malicious);
    return log1;
}

export function ObjectKeys2Test078() {
    const obj = { a: 1 };
    obj.self = obj;
    let log1 = Object.keys(obj);
    let log2 = obj.self === obj;
    return [log1, log2];
}

export function ObjectKeys2Test079() {
    const obj = {};
    Object.preventExtensions(obj);
    try {
        obj.newProp = 'value';
    } catch (e) {
        // 捕获严格模式下的TypeError
    }
    let log1 = Object.isExtensible(obj);
    return log1;
}

export function ObjectKeys2Test080() {
    const obj = { a: 1, b: 'test' };
    Object.preventExtensions(obj);
    try {
        obj.c = 3;
    } catch (e) {
        // 捕获严格模式下的TypeError
    }
    let log1 = obj.hasOwnProperty('c');
    return log1;
}

export function ObjectKeys2Test081() {
    const obj = { a: { b: 1 } };
    Object.preventExtensions(obj);
    try {
        obj.c = 2;
    } catch (e) {
        // 捕获严格模式下的TypeError
    }
    obj.a.c = 3;
    let log1 = obj.a.c;
    return log1;
}

export function ObjectKeys2Test082() {
    const obj = {};
    let log1 = Object.isExtensible(obj);
    Object.preventExtensions(obj);
    let log2 = Object.isExtensible(obj);
    return [log1, log2];
}

export function ObjectKeys2Test083() {
    const obj = { x: 1 };
    Object.preventExtensions(obj);
    let log1 = Reflect.isExtensible(obj);
    return log1;
}

export function ObjectKeys2Test084() {
    const obj = { a: 1 };
    const result = Object.preventExtensions(obj);
    let log1 = result === obj;
    let log2 = Object.isExtensible(result);
    return [log1, log2];
}

export function ObjectKeys2Test085() {
    const obj = { a: 1 };
    const result = Object.preventExtensions(obj);
    let log1 = result.a;
    try {
        result.b = 2;
    } catch (e) {
        // 捕获严格模式下的TypeError
    }
    return log1;
}

export function ObjectKeys2Test086() {
    const obj = { a: 1, b: 'test', c: [1, 2, 3] };
    const result = Object.preventExtensions(obj);
    let log1 = result.a;
    let log2 = result.b;
    let log3 = result.c;
    return [log1, log2, log3];
}

export function ObjectKeys2Test087() {
    const sym = Symbol('key');
    const obj = { [sym]: 'value', a: 1 };
    const result = Object.preventExtensions(obj);
    let log1 = result[sym];
    return log1;
}

export function ObjectKeys2Test088() {
    const obj = { a: 1, b: 'test', c: [1, 2, 3] };
    const result = Object.preventExtensions(obj);
    let log1 = Object.isExtensible(result);
    return log1;
}

export function ObjectKeys2Test089() {
    const obj = {};
    const result = Object.preventExtensions(obj);
    let log1 = Object.isExtensible(result);
    return log1;
}

export function ObjectKeys2Test090() {
    const sym = Symbol('key');
    const obj = { [sym]: 'value', a: 1 };
    const result = Object.preventExtensions(obj);
    let log1 = result[sym];
    try {
        result[Symbol('new')] = 'new';
    } catch (e) {
        // 捕获严格模式下的TypeError
    }
    return log1;
}

export function ObjectKeys2Test091() {
    const obj = { a: 1, b: () => 'test' };
    const result = Object.preventExtensions(obj);
    let log1 = result.b();
    try {
        result.c = () => 'new';
    } catch (e) {
        // 捕获严格模式下的TypeError
    }
    return log1;
}

export function ObjectKeys2Test092() {
    const proto = { parentProp: 1 };
    const obj = Object.create(proto);
    obj.ownProp = 2;
    Object.preventExtensions(obj);
    try {
        obj.newProp = 3;
    } catch (e) {
        // 捕获严格模式下的TypeError
    }
    let log1 = obj.parentProp;
    return log1;
}

export function ObjectKeys2Test093() {
    const obj = {};
    Object.defineProperty(obj, 'a', { enumerable: false, value: 1 });
    Object.preventExtensions(obj);
    let log1 = obj.a;
    let log2 = null;
    try {
        Object.defineProperty(obj, 'b', { value: 2 });
    } catch (e) {
        log2 = e instanceof TypeError;
    }
    return [log1, log2];
}

export function ObjectKeys2Test094() {
    const obj = { a: undefined, b: null, c: NaN, d: Infinity };
    const result = Object.preventExtensions(obj);
    let log1 = result.a;
    let log2 = result.b;
    let log3 = Number.isNaN(result.c);
    let log4 = result.d;
    return [log1, log2, log3, log4];
}

export function ObjectKeys2Test095() {
    const obj = { buffer: new Uint8Array([72, 101, 108, 108, 111]) };
    const result = Object.preventExtensions(obj);
    let log1 = result.buffer;
    return log1;
}

export function ObjectKeys2Test096() {
    const obj = { map: new Map([['key1', 'value1'], ['key2', { a: 1 }]]) };
    const result = Object.preventExtensions(obj);
    let log1 = result.map.get('key1');
    return log1;
}

export function ObjectKeys2Test097() {
    const obj = { set: new Set([1, 2, 3, 2, 1]) };
    const result = Object.preventExtensions(obj);
    let log1 = result.set.size;
    return log1;
}

export function ObjectKeys2Test098() {
    const obj = { promise: new Promise((resolve) => resolve('done')) };
    const result = Object.preventExtensions(obj);
    let log1 = result.promise instanceof Promise;
    return log1;
}

export function ObjectKeys2Test099() {
    const obj = { regex: /abc/gi, flags: /def/m };
    const result = Object.preventExtensions(obj);
    let log1 = result.regex.test('ABC');
    return log1;
}