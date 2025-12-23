/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

/**
 * 测试点1：基础属性访问（目标对象直接有属性）
 * 说明：验证 Proxy 正确拦截并使用 Reflect.get 获取目标属性
 */
export function testBasicProperty() {
    const target = { a: 1 };
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return proxy.a === 1;
}

/**
 * 测试点2：原型链属性访问（目标对象通过原型链继承属性）
 * 说明：验证 Reflect.get 正确处理原型链，而非仅限目标对象
 */
export function testPrototypeChain() {
    const proto = { a: 1 };
    const target = Object.create(proto);
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return proxy.a === 1;
}

/**
 * 测试点3：Symbol 属性访问（特殊键名场景）
 * 说明：验证 Symbol 属性也能被 Proxy 和 Reflect 正确处理
 */
export function testSymbolProperty() {
    const key = Symbol('test');
    const target = { [key]: 'value' };
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return proxy[key] === 'value';
}

/**
 * 测试点4: 访问器属性（目标对象有 getter）
 * 说明：验证 Reflect.get 正确调用 getter
 */
export function testGetterProperty() {
    const target = {
        get a() {
            return 1;
        }
    };
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return proxy.a === 1;
}

/**
 * 测试点5: 不可枚举属性（目标对象有不可枚举属性）
 * 说明：验证 Reflect.get 能访问不可枚举属性
 */
export function testNonEnumerableProperty() {
    const target = {};
    Object.defineProperty(target, 'a', {
        value: 1,
        enumerable: false
    });
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return proxy.a === 1;
}

/**
 * 测试点6: 不可配置属性（目标对象有不可配置属性）
 * 说明：验证 Reflect.get 能访问不可配置属性
 */
export function testNonConfigurableProperty() {
    const target = {};
    Object.defineProperty(target, 'a', {
        value: 1,
        configurable: false
    });
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return proxy.a === 1;
}

/**
 * 测试点7: 数字字符串属性（属性名为 '123'）
 * 说明：验证数字字符串键名被正确处理
 */
export function testNumericStringProperty() {
    const target = { '123': 'value' };
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return proxy['123'] === 'value';
}

/**
 * 测试点8: 特殊字符属性（属性名为 '@test'）
 * 说明：验证特殊字符键名被正确处理
 */
export function testSpecialCharProperty() {
    const target = { '@test': 'value' };
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return proxy['@test'] === 'value';
}

/**
 * 测试点9: 不存在的属性（返回 undefined）
 * 说明：验证访问不存在属性返回 undefined
 */
export function testNonExistentProperty() {
    const target = { a: 1 };
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return proxy.b === undefined;
}

/**
 * 测试点10: 嵌套代理（二级代理）
 * 说明：验证代理链中 Reflect.get 正确传递
 */
export function testNestedProxy() {
    const target = { a: 1 };
    const proxy1 = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    const proxy2 = new Proxy(proxy1, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return proxy2.a === 1;
}

/**
 * 测试点11: 目标对象有 getter（与测试点4重复但更复杂）
 * 说明：验证嵌套 getter 的正确调用
 */
export function testNestedGetter() {
    const target = {
        get a() {
            return 1;
        },
        get b() {
            return this.a;
        }
    };
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return proxy.b === 1;
}

/**
 * 测试点12: 目标对象有 setter（访问属性不触发 setter）
 * 说明：验证 get 陷阱不触发 setter
 */
export function testSetterAccess() {
    let value = null;
    const target = {
        set a(val) {
            value = val;
        },
        get a() {
            return value;
        }
    };
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return proxy.a === null;
}

/**
 * 测试点13: 数组 length 属性
 * 说明：验证数组特殊属性被正确处理
 */
export function testArrayLength() {
    const target = [1, 2, 3];
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return proxy.length === 3;
}

/**
 * 测试点14: constructor 属性（对象内置属性）
 * 说明：验证内置属性被正确获取
 */
export function testConstructorProperty() {
    const target = {};
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return proxy.constructor === Object;
}

/**
 * 测试点15: Reflect.get 非对象目标（应抛 TypeError）
 * 说明：验证错误处理（返回 true 表示抛错成功）
 */
export function testReflectNonObject() {
    try {
        Reflect.get(123, 'prop');
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

/**
 * 测试点16: 原型链上的 getter
 * 说明：验证原型链 getter 被正确调用
 */
export function testPrototypeGetter() {
    const proto = {
        get a() {
            return 1;
        }
    };
    const target = Object.create(proto);
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return proxy.a === 1;
}

/**
 * 测试点17: 目标对象属性与原型同名（优先目标属性）
 * 说明：验证目标对象属性覆盖原型
 */
export function testOverrideInTarget() {
    const proto = { a: 0 };
    const target = { a: 1, b: 2 };
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return proxy.a === 1;
}

/**
 * 测试点18: 属性值为 undefined
 * 说明：验证 undefined 值被正确获取
 */
export function testUndefinedValue() {
    const target = { a: undefined };
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return proxy.a === undefined;
}

/**
 * 测试点19: 属性值为 null
 * 说明：验证 null 值被正确获取
 */
export function testNullValue() {
    const target = { a: null };
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return proxy.a === null;
}

/**
 * 测试点20: 代理 get 返回 undefined（显式覆盖）
 * 说明：验证代理陷阱可覆盖属性返回值
 */
export function testProxyOverride() {
    const target = { a: 1 };
    const proxy = new Proxy(target, {
        get(target, prop) {
            if (prop === 'a') {
                return undefined;
            }
            return Reflect.get(target, prop);
        }
    });
    return proxy.a === undefined;
}

/**
 * 测试点21: Symbol.hasInstance 属性（验证内置Symbol属性的访问）
 * 说明：Reflect.get 正确处理 Symbol 静态属性
 */
export function testSymbolHasInstance() {
    const key = Symbol.hasInstance;
    const target = { [key]: (v) => v instanceof Array };
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return typeof proxy[key] === 'function';
}

/**
 * 测试点22: Symbol.isConcatSpreadable 属性
 * 说明：验证数组扩展操作符的代理支持
 */
export function testSymbolIsConcatSpreadable() {
    const key = Symbol.isConcatSpreadable;
    const target = { [key]: true };
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return proxy[key] === true;
}

/**
 * 测试点23: Symbol.species 属性
 * 说明：验证类继承时的代理行为
 */
export function testSymbolSpecies() {
    const key = Symbol.species;
    const target = { [key]: Array };
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return proxy[key] === Array;
}

/**
 * 测试点24: Symbol.match 属性
 * 说明：验证正则表达式匹配的代理支持
 */
export function testSymbolMatch() {
    const key = Symbol.match;
    const target = { [key]: () => true };
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return typeof proxy[key] === 'function';
}

/**
 * 测试点25: Symbol.replace 属性
 * 说明：验证字符串替换的代理支持
 */
export function testSymbolReplace() {
    const key = Symbol.replace;
    const target = { [key]: () => 'replaced' };
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return typeof proxy[key] === 'function';
}

/**
 * 测试点26: Symbol.search 属性
 * 说明：验证字符串搜索的代理支持
 */
export function testSymbolSearch() {
    const key = Symbol.search;
    const target = { [key]: () => 0 };
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return typeof proxy[key] === 'function';
}

/**
 * 测试点27: Symbol.split 属性
 * 说明：验证字符串分割的代理支持
 */
export function testSymbolSplit() {
    const key = Symbol.split;
    const target = { [key]: () => ['a', 'b'] };
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return typeof proxy[key] === 'function';
}

/**
 * 测试点28: Symbol.asyncIterator 属性
 * 说明：验证异步迭代器的代理支持
 */
export function testSymbolAsyncIterator() {
    const key = Symbol.asyncIterator;
    const target = { [key]: () => ({ next: () => Promise.resolve({ value: 1, done: false }) }) };
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return typeof proxy[key] === 'function';
}

/**
 * 测试点29: Symbol.toStringTag 属性
 * 说明：验证对象标签的代理支持
 */
export function testSymbolToStringTag() {
    const key = Symbol.toStringTag;
    const target = { [key]: 'MyObject' };
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return proxy[key] === 'MyObject';
}

/**
 * 测试点30: 函数的 length 属性（验证内置方法属性）
 * 说明：Reflect.get 正确处理函数的 length
 */
export function testFunctionLength() {
    const target = function () {
    };
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return proxy.length === 0;
}

/**
 * 测试点31: 函数的 name 属性
 * 说明：验证函数命名的代理支持
 */
export function testFunctionName() {
    const target = function myFunc() {
    };
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return proxy.name === 'myFunc';
}

/**
 * 测试点32: 类实例的 constructor 属性
 * 说明：验证类继承链的代理支持
 */
export function testClassInstance() {
    class MyClass {
    }

    const target = new MyClass();
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return proxy.constructor === MyClass;
}

/**
 * 测试点33: 数组方法 push 的访问
 * 说明：代理正确获取数组方法
 */
export function testArrayMethodPush() {
    const target = [];
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return typeof proxy.push === 'function';
}

/**
 * 测试点34: Object.prototype.hasOwnProperty 方法
 * 说明：验证内置方法的代理支持
 */
export function testObjectMethodHasOwnProperty() {
    const target = {};
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return typeof proxy.hasOwnProperty === 'function';
}

/**
 * 测试点35: Date.prototype.toString 方法
 * 说明：验证日期对象方法的代理支持
 */
export function testDatePrototype() {
    const target = new Date();
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return typeof proxy.toString === 'function';
}

/**
 * 测试点36: RegExp.prototype.source 属性
 * 说明：验证正则表达式属性的代理支持
 */
export function testRegExpSource() {
    const target = /abc/;
    const proxy = new Proxy(target, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    return proxy.source === 'abc';
}
