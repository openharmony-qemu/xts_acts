/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { ArkTSUtils } from '@kit.ArkTS';

export function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: Function) => setTimeout(resolve, ms));
}

@Sendable
export class CreateDefaultLruCache extends ArkTSUtils.SendableLruCache<number, number> {
  constructor() {
    super();
  }
  createDefault(key: number): number {
    return key + 100;
  }
}

@Sendable
export class CreateDefaultUndefinedLruCache extends ArkTSUtils.SendableLruCache<number, number> {
  constructor() {
    super();
  }
  createDefault(key: number): number | undefined {
    return undefined;
  }
}

@Concurrent
export async function concurrentPutWithLock(cache: ArkTSUtils.SendableLruCache<number, number>,
  lock: ArkTSUtils.locks.AsyncLock, initialKey: number) {
  await lock.lockAsync(() => {
    cache.put(initialKey, initialKey + 1)
  })
}

@Concurrent
export async function concurrentGetSideEffect(cache: ArkTSUtils.SendableLruCache<number, number>,
  lock: ArkTSUtils.locks.AsyncLock, key: number) {
  await lock.lockAsync(() => {
    cache.get(key)
  })
}

@Concurrent
export function taskPoolAllApisTest(): boolean {
  try {
    let cache = new ArkTSUtils.SendableLruCache<number, number>(10)
    let putRet = cache.put(1, 11)
    if (putRet !== 11) return false
    cache.put(2, 12)
    cache.put(3, 13)
    let len: number = cache.length
    if (len !== 3) return false
    if (cache.get(1) !== 11) return false
    if (cache.get(99) !== undefined) return false
    if (!cache.contains(1)) return false
    if (cache.contains(99)) return false
    let keys = cache.keys()
    if (keys.length !== 3) return false
    let values = cache.values()
    if (values.length !== 3) return false
    let entryCount = 0
    for (let entry of cache.entries()) {
      entryCount++
    }
    if (entryCount !== 3) return false
    let removed = cache.remove(1)
    if (removed !== 11) return false
    len = cache.length
    if (len !== 2) return false
    cache.updateCapacity(1)
    if (cache.getCapacity() !== 1) return false
    len = cache.length
    if (len !== 1) return false
    if (cache.isEmpty()) return false
    let str = cache.toString()
    if (str.indexOf('SendableLruCache') === -1) return false
    if (cache.getPutCount() !== 3) return false
    if (cache.getMatchCount() < 1) return false
    if (cache.getMissCount() < 1) return false
    if (cache.getRemoveCount() < 1) return false
    if (cache.getCreateCount() !== 0) return false
    cache.clear()
    if (!cache.isEmpty()) return false
    len = cache.length
    if (len !== 0) return false
    return true
  } catch (e) {
    return false
  }
}

@Concurrent
export function taskPoolCreateDefaultTest(cache: ArkTSUtils.SendableLruCache<number, number>): boolean {
  try {
    let result = cache.get(5)
    if (result !== 105) return false
    if (cache.getCreateCount() !== 1) return false
    if (cache.length !== 1) return false
    if (!cache.contains(5)) return false
    return true
  } catch (e) {
    return false
  }
}

@Concurrent
export function concurrentAllOpsTryCatch(cache: ArkTSUtils.SendableLruCache<number, number>, iterations: number): number {
  let errorCount: number = 0;
  for (let i = 0; i < iterations; i++) {
    let key: number = i;
    let value: number = i * 2;
    try {
      cache.put(key, value);
    } catch (err) {
      errorCount++;
    }
    try {
      cache.get(key);
    } catch (err) {
      errorCount++;
    }
    try {
      cache.contains(key);
    } catch (err) {
      errorCount++;
    }
    try {
      cache.remove(key);
    } catch (err) {
      errorCount++;
    }
    try {
      cache.put(key, value);
    } catch (err) {
      errorCount++;
    }
    try {
      cache.isEmpty();
    } catch (err) {
      errorCount++;
    }
    try {
      let len: number = cache.length;
      if (len < 0) {
        errorCount++;
      }
    } catch (err) {
      errorCount++;
    }
    try {
      cache.getCapacity();
    } catch (err) {
      errorCount++;
    }
    try {
      cache.keys();
    } catch (err) {
      errorCount++;
    }
    try {
      cache.values();
    } catch (err) {
      errorCount++;
    }
    try {
      let entryCount: number = 0;
      for (let entry of cache.entries()) {
        entryCount++;
      }
    } catch (err) {
      errorCount++;
    }
    try {
      cache.toString();
    } catch (err) {
      errorCount++;
    }
    try {
      cache.getPutCount();
    } catch (err) {
      errorCount++;
    }
    try {
      cache.getMatchCount();
    } catch (err) {
      errorCount++;
    }
    try {
      cache.getMissCount();
    } catch (err) {
      errorCount++;
    }
    try {
      cache.getRemoveCount();
    } catch (err) {
      errorCount++;
    }
    try {
      cache.getCreateCount();
    } catch (err) {
      errorCount++;
    }
  }
  return errorCount;
}

@Concurrent
export async function concurrentAllOpsWithLock(cache: ArkTSUtils.SendableLruCache<number, number>,
  lock: ArkTSUtils.locks.AsyncLock, iterations: number): Promise<number> {
  let errorCount: number = 0;
  await lock.lockAsync(() => {
    for (let i = 0; i < iterations; i++) {
      let key: number = i;
      let value: number = i * 2;
      cache.put(key, value);
      cache.get(key);
      cache.contains(key);
      cache.remove(key);
      cache.put(key, value);
      cache.isEmpty();
      let len: number = cache.length;
      cache.getCapacity();
      cache.keys();
      cache.values();
      let entryCount: number = 0;
      for (let entry of cache.entries()) {
        entryCount++;
      }
      cache.toString();
      cache.getPutCount();
      cache.getMatchCount();
      cache.getMissCount();
      cache.getRemoveCount();
      cache.getCreateCount();
    }
  });
  return errorCount;
}
