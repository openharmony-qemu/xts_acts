import { ArkTSUtils, collections } from '@kit.ArkTS';
import { expect } from '@ohos/hypium';

@Concurrent
export async function test_array_001(arr: collections.Array<number>, name: string, index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => { // 如果不添加异步锁，任务会因为数据竞争冲突，导致抛异常失败
    arr.shift();
    arr.push(index)
    arr.pop()
    arr.reverse()
    arr.unshift(index + 1)
    arr.reverse()
    arr.push(index)
  })
}


@Concurrent
export async function Int32array_test_0001(arr: collections.Int32Array, name: string, index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => { // 如果不添加异步锁，任务会因为数据竞争冲突，导致抛异常失败
    const start = index * 2;
    const end = start + 2;
    if (end <= arr.length) {
      arr.fill(index, start, end);
    }
  })
}

@Concurrent
export async function Int32array_test_0002(arr: collections.Int32Array, name: string, index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => { // 如果不添加异步锁，任务会因为数据竞争冲突，导致抛异常失败
    const start = index * 2;
    const end = start + 2;
    if (end <= arr.length) {
      arr.copyWithin(index, start, end);
    }
  })
}

@Concurrent
export async function Int32array_test_0003(arr: collections.Int32Array, name: string, index: number) {
  let filtered: collections.Int32Array = new collections.Int32Array();
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    arr.forEach((value: number, index: number, array: collections.Int32Array) => {
      filtered = array.filter((element: number) => element % 2 == 0);
    });
  })
  return filtered
}

@Concurrent
export async function Int32array_test_0004(arr: collections.Int32Array, name: string, index: number) {
  let joined: string = '1';
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => { // 如果不添加异步锁，任务会因为数据竞争冲突，导致抛异常失败
    const start = index * 2;
    const end = start + 2;
    if (end <= arr.length) {
      arr.copyWithin(index, start, end);
    }
    joined = arr.join('-');
  })
  return joined;
}

@Concurrent
export async function Int32array_test_0005(arr: collections.Int32Array, name: string, index: number) {
  let mapped: collections.Int32Array = collections.Int32Array.from([0, 0, 0]);
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => { // 如果不添加异步锁，任务会因为数据竞争冲突，导致抛异常失败
    const start = index * 2;
    const end = start + 2;
    if (end <= arr.length) {
      arr.copyWithin(index, start, end);
    }
    mapped = arr.map(Math.sqrt);
  })
  return mapped;
}

@Concurrent
export async function Int32array_test_0006(arr: collections.Int32Array, name: string, index: number) {
  let reducedValue: number = 0;
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => { // 如果不添加异步锁，任务会因为数据竞争冲突，导致抛异常失败
    const start = index * 2;
    const end = start + 2;
    if (end <= arr.length) {
      arr.copyWithin(index, start, end);
    }
    reducedValue = arr.reduce((accumulator: number, value: number) => accumulator + value);
  })
  return reducedValue;
}

@Concurrent
export async function Int32array_test_0007(arr: collections.Int32Array, name: string, index: number) {
  let reducedValue: number = 0;
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => { // 如果不添加异步锁，任务会因为数据竞争冲突，导致抛异常失败
    const start = index * 2;
    const end = start + 2;
    if (end <= arr.length) {
      arr.copyWithin(index, start, end);
    }
    reducedValue = arr.reduceRight((accumulator: number, value: number) => accumulator + value);
  })
  return reducedValue;
}

@Concurrent
export async function Int32array_test_0008(arr: collections.Int32Array, name: string, index: number) {
  let reducedValue: number = 0;
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => { // 如果不添加异步锁，任务会因为数据竞争冲突，导致抛异常失败
    const start = index * 2;
    const end = start + 2;
    if (end <= arr.length) {
      arr.copyWithin(index, start, end);
    }
    reducedValue = arr.reduce((accumulator: number, value: number) => accumulator + value, 1);
  })
  return reducedValue;
}

@Concurrent
export async function Int32array_test_0009(arr: collections.Int32Array, name: string, index: number) {
  let reducedValue: number = 0;
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => { // 如果不添加异步锁，任务会因为数据竞争冲突，导致抛异常失败
    reducedValue = arr.reduceRight((accumulator: number, value: number) => accumulator + value, 1);
  })
  return reducedValue;
}

@Concurrent
export async function Int32array_test_0010(arr: collections.Int32Array, name: string, index: number) {
  let reversed: collections.Int32Array = new collections.Int32Array(5);
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {

    reversed = arr.reverse();
  })
  return reversed;
}

@Concurrent
export async function Int32array_test_0011(arr: collections.Int32Array, name: string, index: number) {
  let reversed: void;
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => { // 如果不添加异步锁，任务会因为数据竞争冲突，导致抛异常失败
    const start = index * 2;
    const end = start + 2;
    if (end <= arr.length) {
      arr.copyWithin(index, start, end);
    }
    reversed = arr.set([1, 2, 3], 3);
  })
  return reversed;
}

@Concurrent
export async function Int32array_test_0012(arr: collections.Int32Array, name: string, index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => { // 如果不添加异步锁，任务会因为数据竞争冲突，导致抛异常失败
    const start = index * 2;
    const end = start + 2;
    if (end <= arr.length) {
      arr.copyWithin(index, start, end);
    }
    arr.slice(1, 3);
  })
}

@Concurrent
export async function Int32array_test_0013(arr: collections.Int32Array, name: string, index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => { // 如果不添加异步锁，任务会因为数据竞争冲突，导致抛异常失败
    arr.slice(1, 3);
    arr.subarray(0, 4);
    arr.sort((a: number, b: number) => a - b);
  })
}

@Concurrent
export async function Int32array_test_0014(arr: collections.Int32Array, name: string, index: number) {
  let subArray: collections.Int32Array = new collections.Int32Array(8) ;
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => { // 如果不添加异步锁，任务会因为数据竞争冲突，导致抛异常失败
    subArray = arr.subarray(0, 4);
    console.info('', arr.subarray(0, 4))
  })
  return subArray;
}

@Concurrent
export async function Int32array_test_0015(arr: collections.Int32Array, name: string, index: number) {
  let reversed: void;
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => { // 如果不添加异步锁，任务会因为数据竞争冲突，导致抛异常失败
    const start = index * 2;
    const end = start + 2;
    if (end <= arr.length) {
      arr.copyWithin(index, start, end);
    }
    let iterator: IterableIterator<number> = arr.values();
    for (const value of iterator) {
      console.info('' + value);
      reversed = arr.set([1, 2, 3], value);
    }
  })
  return reversed;
}

@Concurrent
export async function Int32array_test_0016(arr: collections.Int32Array, name: string, index: number) {
  let reversed: void;
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => { // 如果不添加异步锁，任务会因为数据竞争冲突，导致抛异常失败
    const start = index * 2;
    const end = start + 2;
    if (end <= arr.length) {
      arr.copyWithin(index, start, end);
    }
    let iterator: IterableIterator<number> = arr.keys();
    for (const keys of iterator) {
      console.info('' + keys);
      if(keys === 1 || keys === 2){
        reversed = arr.set([1, 2, 3], keys);
      }
    }
  })
  return reversed;
}
@Concurrent
export async function Int32array_test_006(arr: collections.Int32Array, name: string, index: number) {
  let flag:boolean = false;
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => { // 如果不添加异步锁，任务会因为数据竞争冲突，导致抛异常失败
    const start = index * 2;
    const end = start + 2;
    if (end <= arr.length) {
      arr.copyWithin(index, start, end);
    }
    flag= arr.some((element: number) => element > 0);
  })
  return flag;
}

@Concurrent
export async function Int32array_test_007(arr: collections.Int32Array, name: string, index: number) {
  let filtered: collections.Int32Array = new collections.Int32Array(50)
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    const start = index * 2;
    const end = start + 2;
    if (end <= arr.length) {
      arr.copyWithin(index, start, end);
    }
    filtered = arr.filter((element: number) => element % 2 == 0);
  })
  return filtered;
}

@Concurrent
export async function Int32array_test_008(arr: collections.Int32Array, name: string, index: number) {
  let result: number | undefined = 0;
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    const start = index * 2;
    const end = start + 2;
    if (end <= arr.length) {
      arr.copyWithin(index, start, end);
    }
    result = arr.find((element: number) => element > 30);
  })
  return result;
}

@Concurrent
export async function Int32array_test_009(arr: collections.Int32Array, name: string, index: number) {
  let result: number = 0;
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    const start = index * 2;
    const end = start + 2;
    if (end <= arr.length) {
      arr.copyWithin(index, start, end);
    }
    result = arr.findIndex((element: number) => element % 2 === 0);
  })
  return result;
}

@Concurrent
export async function Int32array_test_011(arr: collections.Int32Array, name: string, index: number) {
  let result: number = 0;
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    const start = index * 2;
    const end = start + 2;
    if (end <= arr.length) {
      arr.copyWithin(index, start, end);
    }
    result = arr.indexOf(99);
  })
  return result;
}

@Concurrent
export async function Int32array_test_012(arr: collections.Int32Array, name: string, index: number) {
  let result: number = 0;
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    const start = index * 2;
    const end = start + 2;
    if (end <= arr.length) {
      arr.copyWithin(index, start, end);
    }
    result = arr.lastIndexOf(90);
  })
  return result;
}