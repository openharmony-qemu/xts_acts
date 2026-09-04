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

import Queue from "@ohos.util.Queue";

export function test007() {
    let queue = new Queue();
    queue.add(8); queue.add("一"); queue.add("二"); queue.add(1); queue.add(2);
    queue.add(3); queue.add(4); queue.add(5); queue.add(6);
    let c = ["a", "b", "c", "d"];
    queue.add(c);
    let arr = [];
    queue.forEach((item, index) => { arr.push(item); });
    let a = [8, "一", "二", 1, 2, 3, 4, 5, 6, c];
    for (let i = 0; i < a.length; i++) { if (arr[i] !== a[i]) return false; }
    return true;
}

export function test008() {
    let queue = new Queue();
    queue.add(8); queue.add("一"); queue.add("二"); queue.add(5); queue.add(6);
    queue.add("三"); queue.add("四");
    let arr = [];
    for (let item of queue) { arr.push(item); }
    let a = [8, "一", "二", 5, 6, "三", "四"];
    for (let i = 0; i < a.length; i++) { if (arr[i] !== a[i]) return false; }
    return true;
}

export function test017() {
    let queue = new Queue();
    let arr = [];
    queue.forEach((item, index) => { arr.push(item); });
    return arr.length === 0;
}

export function test018() {
    let queue = new Queue();
    let arr = [];
    for (let item of queue) { arr.push(item); }
    return arr.length === 0;
}

export function test019() {
    let queue = new Queue();
    queue.add(8); queue.add("一"); queue.add("二"); queue.add(5); queue.add(6);
    queue.add("三"); queue.add("四");
    let arr = [];
    let size = queue.length;
    let itr = queue[Symbol.iterator]();
    for (let i = 0; i < size; i++) { arr.push(itr.next().value); }
    let a = [8, "一", "二", 5, 6, "三", "四"];
    for (let i = 0; i < a.length; i++) { if (arr[i] !== a[i]) return false; }
    return true;
}
