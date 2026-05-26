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

export function ObjectDefineProperties3Test001() {
    const regex = /test/gi;
    Object.defineProperties(regex, {
        name: { value: 'testRegex', enumerable: true },
        matchCount: { value: 0, writable: true }
    });
    return [regex.name, regex.test('TEST')]
}

export function ObjectDefineProperties3Test002() {
    const regex = /abc/gim;
    Object.defineProperties(regex, {
        allFlags: {
            get: function() {
                let flags = '';
                if (this.global) flags += 'g';
                if (this.ignoreCase) flags += 'i';
                if (this.multiline) flags += 'm';
                return flags;
            },
            enumerable: true
        }
    });
    return regex.allFlags;
}

export function ObjectDefineProperties3Test003() {
    const promise = new Promise((resolve) => resolve('done'));
    Object.defineProperties(promise, {
        id: { value: 'promise-001', enumerable: true },
        createdAt: { value: Date.now(), enumerable: true }
    });

    return promise.id;
}

export function ObjectDefineProperties3Test004() {
    class Person {
        constructor(name) { this.name = name; }
        greet() { return `Hello, ${this.name}`; }
    }
    const person = new Person('John');
    Object.defineProperties(person, {
        age: { value: 30, writable: true, enumerable: true },
        email: { value: 'john@example.com', enumerable: true }
    });
    return [person.greet(), person.age];
}

export function ObjectDefineProperties3Test005() {
    class Calculator {
        add(a, b) { return a + b; }
    }
    const calc = new Calculator();
    Object.defineProperties(calc, {
        add: {
            get: function() { return 'getter for add'; },
            configurable: true
        }
    });
    return calc.add;
}

export function ObjectDefineProperties3Test006() {
    const obj = {
        nested: {}
    };
    Object.defineProperties(obj.nested, {
        a: { value: 1, enumerable: true },
        b: { value: 2, enumerable: true }
    });
    return [obj.nested.a, obj.nested.b];
}

export function ObjectDefineProperties3Test007() {
    const obj = {
        level1: {
            level2: {
                level3: {}
            }
        }
    };
    Object.defineProperties(obj.level1.level2.level3, {
        deepProp: { value: 'deep-value', enumerable: true }
    });
    return obj.level1.level2.level3.deepProp;
}

export function ObjectDefineProperties3Test008() {
    let errorType, errorMessage;
    try {
        Object.defineProperties(null, { prop: { value: 1 } });
    } catch (e) {
        errorType = e instanceof TypeError;
        errorMessage = e.message;
    }
    return errorType;
}

export function ObjectDefineProperties3Test009() {
    let errorType;
    try {
        Object.defineProperties(undefined, { prop: { value: 1 } });
    } catch (e) {
        errorType = e instanceof TypeError;
    }
    return errorType;
}

export function ObjectDefineProperties3Test010() {
    let numErrorType, strErrorType;
    try {
        Object.defineProperties(42, { prop: { value: 1 } });
    } catch (e) {
        numErrorType = e instanceof TypeError;
    }
    try {
        Object.defineProperties('string', { prop: { value: 1 } });
    } catch (e) {
        strErrorType = e instanceof TypeError;
    }
    return [numErrorType, strErrorType];
}

export function ObjectDefineProperties3Test011() {
    let errorType;
    try {
        Object.defineProperties({}, null);
    } catch (e) {
        errorType = e instanceof TypeError;
    }
    return errorType;
}

export function ObjectDefineProperties3Test012() {
    let errorType;
    try {
        Object.defineProperties({}, undefined);
    } catch (e) {
        errorType = e instanceof TypeError;
    }
    return errorType;
}

export function ObjectDefineProperties3Test013() {
    let errorType;
    try {
        Object.defineProperties({}, {
            prop: { value: 1, get: function() {} }
        });
    } catch (e) {
        errorType = e instanceof TypeError;
    }
    return errorType;
}

export function ObjectDefineProperties3Test014() {
    let errorType;
    try {
        Object.defineProperties({}, {
            prop: { get: 42 }
        });
    } catch (e) {
        errorType = e instanceof TypeError;
    }
    return errorType;
}

export function ObjectDefineProperties3Test015() {
    let errorType;
    try {
        Object.defineProperties({}, {
            prop: { set: 'not a function' }
        });
    } catch (e) {
        errorType = e instanceof TypeError;
    }
    return errorType;
}

export function ObjectDefineProperties3Test016() {
    const obj = {};
    Object.preventExtensions(obj);
    let errorType;
    try {
        Object.defineProperties(obj, { newProp: { value: 1 } });
    } catch (e) {
        errorType = e instanceof TypeError;
    }
    return errorType;
}

export function ObjectDefineProperties3Test017() {
    const obj = { prop: 1 };
    Object.freeze(obj);
    let errorType;
    try {
        Object.defineProperties(obj, { prop: { value: 2 } });
    } catch (e) {
        errorType = e instanceof TypeError;
    }
    return errorType;
}

export function ObjectDefineProperties3Test018() {
    const obj = {};
    Object.defineProperties(obj, {
        prop: { value: 1, configurable: false }
    });
    let errorType;
    try {
        Object.defineProperties(obj, { prop: { value: 2 } });
    } catch (e) {
        errorType = e instanceof TypeError;
    }
    return errorType;
}

export function ObjectDefineProperties3Test019() {
    const obj = {};
    Object.defineProperties(obj, {
        prop: { get: function() { throw new Error('Getter error'); } }
    });
    let errorType, errorMessage;
    try {
        obj.prop;
    } catch (e) {
        errorType = e instanceof Error;
        errorMessage = e.message;
    }
    return [errorType, errorMessage];
}

export function ObjectDefineProperties3Test020() {
    const obj = {};
    Object.defineProperties(obj, {});
    return Object.keys(obj).length;
}

export function ObjectDefineProperties3Test021() {
    const obj = {};
    Object.defineProperties(obj, {
        prop: { value: 1, enumerable: true }
    });
    return [obj.prop, Object.keys(obj)];
}

export function ObjectDefineProperties3Test022() {
    const obj = {};
    const props = {};
    for (let i = 0; i < 1000; i++) {
        props['prop' + i] = { value: i, enumerable: true };
    }
    Object.defineProperties(obj, props);
    return [Object.keys(obj).length, obj.prop999];
}

export function ObjectDefineProperties3Test024() {
    const obj = {};
    Object.defineProperties(obj, {
        '!@#$%^&*()': { value: 1, enumerable: true },
        '中文属性': { value: 2, enumerable: true },
        'emoji 🎉': { value: 3, enumerable: true }
    });
    return [obj['!@#$%^&*()'], obj['中文属性'], obj['emoji 🎉']];
}

export function ObjectDefineProperties3Test027() {
    const obj = {};
    const result = Object.defineProperties(obj, {
        prop: { value: 1 }
    });
    return [result === obj, result.prop];
}

export function ObjectDefineProperties3Test028() {
    const obj = {};
    const result = Object.defineProperties(obj, {
        a: { value: 1, enumerable: true },
        b: { value: 2, enumerable: true },
        c: { value: 3, enumerable: true }
    });
    return [Object.keys(result), result.a, result.b, result.c];
}

export function ObjectDefineProperties3Test029() {
    const obj1 = {};
    const obj2 = {};
    Object.defineProperties(obj1, {
        a: { value: 1, writable: true },
        b: { value: 2, enumerable: true }
    });
    Object.defineProperty(obj2, 'a', { value: 1, writable: true });
    Object.defineProperty(obj2, 'b', { value: 2, enumerable: true });
    return Object.getOwnPropertyDescriptor(obj1, 'a').value ===
    Object.getOwnPropertyDescriptor(obj2, 'a').value;
}

export function ObjectDefineProperties3Test030() {
    const obj1 = {};
    const obj2 = {};
    const props = {};
    for (let i = 0; i < 100; i++) {
        props['prop' + i] = { value: i };
    }
    const start1 = Date.now();
    Object.defineProperties(obj1, props);
    const time1 = Date.now() - start1;
    const start2 = Date.now();
    for (let i = 0; i < 100; i++) {
        Object.defineProperty(obj2, 'prop' + i, { value: i });
    }
    const time2 = Date.now() - start2;

    return [obj1.prop99, obj2.prop99];
}

export function ObjectDefineProperties3Test031() {
    const obj = {};
    Object.defineProperties(obj, {
        prop: { value: 1, writable: true, enumerable: true }
    });
    Object.freeze(obj);
    let errorType, propValue;
    try {
        obj.prop = 2;
    } catch (e) {
        errorType = e instanceof TypeError;
    }
    propValue = obj.prop;
    return [errorType, propValue];
}

export function ObjectDefineProperties3Test032() {
    const obj = {};
    Object.defineProperties(obj, {
        prop: { value: 1, writable: true, enumerable: true }
    });
    Object.seal(obj);
    obj.prop = 2;
    let errorType;
    try {
        Object.defineProperties(obj, { newProp: { value: 3 } });
    } catch (e) {
        errorType = e instanceof TypeError;
    }
    return [obj.prop, errorType];
}

export function ObjectDefineProperties3Test033() {
    const obj = {};
    Object.defineProperties(obj, {
        prop: { value: 1, writable: true, enumerable: true }
    });
    Object.preventExtensions(obj);
    obj.prop = 2;

    let errorType;
    try {
        Object.defineProperties(obj, { newProp: { value: 3 } });
    } catch (e) {
        errorType = e instanceof TypeError;
    }
    return [obj.prop, errorType];
}

export function ObjectDefineProperties3Test034() {
    const obj = {};
    Object.defineProperties(obj, {
        prop1: { value: 1, writable: true, enumerable: true, configurable: true },
        prop2: { get: function() { return 2; }, enumerable: true }
    });
    const desc1 = Object.getOwnPropertyDescriptor(obj, 'prop1');
    const desc2 = Object.getOwnPropertyDescriptor(obj, 'prop2');
    return [
        desc1.value, desc1.writable, desc1.enumerable, desc1.configurable,
        typeof desc2.get, desc2.enumerable, desc2.configurable
    ];
}

export function ObjectDefineProperties3Test035() {
    const obj = {};
    Object.defineProperties(obj, {
        a: { value: 1, enumerable: true },
        b: { value: 2, enumerable: true },
        c: { get: function() { return 3; } }
    });
    const descriptors = Object.getOwnPropertyDescriptors(obj);
    return [
        Object.keys(descriptors),
        descriptors.a.value,
        typeof descriptors.c.get
    ];
}

export function ObjectDefineProperties3Test036() {
    const source = {};
    Object.defineProperties(source, {
        a: { value: 1, enumerable: true },
        b: { value: 2, enumerable: true },
        hidden: { value: 'secret', enumerable: false }
    });
    const target = {};
    Object.assign(target, source);
    return [target.a, target.b, target.hidden];
}

export function ObjectDefineProperties3Test037() {
    const proto = {};
    Object.defineProperties(proto, {
        method: {
            value: function() { return 'proto method'; },
            enumerable: true
        },
        accessor: {
            get: function() { return 'proto accessor'; },
            enumerable: true
        }
    });
    const child = Object.create(proto);
    return [child.method(), child.accessor];
}

export function ObjectDefineProperties3Test038() {
    const obj = {};
    Object.defineProperties(obj, {
        prop: { value: 1, writable: false }
    });
    let errorType;
    try {
        obj.prop = 2;
    } catch (e) {
        errorType = e instanceof TypeError;
    }
    return errorType;
}

export function ObjectDefineProperties3Test039() {
    const obj = {};
    Object.defineProperties(obj, {
        prop: { value: 1, writable: false }
    });

    return obj.prop;
}

export function ObjectDefineProperties3Test040() {
    const obj = {};
    Object.defineProperties(obj, {
        prop: { value: 1, configurable: false }
    });
    let errorType;
    try {
        delete obj.prop;
    } catch (e) {
        errorType = e instanceof TypeError;
    }
    return errorType;
}

export function ObjectDefineProperties3Test042() {
    const obj = {};
    Object.defineProperties(obj, {
        self: { value: obj, enumerable: true }
    });
    return [obj.self === obj, obj.self.self === obj];
}

export function ObjectDefineProperties3Test043() {
    const obj = {};
    Object.defineProperties(obj, {
        self: {
            get: function() { return this; },
            enumerable: true
        }
    });
    return [obj.self === obj, obj.self.self === obj];
}

export function ObjectDefineProperties3Test044() {
    const obj = {};
    Object.defineProperties(obj, {
        _a: { value: 0, writable: true },
        _b: { value: 0, writable: true },
        a: {
            get: function() { return this._a; },
            set: function(v) { this._a = v; this.b = v; },
            enumerable: true
        },
        b: {
            get: function() { return this._b; },
            set: function(v) { this._b = v; },
            enumerable: true
        }
    });
    obj.a = 10;
    const firstSet = [obj.a, obj.b];
    obj.b = 20;
    const secondSet = [obj.a, obj.b];
    return [firstSet, secondSet];
}
