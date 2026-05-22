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

export function ObjectDefinePropertiesTest001() {
    const obj = {};
    Object.defineProperties(obj, { prop: { value: 1 } });
    return obj.prop;
}

export function ObjectDefinePropertiesTest002() {
    const arr = [];
    Object.defineProperties(arr, {
        length: { value: 5, writable: true },
        0: { value: 'test' }
    });
    return arr[0];
}

export function ObjectDefinePropertiesTest003() {
    function fn() {}
    Object.defineProperties(fn, {
        name: { value: 'myFunc', writable: false }
    });
    return fn.name;
}

export function ObjectDefinePropertiesTest004() {
    const date = new Date();
    Object.defineProperties(date, {
        customProp: { value: 123, enumerable: true }
    });
    return date.customProp;
}

export function ObjectDefinePropertiesTest005() {
    const regex = /test/gi;
    Object.defineProperties(regex, {
        customFlag: { value: true, writable: false }
    });
    return regex.customFlag;
}

export function ObjectDefinePropertiesTest006() {
    const map = new Map();
    Object.defineProperties(map, {
        size: { value: 10, writable: false }
    });
    return map.size;
}

export function ObjectDefinePropertiesTest007() {
    const set = new Set();
    Object.defineProperties(set, {
        customProp: { value: 'test' }
    });
    return set.customProp;
}

export function ObjectDefinePropertiesTest008() {
    const uint8 = new Uint8Array([1, 2, 3]);
    Object.defineProperties(uint8, {
        customProp: { value: 255, writable: true }
    });
    return uint8.customProp;
}

export function ObjectDefinePropertiesTest009() {
    const buffer = new ArrayBuffer(16);
    Object.defineProperties(buffer, {
        customProp: { value: 'buffer' }
    });
    return buffer.customProp;
}

export function ObjectDefinePropertiesTest010() {
    const view = new DataView(new ArrayBuffer(16));
    Object.defineProperties(view, {
        customProp: { value: 100 }
    });
    return view.customProp;
}

export function ObjectDefinePropertiesTest011() {
    const promise = new Promise((resolve) => resolve('done'));
    Object.defineProperties(promise, {
        customProp: { value: 'promise-value' }
    });
    return promise.customProp;
}

export function ObjectDefinePropertiesTest012() {
    try {
        Object.defineProperties(null, { prop: { value: 1 } });
    } catch (e) {
        return e instanceof TypeError;
    }
}

export function ObjectDefinePropertiesTest013() {
    try {
        Object.defineProperties(undefined, { prop: { value: 1 } });
    } catch (e) {
        return e instanceof TypeError;
    }
}

export function ObjectDefinePropertiesTest014() {
    try {
        Object.defineProperties(42, { prop: { value: 1 } });
    } catch (e) {
        return e instanceof TypeError;
    }
}

export function ObjectDefinePropertiesTest015() {
    try {
        Object.defineProperties('test', { prop: { value: 1 } });
    } catch (e) {
        return e instanceof TypeError;
    }
}

export function ObjectDefinePropertiesTest016() {
    try {
        Object.defineProperties(true, { prop: { value: 1 } });
    } catch (e) {
        return e instanceof TypeError;
    }
}

export function ObjectDefinePropertiesTest017() {
    try {
        Object.defineProperties(Symbol('test'), { prop: { value: 1 } });
    } catch (e) {
        return e instanceof TypeError;
    }
}

export function ObjectDefinePropertiesTest018() {
    try {
        Object.defineProperties(123n, { prop: { value: 1 } });
    } catch (e) {
        return e instanceof TypeError;
    }
}

export function ObjectDefinePropertiesTest019() {
    const frozen = Object.freeze({ a: 1 });
    try {
        Object.defineProperties(frozen, { b: { value: 2 } });
    } catch (e) {
        return e instanceof TypeError;
    }
}

export function ObjectDefinePropertiesTest020() {
    const sealed = Object.seal({ a: 1 });
    try {
        Object.defineProperties(sealed, { a: { value: 2 } });
        return sealed.a;
    } catch (e) {
        return 'Cannot add new property to sealed object';
    }
}

export function ObjectDefinePropertiesTest021() {
    const obj = {};
    Object.preventExtensions(obj);
    try {
        Object.defineProperties(obj, { newProp: { value: 1 } });
    } catch (e) {
        return e instanceof TypeError;
    }
}

export function ObjectDefinePropertiesTest022() {
    const proto = { inherited: 1 };
    const obj = Object.create(proto);
    Object.defineProperties(obj, { own: { value: 2 } });
    return [obj.own, obj.inherited];
}

export function ObjectDefinePropertiesTest023() {
    const obj = {};
    Object.defineProperties(obj, {
        a: { value: 1, enumerable: true },
        b: { value: 2, enumerable: true }
    });
    return [obj.a, obj.b];
}

export function ObjectDefinePropertiesTest024() {
    const obj = {};
    try {
        Object.defineProperties(obj, null);
    } catch (e) {
        return e instanceof TypeError;
    }
}

export function ObjectDefinePropertiesTest025() {
    const obj = {};
    try {
        Object.defineProperties(obj, undefined);
    } catch (e) {
        return e instanceof TypeError;
    }
}

export function ObjectDefinePropertiesTest026() {
    const obj = {};
    Object.defineProperties(obj, 42);
    return Object.keys(obj).length;
}

export function ObjectDefinePropertiesTest029() {
    const obj = {};
    Object.defineProperties(obj, {});
    return Object.keys(obj).length;
}

export function ObjectDefinePropertiesTest030() {
    const obj = {};
    const sym = Symbol('key');
    Object.defineProperties(obj, {
        [sym]: { value: 'sym-value' },
        normal: { value: 'normal-value' }
    });
    return [obj[sym], obj.normal];
}

export function ObjectDefinePropertiesTest031() {
    const obj = {};
    const propsProto = { inherited: { value: 1 } };
    const props = Object.create(propsProto);
    props.own = { value: 2 };
    Object.defineProperties(obj, props);
    return [obj.inherited, obj.own];
}

export function ObjectDefinePropertiesTest032() {
    const obj = {};
    let count = 0;
    const props = {
        get a() { count++; return { value: count }; }
    };
    Object.defineProperties(obj, props);
    return [obj.a, obj.a, count];
}

export function ObjectDefinePropertiesTest033() {
    const obj = {};
    Object.defineProperties(obj, {
        int: { value: 42, enumerable: true },
        float: { value: 3.14, enumerable: true },
        negative: { value: -100, enumerable: true },
        zero: { value: 0, enumerable: true }
    });
    return [obj.int, obj.float, obj.negative, obj.zero];
}

export function ObjectDefinePropertiesTest034() {
    const obj = {};
    Object.defineProperties(obj, {
        infinity: { value: Infinity, enumerable: true },
        negInfinity: { value: -Infinity, enumerable: true },
        nan: { value: NaN, enumerable: true },
        negZero: { value: -0, enumerable: true }
    });
    return [
        obj.infinity,
        obj.negInfinity,
        Number.isNaN(obj.nan),
        Object.is(obj.negZero, -0)
    ];
}

export function ObjectDefinePropertiesTest035() {
    const obj = {};
    Object.defineProperties(obj, {
        max: { value: Number.MAX_VALUE, enumerable: true },
        min: { value: Number.MIN_VALUE, enumerable: true },
        maxSafeInt: { value: Number.MAX_SAFE_INTEGER, enumerable: true },
        minSafeInt: { value: Number.MIN_SAFE_INTEGER, enumerable: true }
    });
    return [obj.max, obj.min, obj.maxSafeInt, obj.minSafeInt];
}

export function ObjectDefinePropertiesTest036() {
    const obj = {};
    Object.defineProperties(obj, {
        empty: { value: '', enumerable: true },
        normal: { value: 'hello', enumerable: true },
        special: { value: '!@#$%^&*()', enumerable: true },
        unicode: { value: '你好世界', enumerable: true },
        emoji: { value: '👆👿👀💯🎅', enumerable: true }
    });
    return [obj.empty, obj.normal, obj.special, obj.unicode, obj.emoji];
}

export function ObjectDefinePropertiesTest037() {
    const obj = {};
    Object.defineProperties(obj, {
        newline: { value: 'line1\nline2', enumerable: true },
        tab: { value: 'col1\tcol2', enumerable: true },
        backslash: { value: 'path\\to\\file', enumerable: true },
        quote: { value: 'say "hello"', enumerable: true }
    });
    return [obj.newline, obj.tab, obj.backslash, obj.quote];
}

export function ObjectDefinePropertiesTest038() {
    const obj = {};
    Object.defineProperties(obj, {
        trueVal: { value: true, enumerable: true },
        falseVal: { value: false, enumerable: true }
    });
    return [obj.trueVal, obj.falseVal];
}

export function ObjectDefinePropertiesTest039() {
    const obj = {};
    Object.defineProperties(obj, {
        undef: { value: undefined, enumerable: true }
    });
    return [obj.undef, 'undef' in obj];
}

export function ObjectDefinePropertiesTest040() {
    const obj = {};
    Object.defineProperties(obj, {
        nullVal: { value: null, enumerable: true }
    });
    return [obj.nullVal, 'nullVal' in obj];
}

export function ObjectDefinePropertiesTest041() {
    const obj = {};
    Object.defineProperties(obj, {
        nested: { value: { a: 1, b: 2 }, enumerable: true },
        array: { value: [1, 2, 3], enumerable: true }
    });
    return [obj.nested.a, obj.array.length];
}

export function ObjectDefinePropertiesTest042() {
    const obj = {};
    Object.defineProperties(obj, {
        func: { value: function() { return 42; }, enumerable: true },
        arrow: { value: () => 'arrow', enumerable: true }
    });
    return [obj.func(), obj.arrow()];
}

export function ObjectDefinePropertiesTest043() {
    const obj = {};
    Object.defineProperties(obj, {
        emptyArr: { value: [], enumerable: true },
        numArr: { value: [1, 2, 3, 4, 5], enumerable: true },
        mixedArr: { value: [1, 'a', true, null], enumerable: true }
    });
    return [obj.emptyArr.length, obj.numArr[2], obj.mixedArr.length];
}

export function ObjectDefinePropertiesTest044() {
    const obj = {};
    Object.defineProperties(obj, {
        int8: { value: new Int8Array([1, 2, 3]), enumerable: true },
        uint8: { value: new Uint8Array([255, 0, 128]), enumerable: true },
        float32: { value: new Float32Array([1.5, 2.5, 3.5]), enumerable: true },
        bigInt64: { value: new BigInt64Array([9007199254740991n]), enumerable: true }
    });
    return [
        obj.int8[0].toString(),
        obj.uint8[0].toString(),
        obj.float32[0].toString(),
        obj.bigInt64[0].toString()
    ];
}

export function ObjectDefinePropertiesTest045() {
    const obj = {};
    const sym = Symbol('test');
    Object.defineProperties(obj, {
        symVal: { value: sym, enumerable: true }
    });
    return typeof obj.symVal;
}

export function ObjectDefinePropertiesTest046() {
    const obj = {};
    Object.defineProperties(obj, {
        bigIntVal: { value: 123456789012345678901234567890n, enumerable: true },
        bigIntNeg: { value: -999999999999999999999999n, enumerable: true }
    });
    return [obj.bigIntVal.toString(), obj.bigIntNeg.toString()];
}

export function ObjectDefinePropertiesTest047() {
    const obj = {};
    Object.defineProperties(obj, {
        date: { value: new Date('2024-01-01'), enumerable: true }
    });
    return obj.date instanceof Date;
}

export function ObjectDefinePropertiesTest048() {
    const obj = {};
    Object.defineProperties(obj, {
        regex: { value: /test/gi, enumerable: true }
    });
    return obj.regex.test('TEST');
}

export function ObjectDefinePropertiesTest049() {
    const obj = {};
    const map = new Map([['key1', 'value1'], ['key2', 'value2']]);
    Object.defineProperties(obj, {
        mapVal: { value: map, enumerable: true }
    });
    return obj.mapVal.get('key1');
}

export function ObjectDefinePropertiesTest050() {
    const obj = {};
    const set = new Set([1, 2, 3, 2, 1]);
    Object.defineProperties(obj, {
        setVal: { value: set, enumerable: true }
    });
    return obj.setVal.size;
}

export function ObjectDefinePropertiesTest051() {
    const obj = {};
    Object.defineProperties(obj, {
        buffer: { value: new ArrayBuffer(16), enumerable: true }
    });
    return obj.buffer.byteLength;
}

export function ObjectDefinePropertiesTest052() {
    const obj = {};
    Object.defineProperties(obj, {
        dataView: { value: new DataView(new ArrayBuffer(16)), enumerable: true }
    });
    return obj.dataView.byteLength;
}

export function ObjectDefinePropertiesTest054() {
    class MyClass {
        constructor(val) { this.val = val; }
        getValue() { return this.val; }
    }
    const obj = {};
    Object.defineProperties(obj, {
        instance: { value: new MyClass(42), enumerable: true }
    });
    return obj.instance.getValue();
}

export function ObjectDefinePropertiesTest055() {
    const obj = {};
    Object.defineProperties(obj, {
        writable: { value: 'initial', writable: true, enumerable: true }
    });
    obj.writable = 'modified';
    return obj.writable;
}

export function ObjectDefinePropertiesTest056() {
    const obj = {};
    Object.defineProperties(obj, {
        readonly: { value: 'initial', writable: false, enumerable: true }
    });

    return obj.readonly;
}

export function ObjectDefinePropertiesTest057() {
    const obj = {};
    Object.defineProperties(obj, {
        defaultWritable: { value: 'test' }
    });

    return obj.defaultWritable;
}

export function ObjectDefinePropertiesTest058() {
    const obj = {};
    Object.defineProperties(obj, {
        prop: { value: 1, writable: false, configurable: true }
    });
    Object.defineProperties(obj, {
        prop: { value: 2, writable: true }
    });
    obj.prop = 3;
    return [obj.prop];
}

export function ObjectDefinePropertiesTest059() {
    const obj = {};
    Object.defineProperties(obj, {
        nested: { value: { a: 1 }, writable: false, enumerable: true }
    });
    obj.nested.a = 100;

    return obj.nested.a;
}

export function ObjectDefinePropertiesTest060() {
    const obj = {};
    Object.defineProperties(obj, {
        arr: { value: [1, 2, 3], writable: false, enumerable: true }
    });
    obj.arr.push(4);

    return obj.arr;
}

export function ObjectDefinePropertiesTest061() {
    const obj = {};
    Object.defineProperties(obj, {
        prop: { value: 1, writable: true, configurable: true }
    });
    Object.defineProperties(obj, {
        prop: { writable: false }
    });

    return obj.prop;
}

export function ObjectDefinePropertiesTest062() {
    const obj = {};
    Object.defineProperties(obj, {
        prop: {}
    });
    const desc = Object.getOwnPropertyDescriptor(obj, 'prop');
    return [desc.value, desc.writable, desc.enumerable, desc.configurable];
}

export function ObjectDefinePropertiesTest063() {
    const obj = {};
    Object.defineProperties(obj, {
        prop: { value: 42 }
    });
    const desc = Object.getOwnPropertyDescriptor(obj, 'prop');
    return [desc.value, desc.writable, desc.enumerable, desc.configurable];
}

export function ObjectDefinePropertiesTest064() {
    const obj = {};
    Object.defineProperties(obj, {
        prop: { writable: true }
    });
    const desc = Object.getOwnPropertyDescriptor(obj, 'prop');
    return [desc.value, desc.writable, desc.enumerable, desc.configurable];
}

export function ObjectDefinePropertiesTest065() {
    const obj = {};
    let _value = 42;
    Object.defineProperties(obj, {
        prop: {
            get: function() { return _value; },
            enumerable: true
        }
    });
    return obj.prop;
}

export function ObjectDefinePropertiesTest066() {
    const obj = {};
    Object.defineProperties(obj, {
        a: { value: 10, enumerable: true, writable: true },
        b: { value: 20, enumerable: true, writable: true },
        sum: {
            get: function() { return this.a + this.b; },
            enumerable: true
        }
    });
    const firstSum = obj.sum;
    obj.a = 15;
    const secondSum = obj.sum;
    return [firstSum, secondSum];
}

export function ObjectDefinePropertiesTest067() {
    const obj = {};
    Object.defineProperties(obj, {
        value: { value: 100, enumerable: true },
        arrowGet: {
            get: () => this.value,
            enumerable: true
        },
        normalGet: {
            get: function() { return this.value; },
            enumerable: true
        }
    });
    return [obj.arrowGet, obj.normalGet];
}

export function ObjectDefinePropertiesTest068() {
    const obj = {};
    Object.defineProperties(obj, {
        _private: { value: 'secret', writable: true },
        public: {
            get: function() { return this._private; },
            enumerable: true
        }
    });
    const firstPublic = obj.public;
    obj._private = 'new secret';
    const secondPublic = obj.public;
    return [firstPublic, secondPublic];
}

export function ObjectDefinePropertiesTest069() {
    const obj = {};
    Object.defineProperties(obj, {
        errorProp: {
            get: function() { throw new Error('Getter error'); },
            enumerable: true
        }
    });
    try {
        obj.errorProp;
    } catch (e) {
        return e.message;
    }
}

export function ObjectDefinePropertiesTest070() {
    const obj = {};
    Object.defineProperties(obj, {
        undefProp: {
            get: function() { return undefined; },
            enumerable: true
        }
    });
    return [obj.undefProp, 'undefProp' in obj];
}

export function ObjectDefinePropertiesTest071() {
    const obj = {};
    Object.defineProperties(obj, {
        nullProp: {
            get: function() { return null; },
            enumerable: true
        }
    });
    return obj.nullProp;
}

export function ObjectDefinePropertiesTest072() {
    const obj = {};
    Object.defineProperties(obj, {
        complex: {
            get: function() {
                return {
                    nested: {
                        value: [1, 2, 3],
                        date: new Date()
                    }
                };
            },
            enumerable: true
        }
    });
    return obj.complex.nested.value[0];
}

export function ObjectDefinePropertiesTest073() {
    const obj = {};
    Object.defineProperties(obj, {
        _data: { value: [1, 2, 3, 4, 5], writable: true },
        computeSum: { value: function() { return this._data.reduce((a, b) => a + b, 0); } },
        sum: {
            get: function() { return this.computeSum(); },
            enumerable: true
        }
    });
    return obj.sum;
}

export function ObjectDefinePropertiesTest075() {
    const obj = {};
    Object.defineProperties(obj, {
        funcProp: {
            get: function() { return function(x) { return x * 2; }; },
            enumerable: true
        }
    });
    return obj.funcProp(5);
}

export function ObjectDefinePropertiesTest076() {
    const obj = {};
    let cache = null;
    let computeCount = 0;
    Object.defineProperties(obj, {
        cached: {
            get: function() {
                if (cache === null) {
                    computeCount++;
                    cache = 'computed value';
                }
                return cache;
            },
            enumerable: true
        }
    });
    const firstCached = obj.cached;
    const firstCount = computeCount;
    const secondCached = obj.cached;
    const secondCount = computeCount;
    return [firstCached, firstCount, secondCached, secondCount];
}

export function ObjectDefinePropertiesTest077() {
    const obj = {};
    Object.defineProperties(obj, {
        noGetter: {
            get: undefined,
            set: function(val) { this._val = val; },
            enumerable: true
        },
        _val: { value: 0, writable: true }
    });
    obj.noGetter = 42;
    return [obj.noGetter, obj._val];
}

export function ObjectDefinePropertiesTest078() {
    const obj = {};
    let _value = 0;
    Object.defineProperties(obj, {
        prop: {
            set: function(val) { _value = val; },
            get: function() { return _value; },
            enumerable: true
        }
    });
    obj.prop = 100;
    return obj.prop;
}

export function ObjectDefinePropertiesTest079() {
    const obj = {};
    Object.defineProperties(obj, {
        firstName: { value: 'John', writable: true, enumerable: true },
        lastName: { value: 'Doe', writable: true, enumerable: true },
        fullName: {
            set: function(val) {
                const parts = val.split(' ');
                this.firstName = parts[0];
                this.lastName = parts[1] || '';
            },
            get: function() { return this.firstName + ' ' + this.lastName; },
            enumerable: true
        }
    });
    obj.fullName = 'Jane Smith';
    return [obj.firstName, obj.lastName];
}

export function ObjectDefinePropertiesTest080() {
    const obj = {};
    Object.defineProperties(obj, {
        _age: { value: 0, writable: true },
        age: {
            set: function(val) {
                if (typeof val !== 'number' || val < 0 || val > 150) {
                    throw new Error('Invalid age');
                }
                this._age = val;
            },
            get: function() { return this._age; },
            enumerable: true
        }
    });
    obj.age = 25;
    const validAge = obj.age;
    let errorMsg = '';
    try {
        obj.age = -1;
    } catch (e) {
        errorMsg = e.message;
    }
    return [validAge, errorMsg];
}

export function ObjectDefinePropertiesTest081() {
    const obj = {};
    let changes = [];
    Object.defineProperties(obj, {
        _value: { value: 0, writable: true },
        value: {
            set: function(val) {
                changes.push({ old: this._value, new: val });
                this._value = val;
            },
            get: function() { return this._value; },
            enumerable: true
        }
    });
    obj.value = 10;
    obj.value = 20;
    return changes;
}


export function ObjectDefinePropertiesTest082() {
    const obj = {};
    Object.defineProperties(obj, {
        _val: { value: 0, writable: true },
        arrowSet: {
            set: function(val) { this._val = val; },
            get: function() { return this._val; },
            enumerable: true
        }
    });
    obj.arrowSet = 100;
    return obj.arrowSet;
}

export function ObjectDefinePropertiesTest083() {
    const obj = {};
    Object.defineProperties(obj, {
        errorProp: {
            set: function(val) { throw new Error('Setter error'); },
            enumerable: true
        }
    });
    try {
        obj.errorProp = 42;
    } catch (e) {
        return e.message;
    }
}

export function ObjectDefinePropertiesTest084() {
    const obj = {};
    Object.defineProperties(obj, {
        _num: { value: 0, writable: true },
        num: {
            set: function(val) { this._num = Number(val); },
            get: function() { return this._num; },
            enumerable: true
        }
    });
    obj.num = '42';
    return [obj.num, typeof obj.num];
}

export function ObjectDefinePropertiesTest085() {
    const obj = {};
    Object.defineProperties(obj, {
        _square: { value: 0, writable: true },
        _cube: { value: 0, writable: true },
        value: {
            set: function(val) {
                this._square = val * val;
                this._cube = val * val * val;
            },
            enumerable: true
        },
        square: { get: function() { return this._square; }, enumerable: true },
        cube: { get: function() { return this._cube; }, enumerable: true }
    });
    obj.value = 3;
    return [obj.square, obj.cube];
}

export function ObjectDefinePropertiesTest086() {
    const obj = {};
    Object.defineProperties(obj, {
        readOnly: {
            get: function() { return 42; },
            set: undefined,
            enumerable: true
        }
    });
    const firstReadOnly = obj.readOnly;

    const secondReadOnly = obj.readOnly;
    return [firstReadOnly, secondReadOnly];
}

export function ObjectDefinePropertiesTest087() {
    const obj = {};
    Object.defineProperties(obj, {
        _a: { value: 0, writable: true },
        _b: { value: 0, writable: true },
        a: {
            set: function(val) { this._a = val; this.b = val * 2; },
            get: function() { return this._a; },
            enumerable: true
        },
        b: {
            set: function(val) { this._b = val; },
            get: function() { return this._b; },
            enumerable: true
        }
    });
    obj.a = 10;
    return [obj.a, obj.b];
}

export function ObjectDefinePropertiesTest088() {
    const obj = {};
    let _value = 0;
    Object.defineProperties(obj, {
        prop: {
            get: function() { return _value; },
            set: function(val) { _value = val; },
            enumerable: true,
            configurable: true
        }
    });
    obj.prop = 42;
    return obj.prop;
}

export function ObjectDefinePropertiesTest089() {
    const obj = {};
    Object.defineProperties(obj, {
        readOnly: {
            get: function() { return 'constant'; },
            enumerable: true
        }
    });
    const firstReadOnly = obj.readOnly;

    const secondReadOnly = obj.readOnly;
    return [firstReadOnly, secondReadOnly];
}

export function ObjectDefinePropertiesTest090() {
    const obj = {};
    Object.defineProperties(obj, {
        _val: { value: 0, writable: true },
        writeOnly: {
            set: function(val) { this._val = val; },
            enumerable: true
        }
    });
    obj.writeOnly = 42;
    return [obj.writeOnly, obj._val];
}

export function ObjectDefinePropertiesTest091() {
    const obj = {};
    const privateData = Symbol('private');
    Object.defineProperties(obj, {
        [privateData]: { value: 'secret', writable: true },
        data: {
            get: function() { return this[privateData]; },
            set: function(val) { this[privateData] = val; },
            enumerable: true
        }
    });
    const firstData = obj.data;
    obj.data = 'new secret';
    const secondData = obj.data;
    return [firstData, secondData];
}

export function ObjectDefinePropertiesTest092() {
    const obj = {};
    Object.defineProperties(obj, {
        visible: {
            get: function() { return 1; },
            set: function(val) {},
            enumerable: true
        },
        hidden: {
            get: function() { return 2; },
            set: function(val) {},
            enumerable: false
        }
    });
    return [Object.keys(obj), obj.hidden];
}

export function ObjectDefinePropertiesTest093() {
    const obj = {};
    Object.defineProperties(obj, {
        prop: {
            get: function() { return 1; },
            set: function(val) {},
            configurable: true,
            enumerable: true
        }
    });
    Object.defineProperties(obj, {
        prop: { value: 42, writable: true }
    });
    return obj.prop;
}

export function ObjectDefinePropertiesTest094() {
    const obj = {};
    Object.defineProperties(obj, {
        prop: {
            get: function() { return 'first'; },
            configurable: true,
            enumerable: true
        }
    });
    Object.defineProperties(obj, {
        prop: {
            get: function() { return 'second'; },
            enumerable: true
        }
    });
    return obj.prop;
}

export function ObjectDefinePropertiesTest095() {
    const obj = {};
    Object.defineProperties(obj, {
        prop: {
            get: function() { return 'fixed'; },
            configurable: false,
            enumerable: true
        }
    });
    try {
        Object.defineProperties(obj, {
            prop: { get: function() { return 'new'; } }
        });
    } catch (e) {
        return e instanceof TypeError;
    }
}

export function ObjectDefinePropertiesTest096() {
    const obj = {};
    Object.defineProperties(obj, {
        prop: {
            get: function() { return 'getter value'; },
            configurable: true,
            enumerable: true
        }
    });
    Object.defineProperties(obj, {
        prop: { value: 'data value', writable: true, enumerable: true }
    });
    const firstProp = obj.prop;
    obj.prop = 'modified';
    const secondProp = obj.prop;
    return [firstProp, secondProp];
}

export function ObjectDefinePropertiesTest097() {
    const obj = {};
    Object.defineProperties(obj, {
        prop: { configurable: true, enumerable: true }
    });
    const desc = Object.getOwnPropertyDescriptor(obj, 'prop');
    return [desc.get, desc.set, desc.value, desc.writable];
}

export function ObjectDefinePropertiesTest098() {
    const obj = {};
    Object.defineProperties(obj, {
        prop: { value: 1, configurable: true, enumerable: true }
    });
    delete obj.prop;
    return [obj.prop, 'prop' in obj];
}

export function ObjectDefinePropertiesTest099() {
    const obj = {};
    Object.defineProperties(obj, {
        prop: { value: 1, configurable: true, enumerable: true }
    });
    Object.defineProperties(obj, {
        prop: { value: 2, writable: true, enumerable: true }
    });
    const firstProp = obj.prop;
    obj.prop = 3;
    const secondProp = obj.prop;
    return [firstProp, secondProp];
}
