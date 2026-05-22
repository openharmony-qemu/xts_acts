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

export function ObjectDefineProperties2Test001() {
    const obj = {};
    Object.defineProperties(obj, {
        prop: { value: 1, configurable: true, enumerable: true }
    });
    Object.defineProperties(obj, {
        prop: {
            get: function() { return 100; },
            enumerable: true
        }
    });
    return obj.prop; 
}


export function ObjectDefineProperties2Test002() {
    const obj = {};
    Object.defineProperties(obj, {
        prop: { value: 1, configurable: true, enumerable: false }
    });
    const firstKeys = Object.keys(obj);
    Object.defineProperties(obj, {
        prop: { enumerable: true }
    });
    const secondKeys = Object.keys(obj);
    return [firstKeys, secondKeys];
}


export function ObjectDefineProperties2Test003() {
    const obj = {};
    Object.defineProperties(obj, {
        prop: { value: 1, writable: false, configurable: true }
    });
    Object.defineProperties(obj, {
        prop: { writable: true }
    });
    obj.prop = 2;
    return obj.prop;
}


export function ObjectDefineProperties2Test004() {
    const obj = {};
    Object.defineProperties(obj, {
        prop: { value: 1, configurable: false, enumerable: true }
    });

    return [obj.prop, 'prop' in obj];
}


export function ObjectDefineProperties2Test005() {
    const obj = {};
    Object.defineProperties(obj, {
        prop: { value: 1, configurable: false, enumerable: true }
    });
    let isTypeError = false;
    try {
        Object.defineProperties(obj, {
            prop: { value: 2 }
        });
    } catch (e) {
        isTypeError = e instanceof TypeError;
    }
    return isTypeError;
}


export function ObjectDefineProperties2Test006() {
    const obj = {};
    Object.defineProperties(obj, {
        prop: { value: 1, configurable: false, enumerable: false }
    });
    let isTypeError = false;
    try {
        Object.defineProperties(obj, {
            prop: { enumerable: true }
        });
    } catch (e) {
        isTypeError = e instanceof TypeError;
    }
    return isTypeError; 
}


export function ObjectDefineProperties2Test007() {
    const obj = {};
    Object.defineProperties(obj, {
        prop: { value: 1, writable: true, configurable: false }
    });
    Object.defineProperties(obj, {
        prop: { writable: false }
    });

    return obj.prop;
}


export function ObjectDefineProperties2Test008() {
    const obj = {};
    Object.defineProperties(obj, {
        prop: { value: 1, writable: false, configurable: false }
    });
    let isTypeError = false;
    try {
        Object.defineProperties(obj, {
            prop: { writable: true }
        });
    } catch (e) {
        isTypeError = e instanceof TypeError;
    }
    return isTypeError; 
}


export function ObjectDefineProperties2Test009() {
    const obj = {};
    Object.defineProperties(obj, {
        prop: {
            get: function() { return 1; },
            configurable: false,
            enumerable: true
        }
    });
    let isTypeError = false;
    try {
        Object.defineProperties(obj, {
            prop: { get: function() { return 2; } }
        });
    } catch (e) {
        isTypeError = e instanceof TypeError;
    }
    return isTypeError; 
}


export function ObjectDefineProperties2Test010() {
    const obj = {};
    Object.defineProperties(obj, {
        prop: { value: 1 }
    });
    const desc = Object.getOwnPropertyDescriptor(obj, 'prop');
    return desc.configurable; 
}


export function ObjectDefineProperties2Test011() {
    const obj = {};
    obj.prop = 1;
    const desc = Object.getOwnPropertyDescriptor(obj, 'prop');
    const configurable = desc.configurable;
    delete obj.prop;
    const hasProp = 'prop' in obj;
    return [configurable, hasProp]; 
}


export function ObjectDefineProperties2Test012() {
    const obj = {};
    Object.defineProperties(obj, {
        prop: { value: 1, configurable: true }
    });
    return delete obj.prop; 
}


export function ObjectDefineProperties2Test013() {
    const obj = {};
    Object.defineProperties(obj, {
        prop: { value: 1, configurable: false }
    });
    return obj.prop;
}


export function ObjectDefineProperties2Test014() {
    const obj = {};
    Object.defineProperties(obj, {
        prop: { value: 1 }
    });
    return delete obj.nonexistent; 
}


export function ObjectDefineProperties2Test015() {
    const obj = {};
    obj.prop = 1;
    Object.freeze(obj);
    const desc = Object.getOwnPropertyDescriptor(obj, 'prop');
    const configurable = desc.configurable;
    let isTypeError = false;
    try {
        delete obj.prop;
    } catch (e) {
        isTypeError = e instanceof TypeError;
    }
    return [configurable, isTypeError]; 
}


export function ObjectDefineProperties2Test016() {
    const obj = {};
    obj.prop = 1;
    Object.seal(obj);
    const desc = Object.getOwnPropertyDescriptor(obj, 'prop');
    const configurable = desc.configurable;
    let isTypeError = false;
    try {
        delete obj.prop;
    } catch (e) {
        isTypeError = e instanceof TypeError;
    }
    return [configurable, isTypeError]; 
}


export function ObjectDefineProperties2Test017() {
    const obj = {};
    Object.defineProperties(obj, {
        prop1: { value: 1, enumerable: true },
        prop2: { value: 2, enumerable: true }
    });
    return Object.keys(obj); 
}


export function ObjectDefineProperties2Test018() {
    const obj = {};
    Object.defineProperties(obj, {
        prop1: { value: 1, enumerable: true },
        prop2: { value: 2, enumerable: true }
    });
    const keys = [];
    for (const key in obj) {
        keys.push(key);
    }
    return keys; 
}


export function ObjectDefineProperties2Test019() {
    const obj = {};
    Object.defineProperties(obj, {
        prop: { value: 1, enumerable: true }
    });
    return JSON.stringify(obj); 
}


export function ObjectDefineProperties2Test020() {
    const obj = {};
    Object.defineProperties(obj, {
        prop1: { value: 1, enumerable: true },
        prop2: { value: 2, enumerable: true }
    });
    return Object.entries(obj); 
}

export function ObjectDefineProperties2Test021() {
    const obj = {};
    Object.defineProperties(obj, {
        prop1: { value: 1, enumerable: true },
        prop2: { value: 2, enumerable: true }
    });
    return Object.values(obj); 
}


export function ObjectDefineProperties2Test022() {
    const obj = {};
    const sym = Symbol('key');
    Object.defineProperties(obj, {
        [sym]: { value: 'sym-val', enumerable: true },
        normal: { value: 'normal-val', enumerable: true }
    });
    return [Object.keys(obj), Object.getOwnPropertySymbols(obj)]; 
}


export function ObjectDefineProperties2Test023() {
    const obj = {};
    Object.defineProperties(obj, {
        visible: { value: 1, enumerable: true },
        hidden: { value: 2, enumerable: false }
    });
    return [Object.keys(obj), obj.hidden]; 
}


export function ObjectDefineProperties2Test024() {
    const obj = {};
    Object.defineProperties(obj, {
        visible: { value: 1, enumerable: true },
        hidden: { value: 2, enumerable: false }
    });
    const keys = [];
    for (const key in obj) {
        keys.push(key);
    }
    return keys; 
}


export function ObjectDefineProperties2Test025() {
    const obj = {};
    Object.defineProperties(obj, {
        visible: { value: 1, enumerable: true },
        hidden: { value: 2, enumerable: false }
    });
    return JSON.stringify(obj); 
}


export function ObjectDefineProperties2Test026() {
    const obj = {};
    Object.defineProperties(obj, {
        visible: { value: 1, enumerable: true },
        hidden: { value: 2, enumerable: false }
    });
    return Object.getOwnPropertyNames(obj); 
}


export function ObjectDefineProperties2Test027() {
    const obj = {};
    Object.defineProperties(obj, {
        visible: { value: 1, enumerable: true },
        hidden: { value: 2, enumerable: false }
    });
    return [
        obj.propertyIsEnumerable('visible'),
        obj.propertyIsEnumerable('hidden')
    ]; 
}


export function ObjectDefineProperties2Test028() {
    const obj = {};
    Object.defineProperties(obj, {
        prop: { value: 1, enumerable: false, writable: true }
    });
    obj.prop = 2;
    return obj.prop; 
}


export function ObjectDefineProperties2Test029() {
    const obj = {};
    Object.defineProperties(obj, {
        prop: { value: 1 }
    });
    const desc = Object.getOwnPropertyDescriptor(obj, 'prop');
    return [desc.enumerable, Object.keys(obj)]; 
}


export function ObjectDefineProperties2Test030() {
    const obj = {};
    obj.prop = 1;
    const desc = Object.getOwnPropertyDescriptor(obj, 'prop');
    return [desc.enumerable, Object.keys(obj)]; 
}


export function ObjectDefineProperties2Test031() {
    const obj = {};
    Object.defineProperties(obj, {
        prop: { value: 1, enumerable: false, configurable: true }
    });
    const firstKeys = Object.keys(obj);
    Object.defineProperties(obj, {
        prop: { enumerable: true }
    });
    const secondKeys = Object.keys(obj);
    return [firstKeys, secondKeys]; 
}


export function ObjectDefineProperties2Test032() {
    const obj = {};
    Object.defineProperties(obj, {
        prop: { value: 1, enumerable: false, configurable: false }
    });
    let isTypeError = false;
    try {
        Object.defineProperties(obj, {
            prop: { enumerable: true }
        });
    } catch (e) {
        isTypeError = e instanceof TypeError;
    }
    return isTypeError; 
}

export function ObjectDefineProperties2Test033() {
    const obj = {};
    Object.defineProperties(obj, {
        prop: { value: 1, enumerable: true }
    });
    Object.freeze(obj);
    const desc = Object.getOwnPropertyDescriptor(obj, 'prop');
    return [desc.enumerable, Object.keys(obj)]; 
}

export function ObjectDefineProperties2Test034() {
    const obj = {};
    Object.defineProperties(obj, {
        prop: { value: 1, enumerable: true }
    });
    Object.seal(obj);
    const desc = Object.getOwnPropertyDescriptor(obj, 'prop');
    return [desc.enumerable, Object.keys(obj)]; 
}

export function ObjectDefineProperties2Test035() {
    const obj = {};
    Object.defineProperties(obj, {
        prop: { value: 1, writable: true }
    });
    obj.prop = 100;
    return obj.prop;
}

export function ObjectDefineProperties2Test036() {
    const obj = {};
    Object.defineProperties(obj, {
        prop: { value: 1, writable: false }
    });

    return obj.prop;
}

export function ObjectDefineProperties2Test038() {
    const obj = {};
    Object.defineProperties(obj, {
        prop: { value: 1, writable: false }
    });
    let isTypeError = false;
    try {
        obj.prop = 100;
    } catch (e) {
        isTypeError = e instanceof TypeError;
    }
    return isTypeError; 
}

export function ObjectDefineProperties2Test039() {
    const obj = {};
    Object.defineProperties(obj, {
        num: { value: 42, writable: true },
        readonlyNum: { value: 42, writable: false }
    });
    obj.num = 100;

    return [obj.num, obj.readonlyNum]; 
}

export function ObjectDefineProperties2Test040() {
    const obj = {};
    Object.defineProperties(obj, {
        str: { value: 'hello', writable: true },
        readonlyStr: { value: 'hello', writable: false }
    });
    obj.str = 'world';

    return [obj.str, obj.readonlyStr]; 
}

export function ObjectDefineProperties2Test041() {
    const obj = {};
    const nested = { a: 1, b: 2 };
    Object.defineProperties(obj, {
        nested: { value: nested, writable: false }
    });
    obj.nested.a = 100;

    return obj.nested;
}

export function ObjectDefineProperties2Test042() {
    const obj = {};
    const arr = [1, 2, 3];
    Object.defineProperties(obj, {
        arr: { value: arr, writable: false }
    });
    obj.arr.push(4);
    obj.arr[0] = 100;

    return obj.arr;
}

export function ObjectDefineProperties2Test043() {
    const obj = {};
    Object.defineProperties(obj, {
        undef: { value: undefined, writable: true }
    });
    obj.undef = 'defined';
    return obj.undef; 
}

export function ObjectDefineProperties2Test044() {
    const obj = {};
    Object.defineProperties(obj, {
        nullVal: { value: null, writable: true }
    });
    obj.nullVal = 'not null';
    return obj.nullVal; 
}

export function ObjectDefineProperties2Test045() {
    const obj = {};
    Object.defineProperties(obj, {
        prop: { value: 1, writable: true, configurable: true }
    });
    Object.defineProperties(obj, {
        prop: { writable: false }
    });

    return obj.prop;
}

export function ObjectDefineProperties2Test046() {
    const obj = {};
    Object.defineProperties(obj, {
        prop: { value: 1, writable: false, configurable: false }
    });
    let isTypeError = false;
    try {
        Object.defineProperties(obj, {
            prop: { writable: true }
        });
    } catch (e) {
        isTypeError = e instanceof TypeError;
    }
    return isTypeError; 
}

export function ObjectDefineProperties2Test047() {
    const obj = {};
    Object.defineProperties(obj, {
        prop: { value: 1, writable: true, configurable: true }
    });
    obj.prop = 2;
    delete obj.prop;
    return obj.prop; 
}

export function ObjectDefineProperties2Test048() {
    const obj = {};
    Object.defineProperties(obj, {
        prop: { value: 1, writable: true, configurable: false }
    });
    obj.prop = 2;
    const afterSet = obj.prop;

    const afterDelete = obj.prop;
    return [afterSet, afterDelete];
}

export function ObjectDefineProperties2Test049() {
    const obj = {};
    Object.defineProperties(obj, {
        prop: { value: 1, writable: false, configurable: true }
    });

    const beforeRedefine = obj.prop;
    Object.defineProperties(obj, { prop: { value: 2 } });
    const afterRedefine = obj.prop;
    return [beforeRedefine, afterRedefine];
}

export function ObjectDefineProperties2Test050() {
    const obj = {};
    Object.defineProperties(obj, {
        CONSTANT: { value: 1, writable: false, configurable: false }
    });

    let isTypeError = false;
    try {
        Object.defineProperties(obj, { CONSTANT: { value: 2 } });
    } catch (e) {
        isTypeError = e instanceof TypeError;
    }
    return [isTypeError, obj.CONSTANT]; 
}

export function ObjectDefineProperties2Test051() {
    const obj = {};
    obj.prop = 1;
    Object.freeze(obj);
    const desc = Object.getOwnPropertyDescriptor(obj, 'prop');
    const writable = desc.writable;

    const afterSet = obj.prop;
    return [writable, afterSet]; 
}

export function ObjectDefineProperties2Test052() {
    const obj = {};
    let isTypeError = false;
    try {
        Object.defineProperties(obj, {
            prop: { value: 1, get: function() { return 2; } }
        });
    } catch (e) {
        isTypeError = e instanceof TypeError;
    }
    return isTypeError; 
}

export function ObjectDefineProperties2Test053() {
    const obj = {};
    let isTypeError = false;
    try {
        Object.defineProperties(obj, {
            prop: { value: 1, set: function(val) {} }
        });
    } catch (e) {
        isTypeError = e instanceof TypeError;
    }
    return isTypeError; 
}

export function ObjectDefineProperties2Test054() {
    const obj = {};
    let isTypeError = false;
    try {
        Object.defineProperties(obj, {
            prop: {
                value: 1,
                get: function() { return 2; },
                set: function(val) {}
            }
        });
    } catch (e) {
        isTypeError = e instanceof TypeError;
    }
    return isTypeError; 
}

export function ObjectDefineProperties2Test055() {
    const obj = {};
    let isTypeError = false;
    try {
        Object.defineProperties(obj, {
            prop: { writable: true, get: function() { return 2; } }
        });
    } catch (e) {
        isTypeError = e instanceof TypeError;
    }
    return isTypeError; 
}

export function ObjectDefineProperties2Test056() {
    const obj = {};
    let isTypeError = false;
    try {
        Object.defineProperties(obj, {
            prop: { writable: true, set: function(val) {} }
        });
    } catch (e) {
        isTypeError = e instanceof TypeError;
    }
    return isTypeError; 
}

export function ObjectDefineProperties2Test057() {
    const obj = {};
    Object.defineProperties(obj, {
        self: { value: obj, enumerable: true }
    });
    return [obj.self === obj, obj.self.self === obj]; 
}

export function ObjectDefineProperties2Test058() {
    const obj = {};
    const nested = {};
    Object.defineProperties(obj, {
        nested: { value: nested, enumerable: true }
    });
    Object.defineProperties(nested, {
        parent: { value: obj, enumerable: true }
    });
    return obj.nested.parent === obj; 
}

export function ObjectDefineProperties2Test059() {
    const proto = { inherited: 1 };
    const obj = Object.create(proto);
    Object.defineProperties(obj, {
        inherited: { value: 100, enumerable: true }
    });
    return [
        obj.inherited,
        Object.prototype.hasOwnProperty.call(obj, 'inherited')
    ]; 
}

export function ObjectDefineProperties2Test060() {
    const proto = { inherited: 1 };
    const obj = Object.create(proto);
    Object.defineProperties(obj, {
        own: { value: 2, enumerable: true }
    });
    return [obj.inherited, obj.own]; 
}

export function ObjectDefineProperties2Test061() {
    const obj = {};
    Object.defineProperties(obj, {
        a: { value: 10, writable: true, enumerable: true },
        doubleA: {
            get: function() { return this.a * 2; },
            enumerable: true
        }
    });
    const firstDoubleA = obj.doubleA;
    const anotherObj = { a: 5 };
    Object.defineProperties(anotherObj, {
        doubleA: Object.getOwnPropertyDescriptor(obj, 'doubleA')
    });
    const secondDoubleA = anotherObj.doubleA;
    return [firstDoubleA, secondDoubleA]; 
}

export function ObjectDefineProperties2Test062() {
    const source = {};
    Object.defineProperties(source, {
        prop: {
            get: function() { return this._val; },
            set: function(v) { this._val = v; },
            enumerable: true,
            configurable: true
        },
        _val: { value: 100, writable: true }
    });
    const target = {};
    Object.defineProperties(target, {
        prop: Object.getOwnPropertyDescriptor(source, 'prop'),
        _val: { value: 200, writable: true }
    });
    target.prop = 300;
    return [target.prop, source.prop]; 
}

export function ObjectDefineProperties2Test063() {
    const obj = {};
    Object.defineProperties(obj, {
        prop: {
            get: function() { return this.value; },
            enumerable: true
        },
        value: { value: 42, writable: true }
    });
    const desc = Object.getOwnPropertyDescriptor(obj, 'prop');
    return desc.get.call({ value: 100 }); 
}

export function ObjectDefineProperties2Test064() {
    const parent = {};
    Object.defineProperties(parent, {
        prop: {
            get: function() { return this._val || 0; },
            set: function(v) { this._val = v; },
            enumerable: true
        }
    });
    const child = Object.create(parent);
    child.prop = 42;
    return [child.prop, child._val, parent.prop]; 
}

export function ObjectDefineProperties2Test065() {
    const proto = {};
    Object.defineProperties(proto, {
        value: {
            get: function() { return this._internal || 'proto'; },
            set: function(v) { this._internal = v; },
            enumerable: true
        }
    });
    const obj = Object.create(proto);
    obj.value = 'obj';
    return [obj.value, obj._internal, proto.value]; 
}

export function ObjectDefineProperties2Test066() {
    const obj1 = {};
    const obj2 = {};
    Object.defineProperties(obj1, {
        a: { value: 1, writable: true },
        b: { get: function() { return 2; } }
    });
    Object.defineProperty(obj2, 'a', { value: 1, writable: true });
    Object.defineProperty(obj2, 'b', { get: function() { return 2; } });
    const desc1 = Object.getOwnPropertyDescriptor(obj1, 'a');
    const desc2 = Object.getOwnPropertyDescriptor(obj2, 'a');

    return [
        desc1.value === desc2.value,
        desc1.writable === desc2.writable,
        desc1.configurable === desc2.configurable,
        desc1.enumerable === desc2.enumerable
    ];
}

export function ObjectDefineProperties2Test067() {
    const obj = {};
    let callCount = 0;
    Object.defineProperties(obj, {
        prop: {
            get: function() { callCount++; return 42; },
            enumerable: true
        }
    });
    for (let i = 0; i < 100; i++) {
        obj.prop;
    }
    return callCount; 
}

export function ObjectDefineProperties2Test068() {
    const obj = {};
    Object.defineProperties(obj, {
        data: { value: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], writable: true },
        sum: {
            get: function() {
                return this.data.reduce((a, b) => a + b, 0);
            },
            enumerable: true
        }
    });
    const firstSum = obj.sum;
    obj.data.push(11);
    const secondSum = obj.sum;
    return [firstSum, secondSum]; 
}

export function ObjectDefineProperties2Test069() {
    const obj = {};
    let isTypeError = false;
    let hasMessage = false;
    try {
        Object.defineProperties(obj, {
            prop: { value: 1, get: function() { return 2; } }
        });
    } catch (e) {
        isTypeError = e instanceof TypeError;
        hasMessage = e.message.includes('accessor') && e.message.includes('data');
    }
    return [isTypeError, hasMessage]; 
}

export function ObjectDefineProperties2Test070() {
    const obj = {};
    let isTypeError = false;
    try {
        Object.defineProperties(obj, {
            prop: { value: 1, set: function(v) {} }
        });
    } catch (e) {
        isTypeError = e instanceof TypeError;
    }
    return isTypeError; 
}

export function ObjectDefineProperties2Test071() {
    const obj = {};
    let isTypeError = false;
    try {
        Object.defineProperties(obj, {
            prop: { writable: true, get: function() { return 2; } }
        });
    } catch (e) {
        isTypeError = e instanceof TypeError;
    }
    return isTypeError; 
}

export function ObjectDefineProperties2Test072() {
    const obj = {};
    let isTypeError = false;
    try {
        Object.defineProperties(obj, {
            prop: { writable: true, set: function(v) {} }
        });
    } catch (e) {
        isTypeError = e instanceof TypeError;
    }
    return isTypeError; 
}

export function ObjectDefineProperties2Test073() {
    const obj = {};
    let isTypeError = false;
    try {
        Object.defineProperties(obj, {
            prop: {
                value: 1,
                writable: true,
                get: function() {},
                set: function() {}
            }
        });
    } catch (e) {
        isTypeError = e instanceof TypeError;
    }
    return isTypeError; 
}

export function ObjectDefineProperties2Test074() {
    const obj = {};
    Object.defineProperties(obj, {
        prop: { configurable: true, enumerable: true }
    });
    const desc = Object.getOwnPropertyDescriptor(obj, 'prop');
    return [
        desc.value,
        desc.writable,
        desc.get,
        desc.set
    ]; 
}

export function ObjectDefineProperties2Test075() {
    const obj = {};
    Object.defineProperties(obj, {
        prop: { get: function() { return 42; } }
    });
    const desc = Object.getOwnPropertyDescriptor(obj, 'prop');
    return [
        typeof desc.get === 'function',
        desc.set,
        desc.value,
        desc.writable
    ]; 
}

export function ObjectDefineProperties2Test076() {
    const obj = {};
    Object.defineProperties(obj, {
        prop: { set: function(v) { this._v = v; } },
        _v: { value: 0, writable: true }
    });
    const desc = Object.getOwnPropertyDescriptor(obj, 'prop');
    return [
        desc.get,
        typeof desc.set === 'function',
        desc.value,
        desc.writable
    ]; 
}

export function ObjectDefineProperties2Test077() {
    const obj = {};
    Object.defineProperties(obj, {
        prop: { value: 1, configurable: true, enumerable: true }
    });
    Object.defineProperties(obj, {
        prop: {
            get: function() { return 100; },
            enumerable: true
        }
    });
    const propValue = obj.prop;
    const desc = Object.getOwnPropertyDescriptor(obj, 'prop');
    return [
        propValue,
        desc.value,
        typeof desc.get === 'function'
    ]; 
}

export function ObjectDefineProperties2Test078() {
    const obj = {};
    Object.defineProperties(obj, {
        prop: {
            get: function() { return 1; },
            configurable: true,
            enumerable: true
        }
    });
    Object.defineProperties(obj, {
        prop: { value: 100, writable: true, enumerable: true }
    });
    const firstProp = obj.prop;
    obj.prop = 200;
    const secondProp = obj.prop;
    return [firstProp, secondProp]; 
}

export function ObjectDefineProperties2Test079() {
    const obj = {};
    Object.defineProperties(obj, {
        prop: { value: 1, configurable: false }
    });
    let isTypeError = false;
    try {
        Object.defineProperties(obj, {
            prop: { get: function() { return 2; } }
        });
    } catch (e) {
        isTypeError = e instanceof TypeError;
    }
    return isTypeError; 
}

export function ObjectDefineProperties2Test080() {
    const obj = {};
    Object.defineProperties(obj, {
        b: { value: 2, enumerable: true },
        a: { value: 1, enumerable: true },
        c: { value: 3, enumerable: true }
    });
    const keys = Object.keys(obj);
    const values = [obj.a, obj.b, obj.c];
    return [keys, values]; 
}

export function ObjectDefineProperties2Test081() {
    const obj = {};
    Object.defineProperties(obj, {
        _x: { value: 0, writable: true },
        _y: { value: 0, writable: true },
        x: {
            get: function() { return this._x; },
            set: function(v) { this._x = v; this.y = v * 2; },
            enumerable: true
        },
        y: {
            get: function() { return this._y; },
            set: function(v) { this._y = v; },
            enumerable: true
        }
    });
    obj.x = 10;
    return [obj.x, obj.y]; 
}

export function ObjectDefineProperties2Test082() {
    const obj = {};
    let isTypeError = false;
    try {
        Object.defineProperties(obj, {
            a: { value: 1, enumerable: true },
            b: { value: 2, configurable: false },
            c: { value: 3, get: function() {} }
        });
    } catch (e) {
        isTypeError = e instanceof TypeError;
    }
    return [
        isTypeError,
        obj.a,
        obj.b,
        obj.c
    ]; 
}

export function ObjectDefineProperties2Test083() {
    const obj = {};
    Object.defineProperties(obj, {
        prop1: { value: 1, configurable: 1 },
        prop2: { value: 2, configurable: 0 },
        prop3: { value: 3, configurable: 'true' },
        prop4: { value: 4, configurable: null }
    });
    return [
        Object.getOwnPropertyDescriptor(obj, 'prop1').configurable,
        Object.getOwnPropertyDescriptor(obj, 'prop2').configurable
    ]; 
}

export function ObjectDefineProperties2Test084() {
    const obj = {};
    Object.defineProperties(obj, {
        prop1: { value: 1, enumerable: 1 },
        prop2: { value: 2, enumerable: '' },
        prop3: { value: 3, enumerable: {} }
    });
    return Object.keys(obj); 
}

export function ObjectDefineProperties2Test085() {
    const obj = {};
    Object.defineProperties(obj, {
        prop1: { value: 1, writable: 1 },
        prop2: { value: 2, writable: 0 },
        prop3: { value: 3, writable: undefined }
    });
    obj.prop1 = 100;

    return [obj.prop1, obj.prop2]; 
}

export function ObjectDefineProperties2Test086() {
    const obj = {};
    let isTypeError = false;
    try {
        Object.defineProperties(obj, {
            prop: 'invalid'
        });
    } catch (e) {
        isTypeError = e instanceof TypeError;
    }
    return isTypeError; 
}

export function ObjectDefineProperties2Test087() {
    const obj = {};
    let isTypeError = false;
    try {
        Object.defineProperties(obj, {
            prop: { get: 'not a function' }
        });
    } catch (e) {
        isTypeError = e instanceof TypeError;
    }
    return isTypeError; 
}

export function ObjectDefineProperties2Test088() {
    const obj = {};
    let isTypeError = false;
    try {
        Object.defineProperties(obj, {
            prop: { set: 42 }
        });
    } catch (e) {
        isTypeError = e instanceof TypeError;
    }
    return isTypeError; 
}

export function ObjectDefineProperties2Test089() {
    const arr = new Int8Array([1, 2, 3]);
    Object.defineProperties(arr, {
        custom: { value: 'int8-custom', enumerable: true },
        maxValue: { value: 127, enumerable: true }
    });
    return [arr.custom, arr[0]]; 
}

export function ObjectDefineProperties2Test090() {
    const arr = new Uint8Array([255, 0, 128]);
    Object.defineProperties(arr, {
        custom: { value: 255, writable: true },
        sum: {
            get: function() { return this.reduce((a, b) => a + b, 0); },
            enumerable: true
        }
    });
    return [arr.custom, arr.sum]; 
}

export function ObjectDefineProperties2Test091() {
    const arr = new Float32Array([1.5, 2.5, 3.5]);
    Object.defineProperties(arr, {
        average: {
            get: function() { return this.reduce((a, b) => a + b, 0) / this.length; },
            enumerable: true
        }
    });
    return arr.average; 
}

export function ObjectDefineProperties2Test092() {
    const arr = new BigInt64Array([100n, 200n, 300n]);
    Object.defineProperties(arr, {
        total: {
            get: function() { return this.reduce((a, b) => a + b, 0n); },
            enumerable: true
        }
    });
    return arr.total; 
}

export function ObjectDefineProperties2Test093() {
    const buffer = new ArrayBuffer(16);
    Object.defineProperties(buffer, {
        label: { value: 'my-buffer', enumerable: true },
        createTime: { value: new Date(), enumerable: true }
    });
    return [buffer.label, buffer.byteLength]; 
}

export function ObjectDefineProperties2Test094() {
    const buffer = new ArrayBuffer(32);
    Object.defineProperties(buffer, {
        view: {
            get: function() { return new DataView(this); },
            enumerable: true
        }
    });
    return buffer.view instanceof DataView;
}

export function ObjectDefineProperties2Test095() {
    const view = new DataView(new ArrayBuffer(16));
    Object.defineProperties(view, {
        offset: { value: 0, writable: true },
        label: { value: 'data-view', enumerable: true }
    });
    return [view.offset, view.byteLength];
}

export function ObjectDefineProperties2Test096() {
    const map = new Map([['key1', 'value1']]);
    Object.defineProperties(map, {
        customProp: { value: 'custom-value', enumerable: true },
        count: {
            get: function() { return this.size; },
            enumerable: true
        }
    });
    return [
        map.customProp,
        map.count,
        map.get('key1')
    ]; 
}

export function ObjectDefineProperties2Test097() {
    const map = new Map([['name', 'John'], ['age', 30]]);
    Object.defineProperties(map, {
        name: {
            get: function() { return this.get('name'); },
            set: function(v) { this.set('name', v); },
            enumerable: true
        }
    });
    const firstName = map.name;
    map.name = 'Jane';
    const afterSet = map.get('name');
    return [firstName, afterSet];
}

export function ObjectDefineProperties2Test098() {
    const set = new Set([1, 2, 3]);
    Object.defineProperties(set, {
        label: { value: 'number-set', enumerable: true },
        hasDuplicates: { value: false, writable: true }
    });
    return [set.label, set.size]; 
}

export function ObjectDefineProperties2Test099() {
    const date = new Date('2024-01-01');
    Object.defineProperties(date, {
        timezone: { value: 'UTC', enumerable: true },
        formatted: {
            get: function() { return this.toISOString().split('T')[0]; },
            enumerable: true
        }
    });
    return [
        date.timezone,
        date.formatted,
        date.getFullYear()
    ]; 
}
