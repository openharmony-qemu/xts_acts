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

// ==================== 第 1 节：返回值类型验证（JS 实现）====================

/**
 * 1.1.1 验证 values() 返回的是迭代器对象（通过类型检查）
 */
export function ArrayValuesJs_1_1_1() {
    const arr = [1, 2, 3];
    const iter = arr.values();
    return iter !== null && typeof iter === 'object' && typeof iter.next === 'function';
}

/**
 * 1.1.2 验证 values() 返回对象的 Symbol.toStringTag
 */
export function ArrayValuesJs_1_1_2() {
    const arr = [1, 2, 3];
    const iter = arr.values();
    return iter[Symbol.toStringTag] === 'Array Iterator' &&
        Object.prototype.toString.call(iter) === '[object Array Iterator]';
}

/**
 * 2.3.3 验证迭代器对象本身具有 Symbol.iterator，且返回自身
 */
export function ArrayValuesJs_2_3_3() {
    const arr = [1];
    const iter = arr.values();
    return typeof iter[Symbol.iterator] === 'function' && iter[Symbol.iterator]() === iter;
}

// ==================== 第 5 节：与 Symbol.iterator 关系（JS 实现）====================

/**
 * 5.1.1 验证 Array.prototype.values === Array.prototype[Symbol.iterator]
 */
export function ArrayValuesJs_5_1_1() {
    return Array.prototype.values === Array.prototype[Symbol.iterator];
}

/**
 * 5.1.2 验证 values() 和 Symbol.iterator() 返回相同类型的迭代器
 */
export function ArrayValuesJs_5_1_2() {
    const arr = [1, 2, 3];
    const vIter = arr.values();
    const sIter = arr[Symbol.iterator]();
    return vIter[Symbol.toStringTag] === sIter[Symbol.toStringTag] &&
        vIter[Symbol.toStringTag] === 'Array Iterator';
}

/**
 * 5.1.3 验证两个独立迭代器遍历产生相同结果
 */
export function ArrayValuesJs_5_1_3() {
    const arr = [1, 2, 3];
    const vIter = arr.values();
    const sIter = arr[Symbol.iterator]();
    return vIter.next().value === sIter.next().value &&
        vIter.next().value === sIter.next().value &&
        vIter.next().value === sIter.next().value;
}

/**
 * 5.2.2 验证修改 Symbol.iterator 后已获取的 values 迭代器不受影响
 */
export function ArrayValuesJs_5_2_2() {
    const arr = [1, 2, 3];
    const iter = arr.values();
    arr[Symbol.iterator] = function* () { yield 99; };
    const result = [];
    for (const v of iter) {
        result.push(v);
    }
    return JSON.stringify(result) === '[1,2,3]';
}

/**
 * 5.2.3 验证修改数组的 Symbol.iterator 后 for...of 行为改变
 */
export function ArrayValuesJs_5_2_3() {
    const arr = [1, 2, 3];
    arr[Symbol.iterator] = function* () { yield 99; };
    const result = [];
    for (const v of arr) {
        result.push(v);
    }
    return JSON.stringify(result) === '[99]';
}

// ==================== 第 6 节：特殊元素类型（JS 实现）====================

/**
 * 6.1.4 验证 BigInt 类型数组迭代
 */
export function ArrayValuesJs_6_1_4() {
    const arr = [1n, 2n, 3n];
    const result = [];
    for (const v of arr.values()) {
        result.push(v);
    }
    return result[0] === 1n && result[1] === 2n && result[2] === 3n;
}

/**
 * 6.2.3 验证函数作为元素迭代
 */
export function ArrayValuesJs_6_2_3() {
    const fn = () => 42;
    const arr = [fn];
    const iter = arr.values();
    const r = iter.next();
    return r.value === fn && r.value() === 42;
}

/**
 * 6.3.1 验证不同类型混合数组迭代（typeof 检查）
 */
export function ArrayValuesJs_6_3_1() {
    const arr = [1, 'two', true, null, { a: 1 }, [2]];
    const types = [];
    for (const v of arr.values()) {
        types.push(typeof v);
    }
    return JSON.stringify(types) === '["number","string","boolean","object","object","object"]';
}

/**
 * 6.4.4 验证 Symbol 作为元素迭代
 */
export function ArrayValuesJs_6_4_4() {
    const sym = Symbol('test');
    const arr = [sym];
    const iter = arr.values();
    return iter.next().value === sym;
}

// ==================== 第 7 节：稀疏数组（JS 实现）====================

/**
 * 7.1.1 验证稀疏数组空槽作为 undefined 迭代
 */
export function ArrayValuesJs_7_1_1() {
    const arr = [1, , , 4];
    const result = [];
    for (const v of arr.values()) {
        result.push(v);
    }
    return result.length === 4 &&
        result[0] === 1 &&
        result[1] === undefined &&
        result[2] === undefined &&
        result[3] === 4;
}

/**
 * 7.1.2 验证中间有空槽的数组迭代
 */
export function ArrayValuesJs_7_1_2() {
    const arr = ['a', , 'c'];
    const result = [];
    for (const v of arr.values()) {
        result.push(v === undefined ? null : v);
    }
    return result[0] === 'a' && result[1] === null && result[2] === 'c';
}

/**
 * 7.2.1 验证全空槽数组迭代输出全为 undefined
 */
export function ArrayValuesJs_7_2_1() {
    const arr = new Array(3);
    const result = [];
    for (const v of arr.values()) {
        result.push(v);
    }
    return result.length === 3 && result.every(v => v === undefined);
}

/**
 * 7.2.2 验证通过 Array 构造函数创建的空数组迭代
 */
export function ArrayValuesJs_7_2_2() {
    const arr = Array(5);
    const iter = arr.values();
    let allUndefined = true;
    let allNotDone = true;
    for (let i = 0; i < 5; i++) {
        const r = iter.next();
        if (r.value !== undefined) allUndefined = false;
        if (r.done !== false) allNotDone = false;
    }
    const last = iter.next();
    return allUndefined && allNotDone && last.done === true;
}

/**
 * 7.3.1 验证数组开头有空槽的迭代
 */
export function ArrayValuesJs_7_3_1() {
    const arr = [, , 'a', 'b'];
    const result = [];
    for (const v of arr.values()) {
        result.push(v);
    }
    return result[0] === undefined &&
        result[1] === undefined &&
        result[2] === 'a' &&
        result[3] === 'b';
}

/**
 * 7.3.2 验证数组末尾有空槽的迭代
 */
export function ArrayValuesJs_7_3_2() {
    const arr = ['a', 'b', ,];
    const result = [];
    for (const v of arr.values()) {
        result.push(v);
    }
    return result.length === 3 &&
        result[0] === 'a' &&
        result[1] === 'b' &&
        result[2] === undefined;
}

/**
 * 7.3.3 验证空槽与显式 undefined 元素的迭代行为一致
 */
export function ArrayValuesJs_7_3_3() {
    const sparse = [1, , 3];
    const explicit = [1, undefined, 3];
    const sparseVals = [];
    for (const v of sparse.values()) sparseVals.push(v);
    const explicitVals = [];
    for (const v of explicit.values()) explicitVals.push(v);
    return sparseVals[0] === explicitVals[0] &&
        sparseVals[1] === explicitVals[1] &&
        sparseVals[2] === explicitVals[2];
}

// ==================== 第 8 节：大稀疏数组（JS 实现）====================

/**
 * 8.3.2 验证含大量空槽的大数组迭代
 */
export function ArrayValuesJs_8_3_2() {
    const arr = new Array(1000);
    arr[0] = 'first';
    arr[999] = 'last';
    let count = 0;
    let undefinedCount = 0;
    for (const v of arr.values()) {
        if (v === undefined) undefinedCount++;
        count++;
    }
    return count === 1000 && undefinedCount === 998;
}

// ==================== 第 9 节：迭代期间删除操作（JS 实现）====================

/**
 * 9.3.1 验证迭代期间用 delete 删除元素，空槽变为 undefined
 */
export function ArrayValuesJs_9_3_1() {
    const arr = ['a', 'b', 'c'];
    const iter = arr.values();
    iter.next();
    delete arr[1];
    return iter.next().value === undefined;
}

/**
 * 9.3.3 验证迭代期间用 shift 删除头部元素的影响
 */
export function ArrayValuesJs_9_3_3() {
    const arr = ['a', 'b', 'c'];
    const iter = arr.values();
    iter.next();
    arr.shift();
    const result = [];
    for (const v of iter) {
        result.push(v);
    }
    return result.length > 0;
}

// ==================== 第 10 节：泛型调用（JS 实现）====================

/**
 * 10.1.1 验证对类数组对象调用 values()
 */
export function ArrayValuesJs_10_1_1() {
    const arrayLike = { length: 3, 0: 'a', 1: 'b', 2: 'c' };
    const iter = Array.prototype.values.call(arrayLike);
    const result = [];
    for (const v of iter) {
        result.push(v);
    }
    return JSON.stringify(result) === '["a","b","c"]';
}

/**
 * 10.1.2 验证类数组对象中超出 length 的属性被忽略
 */
export function ArrayValuesJs_10_1_2() {
    const arrayLike = { length: 2, 0: 'a', 1: 'b', 2: 'c' };
    const iter = Array.prototype.values.call(arrayLike);
    const result = [];
    for (const v of iter) {
        result.push(v);
    }
    return JSON.stringify(result) === '["a","b"]';
}

/**
 * 10.1.3 验证 arguments 对象调用 values()
 */
export function ArrayValuesJs_10_1_3() {
    function testFn() {
        const iter = Array.prototype.values.call(arguments);
        const result = [];
        for (const v of iter) {
            result.push(v);
        }
        return result;
    }
    const result = testFn(1, 2, 3);
    return JSON.stringify(result) === '[1,2,3]';
}

/**
 * 10.2.1 验证对字符串调用 values()（通过 Array.prototype.values.call）
 */
export function ArrayValuesJs_10_2_1() {
    const str = 'abc';
    const iter = Array.prototype.values.call(str);
    const result = [];
    for (const v of iter) {
        result.push(v);
    }
    return JSON.stringify(result) === '["a","b","c"]';
}

/**
 * 10.3.1 验证仅有 length 属性的对象迭代输出全为 undefined
 */
export function ArrayValuesJs_10_3_1() {
    const obj = { length: 3 };
    const iter = Array.prototype.values.call(obj);
    const result = [];
    for (const v of iter) {
        result.push(v);
    }
    return result.length === 3 && result.every(v => v === undefined);
}

/**
 * 10.3.2 验证 length 为 0 的对象迭代立即结束
 */
export function ArrayValuesJs_10_3_2() {
    const obj = { length: 0, 0: 'a' };
    const iter = Array.prototype.values.call(obj);
    const result = [];
    for (const v of iter) {
        result.push(v);
    }
    return result.length === 0;
}

/**
 * 10.4.1 验证对 null 调用 values() 抛出 TypeError
 */
export function ArrayValuesJs_10_4_1() {
    let thrown = false;
    try {
        Array.prototype.values.call(null);
    } catch (e) {
        thrown = e instanceof TypeError;
    }
    return thrown;
}

/**
 * 10.4.2 验证对 undefined 调用 values() 抛出 TypeError
 */
export function ArrayValuesJs_10_4_2() {
    let thrown = false;
    try {
        Array.prototype.values.call(undefined);
    } catch (e) {
        thrown = e instanceof TypeError;
    }
    return thrown;
}

/**
 * 10.4.3 验证对数字调用 values() 立即 done
 */
export function ArrayValuesJs_10_4_3() {
    const iter = Array.prototype.values.call(42);
    const r = iter.next();
    return r.done === true;
}

/**
 * 10.4.4 验证对布尔值调用 values() 立即 done
 */
export function ArrayValuesJs_10_4_4() {
    const iter = Array.prototype.values.call(true);
    const r = iter.next();
    return r.done === true;
}

/**
 * 10.4.5 验证负数 length 的对象迭代立即结束
 */
export function ArrayValuesJs_10_4_5() {
    const obj = { length: -1, 0: 'a' };
    const iter = Array.prototype.values.call(obj);
    const r = iter.next();
    return r.done === true;
}

/**
 * 10.4.6 验证 NaN 作为 length 的对象迭代立即结束
 */
export function ArrayValuesJs_10_4_6() {
    const obj = { length: NaN, 0: 'a' };
    const iter = Array.prototype.values.call(obj);
    const r = iter.next();
    return r.done === true;
}

/**
 * 10.4.7 验证 length 为非整数时向下取整
 */
export function ArrayValuesJs_10_4_7() {
    const obj = { length: 2.7, 0: 'a', 1: 'b', 2: 'c' };
    const iter = Array.prototype.values.call(obj);
    const result = [];
    for (const v of iter) {
        result.push(v);
    }
    return result.length === 2 && result[0] === 'a' && result[1] === 'b';
}

// ==================== 第 12 节：Set/Map/Object.fromEntries（JS 实现）====================

/**
 * 12.3.3 验证使用 Set 构造函数从 values() 创建集合
 */
export function ArrayValuesJs_12_3_3() {
    const arr = [1, 2, 2, 3, 3];
    const set = new Set(arr.values());
    return set.size === 3 && set.has(1) && set.has(2) && set.has(3);
}

/**
 * 12.3.4 验证使用展开运算符从 values() 创建 Map 键
 */
export function ArrayValuesJs_12_3_4() {
    const arr2 = [1, 2, 3];
    const vals = [...arr2.values()];
    return JSON.stringify(vals) === '[1,2,3]';
}

/**
 * 12.3.5 验证 Object.fromEntries 与 values() 的结合使用
 */
export function ArrayValuesJs_12_3_5() {
    const arr = [['a', 1], ['b', 2]];
    const obj = Object.fromEntries(arr.values());
    return obj.a === 1 && obj.b === 2;
}
