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
import HashSet from '@ohos.util.HashSet';

export function test004() {
    let hashSet = new HashSet();
    let c = { name: "lili", age: "13" };
    hashSet.add(c);
    return hashSet.has(c) === true;
}

export function test008() {
    let hashSet = new HashSet();
    hashSet.add(4); hashSet.add(1); hashSet.add(3); hashSet.add(2); hashSet.add(5);
    hashSet.remove(1);
    let arr = [];
    hashSet.forEach((value, index) => { arr.push(value); });
    for (let i = 0; i < arr.length; i++) { if (!hashSet.has(arr[i])) return false; }
    return true;
}

export function test011() {
    let hashSet = new HashSet();
    hashSet.add(1); hashSet.add(2); hashSet.add(3); hashSet.add(4); hashSet.add(5);
    let arr = [];
    hashSet.forEach((value, index) => { arr.push(value); });
    for (let i = 0; i < arr.length; i++) { if (!hashSet.has(arr[i])) return false; }
    return true;
}

export function test012() {
    let hashSet = new HashSet();
    hashSet.add(1); hashSet.add(2); hashSet.add(3); hashSet.add(4); hashSet.add(5);
    let arr = [];
    for (let item of hashSet) { arr.push(item); }
    for (let i = 0; i < arr.length; i++) { if (!hashSet.has(arr[i])) return false; }
    return true;
}

export function test013() {
    let hashSet = new HashSet();
    hashSet.add("A"); hashSet.add("B"); hashSet.add("C"); hashSet.add("D"); hashSet.add("E");
    let arr = [];
    for (let item of hashSet) { arr.push(item); }
    for (let i = 0; i < arr.length; i++) { if (!hashSet.has(arr[i])) return false; }
    return true;
}

export function test019() {
    let hashSet = new HashSet();
    let a = {};
    hashSet.add(a);
    return hashSet.has(a) === true;
}

export function test022() {
    let hashSet = new HashSet();
    let arr = [];
    hashSet.forEach((value, index) => { arr.push(value); });
    return arr.length === 0;
}

export function test026() {
    let hashSet = new HashSet();
    let res = hashSet.clear();
    return res === undefined;
}

export function test028() {
    let hashSet = new HashSet();
    for (let i = 0; i < 100; i++) { hashSet.add(i); }
    let arr = [];
    for (let item of hashSet) { arr.push(Number.parseInt(item)); }
    for (let i = 0; i < 100; i++) { if (!hashSet.has(arr[i])) return false; }
    return true;
}

export function test029() {
    let hashSet = new HashSet();
    for (let i = 0; i < 100; i++) { hashSet.add(i); }
    let arr = [];
    hashSet.forEach((value, index) => { arr.push(value); });
    for (let i = 0; i < 100; i++) { if (!hashSet.has(arr[i])) return false; }
    return true;
}

export function test031() {
    let hashSet = new HashSet();
    hashSet.add(1); hashSet.add(2); hashSet.add(3); hashSet.add(4); hashSet.add(5);
    let res = hashSet[Symbol.iterator]();
    let temp = undefined;
    let arr = [];
    do { temp = res.next().value; arr.push(temp); } while (temp != undefined);
    arr.sort(function (a, b) { return a - b; });
    let arr1 = [1, 2, 3, 4, 5];
    for (let i = 0; i < arr.length; i++) { if (arr[i] !== arr1[i]) return false; }
    return true;
}

export function test036() {
    let hashSet = new HashSet();
    try {
        hashSet.forEach(11);
        return false;
    } catch (err) {
        return err.name === "BusinessError" && err.code === 401 &&
            err.message === `The type of "callbackfn" must be callable. Received value is: 11`;
    }
}
