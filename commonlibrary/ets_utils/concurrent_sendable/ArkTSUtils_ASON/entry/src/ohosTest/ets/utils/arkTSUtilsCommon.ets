/**
 * Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
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

import { ArkTSUtils } from '@kit.ArkTS';
import { lang, JSON, collections } from '@kit.ArkTS';
import { GetTime, Sleep } from './utils';

export function loadCase(): Promise<void | Object> {
  let p: Promise<void | Object> = new Promise((resolve: Function, reject: Function) => {
    setTimeout(() => {
      resolve(1);
    }, 100);
  });
  return p;
}

@Concurrent
export async function sharedTaskTime(lockName: string): Promise<Array<number>> {
  let res: Array<number> = [];
  let lock = ArkTSUtils.locks.AsyncLock.request(lockName);
  await lock.lockAsync(async () => {
    res.push(GetTime());
    await Sleep(500);
  }, ArkTSUtils.locks.AsyncLockMode.SHARED).then(() => {
    res.push(GetTime());
  })
  return res;
}

@Concurrent
export async function exclusiveTask(lockName: string, str: string): Promise<string> {
  let res = "";
  let lock = ArkTSUtils.locks.AsyncLock.request(lockName);
  await lock.lockAsync(async () => {
    res += str;
    await Sleep(500);
  }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
  return res;
}

@Concurrent
export async function lockExclusiveTask(lock: ArkTSUtils.locks.AsyncLock, str: string): Promise<string> {
  let res = "";
  await lock.lockAsync(async () => {
    res += str;
    await Sleep(500);
  }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
  return res;
}

@Concurrent
export async function sharedTimeTask(lockName: string): Promise<Array<number>> {
  let res: Array<number> = [];
  let lock = ArkTSUtils.locks.AsyncLock.request(lockName);
  await lock.lockAsync(async () => {
    res.push(ArkTSUtils.locks.AsyncLockMode.SHARED);
    res.push(GetTime());
    await Sleep(500);
  }, ArkTSUtils.locks.AsyncLockMode.SHARED);
  return res;
}

@Concurrent
export async function exclusiveTimeTask(lockName: string): Promise<Array<number>> {
  let res: Array<number> = [];
  let lock = ArkTSUtils.locks.AsyncLock.request(lockName);
  await lock.lockAsync(async () => {
    res.push(ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
    res.push(GetTime());
    await Sleep(500);
  }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
  return res;
}

@Concurrent
export async function locksTask(lock: ArkTSUtils.locks.AsyncLock,
  mode: ArkTSUtils.locks.AsyncLockMode): Promise<string> {
  let res = "";
  await lock.lockAsync(async () => {
    res = mode == ArkTSUtils.locks.AsyncLockMode.SHARED ? 'A' : 'B';
    await Sleep(500);
  }, mode);
  return res;
}

@Concurrent
export async function locksTimeTask(lock: ArkTSUtils.locks.AsyncLock,
  mode: ArkTSUtils.locks.AsyncLockMode): Promise<Array<number>> {
  let res: Array<number> = [];
  await lock.lockAsync(async () => {
    res.push(GetTime());
    await Sleep(500);
  }, mode).then(() => {
    res.push(GetTime());
  })
  return res;
}

@Sendable
export function sendableFunction() {
  console.info(`sendableFunction`);
}

export class NumClass {
  a = 1;
  static b = 1;

  GetA() {
    return this.a
  }

  static GetB() {
    return NumClass.b
  }
}

@Sendable
export class SendableClass {
  public count_: number = 0;
  public static count: number = 1;

  static getPromiseCount(): Promise<number> {
    let lock: ArkTSUtils.locks.AsyncLock = ArkTSUtils.locks.AsyncLock.request("lock");
    return lock.lockAsync(() => {
      return SendableClass.count;
    })
  }

  static getCount(): number {
    return SendableClass.count;
  }

  async getCountAsync_(): Promise<number> {
    let lock: ArkTSUtils.locks.AsyncLock = ArkTSUtils.locks.AsyncLock.request("lock");
    return lock.lockAsync(() => {
      return this.count_;
    })
  }

  getCount_(): number {
    return SendableClass.count;
  }

  async setCount(count: number) {
    let lock: ArkTSUtils.locks.AsyncLock = ArkTSUtils.locks.AsyncLock.request("lock");
    await lock.lockAsync(() => {
      this.count_ = count;
    })
  }
}

@Concurrent
export function verifyDoubledNumericKeys(obj: lang.ISendable, keyCount: number): number {
  let record: Record<string, Object> = obj as Record<string, Object>;
  for (let i = 0; i < keyCount; i++) {
    if ((record[`${i}`] as number) !== i * 2) {
      return i;
    }
  }
  return -1;
}

@Concurrent
export function verifyCharKeys(obj: lang.ISendable, keyCount: number): number {
  let record: Record<string, Object> = obj as Record<string, Object>;
  for (let i = 0; i < keyCount; i++) {
    if ((record[`key-${i}`] as string) !== `value-${i}`) {
      return i;
    }
  }
  return -1;
}

@Concurrent
export function verifyAlternatingKeys(obj: lang.ISendable, keyCount: number): number {
  let record: Record<string, Object> = obj as Record<string, Object>;
  let numericCount = Math.ceil(keyCount / 2);
  for (let i = 0; i < numericCount; i++) {
    if ((record[`${i}`] as string) !== `numeric-${i}`) {
      return i;
    }
  }
  let charCount = Math.floor(keyCount / 2);
  for (let i = 0; i < charCount; i++) {
    if ((record[`str-${i}`] as string) !== `char-${i}`) {
      return 10000 + i;
    }
  }
  return -1;
}

@Concurrent
export function verifyNestedNumericKeys(obj: lang.ISendable): number {
  let root: Record<string, Object> = obj as Record<string, Object>;
  for (let i = 0; i < 1025; i++) {
    let child = root[`${i}`];
    if (typeof child !== 'object' || child === null) {
      return 10000 + i;
    }
  }
  let shallow: Record<string, Object> = root['1'] as Record<string, Object>;
  if ((shallow['m1'] as string) !== 'm1-1') {
    return 1;
  }
  let middle: Record<string, Object> = root['0'] as Record<string, Object>;
  for (let i = 0; i < 1025; i++) {
    let child = middle[`${i}`];
    if (typeof child !== 'object' || child === null) {
      return 20000 + i;
    }
  }
  let middleShallow: Record<string, Object> = middle['1'] as Record<string, Object>;
  if ((middleShallow['m2'] as string) !== 'm2-1') {
    return 2;
  }
  let deepest: Record<string, Object> = middle['0'] as Record<string, Object>;
  for (let i = 0; i < 1025; i++) {
    if ((deepest[`char-key-${i}`] as string) !== `leaf-${i}`) {
      return 30000 + i;
    }
  }
  return -1;
}

@Concurrent
export function verifyDictModeValueTypes(obj: lang.ISendable, keyCount: number): number {
  let record: Record<string, Object> = obj as Record<string, Object>;
  for (let i = 0; i < keyCount; i++) {
    let kind = Math.floor(i / 10) % 6;
    let value = record[`${i}`];
    if (kind === 0 && (value as string) !== `v-${i}`) {
      return i;
    }
    if (kind === 1 && (value as number) !== i) {
      return 10000 + i;
    }
    if (kind === 2 && (value as boolean) !== (i % 2 === 0)) {
      return 20000 + i;
    }
    if (kind === 3 && value !== null) {
      return 30000 + i;
    }
    if (kind === 4) {
      let sub: Record<string, Object> = value as Record<string, Object>;
      if ((sub['sub'] as string) !== `sub-${i}`) {
        return 40000 + i;
      }
    }
    if (kind === 5) {
      let arr: collections.Array<number> = value as collections.Array<number>;
      if (arr.at(0) !== i || arr.at(1) !== i + 1) {
        return 50000 + i;
      }
    }
  }
  return -1;
}

@Concurrent
export function parseSendableInTask(text: string): lang.ISendable {
  return JSON.parseSendable(text) as lang.ISendable;
}

@Concurrent
export function modifyNumericKeyInTask(obj: lang.ISendable): number {
  try {
    let record: Record<string, Object> = obj as Record<string, Object>;
    record['0'] = 'modified';
    return 0;
  } catch (err) {
    return -1;
  }
}

@Concurrent
export function enumerateKeysInTask(obj: lang.ISendable, expectedCount: number): number {
  try {
    let record: Record<string, Object> = obj as Record<string, Object>;
    let keys: string[] = Object.keys(record);
    if (keys.length !== expectedCount) {
      return 10000 + keys.length;
    }
    if (!keys.includes('0')) {
      return 20000;
    }
    if (!keys.includes(`${expectedCount - 1}`)) {
      return 30000;
    }
    return 0;
  } catch (err) {
    return -1;
  }
}
