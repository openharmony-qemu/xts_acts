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
import { createSharedLock, withLock } from '../SharedLock';
import { BusinessError } from '@ohos.base';
@Sendable
export class Counter {
  count: number = 0;
}

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

@Concurrent
export function forEachCollectTask(
  set: collections.Set<number>
): Array<number> {
  try {
    let result: Array<number> = [];
    set.forEach(
      (
        value: number,
        value2: number,
        setRef: collections.Set<number>
      ) => {
        result.push(value);
      }
    );
    return result;
  } catch (e) {
    return [];
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
  let hasValue =
    set.has(1);
  return hasValue;
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

@Concurrent
export function entriesClearErrorTask(set: collections.Set<number>): number {
  let code = 0;
  try {
    set.forEach((_value: number): void => {
      set.clear();
    });
  } catch (e) {
    code = (e as BusinessError).code;
  }
  return code;
}

@Concurrent
export function keysDeleteErrorTask(
  set: collections.Set<number>
): number {
  let code = 0;
  try {
    // ⭐ 改用 forEach 触发错误
    set.forEach((value: number): void => {
      set.delete(value);
    });
  } catch (e) {
    code = (e as BusinessError).code;
  }
  return code;
}

@Concurrent
export function forEachDeleteOtherErrorTask(
  set: collections.Set<number>
): number {
  let code = 0;
  try {
    let deleteTarget = 999;
    set.forEach((): void => {
      set.delete(deleteTarget);
    });
  } catch (e) {
    code = (e as BusinessError).code;
  }
  return code;
}

@Concurrent
export function entriesAddErrorTask(
  set: collections.Set<number>
): number {
  let code = 0;
  try {
    set.forEach((_value: number): void => {
      set.add(999);
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
export function valuesClearErrorTask(
  set: collections.Set<number>
): number {
  let code = 0;
  try {
    set.forEach((_value: number): void => {
      set.clear();
    });
  } catch (e) {
    code = (e as BusinessError).code;
  }
  return code;
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
