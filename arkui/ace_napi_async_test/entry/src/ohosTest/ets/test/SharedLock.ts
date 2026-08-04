export function createSharedLock(): SharedArrayBuffer {
  const buffer: SharedArrayBuffer = new SharedArrayBuffer(4);
  const view: Int32Array = new Int32Array(buffer);
  Atomics.store(view, 0, 0);
  return buffer;
}

function lockAcquire(lockBuffer: SharedArrayBuffer): void {
  const view: Int32Array = new Int32Array(lockBuffer);
  let attempts: number = 0;
  while (true) {
    const oldValue: number = Atomics.compareExchange(view, 0, 0, 1);
    if (oldValue === 0) {
      return;
    }
    attempts++;
    if (attempts > 10000) {
      Atomics.wait(view, 0, 1, 1);
      attempts = 0;
    }
  }
}

function lockRelease(lockBuffer: SharedArrayBuffer): void {
  const view: Int32Array = new Int32Array(lockBuffer);
  Atomics.store(view, 0, 0);
  Atomics.notify(view, 0, 1);
}

export function withLock<T>(lockBuffer: SharedArrayBuffer, fn: () => T): T {
  lockAcquire(lockBuffer);
  try {
    return fn();
  } finally {
    lockRelease(lockBuffer);
  }
}