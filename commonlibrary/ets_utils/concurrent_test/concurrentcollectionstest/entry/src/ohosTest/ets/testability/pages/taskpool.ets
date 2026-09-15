import { ArkTSUtils, collections } from '@kit.ArkTS';

@Concurrent
export async function test_array_001(arr: collections.Array<number>, name: string, index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
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
export async function test_array_002(arr: collections.Array<number>, name: string, index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    arr.push(index)
    arr.pop()
  })
}

@Concurrent
export async function test_array_003(arr: collections.Array<number>, name: string, index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    arr.push(index)
  })
}

@Concurrent
export async function test_array_004(arr: collections.Array<string>, name: string, index: string) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    arr.push(index)
  })
}

@Concurrent
export async function test_array_005(arr: collections.Array<string>, name: string, index: string) {
  let res = false;
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    res = collections.Array.isArray(arr);
    arr.reverse();
    arr.reverse();
  })
  return res
}

@Concurrent
export async function test_array_006(arr: collections.Array<string>, name: string, index: string) {
  let res = 0;
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    res = arr.lastIndexOf('a');
    let t = arr[0];
    arr.shift();
    arr.unshift(t);
    t = arr[arr.length-1];
    arr.pop();
    arr.push(t);
  })
  return res
}

@Concurrent
export async function test_array_007(arr: collections.Array<number>, name: string, index: number) {
  let res = false;
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    res = arr.some((element: number) => element < 0);
    let temp = arr[1];
    arr.splice(1, 1);
    arr.splice(1, 0, temp);
  })
  return res
}

@Concurrent
export async function test_array_008(arr: collections.Array<number>, name: string, index: number) {
  let res = 0;
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    res = arr.reduceRight((accumulator, value) => accumulator + value);
    let temp = arr.pop();
    arr.push(temp as number);
  })
  return res
}

@Concurrent
export async function test_array_009(arr: collections.Array<number>, name: string, index: number) {
  let res = 0;
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    res = arr.reduceRight<number>((accumulator: number, value: number) => accumulator + value, 0);
    let temp = arr.shift();
    arr.unshift(temp as number);
  })
  return res
}

@Concurrent
export async function test_array_010(arr: collections.Array<number>, name: string, index: number) {
  let res = '';
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    res = arr.join('-');
    arr.reverse();
    arr.reverse();
  })
  return res
}

@Concurrent
export async function test_array_011(arr: collections.Array<number>, name: string, index: number) {
  let res = '';
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    res = arr.toString()
    let t = arr[0];
    arr.shift();
    arr.unshift(t);
    t = arr[arr.length-1];
    arr.pop();
    arr.push(t);
  })
  return res
}

@Concurrent
export async function test_array_012(arr: collections.Array<number>, name: string, index: number) {
  let res = '';
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let slicedArray = arr.slice(1, 3);
    res = slicedArray.toString()
    let temp = arr[1];
    arr.splice(1, 1);
    arr.splice(1, 0, temp);
  })
  return res
}

@Concurrent
export async function test_array_013(arr: collections.Array<number>, name: string, index: number) {
  let str = ''
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    arr.sort((a: number, b: number) => b - a);
    str = arr.toString()
    let temp = arr.pop();
    arr.push(temp as number);
  })
  return str
}

@Concurrent
export async function test_array_014(arr: collections.Array<number>, name: string, index: number) {
  let res = 0
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    res = arr.indexOf(2)
    let temp = arr.shift()
    arr.unshift(temp as number)
  })
  return res
}

@Concurrent
export async function test_array_015(arr: collections.Array<number>, name: string, index: number) {
  let result = 'forEach_completed'
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    arr.forEach((value, index, array) => {
      if (value !== array[index]) {
        result = 'forEach_failed'
      }
    })
    arr.reverse();
    arr.reverse();
  })
  return result
}

@Concurrent
export async function test_array_016(arr: collections.Array<number>, name: string, index: number) {
  let str = ''
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let mappedArray = arr.map((value, index, array) => value * 2);
    str = mappedArray.toString()
    let t = arr[0];
    arr.shift();
    arr.unshift(t);
    t = arr[arr.length-1];
    arr.pop();
    arr.push(t);
  })
  return str
}

@Concurrent
export async function test_array_017(arr: collections.Array<number>, name: string, index: number) {
  let str = ''
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let filteredArray = arr.filter((value: number) => value % 2 === 0);
    str = filteredArray.toString()
    let temp = arr[1];
    arr.splice(1, 1);
    arr.splice(1, 0, temp);
  })
  return str
}

@Concurrent
export async function test_array_018(arr: collections.Array<number>, name: string, index: number) {
  let res = 0
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    res = arr.reduce((accumulator, value) => accumulator + value);
    let temp = arr.pop();
    arr.push(temp as number);
  })
  return res
}

@Concurrent
export async function test_array_019(arr: collections.Array<number>, name: string, index: number) {
  let res = 0
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    res = arr.reduce<number>((accumulator: number, value: number) => accumulator + value, 0);
    let temp = arr.shift();
    arr.unshift(temp as number);
  })
  return res
}

@Concurrent
export async function test_array_020(arr: collections.Array<number>, name: string, index: number) {
  let res = 0;
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    res = arr.at(2) as number;
    arr.reverse();
    arr.reverse();
  })
  return res
}

@Concurrent
export async function test_array_021(arr: collections.Array<number>, name: string, index: number) {
  let str = ''
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let iterator = arr.entries();
    let firstEntry: [number, number] = iterator.next().value;
    str = firstEntry[0] + ',' + firstEntry[1];
    let t = arr[0];
    arr.shift();
    arr.unshift(t);
    t = arr[arr.length-1];
    arr.pop();
    arr.push(t);
  })
  return str
}

@Concurrent
export async function test_array_022(arr: collections.Array<number>, name: string, index: number) {
  let firstKey = 0
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let iterator = arr.keys();
    firstKey = iterator.next().value;
    let temp = arr[1];
    arr.splice(1, 1);
    arr.splice(1, 0, temp);
  })
  return firstKey.toString()
}

@Concurrent
export async function test_array_023(arr: collections.Array<number>, name: string, index: number) {
  let firstValue = 0
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let iterator = arr.values();
    firstValue = iterator.next().value;
    let temp = arr.pop();
    arr.push(temp as number);
  })
  return firstValue.toString()
}

@Concurrent
export async function test_array_024(arr: collections.Array<number>, name: string, index: number) {
  let res = 0;
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    res = arr.find((value: number) => value % 2 === 0) as number;
    let temp = arr.shift();
    arr.unshift(temp as number);
  })
  return res
}

@Concurrent
export async function test_array_025(arr: collections.Array<number>, name: string, index: number) {
  let res = false;
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    res = arr.includes(3);
    arr.reverse();
    arr.reverse();
  })
  return res
}

@Concurrent
export async function test_array_026(arr: collections.Array<number>, name: string, index: number) {
  let res = 0
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    res = arr.findIndex((value: number) => value % 2 === 0);
    let t = arr[0];
    arr.shift();
    arr.unshift(t);
    t = arr[arr.length-1];
    arr.pop();
    arr.push(t);
  })
  return res
}

@Concurrent
export async function test_array_027(arr: collections.Array<number>, name: string, index: number) {
  let str = ''
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let res = arr.fill(0, 1, 3);
    str = res.toString()
    arr.reverse();
    arr.reverse();
  })
  return str
}

@Concurrent
export async function test_array_028(arr: collections.Array<number>, name: string, index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    arr.shrinkTo(1);
    let t = arr[0];
    arr.shift();
    arr.unshift(t);
    t = arr[arr.length-1];
    arr.pop();
    arr.push(t);
  })
  let str = arr.toString()
  return str
}

@Concurrent
export async function test_array_029(arr: collections.Array<number>, name: string, index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    arr.extendTo(6, 10);
    let temp = arr.pop();
    arr.push(temp as number);
  })
  let str = arr.toString()
  return str
}

@Concurrent
export async function test_array_030(arr: collections.Array<number>, name: string, index: number) {
  let str = ''
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let array1 = new collections.Array<number>(5, 6);
    let array2 = new collections.Array<number>(7, 8);
    let res = arr.concat(array1, array2);
    str = res.toString()
    let temp = arr.shift();
    arr.unshift(temp as number);
  })
  return str
}

@Concurrent
export async function test_array_031(arr: collections.Array<number>, name: string, index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    arr.splice(arr.length - 1);
    arr.reverse();
    arr.reverse();
  })
}

@Concurrent
export async function test_array_032(arr: collections.Array<number>, name: string, index: number) {
  let res = false;
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    res = arr.every((element: number) => element > 0);
    let t = arr[0];
    arr.shift();
    arr.unshift(t);
    t = arr[arr.length-1];
    arr.pop();
    arr.push(t);
  })
  return res
}

@Concurrent
export async function test_array_033(arr: collections.Array<number>, name: string, index: number) {
  let res = ''
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    res = arr.toLocaleString();
    let temp = arr[1];
    arr.splice(1, 1);
    arr.splice(1, 0, temp);
  })
  return res
}

@Concurrent
export async function test_array_034(arr: collections.Array<number>, name: string, index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    arr.splice(2, 2);
    let temp = arr.pop();
    arr.push(temp as number);
  })
}

@Concurrent
export async function test_array_035(arr: collections.Array<number>, name: string, index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    arr.splice(2, 2, 6, 7, 8);
    let temp = arr.shift();
    arr.unshift(temp as number);
  })
}

@Concurrent
export async function test_array_036(arr: collections.Array<number>, name: string, index: number) {
  let res = 0
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    res = arr[1];
    arr.reverse();
    arr.reverse();
  })
  return res
}

@Concurrent
export async function test_array_037(arr: collections.ConcatArray<number>, name: string, index: number) {
  let res = 0
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    res = arr[1];
  })
  return res
}

@Concurrent
export async function test_array_038(arr: collections.ConcatArray<number>, name: string, index: string) {
  let res = ''
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    res = arr.join('-');
  })
  return res
}

@Concurrent
export async function test_array_039(arr: collections.ConcatArray<number>, name: string, index: number) {
  let str = ''
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let slicedArray = arr.slice(1, 3);
    str = slicedArray.toString()
  })
  return str
}

@Concurrent
export async function test_array_040(arr: collections.ArrayBuffer, name: string, index: number) {
  let res = 0
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let slicedBuffer: collections.ArrayBuffer = arr.slice(0, 4);
    res = slicedBuffer.byteLength
  })
  return res
}

@Concurrent
export async function test_map_001(map: collections.Map<number, string>, name: string, index: number) {
  let str = ''
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let iterator = map.entries();
    let firstEntry: [number, string] = iterator.next().value;
    str = firstEntry[0] + ',' + firstEntry[1];
    map.set(-1, '999');
    map.delete(-1);
  })
  return str
}

@Concurrent
export async function test_map_002(map: collections.Map<number, string>, name: string, index: number) {
  let res = 0
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let iterator = map.keys();
    res = iterator.next().value;
    let tempValue = map.get(3);
    map.delete(3);
    map.set(3, tempValue as string);
  })
  return res
}

@Concurrent
export async function test_map_003(map: collections.Map<number, string>, name: string, index: number) {
  let str = ''
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let iterator = map.values();
    str = iterator.next().value;
    let originalValue = map.get(1);
    map.set(1, originalValue as string);
    map.set(1, originalValue as string);
  })
  return str
}

@Concurrent
export async function test_map_004(map: collections.Map<number, string>, name: string, index: number) {
  let str = ''
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    str = map.get(2) as string;
  })
  return str
}

@Concurrent
export async function test_map_005(map: collections.Map<number, string>, name: string, index: number) {
  let res = false
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    res = map.has(1);
    map.set(index, 'now');
  })
  return res
}

@Concurrent
export async function test_map_006(map: collections.Map<string, number>, name: string, index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    map.set(`key${index}`, index);
    map.set('temp', 999);
    map.delete('temp');
  })
}

@Concurrent
export async function test_map_007(map: collections.Map<number, number>, name: string, index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    map.delete(10 + index);
    let tempValue = map.get(1);
    map.delete(1);
    map.set(1, tempValue as number);
  })
}

@Concurrent
export async function test_map_008(map: collections.Map<number, string>, name: string, index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    map.clear();
  })
}

@Concurrent
export async function test_map_009(map: collections.Map<string, number>, name: string, index: number) {
  let result = 'forEach_completed'
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    map.forEach((value, key, map) => {
      if (value !== map.get(key)) {
        result = 'forEach_failed'
      }
    })
    let originalValue = map.get('a');
    map.set('a', originalValue as number);
    map.set('a', originalValue as number);
  })
  return result
}

@Concurrent
export async function test_map_010(map: collections.Map<number, number>, name: string, index: number) {
  let res = 0
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    res = map.size;
    map.set(-1, 999);
    map.delete(-1);
  })
  return res
}

@Concurrent
export async function test_set_001(set: collections.Set<number>, name: string, index: number) {
  let str = ''
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let iterator = set.entries();
    let firstEntry: [number, number] = iterator.next().value;
    str = firstEntry[0] + ',' + firstEntry[1];
    set.add(111)
    set.delete(111)
  })
  return str
}

@Concurrent
export async function test_set_002(set: collections.Set<number>, name: string, index: number) {
  let res = 0
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let iterator = set.keys();
    res = iterator.next().value;
    set.add(222)
    set.delete(222)
  })
  return res
}

@Concurrent
export async function test_set_003(set: collections.Set<number>, name: string, index: number) {
  let res = 0
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let iterator = set.values();
    res = iterator.next().value;
    set.add(333)
    set.delete(333)
  })
  return res
}

@Concurrent
export async function test_set_004(set: collections.Set<number>, name: string, index: number) {
  let res = false
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    res = set.has(1);
    set.add(444)
    set.delete(444)
  })
  return res
}

@Concurrent
export async function test_set_005(set: collections.Set<string>, name: string, index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    set.add(`item${index}`);
    set.add('9')
    set.delete('9')
  })
}

@Concurrent
export async function test_set_006(set: collections.Set<number>, name: string, index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    set.delete(10 + index);
    set.add(999)
    set.delete(999)
  })
}

@Concurrent
export async function test_set_007(set: collections.Set<number>, name: string, index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    set.clear();
    set.add(999)
    set.delete(999)
  })
}

@Concurrent
export async function test_set_008(set: collections.Set<string>, name: string, index: number) {
  let result = 'forEach_completed'
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    set.forEach((value, value2, set) => {
      if (value !== value2) {
        result = 'forEach_failed'
      }
    })
    set.add('' + index)
  })
  return result
}

@Concurrent
export async function test_set_009(set: collections.Set<number>, name: string, index: number) {
  let res = 0
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    res = set.size;
    set.add(999)
    set.delete(999)
  })
  return res
}

@Concurrent
export async function test_asynclock_001(name: string, index: number) {
  let lock = new ArkTSUtils.locks.AsyncLock();
  let result = 0;
  await lock.lockAsync(() => {
    result = 1;
  });
  return result;
}

@Concurrent
export async function test_asynclock_002(name: string, index: number) {
  let lock = ArkTSUtils.locks.AsyncLock.request(`test_lock_${index}`);
  let result = '';
  await lock.lockAsync(() => {
    result = 'request_success';
  });
  return result;
}

@Concurrent
export async function test_asynclock_003(name: string, index: number) {
  let lockName = `query_test_lock_${index}`;
  let lock = ArkTSUtils.locks.AsyncLock.request(lockName);
  await lock.lockAsync(() => {
  });
  let state = ArkTSUtils.locks.AsyncLock.query(lockName);
  return state !== null;
}

@Concurrent
export async function test_asynclock_004(name: string, index: number) {
  let lock = ArkTSUtils.locks.AsyncLock.request(`queryall_test_lock_${index}`);
  await lock.lockAsync(() => {
  });
  let states = ArkTSUtils.locks.AsyncLock.queryAll();
  return states.length > 0;
}

@Concurrent
export async function test_asynclock_005(name: string, index: number) {
  let lock = ArkTSUtils.locks.AsyncLock.request(name);
  let result = 0;
  await lock.lockAsync(() => {
    result = 100;
  });
  return result;
}

@Concurrent
export async function test_asynclock_006(name: string, index: number) {
  let lock = ArkTSUtils.locks.AsyncLock.request(name);
  let result = '';
  await lock.lockAsync(() => {
    result = 'exclusive_mode_success';
  }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE);
  return result;
}

@Concurrent
export async function test_asynclock_007(name: string, index: number) {
  let lock = ArkTSUtils.locks.AsyncLock.request(name);
  let options = new ArkTSUtils.locks.AsyncLockOptions<string>();
  options.timeout = 1000;
  let result = '';
  try {
    await lock.lockAsync(() => {
      result = 'timeout_success';
    }, ArkTSUtils.locks.AsyncLockMode.EXCLUSIVE, options);
  } catch (e) {
    result = 'timeout_error';
  }
  return result;
}

@Concurrent
export async function test_asynclock_008(name: string, index: number) {
  let lock = ArkTSUtils.locks.AsyncLock.request(name);
  let sharedCounter = 0;
  await lock.lockAsync(() => {
    sharedCounter = 100;
  });
  return sharedCounter;
}

@Concurrent
export async function test_asynclock_009(name: string, index: number) {
  let lock = ArkTSUtils.locks.AsyncLock.request(name);
  let result = '';
  try {
    await lock.lockAsync(() => {
      if (1) {
        throw new Error('模拟错误');
      }
      result = 'success';
    });
  } catch (e) {
    result = 'error_handled';
  }
  return result;
}

@Concurrent
export async function test_cond_001(name: string, index: number) {
  let conditionVariable = new ArkTSUtils.locks.ConditionVariable();
  return 'constructor_success';
}

@Concurrent
export async function test_cond_002(name: string, index: number) {
  let conditionVariable = ArkTSUtils.locks.ConditionVariable.request(`test_cond_${index}`);
  return 'request_success';
}

@Concurrent
export async function test_cond_003(name: string, index: number) {
  let conditionVariable = ArkTSUtils.locks.ConditionVariable.request(name);
  let waitPromise = conditionVariable.wait();
  conditionVariable.notifyAll();
  await waitPromise;
  return 'wait_success';
}

@Concurrent
export async function test_cond_004(name: string, index: number) {
  let conditionVariable = ArkTSUtils.locks.ConditionVariable.request(name);
  let waitPromise = conditionVariable.waitFor(100);
  await waitPromise;
  return 'waitFor_success';
}

@Concurrent
export async function test_cond_005(name: string, index: number) {
  let conditionVariable = ArkTSUtils.locks.ConditionVariable.request(name);
  let waitPromise = conditionVariable.wait();
  conditionVariable.notifyAll();
  await waitPromise;
  return 'notifyAll_success';
}

@Concurrent
export async function test_cond_006(name: string, index: number) {
  let conditionVariable = ArkTSUtils.locks.ConditionVariable.request(name);
  let waitPromise = conditionVariable.wait();
  conditionVariable.notifyOne();
  await waitPromise;
  return 'notifyOne_success';
}

@Concurrent
export async function test_cond_007(name: string, index: number) {
  let conditionVariable = ArkTSUtils.locks.ConditionVariable.request(name);
  let waitPromise = conditionVariable.wait();
  conditionVariable.notifyAll();
  await waitPromise;
  return 'wait_notifyAll_success';
}

@Concurrent
export async function test_cond_008(name: string, index: number) {
  let conditionVariable = ArkTSUtils.locks.ConditionVariable.request(name);
  let waitPromise = conditionVariable.waitFor(50);
  await waitPromise;
  return 'timeout_success';
}

@Concurrent
export async function test_bitvector_001(bitVector: collections.BitVector, name: string, index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    bitVector.push(index % 2);
  })
}

@Concurrent
export async function test_bitvector_002(bitVector: collections.BitVector, name: string, index: number) {
  let res = 0
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    if (bitVector.length > 0) {
      res = bitVector.pop();
    }
  })
  return res
}

@Concurrent
export async function test_bitvector_003(bitVector: collections.BitVector, name: string, index: number) {
  let res = false
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    if (bitVector.length >= 3) {
      res = bitVector.has(1, 0, 2);
    }
  })
  return res
}

@Concurrent
export async function test_bitvector_004(bitVector: collections.BitVector, name: string, index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    if (bitVector.length >= 4) {
      bitVector.setBitsByRange(index % 2, 1, 3);
    }
  })
}

@Concurrent
export async function test_bitvector_005(bitVector: collections.BitVector, name: string, index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    bitVector.setAllBits(index % 2);
  })
}

@Concurrent
export async function test_bitvector_006(bitVector: collections.BitVector, name: string, index: number) {
  let res = 0
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let subBitVector = bitVector.getBitsByRange(1, 3);
    res = subBitVector.length;
  })
  return res
}

@Concurrent
export async function test_bitvector_007(bitVector: collections.BitVector, name: string, index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    if (index === 0) {
      bitVector.resize(8);
