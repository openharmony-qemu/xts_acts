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

export function createSharedLock(): SharedArrayBuffer {
  const buffer: SharedArrayBuffer = new SharedArrayBuffer(4);
  const view: Int32Array = new Int32Array(buffer);
  Atomics.store(view, 0, 0); // 0 = 未锁定, 1 = 已锁定
  return buffer;
}


function lockAcquire(lockBuffer: SharedArrayBuffer): void {
  const view: Int32Array = new Int32Array(lockBuffer);
  let attempts: number = 0;
  while (true) {
    // 尝试将 0 交换为 1（CAS 操作）
    const oldValue: number = Atomics.compareExchange(view, 0, 0, 1);
    if (oldValue === 0) {
      // 成功获取锁
      return;
    }
    attempts++;
    // 自旋超时后让出 CPU
    if (attempts > 10000) {
      Atomics.wait(view, 0, 1, 1);
      attempts = 0;
    }
  }
}


function lockRelease(lockBuffer: SharedArrayBuffer): void {
  const view: Int32Array = new Int32Array(lockBuffer);
  Atomics.store(view, 0, 0); // 重置为 0
  Atomics.notify(view, 0, 1); // 唤醒等待的线程
}


export function withLock<T>(lockBuffer: SharedArrayBuffer, fn: () => T): T {
  lockAcquire(lockBuffer);
  try {
    return fn();
  } finally {
    lockRelease(lockBuffer);
  }
}