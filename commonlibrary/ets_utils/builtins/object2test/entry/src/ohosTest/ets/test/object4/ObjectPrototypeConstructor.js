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

export function ObjectPrototypeConstructorTest001() {
    const obj = {};
    let a1 = obj.constructor === Object;
    let a2 = obj.constructor.name;
    let a = obj.constructor === Object;
    let b = obj.constructor.name;
    return [a, b];
}

export function ObjectPrototypeConstructorTest002() {
    const obj = new Object();
    let a = obj.constructor === Object;
    return a;
}

export function ObjectPrototypeConstructorTest003() {
    const obj = {};
    let a1 = typeof obj.constructor;
    let a2 = obj.constructor === Object;
    return [a1, a2];
}

export function ObjectPrototypeConstructorTest004() {
    const obj = {};
    obj.constructor = Array;
    let a = obj.constructor === Array;
    return a;
}

export function ObjectPrototypeConstructorTest005() {
    const obj = {};
    let a1 = obj.propertyIsEnumerable('constructor');
    let a2 = Object.keys(obj).includes('constructor');
    return [a1, a2];
}

export function ObjectPrototypeConstructorTest007() {
    const obj = {};
    let a1 = Object.hasOwn(obj, 'constructor');
    let a2 = Object.hasOwn(Object.getPrototypeOf(obj), 'constructor');
    return [a1, a2];
}

export function ObjectPrototypeConstructorTest008() {
    const obj = {};
    let a1 = 'constructor' in obj;
    let a2 = obj.constructor === Object;
    return [a1, a2];
}

export function ObjectPrototypeConstructorTest009() {
    const num = new Number(123);
    let a1 = num.constructor === Number;
    const primitiveNum = 42;
    let a2 = primitiveNum.constructor === Number;
    return [a1, a2];
}

export function ObjectPrototypeConstructorTest010() {
    const str = new String("hello");
    let a1 = str.constructor === String;
    const primitiveStr = "world";
    let a2 = primitiveStr.constructor === String;
    return [a1, a2];
}

export function ObjectPrototypeConstructorTest011() {
    const bool = new Boolean(true);
    let a1 = bool.constructor === Boolean;
    const primitiveBool = false;
    let a2 = primitiveBool.constructor === Boolean;
    return [a1, a2];
}

export function ObjectPrototypeConstructorTest012() {
    const arr = [];
    let a1 = arr.constructor === Array;
    const arr2 = new Array(1, 2, 3);
    let a2 = arr2.constructor === Array;
    return [a1, a2];
}

export function ObjectPrototypeConstructorTest013() {
    const map = new Map();
    let a = map.constructor === Map;
    return a;
}

export function ObjectPrototypeConstructorTest014() {
    const set = new Set();
    let a = set.constructor === Set;
    return a;
}

export function ObjectPrototypeConstructorTest015() {
    const weakMap = new WeakMap();
    let a = weakMap.constructor === WeakMap;
    return a;
}

export function ObjectPrototypeConstructorTest016() {
    const weakSet = new WeakSet();
    let a = weakSet.constructor === WeakSet;
    return a;
}

export function ObjectPrototypeConstructorTest017() {
    const int8 = new Int8Array([1, 2, 3]);
    let a = int8.constructor === Int8Array;
    return a;
}

export function ObjectPrototypeConstructorTest018() {
    const uint8 = new Uint8Array([1, 2, 3]);
    let a = uint8.constructor === Uint8Array;
    return a;
}

export function ObjectPrototypeConstructorTest019() {
    const float32 = new Float32Array([1.1, 2.2, 3.3]);
    let a = float32.constructor === Float32Array;
    return a;
}

export function ObjectPrototypeConstructorTest020() {
    const bigInt64 = new BigInt64Array([1n, 2n, 3n]);
    let a = bigInt64.constructor === BigInt64Array;
    return a;
}

export function ObjectPrototypeConstructorTest022() {
    const date = new Date();
    let a1 = date.constructor === Date;
    const date2 = new Date('2024-01-01');
    let a2 = date2.constructor === Date;
    return [a1, a2];
}

export function ObjectPrototypeConstructorTest023() {
    const regex = /abc/;
    let a1 = regex.constructor === RegExp;
    const regex2 = new RegExp('abc');
    let a2 = regex2.constructor === RegExp;
    return [a1, a2];
}

export function ObjectPrototypeConstructorTest024() {
    const err = new Error();
    let a1 = err.constructor === Error;
    const typeErr = new TypeError();
    let a2 = typeErr.constructor === TypeError;
    const rangeErr = new RangeError();
    let a3 = rangeErr.constructor === RangeError;
    return [a1, a2, a3];
}

export function ObjectPrototypeConstructorTest025() {
    const promise = new Promise((resolve, reject) => resolve());
    let a = promise.constructor === Promise;
    return a;
}

export function ObjectPrototypeConstructorTest026() {
    const buffer = new ArrayBuffer(16);
    let a = buffer.constructor === ArrayBuffer;
    return a;
}

export function ObjectPrototypeConstructorTest027() {
    const buffer = new ArrayBuffer(16);
    const view = new DataView(buffer);
    let a = view.constructor === DataView;
    return a;
}

export function ObjectPrototypeConstructorTest028() {
    const big = 123n;
    let a = big.constructor === BigInt;
    return a;
}

export function ObjectPrototypeConstructorTest029() {
    const sym = Symbol('test');
    let a = sym.constructor === Symbol;
    return a;
}

export function ObjectPrototypeConstructorTest030() {
    const obj = {};
    let a = obj.constructor === Object;
    return a;
}

export function ObjectPrototypeConstructorTest031() {
    const obj = { a: 1, b: 2 };
    let a = obj.constructor === Object;
    return a;
}

export function ObjectPrototypeConstructorTest032() {
    const arr = [];
    let a = arr.constructor === Array;
    return a;
}

export function ObjectPrototypeConstructorTest033() {
    const arr = [1, 2, 3];
    let a = arr.constructor === Array;
    return a;
}

export function ObjectPrototypeConstructorTest034() {
    const regex = /abc/gi;
    let a = regex.constructor === RegExp;
    return a;
}

export function ObjectPrototypeConstructorTest035() {
    function foo() {}
    let a = foo.constructor === Function;
    return a;
}

export function ObjectPrototypeConstructorTest036() {
    const foo = function() {};
    let a = foo.constructor === Function;
    return a;
}

export function ObjectPrototypeConstructorTest037() {
    const arrow = () => {};
    let a = arrow.constructor === Function;
    return a;
}

export function ObjectPrototypeConstructorTest038() {
    function Person(name) {
        this.name = name;
    }
    const person = new Person('John');
    let a = person.constructor === Person;
    return a;
}

export function ObjectPrototypeConstructorTest039() {
    const Animal = function(name) {
        this.name = name;
    };
    const animal = new Animal('Dog');
    let a = animal.constructor === Animal;
    return a;
}

export function ObjectPrototypeConstructorTest040() {
    function Person(name) {
        this.name = name;
    }
    const person = new Person('John');
    let a1 = person.constructor === Person.prototype.constructor;
    let a2 = Object.hasOwn(person, 'constructor');
    return [a1, a2];
}

export function ObjectPrototypeConstructorTest041() {
    function Person(name) {
        this.name = name;
    }
    let a = Person.prototype.constructor === Person;
    return a;
}

export function ObjectPrototypeConstructorTest044() {
    function Parent() {}
    function Child() {}
    Child.prototype = Object.create(Parent.prototype);
    const child = new Child();
    let a = child.constructor === Parent;
    return a;
}

export function ObjectPrototypeConstructorTest045() {
    function Parent() {}
    function Child() {}
    Child.prototype = Object.create(Parent.prototype);
    Child.prototype.constructor = Child;
    const child = new Child();
    let a = child.constructor === Child;
    return a;
}

export function ObjectPrototypeConstructorTest046() {
    const proto = { a: 1 };
    const obj = Object.create(proto);
    let a = obj.constructor === Object;
    return a;
}

export function ObjectPrototypeConstructorTest047() {
    const obj = Object.create(null);
    let a1 = obj.constructor;
    let a2 = 'constructor' in obj;
    return [a1, a2];
}

export function ObjectPrototypeConstructorTest048() {
    const obj = new TypeError();
    const proto = Object.getPrototypeOf;
    let a1 = proto(obj).constructor === TypeError;
    let a2 = proto(proto(obj)).constructor === Error;
    let a3 = proto(proto(proto(obj))).constructor === Object;
    return [a1, a2, a3];
}

export function ObjectPrototypeConstructorTest049() {
    function Foo() {}
    const foo = new Foo();
    let a1 = foo.hasOwnProperty('constructor');
    let a2 = Foo.prototype.hasOwnProperty('constructor');
    return [a1, a2];
}

export function ObjectPrototypeConstructorTest050() {
    const arr = [];
    arr.constructor = String;
    let a1 = arr.constructor === String;
    let a2 = arr instanceof String;
    let a3 = arr instanceof Array;
    return [a1, a2, a3];
}

export function ObjectPrototypeConstructorTest051() {
    const arr = [];
    arr.constructor = String;
    let a1 = Object.hasOwn(arr, 'constructor');
    let a2 = Array.prototype.constructor === Array;
    return [a1, a2];
}

export function ObjectPrototypeConstructorTest052() {
    function Foo() {}
    Foo.prototype.constructor = String;
    const foo = new Foo();
    let a = foo.constructor === String;
    return a;
}

export function ObjectPrototypeConstructorTest053() {
    function Parent() {}
    function Child() {}
    Child.prototype = Object.create(Parent.prototype);
    return null;
}

export function ObjectPrototypeConstructorTest054() {
    function Parent() {}
    function Child() {}
    Child.prototype = Object.create(Parent.prototype);
    Child.prototype.constructor = Child;
    const child = new Child();
    let a = child.constructor === Child;
    return a;
}

export function ObjectPrototypeConstructorTest055() {
    function Parent() {}
    function Child() {}
    Child.prototype = Object.create(Parent.prototype);
    Object.defineProperty(Child.prototype, 'constructor', {
        value: Child,
        enumerable: false,
        writable: true,
        configurable: true
    });
    const child = new Child();
    let a = child.constructor === Child;
    return a;
}

export function ObjectPrototypeConstructorTest056() {
    const arr = [];
    arr.constructor = String;
    let a1 = arr instanceof String;
    let a2 = arr instanceof Array;
    return [a1, a2];
}

export function ObjectPrototypeConstructorTest057() {
    const obj = {};
    obj.constructor = Array;
    let a1 = Array.isArray(obj);
    let a2 = Object.prototype.toString.call(obj);
    return [a1, a2];
}

export function ObjectPrototypeConstructorTest058() {
    class Person {
        constructor(name) {
            this.name = name;
        }
    }
    const person = new Person('John');
    let a = person.constructor === Person;
    return a;
}

export function ObjectPrototypeConstructorTest059() {
    class Empty {}
    const empty = new Empty();
    let a = empty.constructor === Empty;
    return a;
}

export function ObjectPrototypeConstructorTest060() {
    class Parent {
        constructor(name) {
            this.name = name;
        }
    }
    class Child extends Parent {
        constructor(name, age) {
            super(name);
            this.age = age;
        }
    }
    const child = new Child('John', 20);
    let a = child.constructor === Child;
    return a;
}

export function ObjectPrototypeConstructorTest061() {
    class Animal {
        constructor(name) {
            this.name = name;
        }
    }
    class Dog extends Animal {}
    const dog = new Dog('Buddy');
    let a = dog.constructor === Dog;
    return a;
}

export function ObjectPrototypeConstructorTest062() {
    const Person = class {
        constructor(name) {
            this.name = name;
        }
    };
    const person = new Person('John');
    let a = person.constructor === Person;
    return a;
}

export function ObjectPrototypeConstructorTest063() {
    const Person = class PersonClass {
        constructor(name) {
            this.name = name;
        }
    };
    const person = new Person('John');
    let a1 = person.constructor === Person;
    let a2 = person.constructor.name;
    return [a1, a2];
}

export function ObjectPrototypeConstructorTest064() {
    const descriptor = Object.getOwnPropertyDescriptor(Object.prototype, 'constructor');
    let a = descriptor.writable;
    return a;
}

export function ObjectPrototypeConstructorTest065() {
    const obj = {};
    obj.constructor = Array;
    let a = obj.constructor === Array;
    return a;
}

export function ObjectPrototypeConstructorTest066() {
    const obj = {};
    let a1 = false;
    for (let key in obj) {
        a1 = key === 'constructor';
    }
    let a2 = Object.keys(obj).includes('constructor');
    return [a1, a2];
}

export function ObjectPrototypeConstructorTest067() {
    const obj = {};
    let a = obj.propertyIsEnumerable('constructor');
    return a;
}

export function ObjectPrototypeConstructorTest069() {
    const obj = {};
    obj.constructor = Array;
    delete obj.constructor;
    let a = obj.constructor === Object;
    return a;
}

export function ObjectPrototypeConstructorTest070() {
    function Foo() {}
    Object.defineProperty(Foo.prototype, 'constructor', {
        value: Foo,
        writable: false,
        enumerable: false,
        configurable: true
    });
    const foo = new Foo();
    try {
        foo.constructor = String;
    } catch (e) {}
    let a = foo.constructor === Foo;
    return a;
}

export function ObjectPrototypeConstructorTest071() {
    function Parent() {}
    function Child() {}
    Child.prototype = new Parent();
    const child = new Child();
    let a = child.constructor === Parent;
    return a;
}

export function ObjectPrototypeConstructorTest072() {
    function Parent() {}
    function Child() {}
    Child.prototype = new Parent();
    Child.prototype.constructor = Child;
    const child = new Child();
    let a = child.constructor === Child;
    return a;
}

export function ObjectPrototypeConstructorTest073() {
    function Parent(name) {
        this.name = name;
    }
    function Child(name, age) {
        Parent.call(this, name);
        this.age = age;
    }
    Child.prototype = Object.create(Parent.prototype);
    Child.prototype.constructor = Child;
    const child = new Child('John', 20);
    let a = child.constructor === Child;
    return a;
}

export function ObjectPrototypeConstructorTest074() {
    function Parent(name) {
        this.name = name;
    }
    function Child(name, age) {
        Parent.call(this, name);
        this.age = age;
    }
    Object.setPrototypeOf(Child.prototype, Parent.prototype);
    const child = new Child('John', 20);
    let a = child.constructor === Child;
    return a;
}

export function ObjectPrototypeConstructorTest075() {
    function Parent() {}
    Parent.prototype.create = function() {
        return new this.constructor();
    };
    const parent = new Parent();
    const newParent = parent.create();
    let a = newParent instanceof Parent;
    return a;
}

export function ObjectPrototypeConstructorTest076() {
    function Parent() {}
    function Child() {}
    Child.prototype = Object.create(Parent.prototype, {
        constructor: {
            value: Child,
            enumerable: false,
            writable: true,
            configurable: true
        }
    });
    Child.prototype.create = function() {
        return new this.constructor();
    };
    const child = new Child();
    const newChild = child.create();
    let a = newChild instanceof Child;
    return a;
}

export function ObjectPrototypeConstructorTest077() {
    let a;
    try {
        null.constructor;
    } catch (e) {
        a = e instanceof TypeError;
    }
    return a;
}

export function ObjectPrototypeConstructorTest078() {
    let a;
    try {
        undefined.constructor;
    } catch (e) {
        a = e instanceof TypeError;
    }
    return a;
}

export function ObjectPrototypeConstructorTest079() {
    let a = Math.constructor === Object;
    return a;
}

export function ObjectPrototypeConstructorTest080() {
    let a = JSON.constructor === Object;
    return a;
}

export function ObjectPrototypeConstructorTest081() {
    let a = typeof globalThis.constructor;
    return a;
}

export function ObjectPrototypeConstructorTest082() {
    function test() {
        let a = arguments.constructor === Object;
        return a;
    }
    let result = test(1, 2, 3);
    return result;
}

export function ObjectPrototypeConstructorTest083() {
    const target = { a: 1 };
    const proxy = new Proxy(target, {});
    let a = proxy.constructor === Object;
    return a;
}

export function ObjectPrototypeConstructorTest084() {
    const frozen = Object.freeze({ a: 1 });
    let a = frozen.constructor === Object;
    return a;
}

export function ObjectPrototypeConstructorTest085() {
    const sealed = Object.seal({ a: 1 });
    let a = sealed.constructor === Object;
    return a;
}

export function ObjectPrototypeConstructorTest086() {
    const moduleExports = { a: 1, b: 2 };
    let a = moduleExports.constructor === Object;
    return a;
}

export function ObjectPrototypeConstructorTest087() {
    const arr = [];
    let a1 = arr.constructor === Array;
    const obj = {};
    let a2 = obj.constructor === Object;
    return [a1, a2];
}

export function ObjectPrototypeConstructorTest088() {
    function Parent() {}
    function Child() {}
    Child.prototype = Object.create(Parent.prototype);
    const child = new Child();
    let a1 = child.constructor === Parent;
    let a2 = child instanceof Child;
    return [a1, a2];
}

export function ObjectPrototypeConstructorTest089() {
    const arr = [1, 2, 3];
    const newArr = new arr.constructor(4, 5, 6);
    let a1 = newArr;
    let a2 = newArr instanceof Array;
    return [a1, a2];
}

export function ObjectPrototypeConstructorTest090() {
    function Container(items) {
        this.items = items;
    }
    Container.prototype.clone = function() {
        return new this.constructor(this.items.slice());
    };
    const container = new Container([1, 2, 3]);
    const cloned = container.clone();
    let a1 = cloned instanceof Container;
    let a2 = cloned.items;
    return [a1, a2];
}

export function ObjectPrototypeConstructorTest091() {
    function deepClone(obj) {
        if (obj === null || typeof obj !== 'object') {
            return obj;
        }
        const clone = new obj.constructor();
        for (let key in obj) {
            if (obj.hasOwnProperty(key)) {
                clone[key] = deepClone(obj[key]);
            }
        }
        return clone;
    }
    const original = { a: 1, b: { c: 2 } };
    const cloned = deepClone(original);
    let a1 = cloned;
    let a2 = cloned !== original;
    return [a1, a2];
}

export function ObjectPrototypeConstructorTest092() {
    const arr = [];
    let a1 = arr.constructor === Array;
    let a2 = arr instanceof Array;
    let a3 = arr instanceof Object;
    let a4 = arr.constructor === Object;
    return [a1, a2, a3, a4];
}

export function ObjectPrototypeConstructorTest093() {
    const arr = [];
    let a = Array.isArray(arr);
    return a;
}

export function ObjectPrototypeConstructorTest094() {
    const obj = {};
    obj.self = obj;
    let a = obj.constructor === Object;
    return a;
}

export function ObjectPrototypeConstructorTest095() {
    let deep = {};
    let current = deep;
    for (let i = 0; i < 1000; i++) {
        current.nested = {};
        current = current.nested;
    }
    let a = deep.constructor === Object;
    return a;
}

export function ObjectPrototypeConstructorTest096() {
    const sym = Symbol('key');
    const obj = { [sym]: 'value' };
    let a = obj.constructor === Object;
    return a;
}

export function ObjectPrototypeConstructorTest097() {
    function Foo() {
        return { custom: true };
    }
    const foo = new Foo();
    let a = foo.constructor === Object;
    return a;
}

export function ObjectPrototypeConstructorTest098() {
    function Bar() {
        return 42;
    }
    const bar = new Bar();
    let a = bar.constructor === Bar;
    return a;
}

export function ObjectPrototypeConstructorTest099() {
    function Foo() {}
    Foo.prototype.constructor = "not a function";
    const foo = new Foo();
    let a1 = foo.constructor;
    let a2 = typeof foo.constructor;
    return [a1, a2];
}
