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

import Deque from '@ohos.util.Deque';

export function test004() {
    let deque = new Deque();
    let a = { name: "lala", age: "15" };
    deque.insertFront(a);
    let res = deque.getFirst();
    return res === a;
}

export function test008() {
    let deque = new Deque();
    let a = { class: "6班", say: "we" };
    deque.insertEnd(a);
    let res = deque.getLast();
    return res === a;
}

export function test015() {
    let deque = new Deque();
    deque.insertEnd(8);
    deque.insertFront("一");
    deque.insertFront("二");
    deque.insertEnd(1);
    deque.insertEnd(2);
    deque.insertEnd(3);
    deque.insertEnd(4);
    deque.insertEnd(5);
    deque.insertEnd(6);
    deque.insertFront("三");
    deque.insertFront("四");
    let arr = [];
    deque.forEach((item, index) => { arr.push(item); });
    let a = ["四", "三", "二", "一", 8, 1, 2, 3, 4, 5, 6];
    for (let i = 0; i < a.length; i++) { if (arr[i] !== a[i]) return false; }
    return true;
}

export function test016() {
    let deque = new Deque();
    deque.insertEnd(8);
    deque.insertFront("一");
    deque.insertFront("二");
    deque.insertEnd(5);
    deque.insertEnd(6);
    deque.insertFront("三");
    deque.insertFront("四");
    let arr = [];
    for (let item of deque) { arr.push(item); }
    let a = ["四", "三", "二", "一", 8, 5, 6];
    for (let i = 0; i < a.length; i++) { if (arr[i] !== a[i]) return false; }
    return true;
}

export function test032() {
    let deque = new Deque();
    deque.insertEnd(8); deque.insertEnd(1); deque.insertEnd(2); deque.insertEnd(3); deque.insertEnd(3);
    deque.insertEnd(4); deque.insertEnd(5); deque.insertEnd(6);
    deque.popFirst(); deque.popLast();
    deque.insertFront(8); deque.insertEnd(6);
    let arr = [];
    deque.forEach((item, index) => { arr.push(item); });
    let a = [8, 1, 2, 3, 3, 4, 5, 6];
    for (let i = 0; i < a.length; i++) { if (arr[i] !== a[i]) return false; }
    return true;
}

export function test033() {
    let deque = new Deque();
    deque.insertEnd(8); deque.insertFront("一"); deque.insertFront("二");
    deque.insertEnd(5); deque.insertEnd(6); deque.insertFront("三"); deque.insertFront("四");
    deque.popFirst(); deque.popLast();
    deque.insertFront("四"); deque.insertEnd(6);
    let arr = [];
    for (let item of deque) { arr.push(item); }
    let a = ["四", "三", "二", "一", 8, 5, 6];
    for (let i = 0; i < a.length; i++) { if (arr[i] !== a[i]) return false; }
    return true;
}

export function test034() {
    let deque = new Deque();
    deque.insertEnd(8); deque.insertFront("a"); deque.insertFront("b");
    deque.insertEnd(5); deque.insertEnd(6); deque.insertFront("s"); deque.insertFront("z");
    deque.popFirst(); deque.popLast();
    deque.insertFront("g"); deque.insertEnd(6);
    let size = deque.length;
    let arr = [];
    let itr = deque[Symbol.iterator]();
    for (let i = 0; i < size; i++) { arr.push(itr.next().value); }
    let a = ["g", "s", "b", "a", 8, 5, 6];
    for (let i = 0; i < a.length; i++) { if (arr[i] !== a[i]) return false; }
    return true;
}

export function test037() {
    let deque = new Deque();
    try {
        deque.forEach(123);
        return false;
    } catch (err) {
        return err.name === "BusinessError" && err.code === 401 &&
            err.message === `The type of "callbackfn" must be callable. Received value is: 123`;
    }
}
