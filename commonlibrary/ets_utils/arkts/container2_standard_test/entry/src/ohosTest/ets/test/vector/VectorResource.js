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

import Vector from '@ohos.util.Vector';

export function test004() {
    let vector = new Vector();
    let a = { name: "lala", age: "13岁" };
    vector.add(a);
    let res = vector.getFirstElement();
    return res === a;
}

export function test027() {
    let vector = new Vector();
    vector.add("四"); vector.add("三"); vector.add(1); vector.add("a");
    vector.add(1); vector.add("b"); vector.add("c"); vector.add(1);
    vector.removeByRange(1, 3);
    let arr = [];
    vector.forEach((item, index) => { arr.push(item); });
    let a = ["四", "a", 1, "b", "c", 1];
    for (let i = 0; i < a.length; i++) { if (arr[i] !== a[i]) return false; }
    return true;
}

export function test031() {
    let vector = new Vector();
    vector.add("四"); vector.add("三"); vector.add(1); vector.add("a");
    vector.add(1); vector.add("b"); vector.add("c"); vector.add(1);
    let capacity = vector.getCapacity();
    vector.removeByRange(0, capacity);
    let arr = [];
    vector.forEach((item, index) => { arr.push(item); });
    return arr.length === 0;
}

export function test035() {
    let vector = new Vector();
    vector.add(4); vector.add(3); vector.add(1); vector.add(2); vector.add(14);
    vector.replaceAllElements((item, index) => { return (item = 2 * item); });
    let arr = [];
    vector.forEach((item, index) => { arr.push(item); });
    let a = [8, 6, 2, 4, 28];
    for (let i = 0; i < a.length; i++) { if (arr[i] !== a[i]) return false; }
    return true;
}

export function test036() {
    let vector = new Vector();
    vector.add(4); vector.add(3); vector.add(1); vector.add(2); vector.add(14);
    let arr = [];
    vector.forEach((item, index) => { arr.push(item); });
    let a = [4, 3, 1, 2, 14];
    for (let i = 0; i < a.length; i++) { if (arr[i] !== a[i]) return false; }
    return true;
}

export function test037() {
    let vector = new Vector();
    let arr = [];
    vector.forEach((item, index) => { arr.push(item); });
    return arr.length === 0;
}

export function test038() {
    let vector = new Vector();
    vector.add(4); vector.add(3); vector.add(1); vector.add(2); vector.add(14);
    let res = vector.subVector(2, 4);
    let arr = [];
    res.forEach((item, index) => { arr.push(item); });
    let a = [1, 2];
    for (let i = 0; i < a.length; i++) { if (arr[i] !== a[i]) return false; }
    return true;
}

export function test044() {
    let vector = new Vector();
    vector.add(4); vector.add(3); vector.add(1); vector.add(2); vector.add(14);
    let arr1 = ["a", "b", "c"];
    vector.copyToArray(arr1);
    let a = [4, 3, 1, 2, 14];
    for (let i = 0; i < a.length; i++) { if (arr1[i] !== a[i]) return false; }
    return true;
}

export function test046() {
    let vector = new Vector();
    vector.add(4); vector.add(3); vector.add(1); vector.add(2); vector.add(14);
    let res = vector.clone();
    let arr = [];
    res.forEach((item, index) => { arr.push(item); });
    let a = [4, 3, 1, 2, 14];
    for (let i = 0; i < a.length; i++) { if (arr[i] !== a[i]) return false; }
    return true;
}

export function test048() {
    let vector = new Vector();
    vector.add(4); vector.add(3); vector.add(1); vector.add(2); vector.add(14);
    vector.add("a"); vector.add("b"); vector.add("c"); vector.add("d"); vector.add("v");
    let a = [1, 2, 3, 4];
    vector.add(a);
    let res = vector.getCapacity();
    return res === 20;
}

export function test052() {
    let vector = new Vector();
    vector.add(8); vector.add("一"); vector.add("二"); vector.add(5);
    let c = [1, 2, 3, 4];
    vector.add(c); vector.add(6); vector.add("三"); vector.add("四");
    let arr = [];
    for (let item of vector) { arr.push(item); }
    let a = [8, "一", "二", 5, c, 6, "三", "四"];
    for (let i = 0; i < a.length; i++) { if (arr[i] !== a[i]) return false; }
    return true;
}

export function test053() {
    let vector = new Vector();
    vector.add(8); vector.add("一"); vector.add("二"); vector.add(5);
    let c = [1, 2, 3, 4];
    vector.add(c); vector.add(6); vector.add(8); vector.add("三"); vector.add("四");
    let arr = [];
    for (let item of vector) {
        if (item == 8) { vector.remove(8); }
    }
    for (let item of vector) { arr.push(item); }
    let a = ["一", "二", 5, c, 6, "三", "四"];
    for (let i = 0; i < a.length; i++) { if (arr[i] !== a[i]) return false; }
    return true;
}

export function test054() {
    let vector = new Vector();
    vector.add(8); vector.add("一"); vector.add("二"); vector.add(5);
    let c = [1, 2, 3, 4];
    vector.add(c); vector.add(6); vector.add("三"); vector.add("四");
    let arr = [];
    for (let item of vector) {
        if (item == 123) { vector.remove(123); }
        else { arr.push(item); }
    }
    let a = [8, "一", "二", 5, c, 6, "三", "四"];
    for (let i = 0; i < a.length; i++) { if (arr[i] !== a[i]) return false; }
    return true;
}

export function test055() {
    let vector = new Vector();
    let arr = [];
    for (let item of vector) { arr.push(item); }
    return arr.length === 0;
}

export function test056() {
    let vector = new Vector();
    vector.add(4); vector.add(3); vector.add(1); vector.add(2); vector.add(14);
    vector.sort((a, b) => a - b);
    let arr = [];
    vector.forEach((item, index) => { arr.push(item); });
    let a = [1, 2, 3, 4, 14];
    for (let i = 0; i < a.length; i++) { if (arr[i] !== a[i]) return false; }
    return true;
}

export function test069() {
    let vector = new Vector();
    vector.add(8); vector.add("一"); vector.add("二"); vector.add(5);
    let c = [1, 2, 3, 4];
    vector.add(c); vector.add(6); vector.add("三"); vector.add("四");
    let arr = [];
    let itr = vector[Symbol.iterator]();
    let tmp = undefined;
    do { tmp = itr.next().value; arr.push(tmp); } while (tmp != undefined);
    let a = [8, "一", "二", 5, c, 6, "三", "四"];
    for (let i = 0; i < a.length; i++) { if (arr[i] !== a[i]) return false; }
    return true;
}
