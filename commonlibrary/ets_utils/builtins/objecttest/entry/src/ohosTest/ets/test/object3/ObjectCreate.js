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

export function ObjectCreateTest001() {
    const obj = Object.create(null);

    let a = Object.getPrototypeOf(obj);
    let b = obj.toString;
    return [a, b];
}

export function ObjectCreateTest002() {
    const obj = Object.create(Object.prototype);
    const protoCheck = Object.getPrototypeOf(obj) === Object.prototype;
    const toStringType = typeof obj.toString;

    return [protoCheck, toStringType];
}

export function ObjectCreateTest003() {
    const proto = { name: 'prototype', greet() { return 'Hello'; } };
    const obj = Object.create(proto);
    const nameVal = obj.name;
    const greetVal = obj.greet();

    return [nameVal, greetVal];
}

export function ObjectCreateTest004() {
    const obj = Object.create({});
    const typeVal = typeof obj;
    const instanceCheck = obj instanceof Object;

    return [typeVal, instanceCheck];
}

export function ObjectCreateTest005() {
    const proto = {};
    const obj = Object.create(proto);
    const isProtoOf = proto.isPrototypeOf(obj);
    const getProtoCheck = Object.getPrototypeOf(obj) === proto;

    return [isProtoOf, getProtoCheck];
}

export function ObjectCreateTest006() {
    const proto = {};
    const obj1 = Object.create(proto);
    const obj2 = Object.create(proto);
    const objNotEqual = obj1 !== obj2;
    const protoEqual = Object.getPrototypeOf(obj1) === Object.getPrototypeOf(obj2);

    return [objNotEqual, protoEqual];
}

export function ObjectCreateTest007() {
    const proto = { a: 1, b: 2, method() { return this.a + this.b; } };
    const obj = Object.create(proto);
    const aVal = obj.a;
    const methodVal = obj.method();

    return [aVal, methodVal];
}

export function ObjectCreateTest008() {
    const obj = Object.create(Function.prototype);
    const callType = typeof obj.call;
    const applyType = typeof obj.apply;

    return [callType, applyType];
}

export function ObjectCreateTest009() {
    const obj = Object.create(Array.prototype);
    const pushType = typeof obj.push;
    const popType = typeof obj.pop;

    return [pushType, popType];
}

export function ObjectCreateTest010() {
    function Person(name) { this.name = name; }
    Person.prototype.greet = function() { return 'Hi, ' + this.name; };
    const obj = Object.create(Person.prototype);
    Person.call(obj, 'John');
    const greetVal = obj.greet();

    return greetVal;
}

export function ObjectCreateTest011() {
    const dateObj = Object.create(Date.prototype);
    const dateInstance = dateObj instanceof Date;
    const regexObj = Object.create(RegExp.prototype);
    const regexInstance = regexObj instanceof RegExp;

    return [dateInstance, regexInstance];
}

export function ObjectCreateTest012() {
    const obj = Object.create(null);
    const hasToString = 'toString' in obj;
    const hasHasOwnProp = 'hasOwnProperty' in obj;
    const keys = Object.keys(obj);

    return [hasToString, hasHasOwnProp, keys];
}

export function ObjectCreateTest013() {
    const obj = Object.create(null);
    obj.a = 1;
    obj.b = 2;
    const aVal = obj.a;
    const hasOwnProp = obj.hasOwnProperty;

    return [aVal, hasOwnProp];
}

export function ObjectCreateTest014() {
    const obj = Object.create(null);
    obj.name = 'test';
    obj.value = 123;
    const str = JSON.stringify(obj);

    return str;
}

export function ObjectCreateTest015() {
    let typeError = false;
    let errorMsg = '';
    try {
        const obj = Object.create(42);
    } catch (e) {
        typeError = e instanceof TypeError;
        errorMsg = e.name;

    }
    return [typeError, errorMsg];
}

export function ObjectCreateTest016() {
    let typeError = false;
    try {
        const obj = Object.create("proto");
    } catch (e) {
        typeError = e instanceof TypeError;
    }
    return typeError;
}

export function ObjectCreateTest017() {
    let typeError = false;
    try {
        const obj = Object.create(true);
    } catch (e) {
        typeError = e instanceof TypeError;
    }
    return typeError;
}

export function ObjectCreateTest018() {
    let typeError = false;
    try {
        const obj = Object.create(undefined);
    } catch (e) {
        typeError = e instanceof TypeError;
    }
    return typeError;
}

export function ObjectCreateTest019() {
    let typeError = false;
    try {
        const obj = Object.create(Symbol('test'));
    } catch (e) {
        typeError = e instanceof TypeError;
    }
    return typeError;
}

export function ObjectCreateTest020() {
    const obj = Object.create({}, {
        name: {
            value: 'John',
            writable: true,
            enumerable: true,
            configurable: true
        }
    });
    const nameVal = obj.name;
    return nameVal;
}

export function ObjectCreateTest021() {
    let fullName = 'John Doe';
    const obj = Object.create({}, {
        fullName: {
            get() { return fullName; },
            set(value) { fullName = value; },
            enumerable: true,
            configurable: true
        }
    });
    const initialVal = obj.fullName;
    obj.fullName = 'Jane Smith';
    const modifiedVal = obj.fullName;

    return [initialVal, modifiedVal];
}

export function ObjectCreateTest022() {
    const obj = Object.create({}, {
        a: { value: 1, writable: true },
        b: { value: 2, writable: true },
        c: { value: 3, writable: true }
    });
    const vals = [obj.a, obj.b, obj.c];

    return vals;
}

export function ObjectCreateTest023() {
    const obj = Object.create({}, {
        readonly: {
            value: 'immutable',
            writable: false
        }
    });
    try {
        obj.readonly = 'changed';
    } catch (error) {
        const readonlyVal = obj.readonly;
        return [readonlyVal, error.name];
    }
}


export function ObjectCreateTest024() {
    const obj = Object.create({}, {
        visible: { value: 1, enumerable: true },
        hidden: { value: 2, enumerable: false }
    });
    const keys = Object.keys(obj);
    const hasHidden = 'hidden' in obj;

    return [keys, hasHidden];
}


export function ObjectCreateTest025() {
    const obj = Object.create({}, {
        fixed: {
            value: 'unchangeable',
            configurable: false
        }
    });
    try {
        delete obj.fixed;
    } catch (err) {
        const error = err.name;
    }
    const fixedVal = obj.fixed;
    return fixedVal;
}


export function ObjectCreateTest026() {
    const obj = Object.create({}, {
        prop: { value: 'test' }
    });
    const desc = Object.getOwnPropertyDescriptor(obj, 'prop');
    const writable = desc.writable;
    const enumerable = desc.enumerable;
    const configurable = desc.configurable;

    return [writable, enumerable, configurable];
}

export function ObjectCreateTest027() {
    const obj = Object.create({}, {
        undef: { value: undefined, writable: true }
    });
    const undefVal = obj.undef;
    const hasUndef = 'undef' in obj;

    return [undefVal, hasUndef];
}

export function ObjectCreateTest028() {
    const sym = Symbol('key');
    const obj = Object.create({}, {
        [sym]: { value: 'symbol value', writable: true }
    });
    const symVal = obj[sym];

    return symVal;
}

export function ObjectCreateTest029() {
    const obj = Object.create({}, {});
    const keyLength = Object.keys(obj).length;

    return keyLength;
}

export function ObjectCreateTest030() {
    const obj = Object.create({}, {
        prop: {
            value: 'test',
            custom: 'ignored',
            writable: true
        }
    });
    const propVal = obj.prop;

    return propVal;
}

export function ObjectCreateTest031() {
    const obj = Object.create(Object.prototype);
    const hasOwnPropEqual = obj.hasOwnProperty === Object.prototype.hasOwnProperty;
    const toStringEqual = obj.toString === Object.prototype.toString;

    return [hasOwnPropEqual, toStringEqual];
}

export function ObjectCreateTest032() {
    Object.prototype.customMethod = function() { return 'custom'; };
    const obj = Object.create(Object.prototype);
    const customVal = obj.customMethod();

    delete Object.prototype.customMethod;
    return customVal;
}

export function ObjectCreateTest033() {
    const grandProto = { level: 'grand' };
    const parentProto = Object.create(grandProto);
    parentProto.level = 'parent';
    const obj = Object.create(parentProto);
    const objLevel = obj.level;
    const protoLevel = Object.getPrototypeOf(obj).level;

    return [objLevel, protoLevel];
}

export function ObjectCreateTest034() {
    const proto = {
        method1() { return 'method1'; },
        method2() { return 'method2'; },
        getValue() { return this.value; }
    };
    const obj = Object.create(proto);
    obj.value = 100;
    const method1Val = obj.method1();
    const getValueVal = obj.getValue();

    return [method1Val, getValueVal];
}

export function ObjectCreateTest035() {
    let storedValue = 'initial';
    const proto = {
        get accessor() { return storedValue; },
        set accessor(value) { storedValue = value; }
    };
    const obj = Object.create(proto);
    const initialVal = obj.accessor;
    obj.accessor = 'modified';
    const modifiedVal = obj.accessor;

    return [initialVal, modifiedVal];
}

export function ObjectCreateTest036() {
    const sym = Symbol('protoSymbol');
    const proto = {
        [sym]: 'symbol value'
    };
    const obj = Object.create(proto);
    const symVal = obj[sym];

    return symVal;
}

export function ObjectCreateTest037() {
    const proto = Object.freeze({ a: 1 });
    const obj = Object.create(proto);
    const initialA = obj.a;

    try {
        obj.a = 2;
    } catch (error) {
        const modifiedA = obj.a;
        return [initialA, modifiedA];
    }

}

export function ObjectCreateTest038() {
    const proto = Object.seal({ a: 1 });
    const obj = Object.create(proto);
    obj.a = 2;
    const objA = obj.a;
    const protoA = proto.a;

    return [objA, protoA];
}

export function ObjectCreateTest039() {
    const proto = Object.preventExtensions({ a: 1 });
    const obj = Object.create(proto);
    const aVal = obj.a;

    return aVal;
}

export function ObjectCreateTest040() {
    const proto = new Uint8Array([1, 2, 3]);
    const obj = Object.create(proto);

    return obj[0];
}

export function ObjectCreateTest041() {
    const proto = [1, 2, 3];
    proto.customMethod = function() { return this.length; };
    const obj = Object.create(proto);
    const idx0 = obj[0];
    const customVal = obj.customMethod();

    return [idx0, customVal];
}

export function ObjectCreateTest042() {
    const proto = { a: 1, b: 2 };
    const obj = Object.create(proto);
    obj.c = 3;
    const aVal = obj.a;
    const bVal = obj.b;
    const cVal = obj.c;

    return [aVal, bVal, cVal];
}

export function ObjectCreateTest043() {
    const proto = { value: 100 };
    const obj = Object.create(proto);
    const initialVal = obj.value;
    obj.value = 200;
    const modifiedVal = obj.value;
    const protoVal = proto.value;

    return [initialVal, modifiedVal, protoVal];
}

export function ObjectCreateTest044() {
    const proto = { value: 100 };
    const obj = Object.create(proto);
    obj.value = 200;
    const modifiedVal = obj.value;
    delete obj.value;
    const restoredVal = obj.value;

    return [modifiedVal, restoredVal];
}

export function ObjectCreateTest045() {
    const grandProto = { level: 1 };
    const parentProto = Object.create(grandProto);
    parentProto.level = 2;
    const obj = Object.create(parentProto);
    const initialLevel = obj.level;
    delete parentProto.level;
    const restoredLevel = obj.level;

    return [initialLevel, restoredLevel];
}

export function ObjectCreateTest046() {
    function Animal() {}
    const obj = Object.create(Animal.prototype);
    const isAnimal = obj instanceof Animal;
    const isObject = obj instanceof Object;

    return [isAnimal, isObject];
}

export function ObjectCreateTest047() {
    const proto = {};
    const obj = Object.create(proto);
    const protoIsProto = proto.isPrototypeOf(obj);
    const objectProtoIsProto = Object.prototype.isPrototypeOf(obj);
    const objIsProto = obj.isPrototypeOf(proto);

    return [protoIsProto, objectProtoIsProto, objIsProto];
}

export function ObjectCreateTest048() {
    const proto = { a: 1 };
    const obj = Object.create(proto);
    const protoEqual = Object.getPrototypeOf(obj) === proto;
    const protoA = Object.getPrototypeOf(obj).a;

    return [protoEqual, protoA];
}

export function ObjectCreateTest049() {
    function Parent() { this.parentProp = 'parent'; }
    Parent.prototype.parentMethod = function() { return 'parent method'; };

    function Child() {
        Parent.call(this);
        this.childProp = 'child';
    }
    Child.prototype = Object.create(Parent.prototype);
    Child.prototype.constructor = Child;

    const child = new Child();
    const parentProp = child.parentProp;
    const childProp = child.childProp;
    const parentMethodVal = child.parentMethod();

    return [parentProp, childProp, parentMethodVal];
}

export function ObjectCreateTest050() {
    function Base() {}
    Base.prototype.baseMethod = function() { return 'base'; };

    function Derived() {}
    Derived.prototype = Object.create(Base.prototype, {
        constructor: {
            value: Derived,
            enumerable: false,
            writable: true,
            configurable: true
        },
        derivedProp: {
            value: 'derived',
            writable: true
        }
    });

    const obj = new Derived();
    const baseMethodVal = obj.baseMethod();
    const derivedPropVal = obj.derivedProp;

    return [baseMethodVal, derivedPropVal];
}

export function ObjectCreateTest051() {
    const animal = {
        speak() { return 'Animal speaks'; }
    };

    const dog = Object.create(animal);
    dog.speak = function() { return 'Dog barks'; };

    const cat = Object.create(animal);
    cat.speak = function() { return 'Cat meows'; };

    const dogSpeak = dog.speak();
    const catSpeak = cat.speak();
    const animalSpeak = animal.speak();

    return [dogSpeak, catSpeak, animalSpeak];
}

export function ObjectCreateTest052() {
    const proto = { value: 1 };
    const obj1 = Object.create(proto);
    const obj2 = Object.create(proto);
    proto.value = 2;
    const obj1Val = obj1.value;
    const obj2Val = obj2.value;

    return [obj1Val, obj2Val];
}

export function ObjectCreateTest053() {
    const proto = { a: 1 };
    const obj = Object.create(proto);
    proto.b = 2;
    const bVal = obj.b;

    return bVal;
}


export function ObjectCreateTest054() {
    const obj = Object.create({ a: 1 });
    const initialA = obj.a;
    Object.setPrototypeOf(obj, { b: 2 });
    const modifiedA = obj.a;
    const modifiedB = obj.b;

    return [initialA, modifiedA, modifiedB];
}

export function ObjectCreateTest055() {
    const proto = { a: undefined, b: 1 };
    const obj = Object.create(proto);
    const aVal = obj.a;
    const hasA = 'a' in obj;

    return [aVal, hasA];
}

export function ObjectCreateTest056() {
    const proto = { a: null, b: 1 };
    const obj = Object.create(proto);
    const aVal = obj.a;
    const bVal = obj.b;

    return [aVal, bVal];
}

export function ObjectCreateTest057() {
    const proto = { a: NaN, b: 1 };
    const obj = Object.create(proto);
    const isNaNVal = Number.isNaN(obj.a);

    return isNaNVal;
}

export function ObjectCreateTest058() {
    const proto = { a: Infinity, b: -Infinity };
    const obj = Object.create(proto);
    const aVal = obj.a;
    const bVal = obj.b;

    return [aVal, bVal];
}

export function ObjectCreateTest059() {
    const proto = { empty: '', normal: 'test' };
    const obj = Object.create(proto);
    const emptyVal = obj.empty;
    const emptyLength = obj.empty.length;

    return [emptyVal, emptyLength];
}

export function ObjectCreateTest060() {
    const proto = {
        special: '!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~',
        unicode: '👆👀💯'
    };
    const obj = Object.create(proto);
    const specialVal = obj.special;
    const unicodeVal = obj.unicode;

    return [specialVal, unicodeVal];
}

export function ObjectCreateTest061() {
    const proto = {
        max: Number.MAX_VALUE,
        min: Number.MIN_VALUE
    };
    const obj = Object.create(proto);
    const maxEqual = obj.max === Number.MAX_VALUE;
    const minEqual = obj.min === Number.MIN_VALUE;

    return [maxEqual, minEqual];
}

export function ObjectCreateTest062() {
    const proto = {
        maxSafe: Number.MAX_SAFE_INTEGER,
        minSafe: Number.MIN_SAFE_INTEGER
    };
    const obj = Object.create(proto);
    const maxSafeVal = obj.maxSafe;
    const minSafeVal = obj.minSafe;

    return [maxSafeVal, minSafeVal];
}

export function ObjectCreateTest063() {
    const proto = {
        epsilon: Number.EPSILON,
        value: 2.220446049250313e-16
    };
    const obj = Object.create(proto);
    const epsilonEqual = obj.epsilon === Number.EPSILON;

    return epsilonEqual;
}

export function ObjectCreateTest064() {
    const proto = {
        zero: 0,
        negZero: -0,
        notANumber: NaN
    };
    const obj = Object.create(proto);
    const zeroEqual = Object.is(obj.zero, 0);
    const negZeroEqual = Object.is(obj.negZero, -0);
    const isNaNVal = Number.isNaN(obj.notANumber);

    return [zeroEqual, negZeroEqual, isNaNVal];
}

export function ObjectCreateTest065() {
    const proto = {};
    const obj = Object.create(proto);
    const keyLength = Object.keys(obj).length;
    const protoEqual = Object.getPrototypeOf(obj) === proto;

    return [keyLength, protoEqual];
}

export function ObjectCreateTest067() {
    const proto = {
        level1: {
            level2: {
                level3: {
                    level4: {
                        level5: 'deep'
                    }
                }
            }
        }
    };
    const obj = Object.create(proto);
    const deepVal = obj.level1.level2.level3.level4.level5;

    return deepVal;
}

export function ObjectCreateTest068() {
    const proto = { a: 1 };
    proto.self = proto;
    const obj = Object.create(proto);
    const selfEqual = obj.self === proto;
    const selfSelfEqual = obj.self.self === proto;

    return [selfEqual, selfSelfEqual];
}

export function ObjectCreateTest069() {
    let typeError = false;
    let errorMsg = '';
    try {
        Object.create(42);
    } catch (e) {
        typeError = e instanceof TypeError;
        errorMsg = e.name;
    }
    return [typeError, errorMsg];
}

export function ObjectCreateTest070() {
    let typeError = false;
    try {
        Object.create("invalid");
    } catch (e) {
        typeError = e instanceof TypeError;
    }
    return typeError;
}

export function ObjectCreateTest071() {
    let typeError = false;
    try {
        Object.create(true);
    } catch (e) {
        typeError = e instanceof TypeError;
    }
    return typeError;
}

export function ObjectCreateTest072() {
    let typeError = false;
    try {
        Object.create(undefined);
    } catch (e) {
        typeError = e instanceof TypeError;
    }
    return typeError;
}

export function ObjectCreateTest073() {
    let typeError = false;
    try {
        Object.create(Symbol('test'));
    } catch (e) {
        typeError = e instanceof TypeError;
    }
    return typeError;
}

export function ObjectCreateTest074() {
    let typeError = false;
    try {
        Object.create(BigInt(123));
    } catch (e) {
        typeError = e instanceof TypeError;
    }
    return typeError;
}

export function ObjectCreateTest075() {
    let typeError = false;
    try {
        Object.create({}, {
            prop: 'invalid'
        });
    } catch (e) {
        typeError = e instanceof TypeError;
    }
    return typeError;
}

export function ObjectCreateTest076() {
    let typeError = false;
    try {
        Object.create({}, {
            prop: {
                value: 1,
                get() { return 2; }
            }
        });
    } catch (e) {
        typeError = e instanceof TypeError;
    }
    return typeError;
}

export function ObjectCreateTest077() {
    let typeError = false;
    try {
        Object.create({}, {
            prop: {
                get: 'not a function'
            }
        });
    } catch (e) {
        typeError = e instanceof TypeError;
    }
    return typeError;
}

export function ObjectCreateTest078() {
    const obj = Object.create({}, {
        prop: { value: 1, writable: false }
    });
    let typeError = false;
    try {
        obj.prop = 2;
    } catch (e) {
        typeError = e instanceof TypeError;
    }
    return typeError;
}

export function ObjectCreateTest079() {
    const obj = Object.create({}, {
        prop: { value: 1, configurable: false }
    });
    let typeError = false;
    try {
        delete obj.prop;
    } catch (e) {
        typeError = e instanceof TypeError;
    }
    return typeError;
}

export function ObjectCreateTest080() {
    const obj = Object.create({});
    Object.preventExtensions(obj);
    let typeError = false;
    try {
        obj.newProp = 1;
    } catch (e) {
        typeError = e instanceof TypeError;
    }
    return typeError;
}

export function ObjectCreateTest081() {
    const obj = Object.create({}, {
        prop: { value: 'initial', writable: true }
    });
    obj.prop = 'modified';
    const propVal = obj.prop;
    return propVal;
}

export function ObjectCreateTest082() {
    const obj = Object.create({}, {
        prop: { value: 'immutable', writable: false }
    });
    try {
        obj.prop = 'changed';
    } catch (err) {
        const propVal = obj.prop;
        return propVal;
    }
}

export function ObjectCreateTest083() {
    'use strict';
    const obj = Object.create({}, {
        prop: { value: 'immutable', writable: false }
    });
    let typeError = false;
    try {
        obj.prop = 'changed';
    } catch (e) {
        typeError = e instanceof TypeError;
    }
    return typeError;
}

export function ObjectCreateTest084() {
    const obj = Object.create({}, {
        visible: { value: 1, enumerable: true },
        hidden: { value: 2, enumerable: false }
    });
    const keys = Object.keys(obj);
    let loopKey = '';
    for (let key in obj) loopKey = key;

    return [keys, loopKey];
}

export function ObjectCreateTest085() {
    const obj = Object.create({}, {
        prop: { value: 'value', enumerable: false }
    });
    const propVal = obj.prop;
    const hasKey = Object.keys(obj).includes('prop');
    const hasProp = 'prop' in obj;

    return [propVal, hasKey, hasProp];
}

export function ObjectCreateTest086() {
    const obj = Object.create({}, {
        visible: { value: 1, enumerable: true },
        hidden: { value: 2, enumerable: false }
    });
    const str = JSON.stringify(obj);

    return str;
}


export function ObjectCreateTest087() {
    const obj = Object.create({}, {
        prop: { value: 1, configurable: true, writable: true }
    });
    delete obj.prop;
    const propVal = obj.prop;

    return propVal;
}


export function ObjectCreateTest088() {
    const obj = Object.create({}, {
        prop: { value: 1, configurable: false }
    });
    try {
        delete obj.prop;
    } catch (error) {
        const propVal = obj.prop;
        return propVal;
    }
}


export function ObjectCreateTest089() {
    const obj = Object.create({}, {
        prop: { value: 1, configurable: false, writable: true }
    });
    let typeError = false;
    try {
        Object.defineProperty(obj, 'prop', { enumerable: false });
    } catch (e) {
        typeError = e instanceof TypeError;
    }
    return obj.prop;
}


export function ObjectCreateTest090() {
    const obj = Object.create({}, {
        prop: {
            get() { return 1; },
            configurable: false
        }
    });
    let typeError = false;
    try {
        Object.defineProperty(obj, 'prop', { get() { return 2; } });
    } catch (e) {
        typeError = e instanceof TypeError;
    }
    return typeError;
}


export function ObjectCreateTest091() {
    const obj = Object.create({}, {
        constant: {
            value: 3.14159,
            writable: false,
            configurable: false
        }
    });
    try {
        obj.constant = 2.718;
    } catch (e) {
        let error = e.message;
    }

    try {
        delete obj.constant;
    } catch (e) {
        let error2 = e.message;
    }
    const constantVal = obj.constant;
    return constantVal;
}


export function ObjectCreateTest092() {
    const obj = Object.create({}, {
        prop: {
            value: 1,
            writable: false,
            configurable: true
        }
    });
    delete obj.prop;
    const propVal = obj.prop;
    return propVal;
}


export function ObjectCreateTest093() {
    const obj = Object.create({}, {
        prop: {
            value: 1,
            writable: true,
            configurable: false
        }
    });
    obj.prop = 2;
    const modifiedVal = obj.prop;
    let deleteError = false;
    try {
        delete obj.prop;
    } catch (e) {
        deleteError = e instanceof TypeError;
    }
    const deletedVal = obj.prop;

    return [modifiedVal, deletedVal];
}


export function ObjectCreateTest094() {
    const obj = Object.create({}, {
        prop: {
            value: 1,
            writable: true,
            configurable: true,
            enumerable: true
        }
    });
    obj.prop = 2;
    const modifiedVal = obj.prop;
    delete obj.prop;
    const deletedVal = obj.prop;

    return [modifiedVal, deletedVal];
}


export function ObjectCreateTest095() {
    const obj = Object.create({});
    Object.defineProperty(obj, 'prop', {
        value: 1,
        writable: true
    });
    const propVal = obj.prop;

    return propVal;
}


export function ObjectCreateTest096() {
    const obj = Object.create({}, {
        prop: { value: 1, configurable: true }
    });
    Object.defineProperty(obj, 'prop', { value: 2 });
    const propVal = obj.prop;

    return propVal;
}


export function ObjectCreateTest097() {
    const obj = Object.create({});
    Object.defineProperties(obj, {
        a: { value: 1, writable: true },
        b: { value: 2, writable: true }
    });
    const aVal = obj.a;
    const bVal = obj.b;

    return [aVal, bVal];
}


export function ObjectCreateTest098() {
    const proto = { a: 1 };
    const obj = Object.create(proto);
    const protoEqual = Object.getPrototypeOf(obj) === proto;

    return protoEqual;
}


export function ObjectCreateTest099() {
    const obj = Object.create({ a: 1 });
    const initialA = obj.a;
    Object.setPrototypeOf(obj, { b: 2 });
    const modifiedA = obj.a;
    const modifiedB = obj.b;

    return [initialA, modifiedA, modifiedB];
}
