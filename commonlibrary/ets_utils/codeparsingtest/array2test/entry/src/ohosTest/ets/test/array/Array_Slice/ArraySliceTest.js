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

// ==================== 第 3 节：特殊值处理（JS 实现）====================

/**
 * 3.1 undefined 作为参数时视为未传递该参数
 */
export function ArraySliceJs_3_1() {
    const arr = [1, 2, 3, 4, 5];
    const result1 = arr.slice(undefined);
    const result2 = arr.slice(1, undefined);
    const result3 = arr.slice(undefined, 3);
    return JSON.stringify(result1) === '[1,2,3,4,5]' &&
        JSON.stringify(result2) === '[2,3,4,5]' &&
        JSON.stringify(result3) === '[1,2,3]';
}

/**
 * 3.2 null 被转换为 0
 */
export function ArraySliceJs_3_2() {
    const arr = [1, 2, 3, 4, 5];
    const result1 = arr.slice(null);
    const result2 = arr.slice(null, 3);
    return JSON.stringify(result1) === '[1,2,3,4,5]' &&
        JSON.stringify(result2) === '[1,2,3]';
}

/**
 * 3.3 NaN 被转换为 0
 */
export function ArraySliceJs_3_3() {
    const arr = [1, 2, 3, 4, 5];
    const result1 = arr.slice(NaN);
    const result2 = arr.slice(NaN, 3);
    return JSON.stringify(result1) === '[1,2,3,4,5]' &&
        JSON.stringify(result2) === '[1,2,3]';
}

/**
 * 3.5 空字符串被转换为 0
 */
export function ArraySliceJs_3_5() {
    const arr = [1, 2, 3, 4, 5];
    const result = arr.slice('', 3);
    return JSON.stringify(result) === '[1,2,3]';
}

/**
 * 3.6 布尔值被转换为 1 或 0
 */
export function ArraySliceJs_3_6() {
    const arr = [1, 2, 3, 4, 5];
    const result1 = arr.slice(true);
    const result2 = arr.slice(false, 3);
    return JSON.stringify(result1) === '[2,3,4,5]' &&
        JSON.stringify(result2) === '[1,2,3]';
}

// ==================== 第 4 节：数组类型测试（JS 实现）====================

/**
 * 4.1 处理含有空位的稀疏数组
 */
export function ArraySliceJs_4_1() {
    const arr = [1, , , 4, 5];
    const result = arr.slice(1, 4);
    return result.length === 3 &&
        result[0] === undefined &&
        result[1] === undefined &&
        result[2] === 4;
}

/**
 * 4.3 通过 call/apply 在类数组对象上使用 slice
 */
export function ArraySliceJs_4_3() {
    const arrayLike = { 0: 'a', 1: 'b', 2: 'c', length: 3 };
    const result = Array.prototype.slice.call(arrayLike, 1, 3);
    return JSON.stringify(result) === '["b","c"]';
}

/**
 * 4.4 对 arguments 对象使用 slice
 */
export function ArraySliceJs_4_4() {
    function test() {
        return Array.prototype.slice.call(arguments, 1, 3);
    }
    const result = test(1, 2, 3, 4, 5);
    return JSON.stringify(result) === '[2,3]';
}

// ==================== 第 5 节：引用类型测试（JS 实现）====================

/**
 * 5.6 处理包含 Symbol 的数组
 */
export function ArraySliceJs_5_6() {
    const sym = Symbol('test');
    const arr = [sym, Symbol('foo'), Symbol('bar')];
    const result = arr.slice(0, 2);
    return result.length === 2 &&
        result[0] === arr[0] &&
        typeof result[0] === 'symbol';
}

// ==================== 第 7 节：参数省略测试（JS 实现）====================

/**
 * 7.5 传递超过 2 个参数，多余的参数被忽略
 */
export function ArraySliceJs_7_5() {
    const arr = [1, 2, 3, 4, 5];
    const result = arr.slice(1, 3, 999, 'extra');
    return JSON.stringify(result) === '[2,3]';
}

/**
 * 7.6 通过 apply 传递参数
 */
export function ArraySliceJs_7_6() {
    const arr = [1, 2, 3, 4, 5];
    const result = Array.prototype.slice.apply(arr, [1, 4]);
    return JSON.stringify(result) === '[2,3,4]';
}

// ==================== 第 8 节：类型转换测试（JS 实现）====================

/**
 * 8.1 字符串参数被转换为数字
 */
export function ArraySliceJs_8_1() {
    const arr = [1, 2, 3, 4, 5];
    const result1 = arr.slice('1', '3');
    const result2 = arr.slice('2');
    return JSON.stringify(result1) === '[2,3]' &&
        JSON.stringify(result2) === '[3,4,5]';
}

/**
 * 8.2 浮点数参数被向下取整
 */
export function ArraySliceJs_8_2() {
    const arr = [1, 2, 3, 4, 5];
    const result1 = arr.slice(1.5, 3.9);
    const result2 = arr.slice(2.1);
    return JSON.stringify(result1) === '[2,3]' &&
        JSON.stringify(result2) === '[3,4,5]';
}

/**
 * 8.3 对象通过 valueOf 或 toString 转换为数字
 */
export function ArraySliceJs_8_3() {
    const arr = [1, 2, 3, 4, 5];
    const obj = {
        valueOf() { return 1; }
    };
    const result = arr.slice(obj, 3);
    return JSON.stringify(result) === '[2,3]';
}

/**
 * 8.4 数组参数被转换为数字
 */
export function ArraySliceJs_8_4() {
    const arr = [1, 2, 3, 4, 5];
    const result = arr.slice([1], [3]);
    return JSON.stringify(result) === '[2,3]';
}

/**
 * 8.5 大整数参数的处理（BigInt 转换为数字索引抛出 TypeError）
 */
export function ArraySliceJs_8_5() {
    const arr = [1, 2, 3, 4, 5];
    let thrown = false;
    try {
        const result = arr.slice(BigInt(1), BigInt(3));
    } catch (e) {
        thrown = true;
    }
    return thrown;
}

/**
 * 8.6 十六进制字符串转换为数字
 */
export function ArraySliceJs_8_6() {
    const arr = [1, 2, 3, 4, 5];
    const result = arr.slice('0x1', '0x3');
    return JSON.stringify(result) === '[2,3]';
}

// ==================== 第 9 节：异常场景测试（JS 实现）====================

/**
 * 9.1 this 值为 null 时抛出 TypeError
 */
export function ArraySliceJs_9_1() {
    let thrown = false;
    try {
        Array.prototype.slice.call(null, 1, 3);
    } catch (e) {
        thrown = true;
    }
    return thrown;
}

/**
 * 9.2 this 值为 undefined 时抛出 TypeError
 */
export function ArraySliceJs_9_2() {
    let thrown = false;
    try {
        Array.prototype.slice.call(undefined, 1, 3);
    } catch (e) {
        thrown = true;
    }
    return thrown;
}

/**
 * 9.3 this 值为原始类型时的处理
 */
export function ArraySliceJs_9_3() {
    const result1 = Array.prototype.slice.call('hello', 1, 3);
    return JSON.stringify(result1) === '["e","l"]';
}

/**
 * 9.4 对 Object.freeze 的数组使用 slice（ArkTS 受限标准库，在 JS 中验证）
 */
export function ArraySliceJs_9_4() {
    const arr = Object.freeze([1, 2, 3, 4, 5]);
    const result = arr.slice(1, 3);
    return JSON.stringify(result) === '[2,3]';
}

/**
 * 9.5 对 Object.seal 的数组使用 slice（ArkTS 受限标准库，在 JS 中验证）
 */
export function ArraySliceJs_9_5() {
    const arr = Object.seal([1, 2, 3, 4, 5]);
    const result = arr.slice(1, 3);
    return JSON.stringify(result) === '[2,3]';
}

/**
 * 9.7 length 属性为只读的情况
 */
export function ArraySliceJs_9_7() {
    const arr = [1, 2, 3, 4, 5];
    Object.defineProperty(arr, 'length', {
        writable: false,
        value: 5
    });
    const result = arr.slice(1, 3);
    return JSON.stringify(result) === '[2,3]';
}

// ==================== 第 11 节：原型链测试（JS 实现）====================

/**
 * 11.1 通过 Array.prototype.slice.call 调用（ArkTS 禁止 Function.call，在 JS 中验证）
 */
export function ArraySliceJs_11_1() {
    const arr = [1, 2, 3, 4, 5];
    const result = Array.prototype.slice.call(arr, 1, 3);
    return JSON.stringify(result) === '[2,3]';
}

/**
 * 11.2 修改 Array.prototype.slice 后的影响
 */
export function ArraySliceJs_11_2() {
    const originalSlice = Array.prototype.slice;
    Array.prototype.slice = function () {
        return ['modified'];
    };
    const arr = [1, 2, 3, 4, 5];
    const result = arr.slice(1, 3);
    Array.prototype.slice = originalSlice;
    return JSON.stringify(result) === '["modified"]';
}

/**
 * 11.4 使用 Symbol.species 控制返回的构造函数
 */
export function ArraySliceJs_11_4() {
    class MyArray extends Array {
        static get [Symbol.species]() {
            return Array;
        }
    }
    const myArr = new MyArray(1, 2, 3, 4, 5);
    const result = myArr.slice(1, 3);
    return !(result instanceof MyArray) && result instanceof Array;
}

/**
 * 11.5 在自定义类数组对象上使用 slice
 */
export function ArraySliceJs_11_5() {
    const obj = {
        0: 'a',
        1: 'b',
        2: 'c',
        length: 3
    };
    const result = Array.prototype.slice.call(obj, 1, 3);
    return JSON.stringify(result) === '["b","c"]';
}

/**
 * 11.6 通过 Object.create 继承数组原型
 * slice 会沿原型链读取 length 与数字下标，得到与源数组前段一致的浅拷贝。
 */
export function ArraySliceJs_11_6() {
    const arr = [1, 2, 3, 4, 5];
    const child = Object.create(arr);
    const result = Array.prototype.slice.call(child, 0, 3);
    return Array.isArray(result) && JSON.stringify(result) === '[1,2,3]';
}

// ==================== 第 12 节：实际应用场景（JS 实现）====================

/**
 * 12.2 将 arguments 或类数组转换为真数组
 */
export function ArraySliceJs_12_2() {
    function convertToArray() {
        return Array.prototype.slice.call(arguments);
    }
    const result = convertToArray(1, 2, 3, 4, 5);
    return JSON.stringify(result) === '[1,2,3,4,5]';
}

/**
 * 12.3 在函数中处理可变参数列表
 */
export function ArraySliceJs_12_3() {
    function logger() {
        const args = Array.prototype.slice.call(arguments, 1);
        return args.join(' ');
    }
    const output = logger('Info:', 'User', 'logged', 'in');
    return output === 'User logged in';
}
