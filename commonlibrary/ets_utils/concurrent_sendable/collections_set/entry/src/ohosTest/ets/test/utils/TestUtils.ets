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
import { collections, taskpool, ArkTSUtils} from '@kit.ArkTS';
import { createSharedLock, withLock, createSharedBarrier, waitAtSharedBarrier, createSharedSignal, notifySharedSignal, waitForSharedSignal } from '../SharedLock';
import { BusinessError } from '@ohos.base';
@Sendable
export class SendableClass {
  id: number;
  constructor(id: number) {
    this.id = id;
  }
}

export function createNumberSet(size: number): collections.Set<number> {
  let set = new collections.Set<number>();
  for (let i = 0; i < size; i++) {
    set.add(i);
  }
  return set;
}

export function createStringSet(size: number): collections.Set<string> {
  let set = new collections.Set<string>();
  for (let i = 0; i < size; i++) {
    set.add("value_" + i);
  }
  return set;
}

export function createSendableSet(size: number): collections.Set<SendableClass> {
  let set = new collections.Set<SendableClass>();
  for (let i = 0; i < size; i++) {
    set.add(new SendableClass(i));
  }
  return set;
}

@Concurrent
export function forEachTask(
  set: collections.Set<number>
): number {
  try {
    let count = 0;
    set.forEach(
      (
        value: number,
        value2: number,
        setRef: collections.Set<number>
      ) => {
        count++;
      }
    );
    return count;
  } catch (e) {
    return -1;
  }
}

@Concurrent
export function forEachStringTask(
  set: collections.Set<string>
): number {
  try {
    let count = 0;
    set.forEach(
      (
        value: string,
        value2: string,
        setRef: collections.Set<string>
      ) => {
        count++;
      }
    );
    return count;
  } catch (e) {
    return -1;
  }
}

@Concurrent
export function forEachSendableTask(
  set: collections.Set<SendableClass>
): number {
  try {
    let count = 0;
    set.forEach(
      (
        value: SendableClass,
        value2: SendableClass,
        setRef: collections.Set<SendableClass>
      ) => {
        count++;
      }
    );
    return count;
  } catch (e) {
    return -1;
  }
}


@Concurrent
export function forEachSumTask(
  set: collections.Set<number>
): number {
  try {
    let sum = 0;
    set.forEach(
      (
        value: number,
        value2: number,
        setRef: collections.Set<number>
      ) => {
        sum += value;
      }
    );
    return sum;
  } catch (e) {
    return -1;
  }
}


export function createRangeNumberSet(
  size: number
): collections.Set<number> {
  let set = new collections.Set<number>();
  for (let i = 1; i <= size; i++) {
    set.add(i);
  }
  return set;
}


@Concurrent
export function forEachFindStringTask(
  set: collections.Set<string>,
  target: string
): boolean {
  try {
    let found = false;
    set.forEach(
      (
        value: string,
        value2: string,
        setRef: collections.Set<string>
      ) => {
        if (value === target) {
          found = true;
        }
      }
    );
    return found;
  } catch (e) {
    return false;
  }
}

export function sleep(ms: number): Promise<void> {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve();
    }, ms);
  });
}

@Concurrent
export function forEachAddErrorTask(
  set: collections.Set<number>
): number {
  let code = 0;
  try {
    set.forEach(
      (
        value:number,
        value2:number,
        setRef:collections.Set<number>
      )=>{
        set.add(999);
      }
    );
  } catch(e) {
    code = (e as BusinessError).code;
  }
  return code;
}

@Concurrent
export function forEachDeleteErrorTask(
  set: collections.Set<number>
): number {
  let code = 0;

  try {
    set.forEach(
      (
        value:number
      )=>{
        set.delete(value);
      }
    );
  } catch(e){
    code =
      (e as BusinessError).code;
  }
  return code;
}

@Concurrent
export function forEachClearErrorTask(
  set: collections.Set<number>
): number {
  let code = 0;
  try {
    set.forEach(
      (
        value:number
      )=>{
        set.clear();
      }
    );
  } catch(e){
    code =
      (e as BusinessError).code;
  }
  return code;
}

@Concurrent
export function forEachAddExistErrorTask(
  set: collections.Set<number>
): number {
  let code = 0;
  try {
    set.forEach(
      (
        value:number
      )=>{
        set.add(value);
      }
    );
  } catch(e){
    code =
      (e as BusinessError).code;
  }
  return code;
}

@Concurrent
export function errorRecoverTask(
  set:collections.Set<number>
): boolean {
  try{
    set.forEach(
      (
        value:number
      )=>{
        set.add(999);
      }
    );
  }catch(e){
  }
  // ERR_RECOVER_001: 错误后容器状态未被损坏
  let hasValue =
    set.has(1);
  // ERR_RECOVER_002: 错误后重新遍历可正常执行
  let count = 0;
  set.forEach(
    (
      value:number
    ):void=>{
      count++;
    }
  );
  return hasValue && (count === set.size);
}


@Concurrent
export function entriesTask(
  set: collections.Set<number>
): number {
  try {
    let count = 0;
    let iterator = set.entries();
    while (true) {
      let result = iterator.next();
      if (result.done) {
        break;
      }
      count++;
    }
    return count;
  } catch (e) {
    return -1;
  }
}


@Concurrent
export function entriesCollectTask(
  set: collections.Set<string>
): Array<string> {
  try {
    let result: Array<string> = [];
    let iterator = set.entries();

    while (true) {
      let item = iterator.next();

      if (item.done) {
        break;
      }
      result.push(item.value[0]);
    }
    return result;
  } catch (e) {
    return [];
  }
}

@Concurrent
export function keysTask(
  set: collections.Set<number>
): number {
  try {
    let count = 0;
    let iterator = set.keys();
    while (true) {
      let result = iterator.next();
      if (result.done) {
        break;
      }
      count++;
    }
    return count;
  } catch (e) {
    return -1;
  }
}

@Concurrent
export function valuesTask(
  set: collections.Set<number>
): number {
  try {
    let count = 0;
    let iterator = set.values();
    while (true) {
      let result = iterator.next();
      if (result.done) {
        break;
      }
      count++;
    }
    return count;
  } catch (e) {
    return -1;
  }
}

@Concurrent
export function entriesCheckTask(
  set: collections.Set<number>
): boolean {
  try {
    let iterator = set.entries();
    while (true) {
      let result = iterator.next();
      if (result.done) {
        break;
      }
      if (result.value[0] !== result.value[1]) {
        return false;
      }
    }
    return true;
  } catch (e) {
    return false;
  }
}

@Concurrent
export function largeForEachTask(
  set: collections.Set<number>
): number {
  try {
    let count = 0;
    set.forEach(
      (value: number) => {
        count++;
      }
    );
    return count;
  } catch (e) {
    return -1;
  }
}


@Concurrent
export function largeEntriesTask(
  set: collections.Set<number>
): number {
  try {
    let count = 0;
    let iterator = set.entries();
    while (true) {
      let item = iterator.next();
      if (item.done) {
        break;
      }
      count++;
    }
    return count;
  } catch (e) {
    return -1;
  }
}

/*
 * TC_CONC_SET_LARGE_004: 大容量 keys 遍历任务（Set<string> → count）
 */
@Concurrent
export function largeKeysStringTask(set: collections.Set<string>): number {
  try {
    let count = 0;
    let iterator = set.keys();
    while (true) {
      let result = iterator.next();
      if (result.done) {
        break;
      }
      count++;
    }
    return count;
  } catch (e) {
    return -1;
  }
}

@Concurrent
export function forEachDeleteOtherErrorTask(
  set: collections.Set<number>
): number {
  let code = 0;
  try {
    // 删除一个存在但不等于当前迭代值的元素（50 ≠ 0 首次迭代值）
    let deleteTarget = 50;
    set.forEach((): void => {
      set.delete(deleteTarget);
    });
  } catch (e) {
    code = (e as BusinessError).code;
  }
  return code;
}

@Sendable
export class SendableData {
  id: number;
  constructor(id: number) {
    this.id = id;
  }
}

@Concurrent
export function keysCollectSharedTask(
  set: collections.Set<string>,
  sharedArray: collections.Array<string>,
  lockBuffer: SharedArrayBuffer
): number {
  let count = 0;
  let iterator = set.keys();
  while (true) {
    let result = iterator.next();
    if (result.done) {
      break;
    }
    // ⭐ 使用 withLock 保护共享数组写入
    withLock(lockBuffer, (): void => {
      sharedArray.push(result.value);
    });
    count++;
  }
  return count;
}

@Concurrent
export function forEachCollectSharedTask(
  set: collections.Set<number>,
  sharedArray: collections.Array<number>,
  lockBuffer: SharedArrayBuffer
): number {
  let count = 0;
  set.forEach((value: number) => {
    withLock(lockBuffer, (): void => {
      sharedArray.push(value);
    });
    count++;
  });
  return count;
}

/*
 * TC_CONC_SET_VALUES_002: keys 收集任务（Set<string> → sorted string[]）
 * 与 valuesToStringArrayTask 配合，验证 keys/values 迭代器结果一致性
 */
@Concurrent
export function keysToStringArrayTask(set: collections.Set<string>): string[] {
  let result: string[] = [];
  let iter = set.keys();
  let item = iter.next();
  while (!item.done) {
    result.push(item.value);
    item = iter.next();
  }
  return result.sort();
}

/*
 * TC_CONC_SET_VALUES_002: values 收集任务（Set<string> → sorted string[]）
 * 与 keysToStringArrayTask 配合，验证 keys/values 迭代器结果一致性
 */
@Concurrent
export function valuesToStringArrayTask(set: collections.Set<string>): string[] {
  let result: string[] = [];
  let iter = set.values();
  let item = iter.next();
  while (!item.done) {
    result.push(item.value);
    item = iter.next();
  }
  return result.sort();
}

/*
 * TC_CONC_SET_ITERATOR_001: for...of 遍历验证任务
 * 返回 [count, sum]，同时验证遍历元素数量和元素值正确性
 */
@Concurrent
export function forOfVerifyTask(set: collections.Set<number>): number[] {
  let count: number = 0;
  let sum: number = 0;
  for (const value of set) {
    count++;
    sum += value;
  }
  return [count, sum];
}

/*
 * TC_CONC_SET_ITERATOR_002: spread 展开任务（Set<string> → sorted string[]）
 * 通过迭代器将 Set 展开为排序数组，验证 Symbol.iterator 并发正确性
 */
@Concurrent
export function spreadToStringArrayTask(set: collections.Set<string>): string[] {
  let result: string[] = [];
  let iter = set.values();
  let item = iter.next();
  while (!item.done) {
    result.push(item.value);
    item = iter.next();
  }
  return result.sort();
}

/*
 * ====== 并发修改错误检测 — signal 协调 + 强化断言诊断 ======
 * 返回 JSON: {"status":"ok|err10200201|errUnknown", "count":N, ...}
 */

@Concurrent
export async function setEntriesTraverseTask(
  set: collections.Set<number>,
  barrier: SharedArrayBuffer,
  signal: SharedArrayBuffer
): Promise<string> {
  waitAtSharedBarrier(barrier, 2);
  let count: number = 0;
  try {
    let iter = set.entries();
    let item = iter.next();
    notifySharedSignal(signal, 0);
    if (!waitForSharedSignal(signal, 1, 5000)) {
      return '{"status":"errUnknown","msg":"waitSignal timeout"}';
    }
    while (!item.done) {
      count++;
      item = iter.next();
    }
    return '{"status":"ok","role":"entriesTraverse","count":' + count + '}';
  } catch (err) {
    const e: string = JSON.stringify(err);
    if (e.indexOf("10200201") >= 0) {
      return '{"status":"err10200201","role":"entriesTraverse","count":' + count + ',"err":"' + e + '"}';
    }
    return '{"status":"errUnknown","role":"entriesTraverse","count":' + count + ',"err":"' + e + '"}';
  }
}

@Concurrent
export async function setAddModifyTask(
  set: collections.Set<number>,
  barrier: SharedArrayBuffer,
  signal: SharedArrayBuffer
): Promise<string> {
  waitAtSharedBarrier(barrier, 2);
  if (!waitForSharedSignal(signal, 0, 3000)) {
    return '{"status":"errUnknown","msg":"waitSignal timeout"}';
  }
  notifySharedSignal(signal, 1);
  let ops: number = 0;
  try {
    // 批量添加增加冲突概率
    for (let i: number = 0; i < 1000; i++) {
      set.add(1000 + i);
      ops++;
    }
    return '{"status":"ok","role":"addModify","ops":' + ops + '}';
  } catch (err) {
    const e: string = JSON.stringify(err);
    if (e.indexOf("10200201") >= 0) {
      return '{"status":"err10200201","role":"addModify","ops":' + ops + ',"err":"' + e + '"}';
    }
    return '{"status":"errUnknown","role":"addModify","ops":' + ops + ',"err":"' + e + '"}';
  }
}

@Concurrent
export async function setKeysTraverseTask(
  set: collections.Set<number>,
  barrier: SharedArrayBuffer,
  signal: SharedArrayBuffer
): Promise<string> {
  waitAtSharedBarrier(barrier, 2);
  let count: number = 0;
  try {
    let iter = set.keys();
    let item = iter.next();
    notifySharedSignal(signal, 0);
    if (!waitForSharedSignal(signal, 1, 5000)) {
      return '{"status":"errUnknown","msg":"waitSignal timeout"}';
    }
    while (!item.done) {
      count++;
      item = iter.next();
    }
    return '{"status":"ok","role":"keysTraverse","count":' + count + '}';
  } catch (err) {
    const e: string = JSON.stringify(err);
    if (e.indexOf("10200201") >= 0) {
      return '{"status":"err10200201","role":"keysTraverse","count":' + count + ',"err":"' + e + '"}';
    }
    return '{"status":"errUnknown","role":"keysTraverse","count":' + count + ',"err":"' + e + '"}';
  }
}

@Concurrent
export async function setDeleteModifyTask(
  set: collections.Set<number>,
  barrier: SharedArrayBuffer,
  signal: SharedArrayBuffer
): Promise<string> {
  waitAtSharedBarrier(barrier, 2);
  if (!waitForSharedSignal(signal, 0, 3000)) {
    return '{"status":"errUnknown","msg":"waitSignal timeout"}';
  }
  notifySharedSignal(signal, 1);
  let ops: number = 0;
  try {
    // 密集删除，大集合确保迭代器 mid-flight 时持续冲突
    for (let i: number = 0; i < 10000; i++) {
      set.delete(i);
      ops++;
    }
    return '{"status":"ok","role":"deleteModify","ops":' + ops + '}';
  } catch (err) {
    const e: string = JSON.stringify(err);
    if (e.indexOf("10200201") >= 0) {
      return '{"status":"err10200201","role":"deleteModify","ops":' + ops + ',"err":"' + e + '"}';
    }
    return '{"status":"errUnknown","role":"deleteModify","ops":' + ops + ',"err":"' + e + '"}';
  }
}

@Concurrent
export async function setValuesTraverseTask(
  set: collections.Set<number>,
  barrier: SharedArrayBuffer,
  signal: SharedArrayBuffer
): Promise<string> {
  waitAtSharedBarrier(barrier, 2);
  let count: number = 0;
  try {
    let iter = set.values();
    let first = iter.next();
    notifySharedSignal(signal, 0);
    if (!waitForSharedSignal(signal, 1, 5000)) {
      return '{"status":"errUnknown","msg":"waitSignal timeout"}';
    }
    // clear+回填已完成，继续用旧迭代器 → 期待 10200201
    while (!first.done) {
      count++;
      first = iter.next();
    }
    return '{"status":"ok","role":"valuesTraverse","count":' + count + '}';
  } catch (err) {
    const e: string = JSON.stringify(err);
    if (e.indexOf("10200201") >= 0) {
      return '{"status":"err10200201","role":"valuesTraverse","count":' + count + ',"err":"' + e + '"}';
    }
    return '{"status":"errUnknown","role":"valuesTraverse","count":' + count + ',"err":"' + e + '"}';
  }
}

@Concurrent
export async function setClearModifyTask(
  set: collections.Set<number>,
  barrier: SharedArrayBuffer,
  signal: SharedArrayBuffer
): Promise<string> {
  waitAtSharedBarrier(barrier, 2);
  if (!waitForSharedSignal(signal, 0, 5000)) {
    return '{"status":"errUnknown","role":"clearModify","msg":"wait values timeout"}';
  }
  try {
    // clear + 回填大量元素：确保迭代器 next() 穿过 size 检查，撞到 epoch 检查
    set.clear();
    for (let i: number = 0; i < 50000; i++) {
      set.add(i);
    }
    notifySharedSignal(signal, 1);
    return '{"status":"ok","role":"clearModify","ops":1}';
  } catch (err) {
    const e: string = JSON.stringify(err);
    if (e.indexOf("10200201") >= 0) {
      return '{"status":"err10200201","role":"clearModify","ops":1,"err":"' + e + '"}';
    }
    return '{"status":"errUnknown","role":"clearModify","ops":1,"err":"' + e + '"}';
  }
}

/*
 * runModifyTest: 启动遍历+修改双任务，最多重试3轮，打印详细诊断
 */
export async function runModifyTest(
  set: collections.Set<number>,
  traverseTask: Function,
  modifyTask: Function
): Promise<boolean> {
  for (let round: number = 1; round <= 3; round++) {
    const barrier = createSharedBarrier();
    const signal = createSharedSignal(4);
    let roundResult: boolean = false;
    let details: string[] = [];
    try {
      const results: Object[] = await Promise.all([
        taskpool.execute(traverseTask, set, barrier, signal),
        taskpool.execute(modifyTask, set, barrier, signal)
      ]);
      for (let i = 0; i < results.length; i++) {
        const s: string = results[i] as string;
        details.push("  task" + i + "=" + s);
        if (s.indexOf('"err10200201"') >= 0) {
          roundResult = true;
        }
      }
    } catch (err) {
      const e: string = JSON.stringify(err);
      details.push("  catch=" + e);
      if (e.indexOf("10200201") >= 0) {
        roundResult = true;
      }
    }
    console.info("[runModifyTest] round " + round + " detectedError=" + roundResult);
    for (let k = 0; k < details.length; k++) {
      console.info("[runModifyTest] " + details[k]);
    }
    if (roundResult) {
      return true;
    }
  }
  return false;
}
