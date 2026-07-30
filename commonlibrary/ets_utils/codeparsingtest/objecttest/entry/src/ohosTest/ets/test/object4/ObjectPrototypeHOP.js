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

export function ObjectPrototypeHOPTest001() {
    function Foo() {}
    delete Foo.prototype.constructor;
    const foo = new Foo();
    let a = foo.constructor === Object;
    return a;
}

export function ObjectPrototypeHOPTest003() {
    const example = {};
    example.prop = "exists";
    let a = example.hasOwnProperty("prop");
    return a;
}

export function ObjectPrototypeHOPTest004() {
    const example = {};
    example.prop = "exists";
    let a = example.hasOwnProperty("prop");
    return a;
}

export function ObjectPrototypeHOPTest005() {
    const sym = Symbol("key");
    const obj = { [sym]: "value" };
    let a = obj.hasOwnProperty(sym);
    return a;
}

export function ObjectPrototypeHOPTest006() {
    const obj = { prop: "exists" };
    let a = obj.hasOwnProperty("nonexistent");
    return a;
}

export function ObjectPrototypeHOPTest007() {
    const object1 = {
        prop: "exists",
    };
    let a = object1.hasOwnProperty("undeclaredPropertyValue");
    return a;
}

export function ObjectPrototypeHOPTest008() {
    const example = {};
    example.prop = "exists";
    let a = example.hasOwnProperty("toString");
    let b = example.hasOwnProperty("hasOwnProperty");
    return [a, b];
}

export function ObjectPrototypeHOPTest009() {
    const parent = { inherited: "value" };
    const child = Object.create(parent);
    let a = child.hasOwnProperty("inherited");
    return a;
}

export function ObjectPrototypeHOPTest010() {
    const example = {};
    example.prop = null;
    let a = example.hasOwnProperty("prop");
    return a;
}

export function ObjectPrototypeHOPTest011() {
    const example = {};
    example.prop = undefined;
    let a = example.hasOwnProperty("prop");
    return a;
}

export function ObjectPrototypeHOPTest012() {
    const obj = { prop: "value", "my-prop": "test" };
    let a = obj.hasOwnProperty("prop");
    let b = obj.hasOwnProperty("my-prop");
    return [a, b];
}

export function ObjectPrototypeHOPTest013() {
    const sym1 = Symbol("key1");
    const sym2 = Symbol("key2");
    const obj = { [sym1]: "value1" };
    let a = obj.hasOwnProperty(sym1);
    let b = obj.hasOwnProperty(sym2);
    return [a, b];
}

export function ObjectPrototypeHOPTest014() {
    const obj = { 1: "one", 2: "two" };
    let a = obj.hasOwnProperty(1);
    let b = obj.hasOwnProperty(2);
    let c = obj.hasOwnProperty(3);
    return [a, b, c];
}

export function ObjectPrototypeHOPTest015() {
    const fruits = ["Apple", "Banana", "Watermelon", "Orange"];
    let a = fruits.hasOwnProperty(3);
    let b = fruits.hasOwnProperty(4);
    return [a, b];
}

export function ObjectPrototypeHOPTest016() {
    const obj = { "": "empty key" };
    let a = obj.hasOwnProperty("");
    return a;
}

export function ObjectPrototypeHOPTest017() {
    const obj = {
        "!@#$%^&*()": "special1",
        "空格 键": "special2"
    };
    let a = obj.hasOwnProperty("!@#$%^&*()");
    let b = obj.hasOwnProperty("空格 键");
    return [a, b];
}

export function ObjectPrototypeHOPTest018() {
    const obj = {
        "中文": "chinese",
        "🎉": "emoji",
        "\ud83d\udc46": "unicode escape"
    };
    let a = obj.hasOwnProperty("中文");
    let b = obj.hasOwnProperty("🎉");
    return [a, b];
}

export function ObjectPrototypeHOPTest019() {
    const obj = {
        "line\nbreak": "test1",
        "tab\tspace": "test2",
        "quote\"mark": "test3"
    };
    let a = obj.hasOwnProperty("line\nbreak");
    let b = obj.hasOwnProperty("tab\tspace");
    return [a, b];
}

export function ObjectPrototypeHOPTest020() {
    const obj = {
        "if": "keyword1",
        "for": "keyword2",
        "class": "keyword3"
    };
    let a = obj.hasOwnProperty("if");
    let b = obj.hasOwnProperty("for");
    let c = obj.hasOwnProperty("class");
    return [a, b, c];
}

export function ObjectPrototypeHOPTest022() {
    const obj = { a: 1, b: 2 };
    let a = obj.hasOwnProperty("a");
    let b = obj.hasOwnProperty("b");
    return [a, b];
}

export function ObjectPrototypeHOPTest023() {
    const obj = {};
    Object.defineProperty(obj, "hidden", {
        value: "secret",
        enumerable: false
    });
    let a = obj.hasOwnProperty("hidden");
    return a;
}

export function ObjectPrototypeHOPTest024() {
    const sym = Symbol("key");
    const obj = { [sym]: "value" };
    let a = obj.hasOwnProperty(sym);
    return a;
}

export function ObjectPrototypeHOPTest025() {
    const obj = {
        get value() { return this._value; },
        set value(v) { this._value = v; },
        _value: 10
    };
    let a = obj.hasOwnProperty("value");
    let b = obj.hasOwnProperty("_value");
    return [a, b];
}

export function ObjectPrototypeHOPTest026() {
    const obj = {};
    Object.defineProperty(obj, "defined", {
        value: 42,
        writable: true,
        enumerable: true,
        configurable: true
    });
    let a = obj.hasOwnProperty("defined");
    return a;
}

export function ObjectPrototypeHOPTest027() {
    const obj = { a: 1 };
    let a = obj.hasOwnProperty("nonexistent");
    let b = obj.hasOwnProperty("b");
    return [a, b];
}

export function ObjectPrototypeHOPTest028() {
    const parent = { inherited: "value" };
    const child = Object.create(parent);
    let a = child.hasOwnProperty("inherited");

    const normalObj = {};
    let b = normalObj.hasOwnProperty("toString");
    let c = normalObj.hasOwnProperty("hasOwnProperty");
    return [a, b, c];
}

export function ObjectPrototypeHOPTest029() {
    const grandParent = { grand: "value" };
    const parent = Object.create(grandParent);
    parent.parent = "value";
    const child = Object.create(parent);

    let a = child.hasOwnProperty("grand");
    let b = child.hasOwnProperty("parent");
    let c = child.hasOwnProperty("hasOwnProperty");
    return [a, b, c];
}

export function ObjectPrototypeHOPTest030() {
    const proto = { inherited: "value" };
    const obj = {};
    Object.setPrototypeOf(obj, proto);
    let a = obj.hasOwnProperty("inherited");
    return a;
}

export function ObjectPrototypeHOPTest031() {
    class Parent {
        parentMethod() {}
    }
    class Child extends Parent {
        childMethod() {}
    }
    const child = new Child();

    let a = child.hasOwnProperty("parentMethod");
    let b = child.hasOwnProperty("childMethod");
    return [a, b];
}

export function ObjectPrototypeHOPTest032() {
    const obj = { a: 1 };
    let a = typeof obj.hasOwnProperty("a");
    let b = typeof obj.hasOwnProperty("nonexistent");
    let c = obj.hasOwnProperty("a") === true;
    let d = obj.hasOwnProperty("nonexistent") === false;
    return [a, b, c, d];
}

export function ObjectPrototypeHOPTest033() {
    const obj = { a: 1 };
    const result1 = obj.hasOwnProperty("a");
    const result2 = obj.hasOwnProperty("nonexistent");

    let a = result1 === true;
    let b = result1 === 1;
    let c = result2 === false;
    let d = result2 === 0;
    return [a, b, c, d];
}

export function ObjectPrototypeHOPTest034() {
    const example = {};
    example.prop = "exists";

    let a = example.hasOwnProperty("prop");
    let b = example.hasOwnProperty("toString");
    let c = example.hasOwnProperty("hasOwnProperty");
    return [a, b, c];
}

export function ObjectPrototypeHOPTest035() {
    const example = {};
    example.prop = "exists";

    let a = example.hasOwnProperty("prop");
    let b = "prop" in example;

    let c = example.hasOwnProperty("toString");
    let d = "toString" in example;

    let e = example.hasOwnProperty("hasOwnProperty");
    let f = "hasOwnProperty" in example;
    return [a, b, c, d, e, f];
}

export function ObjectPrototypeHOPTest036() {
    const foo = Object.create(null);
    foo.prop = "exists";
    let a;
    try {
        foo.hasOwnProperty("prop");
    } catch (e) {
        a = e instanceof TypeError;
    }
    return a;
}

export function ObjectPrototypeHOPTest037() {
    const foo = Object.create(null);
    foo.prop = "exists";
    let a = Object.prototype.hasOwnProperty.call(foo, "prop");
    let b = {}.hasOwnProperty.call(foo, "prop");
    return [a, b];
}

export function ObjectPrototypeHOPTest038() {
    const proto = { inherited: "value" };
    const obj = Object.create(proto);
    obj.own = "own value";

    let a = obj.hasOwnProperty("own");
    let b = obj.hasOwnProperty("inherited");
    return [a, b];
}

export function ObjectPrototypeHOPTest039() {
    const grandParent = { grand: "value" };
    const parent = Object.create(grandParent);
    parent.parent = "value";
    const child = Object.create(parent);

    let a = child.hasOwnProperty("grand");
    let b = child.hasOwnProperty("parent");
    let c = parent.hasOwnProperty("grand");
    let d = parent.hasOwnProperty("parent");
    return [a, b, c, d];
}

export function ObjectPrototypeHOPTest040() {
    const level1 = { l1: "level1" };
    const level2 = Object.create(level1);
    level2.l2 = "level2";
    const level3 = Object.create(level2);
    level3.l3 = "level3";

    let a = level3.hasOwnProperty("l3");
    let b = level3.hasOwnProperty("l2");
    let c = level3.hasOwnProperty("l1");
    let d = level2.hasOwnProperty("l2");
    let e = level2.hasOwnProperty("l1");
    return [a, b, c, d, e];
}

export function ObjectPrototypeHOPTest041() {
    class Parent {
        constructor() {
            this.parentProp = "parent";
        }
        parentMethod() {}
    }
    class Child extends Parent {
        constructor() {
            super();
            this.childProp = "child";
        }
        childMethod() {}
    }
    const child = new Child();

    let a = child.hasOwnProperty("parentProp");
    let b = child.hasOwnProperty("childProp");
    let c = child.hasOwnProperty("parentMethod");
    let d = child.hasOwnProperty("childMethod");
    return [a, b, c, d];
}

export function ObjectPrototypeHOPTest042() {
    class MyClass {
        static staticProp = "static";
        static staticMethod() {}
    }

    let a = MyClass.hasOwnProperty("staticProp");
    let b = MyClass.hasOwnProperty("staticMethod");
    let c = MyClass.hasOwnProperty("prototype");
    return [a, b, c];
}

export function ObjectPrototypeHOPTest043() {
    const obj = { own: "value" };
    const newProto = { newInherited: "new" };
    Object.setPrototypeOf(obj, newProto);

    let a = obj.hasOwnProperty("own");
    let b = obj.hasOwnProperty("newInherited");
    let c = obj.hasOwnProperty("hasOwnProperty");
    return [a, b, c];
}

export function ObjectPrototypeHOPTest044() {
    const parent = { inherited: "value" };
    const child = Object.create(parent);

    let a = child.hasOwnProperty("inherited");
    let b = child.inherited;

    delete parent.inherited;
    let c = child.hasOwnProperty("inherited");
    let d = child.inherited;
    return [a, b, c, d];
}

export function ObjectPrototypeHOPTest045() {
    const obj = { a: 1 };
    Object.defineProperty(obj, "b", {
        value: 2,
        enumerable: true
    });
    let a = obj.hasOwnProperty("a");
    let b = obj.hasOwnProperty("b");
    return [a, b];
}

export function ObjectPrototypeHOPTest046() {
    const obj = {};
    Object.defineProperty(obj, "hidden", {
        value: "secret",
        enumerable: false
    });
    let a = obj.hasOwnProperty("hidden");
    let b = Object.keys(obj).includes("hidden");
    return [a, b];
}

export function ObjectPrototypeHOPTest047() {
    const obj = {};
    Object.defineProperty(obj, "writable", {
        value: "can change",
        writable: true
    });
    let a = obj.hasOwnProperty("writable");
    obj.writable = "changed";
    let b = obj.hasOwnProperty("writable");
    return [a, b];
}

export function ObjectPrototypeHOPTest048() {
    const obj = {};
    Object.defineProperty(obj, "readonly", {
        value: "cannot change",
        writable: false
    });
    let a = obj.hasOwnProperty("readonly");
    return a;
}

export function ObjectPrototypeHOPTest049() {
    const obj = {};
    Object.defineProperty(obj, "configurable", {
        value: "can delete",
        configurable: true
    });
    let a = obj.hasOwnProperty("configurable");
    delete obj.configurable;
    let b = obj.hasOwnProperty("configurable");
    return [a, b];
}

export function ObjectPrototypeHOPTest051() {
    const obj = {
        get value() {
            return this._value;
        },
        _value: 10
    };
    let a = obj.hasOwnProperty("value");
    let b = obj.hasOwnProperty("_value");
    return [a, b];
}

export function ObjectPrototypeHOPTest052() {
    const obj = {
        set value(v) {
            this._value = v;
        },
        _value: 10
    };
    let a = obj.hasOwnProperty("value");
    let b = obj.hasOwnProperty("_value");
    return [a, b];
}

export function ObjectPrototypeHOPTest053() {
    const obj = {
        get value() {
            return this._value;
        },
        set value(v) {
            this._value = v;
        },
        _value: 10
    };
    let a = obj.hasOwnProperty("value");
    let b = obj.hasOwnProperty("_value");
    return [a, b];
}

export function ObjectPrototypeHOPTest054() {
    const obj = {};
    Object.defineProperty(obj, "prop", {
        get: function() { return this._prop; },
        set: function(value) { this._prop = value; },
        enumerable: true,
        configurable: true
    });
    obj._prop = "test";
    let a = obj.hasOwnProperty("prop");
    let b = obj.hasOwnProperty("_prop");
    return [a, b];
}

export function ObjectPrototypeHOPTest055() {
    const obj = {};
    Object.defineProperty(obj, "locked", {
        value: "immutable",
        enumerable: false,
        writable: false,
        configurable: false
    });
    let a = obj.hasOwnProperty("locked");
    return a;
}

export function ObjectPrototypeHOPTest056() {
    const obj = {};
    Object.defineProperty(obj, "flexible", {
        value: "mutable",
        enumerable: true,
        writable: true,
        configurable: true
    });
    let a = obj.hasOwnProperty("flexible");
    return a;
}

export function ObjectPrototypeHOPTest057() {
    const obj = { a: 1, b: 2 };
    let a = obj.hasOwnProperty("a");
    delete obj.a;
    let b = obj.hasOwnProperty("a");
    let c = obj.hasOwnProperty("b");
    return [a, b, c];
}

export function ObjectPrototypeHOPTest058() {
    const obj = {};
    Object.defineProperty(obj, "a", {
        value: 1,
        configurable: true
    });
    let a = obj.hasOwnProperty("a");
    delete obj.a;
    let b = obj.hasOwnProperty("a");
    return [a, b];
}

export function ObjectPrototypeHOPTest059() {
    const foo = Object.create(null);
    foo.prop = "exists";
    let a, b;
    try {
        foo.hasOwnProperty("prop");
    } catch (e) {
        a = e instanceof TypeError;
        b = e.message;
    }
    return a;
}

export function ObjectPrototypeHOPTest060() {
    const foo = Object.create(null);
    foo.prop = "exists";
    let a = Object.prototype.hasOwnProperty.call(foo, "prop");
    let b = {}.hasOwnProperty.call(foo, "prop");
    return [a, b];
}

export function ObjectPrototypeHOPTest061() {
    const foo = Object.create(null);
    foo.prop = "exists";
    let a = Object.prototype.hasOwnProperty.call(foo, "prop");
    let b = Object.prototype.hasOwnProperty.call(foo, "toString");
    return [a, b];
}

export function ObjectPrototypeHOPTest062() {
    const obj = Object.freeze({ a: 1, b: 2 });
    let a = obj.hasOwnProperty("a");
    let b = obj.hasOwnProperty("b");
    let c = obj.hasOwnProperty("c");
    return [a, b, c];
}

export function ObjectPrototypeHOPTest064() {
    const obj = Object.seal({ a: 1, b: 2 });
    let a = obj.hasOwnProperty("a");
    let b = obj.hasOwnProperty("b");
    let c = obj.hasOwnProperty("c");
    return [a, b, c];
}

export function ObjectPrototypeHOPTest066() {
    const obj = { a: 1 };
    Object.preventExtensions(obj);
    let a = obj.hasOwnProperty("a");
    let b = obj.hasOwnProperty("b");
    return [a, b];
}

export function ObjectPrototypeHOPTest068() {
    const sym1 = Symbol("s1");
    const sym2 = Symbol("s2");
    const obj = { [sym1]: "value1", [sym2]: "value2" };
    let a = obj.hasOwnProperty(sym1);
    let b = obj.hasOwnProperty(sym2);
    let c = obj.hasOwnProperty("s1");
    return [a, b, c];
}

export function ObjectPrototypeHOPTest069() {
    const sym1 = Symbol("s1");
    const sym2 = Symbol("s2");
    const obj = {
        a: 1,
        [sym1]: "value1",
        b: 2,
        [sym2]: "value2",
        c: 3
    };
    let a = obj.hasOwnProperty("a");
    let b = obj.hasOwnProperty("b");
    let c = obj.hasOwnProperty(sym1);
    let d = obj.hasOwnProperty(sym2);
    return [a, b, c, d];
}

export function ObjectPrototypeHOPTest070() {
    const obj = { a: undefined, b: 1 };
    let a = obj.hasOwnProperty("a");
    let b = obj.hasOwnProperty("b");
    return [a, b];
}

export function ObjectPrototypeHOPTest071() {
    const obj = { a: null, b: 1 };
    let a = obj.hasOwnProperty("a");
    let b = obj.hasOwnProperty("b");
    return [a, b];
}

export function ObjectPrototypeHOPTest072() {
    const obj = { a: NaN, b: 1 };
    let a = obj.hasOwnProperty("a");
    let b = obj.hasOwnProperty("b");
    return [a, b];
}

export function ObjectPrototypeHOPTest073() {
    const obj = { a: Infinity, b: -Infinity, c: 1 };
    let a = obj.hasOwnProperty("a");
    let b = obj.hasOwnProperty("b");
    let c = obj.hasOwnProperty("c");
    return [a, b, c];
}

export function ObjectPrototypeHOPTest074() {
    const map = new Map([["key1", "value1"]]);
    map.customProp = "test";
    let a = map.hasOwnProperty("customProp");
    let b = map.hasOwnProperty("size");
    let c = map.hasOwnProperty("get");
    return [a, b, c];
}

export function ObjectPrototypeHOPTest075() {
    const set = new Set([1, 2, 3]);
    set.customProp = "test";
    let a = set.hasOwnProperty("customProp");
    let b = set.hasOwnProperty("size");
    return [a, b];
}

export function ObjectPrototypeHOPTest076() {
    const weakMap = new WeakMap();
    weakMap.customProp = "test";
    let a = weakMap.hasOwnProperty("customProp");
    let b = weakMap.hasOwnProperty("set");
    return [a, b];
}

export function ObjectPrototypeHOPTest077() {
    const weakSet = new WeakSet();
    weakSet.customProp = "test";
    let a = weakSet.hasOwnProperty("customProp");
    let b = weakSet.hasOwnProperty("add");
    return [a, b];
}

export function ObjectPrototypeHOPTest078() {
    const buffer = new ArrayBuffer(16);
    buffer.customProp = "test";
    let a = buffer.hasOwnProperty("customProp");
    let b = buffer.hasOwnProperty("byteLength");
    return [a, b];
}

export function ObjectPrototypeHOPTest079() {
    const buffer = new ArrayBuffer(16);
    const view = new DataView(buffer);
    view.customProp = "test";
    let a = view.hasOwnProperty("customProp");
    let b = view.hasOwnProperty("byteLength");
    return [a, b];
}

export function ObjectPrototypeHOPTest080() {
    const promise = new Promise((resolve) => resolve("done"));
    promise.customProp = "test";
    let a = promise.hasOwnProperty("customProp");
    let b = promise.hasOwnProperty("then");
    return [a, b];
}

export function ObjectPrototypeHOPTest081() {
    const regex = /abc/gi;
    regex.customProp = "test";
    let a = regex.hasOwnProperty("customProp");
    let b = regex.hasOwnProperty("source");
    let c = regex.hasOwnProperty("lastIndex");
    return [a, b, c];
}

export function ObjectPrototypeHOPTest082() {
    const date = new Date();
    date.customProp = "test";
    let a = date.hasOwnProperty("customProp");
    let b = date.hasOwnProperty("getTime");
    return [a, b];
}

export function ObjectPrototypeHOPTest083() {
    const error = new Error("test error");
    error.customProp = "test";
    let a = error.hasOwnProperty("customProp");
    let b = error.hasOwnProperty("message");
    let c = error.hasOwnProperty("name");
    return [a, b, c];
}

export function ObjectPrototypeHOPTest084() {
    function func() {}
    func.customProp = "test";
    func.customMethod = function() {};
    let a = func.hasOwnProperty("customProp");
    let b = func.hasOwnProperty("customMethod");
    let c = func.hasOwnProperty("name");
    let d = func.hasOwnProperty("length");
    let e = func.hasOwnProperty("call");
    return [a, b, c, d, e];
}

export function ObjectPrototypeHOPTest085() {
    const fruits = ["Apple", "Banana", "Watermelon", "Orange"];
    let a = fruits.hasOwnProperty(3);
    let b = fruits.hasOwnProperty(4);
    let c = fruits.hasOwnProperty("length");
    return [a, b, c];
}

export function ObjectPrototypeHOPTest086() {
    const arr = ["first", "middle", "last"];
    let a = arr.hasOwnProperty(0);
    let b = arr.hasOwnProperty(2);
    let c = arr.hasOwnProperty(3);
    return [a, b, c];
}

export function ObjectPrototypeHOPTest087() {
    const arr = [1, , , 4];
    let a = arr.hasOwnProperty(0);
    let b = arr.hasOwnProperty(1);
    let c = arr.hasOwnProperty(2);
    let d = arr.hasOwnProperty(3);
    return [a, b, c, d];
}

export function ObjectPrototypeHOPTest088() {
    const arr = [1, , , 4];
    let a = arr.hasOwnProperty("length");
    let b = arr.length;
    return [a, b];
}

export function ObjectPrototypeHOPTest089() {
    const arr = [undefined, null, NaN, Infinity];
    let a = arr.hasOwnProperty(0);
    let b = arr.hasOwnProperty(1);
    let c = arr.hasOwnProperty(2);
    let d = arr.hasOwnProperty(3);
    return [a, b, c, d];
}

export function ObjectPrototypeHOPTest090() {
    const arr = [1, 2, 3];
    arr.customProp = "value";
    arr["named"] = "test";
    let a = arr.hasOwnProperty(0);
    let b = arr.hasOwnProperty("customProp");
    let c = arr.hasOwnProperty("named");
    return [a, b, c];
}

export function ObjectPrototypeHOPTest091() {
    const arr = [];
    let a = arr.hasOwnProperty(0);
    let b = arr.hasOwnProperty("length");
    let c = arr.hasOwnProperty("push");
    return [a, b, c];
}

export function ObjectPrototypeHOPTest092() {
    const int8 = new Int8Array([1, 2, 3, -128, 127]);
    let a = int8.hasOwnProperty(0);
    let b = int8.hasOwnProperty(3);
    let c = int8.hasOwnProperty("length");
    let d = int8.hasOwnProperty("byteLength");
    return [a, b, c, d];
}

export function ObjectPrototypeHOPTest093() {
    const uint8 = new Uint8Array([0, 127, 255]);
    let a = uint8.hasOwnProperty(0);
    let b = uint8.hasOwnProperty("length");
    let c = uint8.hasOwnProperty("byteOffset");
    return [a, b, c];
}

export function ObjectPrototypeHOPTest094() {
    const float32 = new Float32Array([1.5, -3.14, Infinity, NaN]);
    let a = float32.hasOwnProperty(0);
    let b = float32.hasOwnProperty(1);
    let c = float32.hasOwnProperty("length");
    return [a, b, c];
}

export function ObjectPrototypeHOPTest095() {
    const bigint64 = new BigInt64Array([0n, 9223372036854775807n, -9223372036854775808n]);
    let a = bigint64.hasOwnProperty(0);
    let b = bigint64.hasOwnProperty(1);
    let c = bigint64.hasOwnProperty("length");
    return [a, b, c];
}

export function ObjectPrototypeHOPTest096() {
    const int8 = new Int8Array(3);
    int8[0] = -128;
    int8[2] = 127;
    let a = int8.hasOwnProperty(0);
    let b = int8.hasOwnProperty(2);
    let c = int8.hasOwnProperty(3);
    return [a, b, c];
}

export function ObjectPrototypeHOPTest097() {
    const arr = ["first", "second"];
    let a = arr.hasOwnProperty(0);
    let b = arr[0];
    return [a, b];
}

export function ObjectPrototypeHOPTest098() {
    const arr = ["first", "second", "last"];
    let a = arr.hasOwnProperty(arr.length - 1);
    let b = arr.hasOwnProperty(2);
    return [a, b];
}

export function ObjectPrototypeHOPTest099() {
    const arr = ["a", "b"];
    let a = arr.hasOwnProperty(arr.length);
    let b = arr.hasOwnProperty(1000);
    let c = arr.hasOwnProperty(-1);
    return [a, b, c];
}
