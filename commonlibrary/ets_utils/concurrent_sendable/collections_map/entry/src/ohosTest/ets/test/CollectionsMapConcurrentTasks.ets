import { collections } from '@kit.ArkTS';
import { taskpool } from '@kit.ArkTS';
import { ArkTSUtils } from '@kit.ArkTS';

@Concurrent
export function concurrentForEachCount(map: collections.Map<string, number>): number {
  try {
    let count: number = 0;
    map.forEach((_value: number, _key: string) => {
      count++;
    });
    return count;
  } catch (_e) {
    return -1;
  }
}

@Concurrent
export function concurrentModifyDuringForEach(map: collections.Map<string, number>): number {
  try {
    map.forEach((value: number, key: string) => {
      if (value === 50) {
        map.delete(key);
      }
    });
    return 0;
  } catch (e) {
    let err: Record<string, number> = e as Record<string, number>;
    return err['code'] ?? -1;
  }
}

@Concurrent
export function concurrentIterateEntries(map: collections.Map<string, number>): number {
  try {
    let count: number = 0;
    let iter: Iterator<[string, number]> = map.entries();
    let result: IteratorResult<[string, number]> = iter.next();
    while (!result.done) {
      count++;
      result = iter.next();
    }
    return count;
  } catch (_e) {
    return -1;
  }
}

@Concurrent
export function concurrentIterateKeys(map: collections.Map<string, number>): number {
  try {
    let count: number = 0;
    let iter: Iterator<string> = map.keys();
    let result: IteratorResult<string> = iter.next();
    while (!result.done) {
      count++;
      result = iter.next();
    }
    return count;
  } catch (_e) {
    return -1;
  }
}

@Concurrent
export function concurrentIterateValues(map: collections.Map<string, number>): number {
  try {
    let count: number = 0;
    let iter: Iterator<number> = map.values();
    let result: IteratorResult<number> = iter.next();
    while (!result.done) {
      count++;
      result = iter.next();
    }
    return count;
  } catch (_e) {
    return -1;
  }
}

@Concurrent
export function concurrentLongForEach(map: collections.Map<string, number>): number {
  try {
    let count: number = 0;
    map.forEach((_value: number, _key: string) => {
      count++;
    });
    return count;
  } catch (_e) {
    return -1;
  }
}

@Sendable
export class Person {
  name: string = '';
  age: number = 0;
}

@Concurrent
export function accessSendableElement(map: collections.Map<string, Person>): string {
  try {
    let person: Person | undefined = map.get('p1');
    return person?.name ?? '';
  } catch (_e) {
    return '';
  }
}

@Concurrent
export async function safeSetWithLock(
  map: collections.Map<string, number>,
  lock: ArkTSUtils.locks.AsyncLock
): Promise<number> {
  try {
    await lock.lockAsync(() => {
      map.set('locked_key', 999);
    });
    return map.get('locked_key') ?? -1;
  } catch (_e) {
    return -1;
  }
}

@Concurrent
export function receiveMapParam(map: collections.Map<string, number>): number {
  try {
    return map.size;
  } catch (_e) {
    return -1;
  }
}

@Concurrent
export function returnMap(): collections.Map<string, number> {
  try {
    let result: collections.Map<string, number> = new collections.Map<string, number>();
    result.set('result', 100);
    return result;
  } catch (_e) {
    return new collections.Map<string, number>();
  }
}

@Concurrent
export function forEachWithProgress(map: collections.Map<string, number>): number {
  try {
    let count: number = 0;
    map.forEach((_value: number, _key: string) => {
      count++;
      if (count % 25 === 0) {
        taskpool.Task.sendData(count);
      }
    });
    return count;
  } catch (_e) {
    return -1;
  }
}

@Sendable
export class TaskCounter {
  count: number = 0;
}

@Concurrent
export function longRunningLoopWithCounter(
  map: collections.Map<string, number>,
  counter: TaskCounter
): number {
  try {
    for (let i: number = 0; i < 10000000; i++) {
      counter.count++;
      if (counter.count % 100000 === 0) {
        map.set('progress', counter.count);
      }
    }
    return counter.count;
  } catch (_e) {
    return -1;
  }
}

@Concurrent
export function stressIterate(map: collections.Map<string, number>): number {
  try {
    let total: number = 0;
    for (let i: number = 0; i < 10000; i++) {
      map.forEach((_value: number, _key: string) => {
        total++;
      });
    }
    return total;
  } catch (_e) {
    return -1;
  }
}

@Concurrent
export function largeMapHandler(map: collections.Map<string, number>): number {
  try {
    return map.size;
  } catch (_e) {
    return -1;
  }
}
