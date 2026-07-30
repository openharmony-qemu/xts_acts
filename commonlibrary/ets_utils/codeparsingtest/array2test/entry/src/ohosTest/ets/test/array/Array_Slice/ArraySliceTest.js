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

export function ArraySliceJs_3_2() {
    const arr = [1, 2, 3, 4, 5];
    const result1 = arr.slice(null);
    const result2 = arr.slice(null, 3);
    return JSON.stringify(result1) === '[1,2,3,4,5]' &&
        JSON.stringify(result2) === '[1,2,3]';
}

export function ArraySliceJs_3_5() {
    const arr = [1, 2, 3, 4, 5];
    const result = arr.slice('', 3);
    return JSON.stringify(result) === '[1,2,3]';
}

export function ArraySliceJs_3_6() {
    const arr = [1, 2, 3, 4, 5];
    const result1 = arr.slice(true);
    const result2 = arr.slice(false, 3);
    return JSON.stringify(result1) === '[2,3,4,5]' &&
        JSON.stringify(result2) === '[1,2,3]';
}

export function ArraySliceJs_7_5() {
    const arr = [1, 2, 3, 4, 5];
    const result = arr.slice(1, 3, 999, 'extra');
    return JSON.stringify(result) === '[2,3]';
}

export function ArraySliceJs_8_1() {
    const arr = [1, 2, 3, 4, 5];
    const result1 = arr.slice('1', '3');
    const result2 = arr.slice('2');
    return JSON.stringify(result1) === '[2,3]' &&
        JSON.stringify(result2) === '[3,4,5]';
}

export function ArraySliceJs_8_3() {
    const arr = [1, 2, 3, 4, 5];
    const obj = {
        valueOf() { return 1; }
    };
    const result = arr.slice(obj, 3);
    return JSON.stringify(result) === '[2,3]';
}

export function ArraySliceJs_8_4() {
    const arr = [1, 2, 3, 4, 5];
    const result = arr.slice([1], [3]);
    return JSON.stringify(result) === '[2,3]';
}

export function ArraySliceJs_8_6() {
    const arr = [1, 2, 3, 4, 5];
    const result = arr.slice('0x1', '0x3');
    return JSON.stringify(result) === '[2,3]';
}

export function ArraySliceJs_9_4() {
    const arr = Object.freeze([1, 2, 3, 4, 5]);
    const result = arr.slice(1, 3);
    return JSON.stringify(result) === '[2,3]';
}

export function ArraySliceJs_9_5() {
    const arr = Object.seal([1, 2, 3, 4, 5]);
    const result = arr.slice(1, 3);
    return JSON.stringify(result) === '[2,3]';
}

export function ArraySliceJs_4_3() {
    const arrayLike = { 0: 'a', 1: 'b', 2: 'c', length: 3 };
    const result = Array.prototype.slice.call(arrayLike, 1, 3);
    return JSON.stringify(result) === '["b","c"]';
}

export function ArraySliceJs_4_4() {
    function test() {
        return Array.prototype.slice.call(arguments, 1, 3);
    }
    const result = test(1, 2, 3, 4, 5);
    return JSON.stringify(result) === '[2,3]';
}

export function ArraySliceJs_5_6() {
    const sym = Symbol('test');
    const arr = [sym, Symbol('foo'), Symbol('bar')];
    const result = arr.slice(0, 2);
    return result.length === 2 &&
        result[0] === arr[0] &&
        typeof result[0] === 'symbol';
}

export function ArraySliceJs_7_6() {
    const arr = [1, 2, 3, 4, 5];
    const result = Array.prototype.slice.apply(arr, [1, 4]);
    return JSON.stringify(result) === '[2,3,4]';
}

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

export function ArraySliceJs_9_1() {
    let thrown = false;
    try {
        Array.prototype.slice.call(null, 1, 3);
    } catch (e) {
        thrown = true;
    }
    return thrown;
}

export function ArraySliceJs_9_2() {
    let thrown = false;
    try {
        Array.prototype.slice.call(undefined, 1, 3);
    } catch (e) {
        thrown = true;
    }
    return thrown;
}

export function ArraySliceJs_9_3() {
    const result1 = Array.prototype.slice.call('hello', 1, 3);
    return JSON.stringify(result1) === '["e","l"]';
}

export function ArraySliceJs_9_7() {
    const arr = [1, 2, 3, 4, 5];
    Object.defineProperty(arr, 'length', {
        writable: false,
        value: 5
    });
    const result = arr.slice(1, 3);
    return JSON.stringify(result) === '[2,3]';
}

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

export function ArraySliceJs_11_6() {
    const arr = [1, 2, 3, 4, 5];
    const child = Object.create(arr);
    const result = Array.prototype.slice.call(child, 0, 3);
    return Array.isArray(result) && JSON.stringify(result) === '[1,2,3]';
}

export function ArraySliceJs_12_2() {
    function convertToArray() {
        return Array.prototype.slice.call(arguments);
    }
    const result = convertToArray(1, 2, 3, 4, 5);
    return JSON.stringify(result) === '[1,2,3,4,5]';
}

export function ArraySliceJs_12_3() {
    function logger() {
        const args = Array.prototype.slice.call(arguments, 1);
        return args.join(' ');
    }
    const output = logger('Info:', 'User', 'logged', 'in');
    return output === 'User logged in';
}
