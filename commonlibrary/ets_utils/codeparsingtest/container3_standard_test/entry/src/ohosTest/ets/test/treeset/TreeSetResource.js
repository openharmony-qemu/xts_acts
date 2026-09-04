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
import TreeSet from '@ohos.util.TreeSet';

export function test002() {
    let treeSet = new TreeSet();
    treeSet.add("四");
    return treeSet.has("四") === true;
}

export function test006() {
    let treeSet = new TreeSet();
    let a = { name: "lala", age: "13岁" };
    treeSet.add(a);
    return treeSet.has(a) === true;
}

export function test034() {
    let treeSet = new TreeSet();
    treeSet.add(0); treeSet.add(1); treeSet.add(2); treeSet.add(3); treeSet.add(4);
    let arr1 = [];
    treeSet.forEach((value, key) => { arr1.push(value); });
    let arr = [0, 1, 2, 3, 4];
    for (let i = 0; i < arr1.length; i++) { if (arr[i] !== arr1[i]) return false; }
    return true;
}

export function test036() {
    let treeSet = new TreeSet();
    treeSet.add(0); treeSet.add(1); treeSet.add(2); treeSet.add(3); treeSet.add(4);
    let arr = [];
    for (let item of treeSet) { arr.push(item); }
    let arr1 = [0, 1, 2, 3, 4];
    for (let i = 0; i < arr1.length; i++) { if (arr[i] !== arr1[i]) return false; }
    return true;
}

export function test037() {
    let treeSet = new TreeSet();
    treeSet.add(0); treeSet.add(1); treeSet.add(2); treeSet.add(3); treeSet.add(4);
    let arr = [];
    let res = treeSet[Symbol.iterator]();
    let temp = undefined;
    do { temp = res.next().value; arr.push(temp); } while (temp != undefined);
    let arr1 = [0, 1, 2, 3, 4];
    for (let i = 0; i < arr1.length; i++) { if (arr[i] !== arr1[i]) return false; }
    return true;
}

export function test045() {
    let treeSet = new TreeSet();
    try {
        treeSet.forEach(11);
        return false;
    } catch (err) {
        return err.name === "BusinessError" && err.code === 401 &&
            err.message === `The type of "callbackfn" must be callable. Received value is: 11`;
    }
}
