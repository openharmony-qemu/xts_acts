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

export function createSharedBarrier(): SharedArrayBuffer {
  const buffer: SharedArrayBuffer = new SharedArrayBuffer(8);
  const view: Int32Array = new Int32Array(buffer);
  Atomics.store(view, 0, 0); // 已到达的参与者数量
  Atomics.store(view, 1, 0); // 0 = 未放行, 1 = 已放行
  return buffer;
}

export function createSharedSignal(count: number): SharedArrayBuffer {
  const buffer: SharedArrayBuffer = new SharedArrayBuffer(count * 4);
  const view: Int32Array = new Int32Array(buffer);
  for (let i: number = 0; i < count; i++) {
    Atomics.store(view, i, 0);
  }
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

export function waitAtSharedBarrier(barrierBuffer: SharedArrayBuffer, participantCount: number): void {
  if (participantCount <= 1) {
    return;
  }
  const view: Int32Array = new Int32Array(barrierBuffer);
  const arrived: number = Atomics.add(view, 0, 1) + 1;
  if (arrived >= participantCount) {
    Atomics.store(view, 1, 1);
    Atomics.notify(view, 1, participantCount - 1);
    return;
  }
  while (Atomics.load(view, 1) === 0) {
    Atomics.wait(view, 1, 0, 1);
  }
}

export function notifySharedSignal(signalBuffer: SharedArrayBuffer, index: number): void {
  const view: Int32Array = new Int32Array(signalBuffer);
  Atomics.store(view, index, 1);
  Atomics.notify(view, index, 1);
}

export function waitForSharedSignal(signalBuffer: SharedArrayBuffer, index: number, timeoutMs: number): boolean {
  const view: Int32Array = new Int32Array(signalBuffer);
  let waitedTime: number = 0;
  const waitStepMs: number = 1;
  while (Atomics.load(view, index) === 0) {
    if (waitedTime >= timeoutMs) {
      return false;
    }
    Atomics.wait(view, index, 0, waitStepMs);
    waitedTime += waitStepMs;
  }
  return true;
}

/*
 * 并发修改完成信号 — 用于 Worker/TaskPool 修改 Set 后通知主线程
 * 利用 Atomics.store(seq-cst) + Atomics.notify → Atomics.wait 的 synchronizes-with 关系
 * 确保跨线程的共享内存修改对读取线程可见
 */
export function createCompletionFlag(): SharedArrayBuffer {
  const buffer: SharedArrayBuffer = new SharedArrayBuffer(4);
  const view: Int32Array = new Int32Array(buffer);
  Atomics.store(view, 0, 0); // 0 = 未完成, 1 = 已完成
  return buffer;
}

export function signalComplete(flag: SharedArrayBuffer): void {
  const view: Int32Array = new Int32Array(flag);
  Atomics.store(view, 0, 1);
  Atomics.notify(view, 0, 1);
}

export function waitForComplete(flag: SharedArrayBuffer, timeoutMs: number = 5000): void {
  const view: Int32Array = new Int32Array(flag);
  let waited: number = 0;
  const stepMs: number = 10;
  while (Atomics.load(view, 0) === 0) {
    if (waited >= timeoutMs) {
      throw new Error('waitForComplete timeout after ' + timeoutMs + 'ms');
    }
    Atomics.wait(view, 0, 0, stepMs);
    waited += stepMs;
  }
}
