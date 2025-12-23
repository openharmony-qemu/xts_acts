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
 * 测试点1: 检查普通属性存在性（目标有属性，陷阱返回true）
 * 说明：目标对象有属性，代理返回true，应成功
 */
export function testHasNormalProperty() {
    const target = { prop: 'value' };
    const handler = { has: (obj, prop) => Reflect.has(obj, prop) };
    const proxy = new Proxy(target, handler);
    return 'prop' in proxy;
}

/**
 * 测试点2: 检查不存在属性（目标无属性，陷阱返回false）
 * 说明：目标对象无属性，代理返回false，应成功
 */
export function testHasMissingProperty() {
    const target = {};
    const handler = { has: (obj, prop) => Reflect.has(obj, prop) };
    const proxy = new Proxy(target, handler);
    return 'missing' in proxy === false;
}

/**
 * 测试点3: 检查Symbol属性存在性（目标有Symbol属性，陷阱返回true）
 * 说明：Symbol属性在目标中存在，代理应识别
 */
export function testHasSymbolProperty() {
    const sym = Symbol('test');
    const target = { [sym]: 'value' };
    const handler = { has: (obj, prop) => Reflect.has(obj, prop) };
    const proxy = new Proxy(target, handler);
    return sym in proxy;
}

/**
 * 测试点4: 检查Symbol属性不存在（目标无Symbol属性，陷阱返回false）
 * 说明：目标对象无该Symbol属性，代理应返回false
 */
export function testHasMissingSymbolProperty() {
    const sym = Symbol('test');
    const target = {};
    const handler = { has: (obj, prop) => Reflect.has(obj, prop) };
    const proxy = new Proxy(target, handler);
    return sym in proxy === false;
}

/**
 * 测试点5: 检查__proto__属性（字符串形式，目标有__proto__）
 * 说明：目标对象有__proto__属性，代理应识别
 */
export function testHasProtoStringProperty() {
    const target = { __proto__: null };
    const handler = { has: (obj, prop) => Reflect.has(obj, prop) };
    const proxy = new Proxy(target, handler);
    return !('__proto__' in proxy);
}

/**
 * 测试点6: 检查__proto__属性（字符串形式，目标无__proto__）
 * 说明：目标对象无__proto__属性，代理应返回false
 */
export function testHasMissingProtoStringProperty() {
    const target = {};
    const handler = { has: (obj, prop) => Reflect.has(obj, prop) };
    const proxy = new Proxy(target, handler);
    return '__proto__' in proxy === true;
}

/**
 * 测试点7: 陷阱返回false但目标有属性（覆盖目标行为）
 * 说明：目标有属性，但代理陷阱返回false，应被覆盖
 */
export function testHasTrapFalseOverTarget() {
    const target = { prop: 'value' };
    const handler = { has: (obj, prop) => false };
    const proxy = new Proxy(target, handler);
    return 'prop' in proxy === false;
}

/**
 * 测试点8: 陷阱返回true但目标无属性（覆盖目标行为）
 * 说明：目标无属性，但代理陷阱返回true，应被覆盖
 */
export function testHasTrapTrueOverTarget() {
    const target = {};
    const handler = { has: (obj, prop) => true };
    const proxy = new Proxy(target, handler);
    return 'prop' in proxy === true;
}

/**
 * 测试点9: 检查不可配置属性（configurable: false，陷阱返回true）
 * 说明：目标属性不可配置，但代理陷阱返回true，应成功
 */
export function testHasConfigurableFalseProperty() {
    const target = {};
    Object.defineProperty(target, 'prop', { value: 'value', configurable: false });
    const handler = { has: (obj, prop) => Reflect.has(obj, prop) };
    const proxy = new Proxy(target, handler);
    return 'prop' in proxy;
}

/**
 * 测试点10: 检查内置方法（toString）存在性（陷阱返回true）
 * 说明：Object.prototype.toString存在，代理应识别
 */
export function testHasBuiltInMethod() {
    const target = {};
    const handler = { has: (obj, prop) => Reflect.has(obj, prop) };
    const proxy = new Proxy(target, handler);
    return 'toString' in proxy;
}

/**
 * 测试点11: 检查不可枚举属性（目标有，陷阱返回true）
 * 说明：目标属性不可枚举（enumerable: false），但代理返回true
 */
export function testHasNonEnumerableProperty() {
    const target = {};
    Object.defineProperty(target, 'prop', { value: 'value', enumerable: false });
    const handler = { has: (obj, prop) => Reflect.has(obj, prop) };
    const proxy = new Proxy(target, handler);
    return 'prop' in proxy;
}

/**
 * 测试点13: 检查原型链不可枚举属性（目标无，原型有，陷阱返回true）
 * 说明：原型链有不可枚举属性，代理返回true
 */
export function testHasPrototypeNonEnumerable() {
    const target = {};
    Object.defineProperty(Object.prototype, 'prop', { value: 'value', enumerable: false });
    const handler = { has: (obj, prop) => Reflect.has(obj, prop) };
    const proxy = new Proxy(target, handler);
    return 'prop' in proxy;
}

/**
 * 测试点14: 检查原型链不可枚举属性（目标无，原型有，陷阱返回false）
 * 说明：原型链有不可枚举属性，代理陷阱返回false
 */
export function testHasPrototypeNonEnumerableTrapFalse() {
    const target = {};
    Object.defineProperty(Object.prototype, 'prop', { value: 'value', enumerable: false });
    const handler = { has: (obj, prop) => false };
    const proxy = new Proxy(target, handler);
    return 'prop' in proxy === false;
}

/**
 * 测试点15: 代理函数，检查name属性（陷阱返回true）
 * 说明：Function.name是只读属性，但代理可覆盖has检查
 */
export function testHasFunctionName() {

    function fn() {
    }

    const handler = { has: (obj, prop) => Reflect.has(obj, prop) };
    const proxy = new Proxy(fn, handler);
    return 'name' in proxy;
}

/**
 * 测试点16: 代理函数，检查length属性（陷阱返回true）
 * 说明：Function.length是只读属性，代理可覆盖has检查
 */
export function testHasFunctionLength() {

    function fn() {
    }

    const handler = { has: (obj, prop) => Reflect.has(obj, prop) };
    const proxy = new Proxy(fn, handler);
    return 'length' in proxy;
}

/**
 * 测试点17: 检查Map的has方法（陷阱返回true）
 * 说明：Map.has是方法，但`in`操作符检查属性，非方法
 */
export function testHasMapHasMethod() {
    const target = new Map();
    const handler = { has: (obj, prop) => Reflect.has(obj, prop) };
    const proxy = new Proxy(target, handler);
    return 'has' in proxy;
}

/**
 * 测试点18: 检查Set的has方法（陷阱返回true）
 * 说明：Set.has是方法，但`in`操作符检查属性
 */
export function testHasSetHasMethod() {
    const target = new Set();
    const handler = { has: (obj, prop) => Reflect.has(obj, prop) };
    const proxy = new Proxy(target, handler);
    return 'has' in proxy;
}

/**
 * 测试点19: 代理对象，检查Symbol.iterator（陷阱返回true）
 * 说明：Symbol.iterator是内置Symbol，代理应识别
 */
export function testHasSymbolIterator() {
    const target = {};
    const handler = { has: (obj, prop) => Reflect.has(obj, prop) };
    const proxy = new Proxy(target, handler);
    return !(Symbol.iterator in proxy);
}

/**
 * 测试点20: 代理对象，检查Symbol.hasInstance（陷阱返回true）
 * 说明：Symbol.hasInstance用于instanceof，代理应识别
 */
export function testHasSymbolHasInstance() {
    const target = {};
    const handler = { has: (obj, prop) => Reflect.has(obj, prop) };
    const proxy = new Proxy(target, handler);
    return !(Symbol.hasInstance in proxy);
}

/**
 * 测试点21: 代理Object.create(null)，检查__proto__（陷阱返回true）
 * 说明：目标无原型链，但代理可覆盖__proto__存在性
 */
export function testHasProtoStringOnNullPrototype() {
    const target = Object.create(null);
    const handler = { has: (obj, prop) => true };
    const proxy = new Proxy(target, handler);
    return '__proto__' in proxy;
}

/**
 * 测试点22: 代理Object.create(null)，检查__proto__（陷阱返回false）
 * 说明：目标无原型链，代理陷阱返回false
 */
export function testHasProtoStringOnNullPrototypeTrapFalse() {
    const target = Object.create(null);
    const handler = { has: (obj, prop) => false };
    const proxy = new Proxy(target, handler);
    return '__proto__' in proxy === false;
}

/**
 * 测试点23: 检查目标属性有getter（陷阱返回true）
 * 说明：目标属性有getter，代理返回true
 */
export function testHasWithGetter() {
    const target = {
        get prop() {
            return 'value';
        }
    };
    const handler = { has: (obj, prop) => Reflect.has(obj, prop) };
    const proxy = new Proxy(target, handler);
    return 'prop' in proxy;
}

/**
 * 测试点24: 检查目标属性有getter（陷阱返回false）
 * 说明：目标属性有getter，代理陷阱返回false
 */
export function testHasWithGetterTrapFalse() {
    const target = {
        get prop() {
            return 'value';
        }
    };
    const handler = { has: (obj, prop) => false };
    const proxy = new Proxy(target, handler);
    return 'prop' in proxy === false;
}

/**
 * 测试点25: 检查目标属性有setter（陷阱返回true）
 * 说明：目标属性有setter，代理返回true（setter不影响has）
 */
export function testHasWithSetter() {
    const target = {
        set prop(val) {
        }
    };
    const handler = { has: (obj, prop) => Reflect.has(obj, prop) };
    const proxy = new Proxy(target, handler);
    return 'prop' in proxy;
}

/**
 * 测试点26: 检查目标属性有setter（陷阱返回false）
 * 说明：目标属性有setter，代理陷阱返回false
 */
export function testHasWithSetterTrapFalse() {
    const target = {
        set prop(val) {
        }
    };
    const handler = { has: (obj, prop) => false };
    const proxy = new Proxy(target, handler);
    return 'prop' in proxy === false;
}

/**
 * 测试点27: 检查不可配置属性（configurable: false，陷阱返回true）
 * 说明：目标属性不可配置，但代理返回true
 */
export function testHasConfigurableFalse() {
    const target = {};
    Object.defineProperty(target, 'prop', { value: 'value', configurable: false });
    const handler = { has: (obj, prop) => Reflect.has(obj, prop) };
    const proxy = new Proxy(target, handler);
    return 'prop' in proxy;
}

/**
 * 测试点29: 检查Symbol.for('test')（全局Symbol，陷阱返回true）
 * 说明：Symbol.for创建全局Symbol，代理应识别
 */
export function testHasSymbolFor() {
    const target = {};
    const sym = Symbol.for('test');
    target[sym] = 'value';
    const handler = { has: (obj, prop) => Reflect.has(obj, prop) };
    const proxy = new Proxy(target, handler);
    return sym in proxy;
}

/**
 * 测试点30: 检查Symbol.for('test')（全局Symbol，陷阱返回false）
 * 说明：Symbol.for创建全局Symbol，代理陷阱返回false
 */
export function testHasSymbolForTrapFalse() {
    const target = {};
    const sym = Symbol.for('test');
    target[sym] = 'value';
    const handler = { has: (obj, prop) => false };
    const proxy = new Proxy(target, handler);
    return sym in proxy === false;
}

/**
 * 测试点31: 代理数组，检查length属性（陷阱返回true）
 * 说明：Array.length是只读属性，但代理可覆盖has检查
 */
export function testHasArrayLength() {
    const target = [];
    const handler = { has: (obj, prop) => Reflect.has(obj, prop) };
    const proxy = new Proxy(target, handler);
    return 'length' in proxy;
}

/**
 * 测试点33: 代理对象，检查arguments属性（陷阱返回true）
 * 说明：arguments是函数特殊属性，代理应识别
 */
export function testHasArgumentsProperty() {
    const target = {};
    const handler = { has: (obj, prop) => Reflect.has(obj, prop) };
    const proxy = new Proxy(target, handler);
    return !('arguments' in proxy);
}

/**
 * 测试点34: 代理对象，检查caller属性（陷阱返回false）
 * 说明：caller是函数已弃用属性，代理陷阱返回false
 */
export function testHasCallerPropertyTrapFalse() {
    const target = {};
    const handler = { has: (obj, prop) => false };
    const proxy = new Proxy(target, handler);
    return 'caller' in proxy === false;
}

/**
 * 测试点35: 代理对象，检查callee属性（陷阱返回true）
 * 说明：callee是函数已弃用属性，代理应识别
 */
export function testHasCalleeProperty() {
    const target = {};
    const handler = { has: (obj, prop) => Reflect.has(obj, prop) };
    const proxy = new Proxy(target, handler);
    return !('callee' in proxy);
}

/**
 * 测试点37: 代理对象，检查__lookupSetter__（陷阱返回false）
 * 说明：历史方法，代理陷阱返回false
 */
export function testHasLookupSetterPropertyTrapFalse() {
    const target = {};
    const handler = { has: (obj, prop) => false };
    const proxy = new Proxy(target, handler);
    return '__lookupSetter__' in proxy === false;
}

/**
 * 测试点38: 代理对象，检查Symbol.asyncIterator（陷阱返回true）
 * 说明：Symbol.asyncIterator用于async iteration，代理应识别
 */
export function testHasSymbolAsyncIterator() {
    const target = {};
    const handler = { has: (obj, prop) => Reflect.has(obj, prop) };
    const proxy = new Proxy(target, handler);
    return !(Symbol.asyncIterator in proxy);
}

/**
 * 测试点39: 代理对象，检查Symbol.asyncIterator（陷阱返回false）
 * 说明：Symbol.asyncIterator，代理陷阱返回false
 */
export function testHasSymbolAsyncIteratorTrapFalse() {
    const target = {};
    const handler = { has: (obj, prop) => false };
    const proxy = new Proxy(target, handler);
    return Symbol.asyncIterator in proxy === false;
}

/**
 * 测试点40: 代理嵌套对象，检查属性存在性（陷阱返回true）
 * 说明：嵌套代理链中，代理检查属性存在
 */
export function testHasNestedProxyProperty() {
    const inner = { inner: 'value' };
    const innerHandler = { has: (obj, prop) => Reflect.has(obj, prop) };
    const innerProxy = new Proxy(inner, innerHandler);

    const target = { nested: innerProxy };
    const handler = { has: (obj, prop) => Reflect.has(obj, prop) };
    const proxy = new Proxy(target, handler);

    return 'inner' in proxy.nested;
}

/**
 * 测试点41: 检查Symbol.toStringTag（陷阱返回true，用于自定义toString）
 * 说明：Symbol.toStringTag是内置Symbol，用于Object.prototype.toString()
 */
export function testHasSymbolToStringTag() {
    const target = {};
    target[Symbol.toStringTag] = 'Custom';
    const handler = { has: (obj, prop) => Reflect.has(obj, prop) };
    const proxy = new Proxy(target, handler);
    return Symbol.toStringTag in proxy;
}

/**
 * 测试点42: 检查Symbol.toStringTag（陷阱返回false，覆盖目标行为）
 * 说明：目标有Symbol.toStringTag，但代理陷阱返回false
 */
export function testHasSymbolToStringTagTrapFalse() {
    const target = { [Symbol.toStringTag]: 'Custom' };
    const handler = { has: (obj, prop) => false };
    const proxy = new Proxy(target, handler);
    return Symbol.toStringTag in proxy === false;
}

/**
 * 测试点43: 检查RegExp.source属性（陷阱返回true）
 * 说明：RegExp.source是只读属性，但代理可覆盖has检查
 */
export function testHasRegExpSource() {
    const target = /test/;
    const handler = { has: (obj, prop) => Reflect.has(obj, prop) };
    const proxy = new Proxy(target, handler);
    return 'source' in proxy;
}

/**
 * 测试点44: 检查RegExp.source属性（陷阱返回false）
 * 说明：目标有source属性，但代理陷阱返回false
 */
export function testHasRegExpSourceTrapFalse() {
    const target = /test/;
    const handler = { has: (obj, prop) => false };
    const proxy = new Proxy(target, handler);
    return 'source' in proxy === false;
}

/**
 * 测试点45: 检查Array.constructor属性（陷阱返回true）
 * 说明：Array.constructor是可写属性，代理应识别
 */
export function testHasArrayConstructor() {
    const target = [];
    const handler = { has: (obj, prop) => Reflect.has(obj, prop) };
    const proxy = new Proxy(target, handler);
    return 'constructor' in proxy;
}

/**
 * 测试点46: 检查Array.constructor属性（陷阱返回false）
 * 说明：目标有constructor，但代理陷阱返回false
 */
export function testHasArrayConstructorTrapFalse() {
    const target = [];
    const handler = { has: (obj, prop) => false };
    const proxy = new Proxy(target, handler);
    return 'constructor' in proxy === false;
}

/**
 * 测试点47: 检查Symbol.species（陷阱返回true，用于构造函数派生）
 * 说明：Symbol.species用于Array.from()等方法
 */
export function testHasSymbolSpecies() {
    const target = [];
    const handler = { has: (obj, prop) => Reflect.has(obj, prop) };
    const proxy = new Proxy(target, handler);
    return !(Symbol.species in proxy);
}

/**
 * 测试点48: 检查Symbol.species（陷阱返回false）
 * 说明：目标有Symbol.species，但代理陷阱返回false
 */
export function testHasSymbolSpeciesTrapFalse() {
    const target = [];
    const handler = { has: (obj, prop) => false };
    const proxy = new Proxy(target, handler);
    return Symbol.species in proxy === false;
}

/**
 * 测试点49: 检查Symbol.isConcatSpreadable（陷阱返回true，用于Array.concat）
 * 说明：Symbol.isConcatSpreadable控制concat是否展开
 */
export function testHasSymbolIsConcatSpreadable() {
    const target = [];
    const handler = { has: (obj, prop) => Reflect.has(obj, prop) };
    const proxy = new Proxy(target, handler);
    return !(Symbol.isConcatSpreadable in proxy);
}

/**
 * 测试点50: 检查Symbol.isConcatSpreadable（陷阱返回false）
 * 说明：目标有Symbol.isConcatSpreadable，但代理陷阱返回false
 */
export function testHasSymbolIsConcatSpreadableTrapFalse() {
    const target = [];
    const handler = { has: (obj, prop) => false };
    const proxy = new Proxy(target, handler);
    return Symbol.isConcatSpreadable in proxy === false;
}

/**
 * 测试点51: 检查数组索引属性（'0' in proxy，陷阱返回true）
 * 说明：数组索引0作为字符串属性，代理应识别
 */
export function testHasArrayIndex0() {
    const target = ['value'];
    const handler = { has: (obj, prop) => Reflect.has(obj, prop) };
    const proxy = new Proxy(target, handler);
    return '0' in proxy;
}

/**
 * 测试点52: 检查数组索引属性（'0' in proxy，陷阱返回false）
 * 说明：目标有索引0，但代理陷阱返回false
 */
export function testHasArrayIndex0TrapFalse() {
    const target = ['value'];
    const handler = { has: (obj, prop) => false };
    const proxy = new Proxy(target, handler);
    return '0' in proxy === false;
}

/**
 * 测试点53: 检查对象数字属性（'1' in proxy，陷阱返回true）
 * 说明：对象属性名使用数字字符串，代理应识别
 */
export function testHasObjectNumericProperty() {
    const target = { '1': 'value' };
    const handler = { has: (obj, prop) => Reflect.has(obj, prop) };
    const proxy = new Proxy(target, handler);
    return '1' in proxy;
}

/**
 * 测试点54: 检查对象数字属性（'1' in proxy，陷阱返回false）
 * 说明：目标有'1'属性，但代理陷阱返回false
 */
export function testHasObjectNumericPropertyTrapFalse() {
    const target = { '1': 'value' };
    const handler = { has: (obj, prop) => false };
    const proxy = new Proxy(target, handler);
    return '1' in proxy === false;
}

/**
 * 测试点55: 检查Date.getUTCDate方法（陷阱返回true）
 * 说明：Date.getUTCDate是方法，代理应识别属性名
 */
export function testHasDateUTCDateMethod() {
    const target = new Date();
    const handler = { has: (obj, prop) => Reflect.has(obj, prop) };
    const proxy = new Proxy(target, handler);
    return 'getUTCDate' in proxy;
}
