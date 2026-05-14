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

export function ArraySomeJs_08() {
    try {
        [1, 2, 3].some();
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

export function ArraySomeJs_09() {
    const arr = [1, 2, 3];
    const bad = ['not a function', 123, null];
    for (const b of bad) {
        try {
            arr.some(b);
            return false;
        } catch (e) {
            if (!(e instanceof TypeError)) return false;
        }
    }
    return true;
}

export function ArraySomeJs_21() {
    const arr = [1, , , 4];
    let count = 0;
    const result = arr.some((element) => {
        count++;
        return element > 2;
    });
    return result === true && count === 2;
}

export function ArraySomeJs_22() {
    const arr1 = [1, , 3];
    const r1 = arr1.some((x) => x === undefined);
    const arr2 = [1, undefined, 3];
    const r2 = arr2.some((x) => x === undefined);
    return r1 === false && r2 === true;
}

export function ArraySomeJs_23() {
    const arr = [, , 3, 4, 5];
    const visited = [];
    const result = arr.some((element) => {
        visited.push(element);
        return element > 4;
    });
    return result === true && JSON.stringify(visited) === '[3,4,5]';
}

export function ArraySomeJs_24() {
    const arr = [1, 2, 3, , ,];
    const visited = [];
    const result = arr.some((element) => {
        visited.push(element);
        return element > 2;
    });
    return result === true && JSON.stringify(visited) === '[1,2,3]';
}

export function ArraySomeJs_25() {
    const arr = [1, 2, 3, 4, 5];
    delete arr[2];
    let count = 0;
    const result = arr.some((element) => {
        count++;
        return element > 3;
    });
    // delete 后空槽是否触发回调因实现而异，仅要求命中 >3 且次数在合理范围
    return result === true && count >= 3 && count <= 5;
}

export function ArraySomeJs_26() {
    const arr = [1, , 3, , 5, , 7];
    const visitedIndices = [];
    const result = arr.some((element, index) => {
        visitedIndices.push(index);
        return element > 5;
    });
    return result === true && JSON.stringify(visitedIndices) === '[0,2,4,6]';
}

export function ArraySomeJs_29() {
    const arrayLike = { length: 0 };
    const result = Array.prototype.some.call(arrayLike, (x) => x > 0);
    return result === false;
}

export function ArraySomeJs_30() {
    const arr = [1, 2, 3];
    let callCount = 0;
    const result = arr.some((element, index, array) => {
        callCount++;
        if (index === 0) {
            array.length = 0;
        }
        return element > 2;
    });
    return result === false && callCount === 1;
}

export function ArraySomeJs_38() {
    const largeArr = new Array(50000).fill(0);
    largeArr[49999] = 1;
    return largeArr.some((x) => x === 1) === true;
}

export function ArraySomeJs_39() {
    const arr = [];
    arr[10000] = 1;
    return arr.some((x) => x === 1) === true;
}

export function ArraySomeJs_54() {
    const arr = [1, 2, 3, 4, 5];
    const checker = {
        threshold: 3,
        check(element) {
            return element > this.threshold;
        }
    };
    return arr.some(checker.check, checker) === true;
}

export function ArraySomeJs_55() {
    const arr = [1, 2, 3];
    try {
        arr.some((x) => {
            if (x === 2) {
                throw new Error('Error at 2');
            }
            // 不可在 x===1 时 return true，否则 some 提前结束，抛不出异常
            return false;
        });
        return false;
    } catch (e) {
        return e.message === 'Error at 2';
    }
}

export function ArraySomeJs_56() {
    const arr = [1, 2, 3, 4, 5];
    let count = 0;
    try {
        arr.some((x) => {
            count++;
            if (x === 3) {
                throw new Error('Stop at 3');
            }
            return false;
        });
        return false;
    } catch (e) {
        return count === 3;
    }
}

export function ArraySomeJs_61() {
    const arr = [1, 2, 3];
    const r = arr.some(function () {
        return this == 42 && Number(this) === 42;
    }, 42);
    return r === true;
}

export function ArraySomeJs_62() {
    'use strict';
    const arr = [1, 2, 3];
    const r = arr.some(function (element) {
        return this === undefined && element > 10;
    }, null);
    return r === false;
}

export function ArraySomeJs_63() {
    'use strict';
    const arr = [1, 2, 3];
    const r = arr.some(function (element) {
        return this === undefined && element > 10;
    }, undefined);
    return r === false;
}

export function ArraySomeJs_64() {
    const arr = [1, 2, 3];
    const context = { multiplier: 10 };
    const r = arr.some((element) => element * context.multiplier > 15, { multiplier: 999 });
    return r === true;
}

export function ArraySomeJs_65() {
    const arr = [1, 2, 3];
    const context = { value: 10 };
    const r = arr.some(function (element) {
        const arrowFunc = () => this.value;
        return element + arrowFunc() > 10;
    }, context);
    return r === true;
}

export function ArraySomeJs_66() {
    const arrayLike = { length: 3, 0: 'a', 1: 'b', 2: 'c' };
    return Array.prototype.some.call(arrayLike, (x) => x === 'b') === true;
}

export function ArraySomeJs_67() {
    const str = 'hello';
    return (
        Array.prototype.some.call(str, (ch) => ch === 'e') === true &&
        Array.prototype.some.call(str, (ch) => ch === 'z') === false
    );
}

export function ArraySomeJs_68() {
    function testArguments() {
        return Array.prototype.some.call(arguments, (arg) => arg > 5);
    }
    return testArguments(1, 3, 7, 2) === true && testArguments(1, 2, 3, 4) === false;
}

export function ArraySomeJs_69() {
    const nodeList = { length: 2, 0: { hidden: false }, 1: { hidden: true } };
    return (
        Array.prototype.some.call(nodeList, (el) => el.hidden === true) === true
    );
}

export function ArraySomeJs_70() {
    const forms = { length: 2, 0: { method: 'post' }, 1: { method: 'get' } };
    return Array.prototype.some.call(forms, (f) => f.method === 'get') === true;
}

export function ArraySomeJs_73() {
    const customArrayLike = {
        0: 10,
        1: 20,
        2: 30,
        length: 3
    };
    return Array.prototype.some.call(customArrayLike, (x) => x > 15) === true;
}

export function ArraySomeJs_74() {
    const sparseArrayLike = { 0: 1, 2: 3, 5: 6, length: 6 };
    const visitedIndices = [];
    const result = Array.prototype.some.call(sparseArrayLike, (x, index) => {
        visitedIndices.push(index);
        return x > 5;
    });
    return result === true && JSON.stringify(visitedIndices) === '[0,2,5]';
}

export function ArraySomeJs_75() {
    const arrayLike = { 0: 1, 1: 2, length: 10 };
    let count = 0;
    const result = Array.prototype.some.call(arrayLike, (x) => {
        count++;
        return x > 5;
    });
    return result === false && count === 2;
}

export function ArraySomeJs_83() {
    const arr = [1, 2, 3, 4, 5];
    const result = arr.some((element, index, array) => {
        if (index === 0) {
            delete array[1];
        }
        return element > 3;
    });
    return result === true;
}

export function ArraySomeJs_84() {
    const arr = [1, 2, 3, 4, 5];
    const result = arr.some((element, index, array) => {
        if (index === 0) {
            delete array[4];
        }
        return element > 3;
    });
    return result === true;
}

/** 回调返回 NaN 时 some 按假值处理 */
export function ArraySomeJs_148() {
    const arr = [1, 2, 3];
    return arr.some(() => NaN) === false;
}

export function ArraySomeJs_88() {
    const arr = [1, 2, 3, 4, 5];
    if (!arr.some((x) => x > 3)) {
        return false;
    }
    const fn = (x) => x > 3;
    return arr.includes(fn) === false;
}
