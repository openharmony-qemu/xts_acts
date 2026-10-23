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
import TreeMap from '@ohos.util.TreeMap';

export function test002() {
    let treeMap = new TreeMap();
    treeMap.set(0, "四");
    return treeMap.get(0) === "四";
}

export function test005() {
    let treeMap = new TreeMap();
    let a = { name: "lala", age: "13" };
    treeMap.set(0, a);
    return treeMap.get(0) === a;
}

export function test010() {
    let treeMap = new TreeMap();
    treeMap.set("a", "四");
    return treeMap.get("a") === "四";
}

export function test036() {
    let treeMap = new TreeMap();
    treeMap.set(0, "a"); treeMap.set(1, "b"); treeMap.set(2, "c"); treeMap.set(3, "d"); treeMap.set(4, "g");
    let arr1 = []; let arr2 = [];
    treeMap.forEach((value, key) => { arr1.push(value); });
    treeMap.forEach((value, key) => { arr2.push(key); });
    let arr = ["a", "b", "c", "d", "g"];
    for (let i = 0; i < arr1.length; i++) { if (arr[i] !== arr1[i]) return false; }
    let arr3 = [0, 1, 2, 3, 4];
    for (let i = 0; i < arr3.length; i++) { if (arr3[i] !== arr2[i]) return false; }
    return true;
}

export function test037() {
    let treeMap = new TreeMap();
    treeMap.set(0, "a"); treeMap.set(1, "b"); treeMap.set(2, "c"); treeMap.set(3, "d"); treeMap.set(4, "g");
    let entries = treeMap.entries();
    let flag = true;
    for (let i = 0, len = treeMap.length; i < len; i++) {
        let entry = entries.next().value;
        let res = treeMap.get(entry[0]);
        if (res != entry[1]) { flag = false; break; }
    }
    return flag;
}

export function test038() {
    let treeMap = new TreeMap();
    treeMap.set(0, "a"); treeMap.set(1, "b"); treeMap.set(2, "c"); treeMap.set(3, "d"); treeMap.set(4, "g");
    let arr = ["0,a", "1,b", "2,c", "3,d", "4,g"];
    let iterArr = [];
    for (let [key, value] of treeMap) { iterArr.push(key + "," + value); }
    for (let i = 0; i < arr.length; i++) { if (arr[i] !== iterArr[i]) return false; }
    return true;
}

export function test039() {
    let treeMap = new TreeMap();
    treeMap.set(0, "a"); treeMap.set(1, "b"); treeMap.set(2, "c"); treeMap.set(3, "d"); treeMap.set(4, "g");
    let iters = treeMap[Symbol.iterator]();
    let flag = true;
    for (let i = 0, len = treeMap.length; i < len; i++) {
        let entry = iters.next().value;
        let res = treeMap.get(entry[0]);
        if (res != entry[1]) { flag = false; break; }
    }
    return flag;
}

export function test041() {
    let treeMap = new TreeMap();
    treeMap.set(0, "a"); treeMap.set(1, "b");
    try {
        treeMap.setAll([1, 2, 3]);
        return false;
    } catch (err) {
        return err.name === "BusinessError" && err.code === 401 &&
            err.message === `The type of "map" must be TreeMap. Received value is: 1,2,3`;
    }
}
