/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import ArrayList from '@ohos.util.ArrayList';

export function test001() {
    try {
        let arrayList = new ArrayList();
        return true;
    } catch (err) {
        return err;
    }
    return null
}

export function test007() {
    let arrayList = new ArrayList();
    arrayList.add("四");
    arrayList.add("三");
    arrayList.add(1);
    arrayList.add("a");
    arrayList.insert(8, 2);
    let arr = [];
    arrayList.forEach((item, index) => {
        arr.push(item);
    });
    let a = ["四", "三", 8, 1, "a"];
    return arr.toString() == a.toString();
}

export function test004() {
    let arrayList = new ArrayList();
    let a = { name: "lala", age: "13岁" };
    arrayList.add(a);
    let res = arrayList.has(a);
    return res === true;
}

export function test011() {
    let arrayList = new ArrayList();
    arrayList.add("四");
    arrayList.add("三");
    arrayList.add(1);
    arrayList.add("a");
    arrayList.removeByIndex(2);
    let arr = [];
    arrayList.forEach((item, index) => {
        arr.push(item);
    });
    let a = ["四", "三", "a"];
    for (let i = 0; i < a.length; i++) {
        if (arr[i] !== a[i]) {
            return false;
        }
    }
    return true;
}

export function test014() {
    let arrayList = new ArrayList();
    arrayList.add("四");
    arrayList.add("三");
    arrayList.add(1);
    arrayList.add("a");
    arrayList.add(1);
    arrayList.add("b");
    arrayList.add("c");
    arrayList.add(1);
    arrayList.removeByRange(1, 3);
    let arr = [];
    arrayList.forEach((item, index) => {
        arr.push(item);
    });
    let a = ["四", "a", 1, "b", "c", 1];
    for (let i = 0; i < a.length; i++) {
        if (arr[i] !== a[i]) {
            return false;
        }
    }
    return true;
}

export function test015() {
    let arrayList = new ArrayList();
    arrayList.add(4);
    arrayList.add(3);
    arrayList.add(1);
    arrayList.add(2);
    arrayList.add(14);
    arrayList.replaceAllElements((item, index) => {
        return (item = 2 * item);
    });
    let arr = [];
    arrayList.forEach((item, index) => {
        arr.push(item);
    });
    let a = [8, 6, 2, 4, 28];
    for (let i = 0; i < a.length; i++) {
        if (arr[i] !== a[i]) {
            return false;
        }
    }
    return true;
}

export function test016() {
    let arrayList = new ArrayList();
    arrayList.add(4);
    arrayList.add(3);
    arrayList.add(1);
    arrayList.add(2);
    arrayList.add(14);
    let arr = [];
    arrayList.forEach((item, index) => {
        arr.push(item);
    });
    let a = [4, 3, 1, 2, 14];
    for (let i = 0; i < a.length; i++) {
        if (arr[i] !== a[i]) {
            return false;
        }
    }
    return true;
}

export function test017() {
    let arrayList = new ArrayList();
    arrayList.add(4);
    arrayList.add(3);
    arrayList.add(1);
    arrayList.add(2);
    arrayList.add(14);
    let subArr = arrayList.subArrayList(2, 4);
    let arr = [];
    subArr.forEach((item, index) => {
        arr.push(item);
    });
    let a = [1, 2];
    for (let i = 0; i < a.length; i++) {
        if (arr[i] !== a[i]) {
            return false;
        }
    }
    return true;
}

export function test020() {
    let arrayList = new ArrayList();
    arrayList.add(4);
    arrayList.add(3);
    arrayList.add(1);
    arrayList.add(2);
    arrayList.add(14);
    let res = arrayList.clone();
    let arr = [];
    res.forEach((item, index) => {
        arr.push(item);
    });
    let a = [4, 3, 1, 2, 14];
    for (let i = 0; i < a.length; i++) {
        if (arr[i] !== a[i]) {
            return false;
        }
    }
    return true;
}

export function test022() {
    let arrayList = new ArrayList();
    arrayList.add(4);
    arrayList.add(3);
    arrayList.add(1);
    arrayList.add(2);
    arrayList.add(14);
    arrayList.add("a");
    arrayList.add("b");
    arrayList.add("c");
    arrayList.add("d");
    arrayList.add("v");
    let a = [1, 2, 3, 4];
    arrayList.add(a);
    let res = arrayList.getCapacity();
    return res === 15;
}

export function test025() {
    let arrayList = new ArrayList();
    arrayList.add(8);
    arrayList.add("一");
    arrayList.add("二");
    arrayList.add(5);
    let c = [1, 2, 3, 4];
    arrayList.add(c);
    arrayList.add(6);
    arrayList.add("三");
    arrayList.add("四");
    let arr = [];
    for (let item of arrayList) {
        arr.push(item);
    }
    let a = [8, "一", "二", 5, c, 6, "三", "四"];
    for (let i = 0; i < a.length; i++) {
        if (arr[i] !== a[i]) {
            return false;
        }
    }
    return true;
}

export function test026() {
    let arrayList = new ArrayList();
    arrayList.add(4);
    arrayList.add(3);
    arrayList.add(1);
    arrayList.add(2);
    arrayList.add(14);
    arrayList.sort((a, b) => a - b);
    let arr = [];
    arrayList.forEach((item, index) => {
        arr.push(item);
    });
    let a = [1, 2, 3, 4, 14];
    for (let i = 0; i < a.length; i++) {
        if (arr[i] !== a[i]) {
            return false;
        }
    }
    return true;
}

export function test035() {
    let arrayList = new ArrayList();
    arrayList.add(0);
    arrayList.add(1);
    arrayList.add(2);
    arrayList.add(1);
    arrayList.add(3);
    arrayList.add(1);
    arrayList.forEach((item, index) => {
        if (item == 1) {
            arrayList.remove(item);
        }
    });
    let arr = [];
    arrayList.forEach((item, index) => {
        arr.push(item);
    });
    let a = [0, 2, 3];
    for (let i = 0; i < a.length; i++) {
        if (arr[i] !== a[i]) {
            return false;
        }
    }
    return true;
}

export function test041() {
    let arrayList = new ArrayList();
    arrayList.add(4);
    arrayList.add(3);
    arrayList.add(1);
    arrayList.add(2);
    arrayList.add(14);
    let subArr = arrayList.subArrayList(0, 5);
    let arr = [];
    arrayList.forEach((item, index) => {
        arr.push(item);
    });
    let a = [4, 3, 1, 2, 14];
    for (let i = 0; i < a.length; i++) {
        if (arr[i] !== a[i]) {
            return false;
        }
    }
    return true;
}

export function test044() {
    let arrayList = new ArrayList();
    arrayList.add(4);
    arrayList.add(3);
    arrayList.add(1);
    arrayList.add(2);
    arrayList.add(14);
    try {
        arrayList.increaseCapacityTo();
        return false;
    } catch (err) {
        return err.name === "BusinessError" && err.code === 401 &&
            err.message === `The type of "newCapacity" must be number. Received value is: undefined`;
    }
}

export function test049() {
    let arrayList = new ArrayList();
    arrayList.add("刘");
    arrayList.add("张三");
    arrayList.add(1);
    arrayList.add(2);
    arrayList.add("李四");
    arrayList.sort((a, b) => a - b);
    let arr = [];
    arrayList.forEach((item, index) => {
        arr.push(item);
    });
    let a = ["刘", "张三", 1, 2, "李四"];
    for (let i = 0; i < a.length; i++) {
        if (arr[i] !== a[i]) {
            return false;
        }
    }
    return true;
}

export function test050() {
    let arrayList = new ArrayList();
    arrayList.add("c");
    arrayList.add("a");
    arrayList.add("b");
    arrayList.add("e");
    arrayList.add("d");
    arrayList.sort((a, b) => a - b);
    let arr = [];
    arrayList.forEach((item, index) => {
        arr.push(item);
    });
    let a = ["c", "a", "b", "e", "d"];
    for (let i = 0; i < a.length; i++) {
        if (arr[i] !== a[i]) {
            return false;
        }
    }
    return true;
}

export function test051() {
    let arrayList = new ArrayList();
    arrayList.add("刘");
    arrayList.add("张三");
    arrayList.add(1);
    arrayList.add(2);
    arrayList.add("李四");
    let arr = [];
    let itr = arrayList[Symbol.iterator]();
    let tmp = undefined;
    do {
        tmp = itr.next().value;
        arr.push(tmp);
    } while (tmp != undefined);
    let a = ["刘", "张三", 1, 2, "李四"];
    for (let i = 0; i < a.length; i++) {
        if (arr[i] !== a[i]) {
            return false;
        }
    }
    return true;
}

export function test054() {
    let arrayList = new ArrayList();
    arrayList.add(1);
    try {
        arrayList.insert("a", "b");
        return false;
    } catch (err) {
        return err.name === "BusinessError" && err.code === 401 &&
            err.message === `The type of "index" must be small integer. Received value is: b`;
    }
}

export function test055() {
    let arrayList = new ArrayList();
    arrayList.add("a");
    arrayList.add("b");
    arrayList.add("c");
    arrayList.add("a");
    arrayList.add("b");
    try {
        arrayList.removeByIndex("a");
        return false;
    } catch (err) {
        return err.name === "BusinessError" && err.code === 401 &&
            err.message === `The type of "index" must be small integer. Received value is: a`;
    }
}

export function test056() {
    let arrayList = new ArrayList();
    arrayList.add(1);
    arrayList.add("a");
    try {
        arrayList.removeByRange("a", 9);
        return false;
    } catch (err) {
        return err.name === "BusinessError" && err.code === 401 &&
            err.message === `The type of "fromIndex" must be number. Received value is: a`;
    }
}

export function test057() {
    let arrayList = new ArrayList();
    arrayList.add(4);
    arrayList.add(3);
    try {
        arrayList.replaceAllElements(123);
        return false;
    } catch (err) {
        return err.name === "BusinessError" && err.code === 401 &&
            err.message === `The type of "callbackfn" must be callable. Received value is: 123`;
    }
}

export function test058() {
    let arrayList = new ArrayList();
    arrayList.add(4);
    arrayList.add(3);
    arrayList.add(1);
    arrayList.add(2);
    arrayList.add(14);
    try {
        arrayList.subArrayList("a", 2);
        return false;
    } catch (err) {
        return err.name === "BusinessError" && err.code === 401 &&
            err.message === `The type of "fromIndex" must be number. Received value is: a`;
    }
}

export function test063() {
    let arrayList = new ArrayList();
    try {
        arrayList.forEach(11);
        return false;
    } catch (err) {
        return err.name === "BusinessError" && err.code === 401 &&
            err.message === `The type of "callbackfn" must be callable. Received value is: 11`;
    }
}

