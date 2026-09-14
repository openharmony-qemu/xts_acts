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

import Stack from '@ohos.util.Stack';

export function test004() {
    let stack = new Stack();
    let a = { name: "lala", age: "13岁" };
    stack.push(a);
    let res = stack.peek();
    return res === a;
}

export function test006() {
    let stack = new Stack();
    let a = [1, 2, 3, 4];
    stack.push(a); stack.push("A"); stack.push("B"); stack.push(1);
    let res = stack.peek();
    return res === 1;
}

export function test007() {
    let stack = new Stack();
    let a = [1, 2, 3, 4];
    stack.push(8); stack.push(a); stack.push("A"); stack.push("B"); stack.push(1);
    let res = stack.locate("A");
    let res1 = stack.locate("C");
    return res === 2 && res1 === -1;
}

export function test009() {
    let stack = new Stack();
    stack.push(8); stack.push("三"); stack.push(5);
    let c = { name: "lili", age: "13" };
    stack.push(c); stack.push(6); stack.push("四");
    let arr = [];
    stack.forEach((item, index) => { arr.push(item); });
    let a = [8, "三", 5, c, 6, "四"];
    for (let i = 0; i < a.length; i++) { if (arr[i] !== a[i]) return false; }
    return true;
}

export function test010() {
    let stack = new Stack();
    stack.push(8); stack.push("一"); stack.push("二"); stack.push(5);
    let c = [1, 2, 3, 4];
    stack.push(c); stack.push(6); stack.push("三"); stack.push("四");
    let arr = [];
    for (let item of stack) { arr.push(item); }
    let a = [8, "一", "二", 5, c, 6, "三", "四"];
    for (let i = 0; i < a.length; i++) { if (arr[i] !== a[i]) return false; }
    return true;
}

export function test021() {
    let stack = new Stack();
    let arr = {};
    stack.push(arr);
    let res = stack.peek();
    return res === arr;
}

export function test032() {
    let stack = new Stack();
    let arr = [];
    stack.forEach((item, index) => { arr.push(item); });
    return arr.length === 0;
}

export function test033() {
    let stack = new Stack();
    let arr = [];
    for (let item of stack) { arr.push(item); }
    return arr.length === 0;
}

export function test035() {
    let stack = new Stack();
    stack.push(8); stack.push("一"); stack.push("二"); stack.push(5);
    let c = [1, 2, 3, 4];
    stack.push(c); stack.push(6); stack.push("三"); stack.push("四");
    let arr = [];
    let itr = stack[Symbol.iterator]();
    let tmp = undefined;
    do { tmp = itr.next().value; arr.push(tmp); } while (tmp != undefined);
    let a = [8, "一", "二", 5, c, 6, "三", "四"];
    for (let i = 0; i < a.length; i++) { if (arr[i] !== a[i]) return false; }
    return true;
}
