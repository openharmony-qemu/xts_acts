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

import LinkedList from '@ohos.util.LinkedList';

export function testAdd005() {
    let linkedList = new LinkedList();
    let a = { name: "lala", age: "13" };
    linkedList.add(a);
    let res = linkedList.get(0);
    return res === a;
}

export function testAdd057() {
    let linkedList = new LinkedList();
    const obj = {};
    linkedList.add(obj);
    let res = linkedList.get(0);
    return res === obj;
}

export function testClone012() {
    let linkedList = new LinkedList();
    linkedList.add("a"); linkedList.add("b"); linkedList.add("c");
    let linkedList1 = linkedList.clone();
    linkedList1.addFirst("e");
    let res = linkedList1.removeLast();
    if (res !== "c") return false;
    let arr = [];
    linkedList1.forEach((item, index) => { arr.push(item); });
    let a = ["e", "a", "b"];
    for (let i = 0; i < a.length; i++) { if (arr[i] !== a[i]) return false; }
    return true;
}

export function testForEach037() {
    let linkedList = new LinkedList();
    linkedList.add(8); linkedList.add("一"); linkedList.add("二"); linkedList.add(5);
    let c = [1, 2, 3, 4];
    linkedList.add(c); linkedList.add(6); linkedList.add("三"); linkedList.add("四");
    let arr = [];
    linkedList.forEach((item, index) => { arr.push(item); });
    let a = [8, "一", "二", 5, c, 6, "三", "四"];
    for (let i = 0; i < a.length; i++) { if (arr[i] !== a[i]) return false; }
    return true;
}

export function testGet059() {
    let linkedList = new LinkedList();
    try {
        linkedList.get("a");
        return false;
    } catch (err) {
        return err.name === "BusinessError" && err.code === 401 &&
            err.message === `The type of "index" must be small integer. Received value is: a`;
    }
}

export function testInsert028() {
    let linkedList = new LinkedList();
    linkedList.add("a"); linkedList.add("b"); linkedList.add("c"); linkedList.add("a"); linkedList.add("b");
    linkedList.insert(3, "d");
    let arr = [];
    linkedList.forEach((item, index) => { arr.push(item); });
    let a = ["a", "b", "c", "d", "a", "b"];
    for (let i = 0; i < a.length; i++) { if (arr[i] !== a[i]) return false; }
    return true;
}

export function testInsert029() {
    let linkedList = new LinkedList();
    linkedList.add("a"); linkedList.add("b"); linkedList.add("c"); linkedList.add("a"); linkedList.add("b");
    linkedList.insert(0, "d");
    let arr = [];
    linkedList.forEach((item, index) => { arr.push(item); });
    let a = ["d", "a", "b", "c", "a", "b"];
    for (let i = 0; i < a.length; i++) { if (arr[i] !== a[i]) return false; }
    return true;
}

export function testInsert030() {
    let linkedList = new LinkedList();
    linkedList.add("a"); linkedList.add("b"); linkedList.add("c"); linkedList.add("a"); linkedList.add("b");
    linkedList.insert(5, "d");
    let arr = [];
    linkedList.forEach((item, index) => { arr.push(item); });
    let a = ["a", "b", "c", "a", "b", "d"];
    for (let i = 0; i < a.length; i++) { if (arr[i] !== a[i]) return false; }
    return true;
}

export function testInsert058() {
    let linkedList = new LinkedList();
    linkedList.add("a"); linkedList.add("b"); linkedList.add("c");
    try {
        linkedList.insert("a", "d");
        return false;
    } catch (err) {
        return err.name === "BusinessError" && err.code === 401 &&
            err.message === `The type of "index" must be small integer. Received value is: a`;
    }
}

export function testIterator036() {
    let linkedList = new LinkedList();
    linkedList.add(8); linkedList.add("一"); linkedList.add("二"); linkedList.add(5);
    let c = [1, 2, 3, 4];
    linkedList.add(c); linkedList.add(6); linkedList.add("三"); linkedList.add("四");
    let arr = [];
    for (let item of linkedList) { arr.push(item); }
    let a = [8, "一", "二", 5, c, 6, "三", "四"];
    for (let i = 0; i < a.length; i++) { if (arr[i] !== a[i]) return false; }
    return true;
}

export function testIterator058() {
    let linkedList = new LinkedList();
    linkedList.add("a"); linkedList.add("b"); linkedList.add("c"); linkedList.addFirst("e");
    let res = linkedList.removeLast();
    if (res !== "c") return false;
    let arr = [];
    let itr = linkedList[Symbol.iterator]();
    let tmp = undefined;
    do { tmp = itr.next().value; arr.push(tmp); } while (tmp != undefined);
    let a = ["e", "a", "b"];
    for (let i = 0; i < a.length; i++) { if (arr[i] !== a[i]) return false; }
    return true;
}

export function testListGet041() {
    let linkedList = new LinkedList();
    linkedList.add("a"); linkedList.add("b"); linkedList.add("c"); linkedList.add("a"); linkedList.add("b");
    let res = linkedList[1];
    linkedList.forEach((item, index) => { console.log(item); });
    return res === "b";
}

export function testListSet042() {
    let linkedList = new LinkedList();
    linkedList.add("a"); linkedList.add("b"); linkedList.add("c"); linkedList.add("a"); linkedList.add("b");
    linkedList[1] = "f";
    let res = linkedList[1];
    linkedList.forEach((item, index) => { console.log(item); });
    return res === "f";
}

export function testRemove021() {
    let linkedList = new LinkedList();
    linkedList.add("a"); linkedList.add("b"); linkedList.add("c"); linkedList.add("a"); linkedList.add("b");
    linkedList.remove("a");
    let arr = [];
    linkedList.forEach((item, index) => { arr.push(item); });
    let a = ["b", "c", "a", "b"];
    for (let i = 0; i < a.length; i++) { if (arr[i] !== a[i]) return false; }
    return true;
}

export function testRemoveByIndex019() {
    let linkedList = new LinkedList();
    linkedList.add("a"); linkedList.add("b"); linkedList.add("c"); linkedList.add("a"); linkedList.add("b");
    linkedList.removeByIndex(2);
    let arr = [];
    linkedList.forEach((item, index) => { arr.push(item); });
    let a = ["a", "b", "a", "b"];
    for (let i = 0; i < a.length; i++) { if (arr[i] !== a[i]) return false; }
    return true;
}

export function testRemoveByIndex062() {
    let linkedList = new LinkedList();
    linkedList.add("a"); linkedList.add("b"); linkedList.add("c");
    try {
        linkedList.removeByIndex("a");
        return false;
    } catch (err) {
        return err.name === "BusinessError" && err.code === 401 &&
            err.message === `The type of "index" must be small integer. Received value is: a`;
    }
}

export function testRemoveFirst014() {
    let linkedList = new LinkedList();
    linkedList.add("a"); linkedList.add("b"); linkedList.add("c");
    let res = linkedList.removeFirst();
    if (res !== "a") return false;
    let arr = [];
    linkedList.forEach((item, index) => { arr.push(item); });
    let a = ["b", "c"];
    for (let i = 0; i < a.length; i++) { if (arr[i] !== a[i]) return false; }
    return true;
}

export function testRemoveFirstFound024() {
    let linkedList = new LinkedList();
    linkedList.add("a"); linkedList.add("b"); linkedList.add("c"); linkedList.add("a"); linkedList.add("b");
    linkedList.removeFirstFound("b");
    let arr = [];
    linkedList.forEach((item, index) => { arr.push(item); });
    let a = ["a", "c", "a", "b"];
    for (let i = 0; i < a.length; i++) { if (arr[i] !== a[i]) return false; }
    return true;
}

export function testRemoveLast038() {
    let linkedList = new LinkedList();
    linkedList.add("a"); linkedList.add("b"); linkedList.add("c"); linkedList.addFirst("e");
    let res = linkedList.removeLast();
    if (res !== "c") return false;
    let arr = [];
    linkedList.forEach((item, index) => { arr.push(item); });
    let a = ["e", "a", "b"];
    for (let i = 0; i < a.length; i++) { if (arr[i] !== a[i]) return false; }
    return true;
}

export function testRemoveLastFound025() {
    let linkedList = new LinkedList();
    linkedList.add("a"); linkedList.add("b"); linkedList.add("c"); linkedList.add("a"); linkedList.add("b");
    linkedList.removeLastFound("b");
    let arr = [];
    linkedList.forEach((item, index) => { arr.push(item); });
    let a = ["a", "b", "c", "a"];
    for (let i = 0; i < a.length; i++) { if (arr[i] !== a[i]) return false; }
    return true;
}

export function testSet065() {
    let linkedList = new LinkedList();
    linkedList.add("a");
    try {
        linkedList.set("a", "d");
        return false;
    } catch (err) {
        return err.name === "BusinessError" && err.code === 401 &&
            err.message === `The type of "index" must be small integer. Received value is: a`;
    }
}