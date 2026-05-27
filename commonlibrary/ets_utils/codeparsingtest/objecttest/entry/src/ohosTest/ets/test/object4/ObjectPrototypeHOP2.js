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

export function ObjectPrototypeHOP2Test001() {
    const arr = [];
    arr[4294967294] = "max index";
    let a1 = arr.hasOwnProperty(4294967294);
    let a2 = arr.hasOwnProperty(4294967295);
    let a = arr.hasOwnProperty(4294967294);
    let b = arr.hasOwnProperty(4294967295);
    return [a1, a2, a, b];
}

export function ObjectPrototypeHOP2Test002() {
    const int8 = new Int8Array(3);
    int8[0] = -128;
    int8[1] = 0;
    int8[2] = 127;
    let a = int8.hasOwnProperty(0);
    let b = int8.hasOwnProperty(1);
    let c = int8.hasOwnProperty(2);
    let d = int8.hasOwnProperty(3);
    let res1 = int8.hasOwnProperty(0);
    let res2 = int8.hasOwnProperty(1);
    let res3 = int8.hasOwnProperty(2);
    let res4 = int8.hasOwnProperty(3);
    return [a, b, c, d, res1, res2, res3, res4];
}

export function ObjectPrototypeHOP2Test003() {
    const uint8 = new Uint8Array(3);
    uint8[0] = 0;
    uint8[1] = 128;
    uint8[2] = 255;
    let a = uint8.hasOwnProperty(0);
    let b = uint8.hasOwnProperty(2);
    let c = uint8.hasOwnProperty(3);
    return [a, b, c];
}

export function ObjectPrototypeHOP2Test004() {
    const obj = { "": "empty" };
    let a = obj.hasOwnProperty("");
    return a;
}

export function ObjectPrototypeHOP2Test005() {
    const obj = { "a": "single" };
    let a = obj.hasOwnProperty("a");
    return a;
}



export function ObjectPrototypeHOP2Test007() {
    const obj = {};
    let a = obj.hasOwnProperty("any");
    let b = Object.keys(obj).length;
    return [a, b];
}

export function ObjectPrototypeHOP2Test008() {
    const obj = { single: "value" };
    let a = obj.hasOwnProperty("single");
    let b = Object.keys(obj).length;
    return [a, b];
}

export function ObjectPrototypeHOP2Test010() {
    const deepObj = { a: { b: { c: { d: { e: "deep" } } } } };
    let a = deepObj.hasOwnProperty("a");
    let b = deepObj.a.hasOwnProperty("b");
    let c = deepObj.a.b.hasOwnProperty("c");
    let d = deepObj.a.b.c.hasOwnProperty("d");
    let e = deepObj.a.b.c.d.hasOwnProperty("e");
    return [a, b, c, d, e];
}

export function ObjectPrototypeHOP2Test011() {
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

export function ObjectPrototypeHOP2Test012() {
    const obj = {};
    obj[1e308] = "large number key";
    let a = obj.hasOwnProperty(1e308);
    let b = obj.hasOwnProperty(1e309);
    return [a, b];
}

export function ObjectPrototypeHOP2Test013() {
    const obj = {};
    obj[5e-324] = "small number key";
    let a = obj.hasOwnProperty(5e-324);
    let b = obj.hasOwnProperty(1e-325);
    return [a, b];
}

export function ObjectPrototypeHOP2Test014() {
    const sym1 = Symbol("key");
    const sym2 = Symbol("key");
    const obj = { [sym1]: "value" };
    let a = obj.hasOwnProperty(sym1);
    let b = obj.hasOwnProperty(sym2);
    let c = sym1 === sym2;
    return [a, b, c];
}

export function ObjectPrototypeHOP2Test015() {
    const globalSym1 = Symbol.for("global");
    const globalSym2 = Symbol.for("global");
    const obj = { [globalSym1]: "value" };
    let a = obj.hasOwnProperty(globalSym1);
    let b = obj.hasOwnProperty(globalSym2);
    let c = globalSym1 === globalSym2;
    return [a, b, c];
}

export function ObjectPrototypeHOP2Test016() {
    let a, b;
    try {
        null.hasOwnProperty("prop");
    } catch (e) {
        a = e instanceof TypeError;
        b = e.message;
    }
    return a;
}

export function ObjectPrototypeHOP2Test017() {
    let a, b;
    try {
        undefined.hasOwnProperty("prop");
    } catch (e) {
        a = e instanceof TypeError;
        b = e.message;
    }
    return a;
}

export function ObjectPrototypeHOP2Test018() {
    const str = "test";
    let a = str.hasOwnProperty("length");
    let b = str.hasOwnProperty("0");
    let c = str.hasOwnProperty("toString");
    return [a, b, c];
}

export function ObjectPrototypeHOP2Test019() {
    const num = 123;
    let a = num.hasOwnProperty("toString");
    return a;
}

export function ObjectPrototypeHOP2Test020() {
    const bool = true;
    let a = bool.hasOwnProperty("valueOf");
    return a;
}

export function ObjectPrototypeHOP2Test021() {
    const big = 123n;
    let a = big.hasOwnProperty("valueOf");
    return a;
}

export function ObjectPrototypeHOP2Test022() {
    const sym = Symbol("test");
    let a = sym.hasOwnProperty("description");
    let b = sym.hasOwnProperty("toString");
    return [a, b];
}

export function ObjectPrototypeHOP2Test023() {
    const obj = { undefined: "value" };
    let a = obj.hasOwnProperty(undefined);
    let b = obj.hasOwnProperty("undefined");
    return [a, b];
}

export function ObjectPrototypeHOP2Test024() {
    const obj = { null: "value" };
    let a = obj.hasOwnProperty(null);
    let b = obj.hasOwnProperty("null");
    return [a, b];
}

export function ObjectPrototypeHOP2Test025() {
    const obj = {};
    const keyObj = { toString: () => "customKey" };
    obj.customKey = "value";
    let a = obj.hasOwnProperty(keyObj);
    let b = obj.hasOwnProperty("customKey");
    return [a, b];
}

export function ObjectPrototypeHOP2Test027() {
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

export function ObjectPrototypeHOP2Test028() {
    const foo = {
        hasOwnProperty: function() {
            return false;
        },
        bar: "Here be dragons",
    };

    let a = foo.hasOwnProperty("bar");
    let b = foo.hasOwnProperty("hasOwnProperty");
    return [a, b];
}

export function ObjectPrototypeHOP2Test029() {
    const foo = {
        hasOwnProperty: "not a function",
        bar: "value"
    };
    let a;
    try {
        foo.hasOwnProperty("bar");
    } catch (e) {
        a = e instanceof TypeError;
    }
    return a;
}

export function ObjectPrototypeHOP2Test030() {
    const foo = {
        hasOwnProperty: function() {
            return false;
        },
        bar: "Here be dragons",
    };

    let a = Object.prototype.hasOwnProperty.call(foo, "bar");
    let b = Object.prototype.hasOwnProperty.call(foo, "hasOwnProperty");
    return [a, b];
}

export function ObjectPrototypeHOP2Test031() {
    const foo = {
        hasOwnProperty: function() {
            return false;
        },
        bar: "Here be dragons",
    };

    let a = {}.hasOwnProperty.call(foo, "bar");
    let b = {}.hasOwnProperty.call(foo, "hasOwnProperty");
    return [a, b];
}

export function ObjectPrototypeHOP2Test032() {
    const foo = {
        hasOwnProperty: function() {
            return false;
        },
        bar: "Here be dragons",
    };

    let a = Object.hasOwn(foo, "bar");
    let b = Object.hasOwn(foo, "hasOwnProperty");
    return [a, b];
}

export function ObjectPrototypeHOP2Test033() {
    const obj = {
        hasOwnProperty: "string value",
        prop: "test"
    };

    let a = Object.prototype.hasOwnProperty.call(obj, "hasOwnProperty");
    let b = Object.prototype.hasOwnProperty.call(obj, "prop");
    return [a, b];
}

export function ObjectPrototypeHOP2Test034() {
    const sym = Symbol("hasOwnProperty");
    const obj = {
        [sym]: "symbol value",
        prop: "test"
    };

    let a = obj.hasOwnProperty(sym);
    let b = obj.hasOwnProperty("prop");
    return [a, b];
}

export function ObjectPrototypeHOP2Test035() {
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

export function ObjectPrototypeHOP2Test036() {
    const parent = { inherited: "value" };
    const child = Object.create(parent);

    let a = child.hasOwnProperty("inherited");
    let b = "inherited" in child;
    let c = "toString" in child;
    let d = child.hasOwnProperty("toString");
    return [a, b, c, d];
}

export function ObjectPrototypeHOP2Test037() {
    const obj = { prop: "exists" };
    let a = obj.hasOwnProperty("prop");
    let b = Object.hasOwn(obj, "prop");
    let c = obj.hasOwnProperty("toString");
    let d = Object.hasOwn(obj, "toString");
    return [a, b, c, d];
}

export function ObjectPrototypeHOP2Test038() {
    const foo = Object.create(null);
    foo.prop = "exists";

    let a = Object.hasOwn(foo, "prop");
    let b = Object.prototype.hasOwnProperty.call(foo, "prop");
    let c;
    try {
        foo.hasOwnProperty("prop");
    } catch (e) {
        c = e instanceof TypeError;
    }
    return [a, b, c];
}

export function ObjectPrototypeHOP2Test039() {
    const foo = {
        hasOwnProperty: function() {
            return false;
        },
        bar: "Here be dragons",
    };

    let a = foo.hasOwnProperty("bar");
    let b = Object.hasOwn(foo, "bar");
    return [a, b];
}

export function ObjectPrototypeHOP2Test040() {
    const obj = {};
    Object.defineProperty(obj, "hidden", {
        value: "secret",
        enumerable: false
    });
    obj.visible = "public";

    let a = obj.hasOwnProperty("hidden");
    let b = obj.propertyIsEnumerable("hidden");
    let c = obj.hasOwnProperty("visible");
    let d = obj.propertyIsEnumerable("visible");
    return [a, b, c, d];
}

export function ObjectPrototypeHOP2Test041() {
    const obj = {};
    Object.defineProperty(obj, "nonEnumerable", {
        value: "value",
        enumerable: false
    });
    Object.defineProperty(obj, "enumerable", {
        value: "value",
        enumerable: true
    });

    let a = obj.hasOwnProperty("nonEnumerable");
    let b = obj.propertyIsEnumerable("nonEnumerable");
    let c = obj.hasOwnProperty("enumerable");
    let d = obj.propertyIsEnumerable("enumerable");
    return [a, b, c, d];
}

export function ObjectPrototypeHOP2Test042() {
    const obj = {};
    Object.defineProperty(obj, "hidden", {
        value: "secret",
        enumerable: false
    });
    obj.visible = "public";

    let a = obj.hasOwnProperty("hidden");
    let b = obj.hasOwnProperty("visible");
    let c = Object.keys(obj);
    let d = Object.keys(obj).includes("hidden");
    return [a, b, c, d];
}

export function ObjectPrototypeHOP2Test043() {
    const parent = { inherited: "value" };
    const child = Object.create(parent);
    child.own = "own value";

    let a = child.hasOwnProperty("inherited");
    let b = child.hasOwnProperty("own");
    let c = Object.keys(child);
    return [a, b, c];
}

export function ObjectPrototypeHOP2Test044() {
    const obj = {};
    Object.defineProperty(obj, "hidden", {
        value: "secret",
        enumerable: false
    });
    obj.visible = "public";

    let a = obj.hasOwnProperty("hidden");
    let b = obj.hasOwnProperty("visible");
    let c = Object.getOwnPropertyNames(obj);
    return [a, b, c];
}

export function ObjectPrototypeHOP2Test045() {
    const obj = {};
    Object.defineProperty(obj, "nonEnumerable1", {
        value: "value1",
        enumerable: false
    });
    Object.defineProperty(obj, "nonEnumerable2", {
        value: "value2",
        enumerable: false
    });
    obj.enumerable = "public";

    let a = Object.getOwnPropertyNames(obj);
    let b = obj.hasOwnProperty("nonEnumerable1");
    let c = obj.hasOwnProperty("nonEnumerable2");
    return [a, b, c];
}

export function ObjectPrototypeHOP2Test046() {
    const buz = {
        fog: "stack",
    };
    let res = [];
    for (const name in buz) {
        if (buz.hasOwnProperty(name)) {
            res.push(`this is fog (${name}) for sure. Value: ${buz[name]}`);
        } else {
            res.push(name);
        }
    }
    return res;
}

export function ObjectPrototypeHOP2Test047() {
    const parent = { inherited: "value" };
    const child = Object.create(parent);
    child.own = "own value";

    const ownProps = [];
    const allProps = [];

    for (const name in child) {
        allProps.push(name);
        if (child.hasOwnProperty(name)) {
            ownProps.push(name);
        }
    }

    let a = allProps;
    let b = ownProps;
    return [a, b];
}

export function ObjectPrototypeHOP2Test048() {
    const sym1 = Symbol("s1");
    const sym2 = Symbol("s2");
    const obj = {
        [sym1]: "value1",
        [sym2]: "value2",
        stringKey: "value"
    };

    let a = obj.hasOwnProperty(sym1);
    let b = obj.hasOwnProperty(sym2);
    let c = obj.hasOwnProperty("stringKey");
    return [a, b, c];
}

export function ObjectPrototypeHOP2Test050() {
    const obj = { prop: "exists" };

    let a = obj.hasOwnProperty("prop");
    let b = Reflect.has(obj, "prop");
    let c = obj.hasOwnProperty("toString");
    let d = Reflect.has(obj, "toString");
    return [a, b, c, d];
}

export function ObjectPrototypeHOP2Test051() {
    const parent = { inherited: "value" };
    const child = Object.create(parent);

    let a = child.hasOwnProperty("inherited");
    let b = Reflect.has(child, "inherited");
    let c = "inherited" in child;
    return [a, b, c];
}

export function ObjectPrototypeHOP2Test052() {
    const obj = { prop: "exists" };

    let a = obj.hasOwnProperty("prop");
    let b = Object.getOwnPropertyDescriptor(obj, "prop");
    let c = obj.hasOwnProperty("nonexistent");
    let d = Object.getOwnPropertyDescriptor(obj, "nonexistent");
    return [a, b, c, d];
}

export function ObjectPrototypeHOP2Test053() {
    const obj = {};

    let a = obj.hasOwnProperty("toString");
    let b = Object.getOwnPropertyDescriptor(obj, "toString");

    return [a, b];
}
