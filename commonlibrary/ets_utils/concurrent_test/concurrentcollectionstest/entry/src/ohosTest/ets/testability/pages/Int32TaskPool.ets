import { ArkTSUtils, collections } from "@kit.ArkTS";
import { expect } from "@ohos/hypium";

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
export async function test_int32array_constructor_with_length(
  length: number,
  name: string,
  index: number
) {
  try {
    console.info(`[${name}] Task ${index}: Creating Int32Array with length = ${length}`);

    let int32Array: collections.Int32Array = new collections.Int32Array(length);

    console.info(`[${name}] Task ${index}: Int32Array created successfully`);

    if (int32Array == null) {
      const errorMsg = `[${name}] Task ${index}: Int32Array is null or undefined after construction with length=${length}`;
      console.error(errorMsg);
      throw new Error(errorMsg);
    }

  } catch (e) {
    console.error(`[${name}] Task ${index}: Failed to create Int32Array. Error: ${e instanceof Error ? e.message : String(e)}`);
  }
}

@Concurrent
export async function test_int32array_constructor_with_array_buffer(
  length: number,
  name: string,
  index: number
) {
  try {
    console.info(`[${name}] Task ${index}: Creating ArrayBuffer with byteLength = ${length}`);

    let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(length);

    console.info(`[${name}] Task ${index}: ArrayBuffer created successfully`);

    if (arrayBuffer == null) {
      const errorMsg = `[${name}] Task ${index}: ArrayBuffer is null after creation with length=${length}`;
      console.error(errorMsg);
      throw new Error(errorMsg);
    }

  } catch (e) {
    console.error(`[${name}] Task ${index}: Failed to create ArrayBuffer. Error: ${e instanceof Error ? e.message : String(e)}`);
  }
}

@Concurrent
export async function test_int32array_constructor_with_iterable(
  elements: Iterable<number>
) {
  try {
    let int32Array: collections.Int32Array = new collections.Int32Array(elements);

    if (int32Array == null) {
      const errorMsg = `Int32Array is null after constructing from iterable`;
      console.error(errorMsg);
      throw new Error(errorMsg);
    }

  } catch (e) {
    console.error(`Failed to create Int32Array from iterable. Error: ${e instanceof Error ? e.message : String(e)}`);
  }
}

@Concurrent
export async function test_int32array_constructor_with_buffer(
  length?: number,
  name: string = "test_int32array_constructor_with_buffer",
  index: number = 0
) {
  try {
    let buffer: collections.ArrayBuffer = new collections.ArrayBuffer(100);
    let int32Array: collections.Int32Array = new collections.Int32Array(buffer, 0, 10);

    if (int32Array == null) {
      const errorMsg = `Int32Array is null after construction`;
      console.error(`[${name}] Task ${index}: ${errorMsg}`);
      throw new Error(errorMsg);
    }

    if (length !== undefined && int32Array.length !== length) {
      const errorMsg = `Int32Array length mismatch. Expected: ${length}, got: ${int32Array.length}`;
      console.error(`[${name}] Task ${index}: ${errorMsg}`);
      throw new Error(errorMsg);
    }

  } catch (e) {
    console.error(`[${name}] Task ${index}: Failed to create Int32Array from buffer. Error: ${e instanceof Error ? e.message : String(e)}`);
  }
}

@Concurrent
export async function test_int32array_static_from_array_like(
  arrayLike: ArrayLike<number>,
  name: string = "test_int32array_static_from_array_like",
  index: number = 0
) {
  try {
    console.info(`[${name}] Task ${index}: Creating Int32Array from arrayLike: [${Array.from(arrayLike).join(', ')}]`);
    let int32Array: collections.Int32Array = collections.Int32Array.from(arrayLike);
    console.info(`[${name}] Task ${index}: Int32Array created successfully, length = ${int32Array.length}`);

  } catch (e) {
    console.error(`[${name}] Task ${index}: Failed to create Int32Array from arrayLike. Error: ${e}`);
  }
}

@Concurrent
export async function test_int32array_from_fixed_001(name: string, index: number) {
  try {
    console.info(`${name} task ${index} start`);

    let int32Array: collections.Int32Array;
    let expectedResult: number[];

    if (index % 3 === 0) {
      let mapFn = (v: object, k: number) => k;
      let arrayLike = [];
      int32Array = collections.Int32Array.from(arrayLike, mapFn);
      expectedResult = [0, 1, 2, 3, 4];
      console.info(`${name} task ${index} - from(object, mapFn)`);

    } else if (index % 3 === 1) {
      let arrayLike: string[] = ["1", "3", "5"];
      let mapFn = (v: string, k: number) => parseInt(v, 10);
      int32Array = collections.Int32Array.from(arrayLike, mapFn);
      expectedResult = [1, 3, 5];
      console.info(`${name} task ${index} - from(string[], mapFn)`);

    } else if (index % 3 === 2) {
      let arrayLike: string = "12345";
      let mapFn = (v: string, k: number) => parseInt(v, 10);
      int32Array = collections.Int32Array.from(arrayLike, mapFn);
      expectedResult = [1, 2, 3, 4, 5];
      console.info(`${name} task ${index} - from(string, mapFn)`);

    } else {
      throw new Error(`Unexpected index modulo: ${index % 3}`);
    }

    let actualArray: number[] = Array.from(int32Array);
    for (let i = 0; i < expectedResult.length; i++) {
      if (actualArray[i] !== expectedResult[i]) {
        throw new Error(`Mismatch at index ${i}: expected ${expectedResult[i]}, got ${actualArray[i]}`);
      }
    }

    console.info(`${name} task ${index} - from() successful, result: [${actualArray}]`);

  } catch (e) {
    console.info(`${name} task ${index} error: ${e.message}`);
  }
}

@Concurrent
export async function test_int32array_static_from_iterable(
  arrayLike: Iterable<number>,
  name: string = "test_int32array_static_from_iterable",
  index: number = 0
) {
  try {
    console.info(`[${name}] Task ${index}: Creating Int32Array from iterable`);

    let int32Array: collections.Int32Array = collections.Int32Array.from(arrayLike);
    console.info(`[${name}] Task ${index}: Int32Array created successfully, length = ${int32Array.length}`);
    const inputArray = Array.from(arrayLike);
    const expectedLength = inputArray.length;

  } catch (e) {
    console.error(`[${name}] Task ${index}: Failed to create Int32Array from iterable. Error: ${e}`);
    expect().assertFail();
  }
}

@Concurrent
export async function test_int32array_static_of_numbers(
  numbers: number[],
  name: string = "test_int32array_static_of_numbers",
  index: number = 0
) {
  try {
    console.info(`[${name}] Task ${index}: Creating Int32Array from numbers: [${numbers.join(', ')}]`);

    let int32Array: collections.Int32Array = collections.Int32Array.of(...numbers);

    console.info(`[${name}] Task ${index}: Int32Array created successfully, length = ${int32Array.length}`);

  } catch (e) {
    console.error(`[${name}] Task ${index}: Failed to create Int32Array from numbers. Error: ${e}`);
    throw new Error(`Int32Array.of failed: ${e}`);
  }
}

@Concurrent
export async function test_int32array_toString(
  int32Array: collections.Int32Array,
  name: string = "test_int32array_toString",
  index: number = 0
) {
  try {
    console.info(`[${name}] Task ${index}: Calling toString() on Int32Array`);

    const result: string = int32Array.toString();

    console.info(`[${name}] Task ${index}: toString() result = "${result}"`);

  } catch (e) {
    console.error(`[${name}] Task ${index}: Failed to call toString() on Int32Array. Error: ${e}`);
    throw new Error(`Int32Array.toString() failed: ${e}`);
  }
}

@Concurrent
export async function test_int32array_toLocaleString(
  int32Array: collections.Int32Array,
  name: string = "test_int32array_toLocaleString",
  index: number = 0
) {
  try {
    console.info(`[${name}] Task ${index}: Calling toLocaleString() on Int32Array`);

    const result: string = int32Array.toLocaleString();

    console.info(`[${name}] Task ${index}: toLocaleString() result = "${result}"`);

  } catch (e) {
    console.error(`[${name}] Task ${index}: Failed to call toLocaleString() on Int32Array. Error: ${e}`);
    throw new Error(`Int32Array.toLocaleString() failed: ${e}`);
  }
}

@Concurrent
export async function test_int32array_copyWithin_helper(
  int32Array: collections.Int32Array,
  target: number,
  start: number,
  end: number,
  expectedArray: collections.Int32Array,
  caseName: string,
  taskIndex: number
): Promise<void> {
  try {
    console.debug(`${caseName} - task[${taskIndex}] - before copyWithin:`, Array.from(int32Array));

    const resultArray = int32Array.copyWithin(target, start, end);

    console.debug(`${caseName} - task[${taskIndex}] - after copyWithin:`, Array.from(int32Array));

    for (let i = 0; i < expectedArray.length; i++) {
      if (int32Array[i] !== expectedArray[i]) {
        console.error(`${caseName} - task[${taskIndex}] - Mismatch at index ${i}: ` +
          `actual=${int32Array[i]}, expected=${expectedArray[i]}`);
      }
    }

    console.debug(`${caseName} - task[${taskIndex}] - copyWithin test PASSED`);
  } catch (e) {
    console.error(`${caseName} - task[${taskIndex}] - Exception occurred: ${e}`);
  }
}

@Concurrent
export async function test_int32array_some_001(int32Array: collections.Int32Array, name: string, index: number, testValue: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    try {
      console.info(`${name} task ${index} executing some() test`);

      let hasNegative = int32Array.some((element: number) => element < 0);
      console.info(`${name} task ${index} - has negative: ${hasNegative}`);

      let hasTestValue = int32Array.some((element: number) => element === testValue);
      console.info(`${name} task ${index} - has test value ${testValue}: ${hasTestValue}`);

      let threshold = 50;
      let hasGreaterThanThreshold = int32Array.some((element: number) => element > threshold);
      console.info(`${name} task ${index} - has greater than ${threshold}: ${hasGreaterThanThreshold}`);

      let hasEvenNumber = int32Array.some((element: number) => element % 2 === 0);
      console.info(`${name} task ${index} - has even number: ${hasEvenNumber}`);

    } catch (e) {
      console.info(`${name} task ${index} failed: ${e.message}`);
    }
  });
}

@Concurrent
export async function test_int32array_every_001(int32Array: collections.Int32Array, name: string, index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    try {
      console.info(`${name} task ${index} start`);

      let allPositive = int32Array.every((element: number) => element > 0);
      console.info(`${name} task ${index} - all > 0: ${allPositive}`);

      let allLessThan100 = int32Array.every((element: number) => element < 100);
      console.info(`${name} task ${index} - all < 100: ${allLessThan100}`);

      let allNumbers = int32Array.every((element: number) => typeof element === 'number');
      console.info(`${name} task ${index} - all numbers: ${allNumbers}`);

      let allEven = int32Array.every((element: number) => element % 2 === 0);
      console.info(`${name} task ${index} - all even: ${allEven}`);

      let allNonNegative = int32Array.every((element: number) => element >= 0);
      console.info(`${name} task ${index} - all >= 0: ${allNonNegative}`);

    } catch (e) {
      console.info(`${name} task ${index} error: ${e.message}`);
    }
  });
}

@Concurrent
export async function test_int32array_fill_fixed(name: string, index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    try {
      console.info(`${name} task ${index} start`);

      let arrayCount = 5;
      let originalValues: number[] = [];
      for (let i = 0; i < arrayCount; i++) {
        originalValues[i] = i + 1;
      }

      let int32Array: collections.Int32Array = new collections.Int32Array(originalValues);

      console.info(`${name} task ${index} - Original array: ${int32Array}`);

      let fillValue1 = index + 10;
      int32Array.fill(fillValue1);
      console.info(`${name} task ${index} - After fill(${fillValue1}): ${int32Array}`);

      let allFilledWithValue1 = int32Array.every((element: number) => element === fillValue1);
      console.info(`${name} task ${index} - all filled with ${fillValue1}: ${allFilledWithValue1}`);

      let fillValue2 = index + 20;
      int32Array.fill(fillValue2, 1);
      console.info(`${name} task ${index} - After fill(${fillValue2}, 1): ${int32Array}`);

      let allFilledWithValue2 = int32Array.slice(1).every((element: number) => element === fillValue2);
      console.info(`${name} task ${index} - all from index 1 filled with ${fillValue2}: ${allFilledWithValue2}`);

      let fillValue3 = index + 30;
      int32Array.fill(fillValue3, 1, 3);
      console.info(`${name} task ${index} - After fill(${fillValue3}, 1, 3): ${int32Array}`);

      let result = int32Array.fill(0, 0, 1);
      console.info(`${name} task ${index} - fill result: ${result}`);

    } catch (e) {
      console.info(`${name} task ${index} error: ${e.message}`);
    }
  });
}

@Concurrent
export async function test_int32array_filter_fixed(name: string, index: number) {
  try {
    console.info(`${name} task ${index} start`);

    let originalValues: number[] = [0, 1, 2, 3, 4];
    let int32Array: collections.Int32Array = new collections.Int32Array(originalValues);

    console.info(`${name} task ${index} - Original array: [${Array.from(int32Array)}]`);

    let filtered: collections.Int32Array = int32Array.filter((element: number) => element % 2 === 0);

    console.info(`${name} task ${index} - Filtered even numbers: [${Array.from(filtered)}]`);

    let expectedResult: number[] = [0, 2, 4];
    let expectedInt32Array: collections.Int32Array = new collections.Int32Array(expectedResult);

    if (filtered.length !== expectedInt32Array.length) {
      throw new Error(`filter result length mismatch: expected length ${expectedInt32Array.length}, got length ${filtered.length}`);
    }

    for (let i = 0; i < filtered.length; i++) {
      if (filtered[i] !== expectedInt32Array[i]) {
        throw new Error(`filter result mismatch at index ${i}: expected ${expectedInt32Array[i]}, got ${filtered[i]}`);
      }
    }

    console.info(`${name} task ${index} - filter() successful, result: [${Array.from(filtered)}]`);

  } catch (e) {
    console.info(`${name} task ${index} error: ${e.message}`);
  }
}

@Concurrent
export async function test_int32array_find_001(name: string, index: number) {
  try {
    console.info(`${name} task ${index} start`);

    let originalValues: number[] = [0, 1, 2, 3, 4];
    let int32Array: collections.Int32Array = new collections.Int32Array(originalValues);

    console.info(`${name} task ${index} - Original array: [${Array.from(int32Array)}]`);

    let foundValue1: number | undefined = int32Array.find((element: number) => element > 2);
    console.info(`${name} task ${index} - find((element) => element > 2) = '${foundValue1}'`);

    let expectedResult1: number | undefined = 3;
    if (foundValue1 !== expectedResult1) {
      throw new Error(`find((element) => element > 2) result mismatch: expected ${expectedResult1}, got ${foundValue1}`);
    }

    let foundValue2: number | undefined = int32Array.find((element: number) => element > 4);
    console.info(`${name} task ${index} - find((element) => element > 4) = '${foundValue2}'`);

    let expectedResult2: number | undefined = undefined;
    if (foundValue2 !== expectedResult2) {
      throw new Error(`find((element) => element > 4) result mismatch: expected ${expectedResult2}, got ${foundValue2}`);
    }

    console.info(`${name} task ${index} - All find() operations successful`);

  } catch (e) {
    console.info(`${name} task ${index} error: ${e.message}`);
  }
}

@Concurrent
export async function test_int32array_findIndex_001(name: string, index: number) {
  try {
    console.info(`${name} task ${index} start`);

    let originalValues: number[] = [1, 2, 3, 4, 5];
    let int32Array: collections.Int32Array = new collections.Int32Array(originalValues);

    console.info(`${name} task ${index} - Original array: [${Array.from(int32Array)}]`);

    let foundIndex: number = int32Array.findIndex((element: number) => element % 2 === 0);

    console.info(`${name} task ${index} - findIndex((element) => element % 2 === 0) = '${foundIndex}'`);

    let expectedResult: number = 1;

    if (foundIndex !== expectedResult) {
      throw new Error(`findIndex result mismatch: expected ${expectedResult}, got ${foundIndex}`);
    }

    if (foundIndex !== -1) {
      let foundElement: number = int32Array[foundIndex];
      if (foundElement % 2 !== 0) {
        throw new Error(`Found element at index ${foundIndex} is not even: ${foundElement}`);
      }
      console.info(`${name} task ${index} - Found even element at index ${foundIndex}: ${foundElement}`);
    } else {
      console.info(`${name} task ${index} - No even element found, returned -1`);
    }

    console.info(`${name} task ${index} - findIndex() successful, result: ${foundIndex}`);

  } catch (e) {
    console.info(`${name} task ${index} error: ${e.message}`);
  }
}

@Concurrent
export async function test_int32array_forEach_001(name: string, index: number) {
  try {
    console.info(`${name} task ${index} start`);

    let originalValues: number[] = [1, 2, 3];
    let int32Array: collections.Int32Array = new collections.Int32Array(originalValues);

    console.info(`${name} task ${index} - Original array: [${Array.from(int32Array)}]`);

    int32Array.forEach((value: number, index: number, array: collections.Int32Array) => {
      console.info(`${name} task ${index} - forEach Callback - Element ${value} at index ${index}`);
    });

    console.info(`${name} task ${index} - forEach executed successfully for all elements`);

  } catch (e) {
    console.info(`${name} task ${index} error: ${e.message}`);
  }
}

@Concurrent
export async function test_int32array_indexOf_001(name: string, index: number) {
  try {
    console.info(`${name} task ${index} start`);

    let originalValues: number[] = [3, 5, 9];
    let int32Array: collections.Int32Array = new collections.Int32Array(originalValues);

    console.info(`${name} task ${index} - Original array: [${Array.from(int32Array)}]`);

    let searchElement1: number = 3;
    let foundIndex1: number = int32Array.indexOf(searchElement1);
    console.info(`${name} task ${index} - indexOf(${searchElement1}) = '${foundIndex1}'`);

    if (foundIndex1 !== 0) {
      throw new Error(`indexOf(${searchElement1}) result mismatch: expected 0, got ${foundIndex1}`);
    }

    let searchElement2: number = 7;
    let foundIndex2: number = int32Array.indexOf(searchElement2);
    console.info(`${name} task ${index} - indexOf(${searchElement2}) = '${foundIndex2}'`);

    if (foundIndex2 !== -1) {
      throw new Error(`indexOf(${searchElement2}) result mismatch: expected -1, got ${foundIndex2}`);
    }

    let searchElement3: number = 9;
    let fromIndex3: number = 2;
    let foundIndex3: number = int32Array.indexOf(searchElement3, fromIndex3);
    console.info(`${name} task ${index} - indexOf(${searchElement3}, ${fromIndex3}) = '${foundIndex3}'`);
    if (foundIndex3 !== 2) {
      throw new Error(`indexOf(${searchElement3}, ${fromIndex3}) result mismatch: expected 2, got ${foundIndex3}`);
    }

    let searchElement4: number = 9;
    let fromIndex4: number = -2;
    let foundIndex4: number = int32Array.indexOf(searchElement4, fromIndex4);
    console.info(`${name} task ${index} - indexOf(${searchElement4}, ${fromIndex4}) = '${foundIndex4}'`);
    if (foundIndex4 !== 2) {
      throw new Error(`indexOf(${searchElement4}, ${fromIndex4}) result mismatch: expected 2, got ${foundIndex4}`);
    }

    console.info(`${name} task ${index} - All indexOf() operations successful`);

  } catch (e) {
    console.info(`${name} task ${index} error: ${e.message}`);
  }
}

@Concurrent
export async function test_int32array_lastIndexOf_001(name: string, index: number) {
  try {
    console.info(`${name} task ${index} start`);

    let originalValues: number[] = [3, 5, 9];
    let int32Array: collections.Int32Array = new collections.Int32Array(originalValues);

    console.info(`${name} task ${index} - Original array: [${Array.from(int32Array)}]`);

    let searchElement1: number = 3;
    let foundIndex1: number = int32Array.lastIndexOf(searchElement1);
    console.info(`${name} task ${index} - lastIndexOf(${searchElement1}) + '' = '${foundIndex1}'`);

    if (foundIndex1 !== 0) {
      throw new Error(`lastIndexOf(${searchElement1}) result mismatch: expected 0, got ${foundIndex1}`);
    }

    let searchElement2: number = 7;
    let foundIndex2: number = int32Array.lastIndexOf(searchElement2);
    console.info(`${name} task ${index} - lastIndexOf(${searchElement2}) + '' = '${foundIndex2}'`);

    if (foundIndex2 !== -1) {
      throw new Error(`lastIndexOf(${searchElement2}) result mismatch: expected -1, got ${foundIndex2}`);
    }

    let searchElement3: number = 9;
    let fromIndex3: number = 2;
    let foundIndex3: number = int32Array.lastIndexOf(searchElement3, fromIndex3);
    console.info(`${name} task ${index} - lastIndexOf(${searchElement3}, ${fromIndex3}) + '' = '${foundIndex3}'`);

    if (foundIndex3 !== 2) {
      throw new Error(`lastIndexOf(${searchElement3}, ${fromIndex3}) result mismatch: expected 2, got ${foundIndex3}`);
    }

    let searchElement4: number = 9;
    let fromIndex4: number = -2;
    let foundIndex4: number = int32Array.lastIndexOf(searchElement4, fromIndex4);
    console.info(`${name} task ${index} - lastIndexOf(${searchElement4}, ${fromIndex4}) + '' = '${foundIndex4}'`);

    if (foundIndex4 !== -1) {
      throw new Error(`lastIndexOf(${searchElement4}, ${fromIndex4}) result mismatch: expected -1, got ${foundIndex4}`);
    }

    console.info(`${name} task ${index} - All lastIndexOf() operations successful`);

  } catch (e) {
    console.info(`${name} task ${index} error: ${e.message}`);
  }
}

@Concurrent
export async function test_int32array_join_001(name: string, index: number) {
  try {
    console.info(`${name} task ${index} start`);

    let originalValues: number[] = [1, 2, 3, 4, 5];
    let int32Array: collections.Int32Array = new collections.Int32Array(originalValues);

    console.info(`${name} task ${index} - Original array: [${Array.from(int32Array)}]`);

    let separator: string = '-';
    let joinedString: string = int32Array.join(separator);

    console.info(`${name} task ${index} - Joined string: '${joinedString}'`);

    let expectedResult: string = '1-2-3-4-5';

    if (joinedString !== expectedResult) {
      throw new Error(`Join result mismatch: expected '${expectedResult}', got '${joinedString}'`);
    }

    console.info(`${name} task ${index} - join() successful, result: '${joinedString}'`);

  } catch (e) {
    console.info(`${name} task ${index} error: ${e.message}`);
  }
}

@Concurrent
export async function test_int32array_map_001(name: string, index: number) {
  type Int32ArrayMapCallback = (value: number) => number;
  try {
    console.info(`${name} task ${index} start`);

    let originalValues: number[] = [25, 36, 49];
    let int32Array: collections.Int32Array = new collections.Int32Array(originalValues);

    console.info(`${name} task ${index} - Original array: [${Array.from(int32Array)}]`);

    let callbackFn: Int32ArrayMapCallback = Math.sqrt;
    let mappedArray: collections.Int32Array = int32Array.map(callbackFn);

    console.info(`${name} task ${index} - Mapped array (first 5 elements): [${Array.from(mappedArray).slice(0, 5)}]`);

    let expectedResult: number[] = [5, 6, 7];

    let actualArray: number[] = Array.from(mappedArray);

    if (actualArray.length !== expectedResult.length) {
      throw new Error(`Mapped array length mismatch: expected ${expectedResult.length}, got ${actualArray.length}`);
    }

    for (let i = 0; i < expectedResult.length; i++) {
      if (actualArray[i] !== expectedResult[i]) {
        throw new Error(`Mapped value mismatch at index ${i}: expected ${expectedResult[i]}, got ${actualArray[i]}`);
      }
    }

    console.info(`${name} task ${index} - map() successful, result: [${actualArray}]`);

  } catch (e) {
    console.info(`${name} task ${index} error: ${e.message}`);
  }
}

@Concurrent
export async function test_int32array_reduce_001(name: string, index: number, arrayCount: number) {
  type Int32ArrayReduceCallback = (accumulator: number, value: number) => number;
  try {
    console.info(`${name} task ${index} start`);

    let originalValues: number[] = [1, 2, 3, 4, 5];
    let int32Array: collections.Int32Array = new collections.Int32Array(originalValues);

    console.info(`${name} task ${index} - Original array: [${Array.from(int32Array)}]`);

    let callbackFn: Int32ArrayReduceCallback = (accumulator: number, value: number) => accumulator + value;
    let reducedValue: number = int32Array.reduce(callbackFn);

    console.info(`${name} task ${index} - Reduced value: ${reducedValue}`);

    let expectedResult: number = 15;

    if (reducedValue !== expectedResult) {
      throw new Error(`Reduce result mismatch: expected ${expectedResult}, got ${reducedValue}`);
    }

    console.info(`${name} task ${index} - reduce() successful, result: ${reducedValue}`);

  } catch (e) {
    console.info(`${name} task ${index} error: ${e.message}`);
  }
}

@Concurrent
export async function test_int32array_reduceRight_001(name: string, index: number) {
  type Int32ArrayReduceCallback = (accumulator: number, value: number) => number;
  try {
    console.info(`${name} task ${index} start`);

    let originalValues: number[] = [1, 2, 3, 4, 5];
    let int32Array: collections.Int32Array = new collections.Int32Array(originalValues);

    console.info(`${name} task ${index} - Original array: [${Array.from(int32Array)}]`);

    let callbackFn: Int32ArrayReduceCallback = (accumulator: number, value: number) => accumulator + value;
    let reducedValue: number = int32Array.reduceRight(callbackFn);

    console.info(`${name} task ${index} - Reduced value: ${reducedValue}`);

    let expectedResult: number = 15;

    if (reducedValue !== expectedResult) {
      throw new Error(`ReduceRight result mismatch: expected ${expectedResult}, got ${reducedValue}`);
    }

    console.info(`${name} task ${index} - reduceRight() successful, result: ${reducedValue}`);

  } catch (e) {
    console.info(`${name} task ${index} error: ${e.message}`);
  }
}

@Concurrent
export async function test_int32array_reduce_with_initial_001(name: string, index: number) {
  try {
    console.info(`${name} task ${index} start`);

    let originalValues: number[] = [1, 2, 3, 4, 5];
    let int32Array: collections.Int32Array = new collections.Int32Array(originalValues);

    console.info(`${name} task ${index} - Original array: [${Array.from(int32Array)}]`);

    let initialValue: number = 1;
    let reducedValue: number = int32Array.reduce((accumulator: number, value: number) => accumulator + value, initialValue);

    console.info(`${name} task ${index} - Reduced value: ${reducedValue}`);
    let expectedResult: number = 16;

    if (reducedValue !== expectedResult) {
      throw new Error(`Reduce result mismatch: expected ${expectedResult}, got ${reducedValue}`);
    }

    console.info(`${name} task ${index} - reduce() successful, result: ${reducedValue}`);

  } catch (e) {
    console.info(`${name} task ${index} error: ${e.message}`);
  }
}

@Concurrent
export async function test_int32array_reduceRight_fixed_001(name: string, index: number) {
  try {
    console.info(`${name} task ${index} start`);

    let originalValues: number[] = [1, 2, 3, 4, 5];
    let int32Array: collections.Int32Array = new collections.Int32Array(originalValues);

    console.info(`${name} task ${index} - Original array: [${Array.from(int32Array)}]`);

    let initialValue: number = 1;
    let reducedValue: number = int32Array.reduceRight((accumulator: number, value: number) => accumulator + value, initialValue);

    console.info(`${name} task ${index} - Reduced value: ${reducedValue}`);

    let expectedResult: number = 16;

    if (reducedValue !== expectedResult) {
      throw new Error(`ReduceRight result mismatch: expected ${expectedResult}, got ${reducedValue}`);
    }

    console.info(`${name} task ${index} - reduceRight() successful, result: ${reducedValue}`);

  } catch (e) {
    console.info(`${name} task ${index} error: ${e.message}`);
  }
}

@Concurrent
export async function test_int32array_reduce_fixed_001(name: string, index: number) {
  try {
    console.info(`${name} task ${index} start`);

    let originalValues: number[] = [1, 2, 3, 4, 5];
    let int32Array: collections.Int32Array = new collections.Int32Array(originalValues);

    console.info(`${name} task ${index} - Original array: [${Array.from(int32Array)}]`);

    let initialValue: string = "initialValue";
    let reducedValue: string = int32Array.reduce<string>((accumulator: string, value: number) => accumulator + value.toString(), initialValue);

    console.info(`${name} task ${index} - Reduced value: ${reducedValue}`);

    let expectedResult: string = "initialValue12345";

    if (reducedValue !== expectedResult) {
      throw new Error(`Reduce result mismatch: expected "${expectedResult}", got "${reducedValue}"`);
    }

    console.info(`${name} task ${index} - reduce() successful`);

  } catch (e) {
    console.info(`${name} task ${index} error: ${e.message}`);
  }
}

@Concurrent
export async function test_int32array_reverse_001(name: string, index: number) {
  try {
    console.info(`${name} task ${index} start`);

    let originalValues: number[] = [1, 2, 3, 4, 5];
    let int32Array: collections.Int32Array = new collections.Int32Array(originalValues);

    console.info(`${name} task ${index} - Original array: [${Array.from(int32Array)}]`);

    let reversed: collections.Int32Array = int32Array.reverse();
    console.info(`${name} task ${index} - Reversed array: [${Array.from(reversed)}]`);

    let expectedValues: number[] = [5, 4, 3, 2, 1];

    if (reversed.length !== expectedValues.length) {
      throw new Error(`Length mismatch: expected ${expectedValues.length}, got ${reversed.length}`);
    }

    console.info(`${name} task ${index} - Reverse successful`);

  } catch (e) {
    console.info(`${name} task ${index} error: ${e.message}`);
  }
}

@Concurrent
export async function test_int32array_set_001(name: string, index: number) {
  try {
    console.info(`${name} task ${index} start`);

    let buffer: collections.ArrayBuffer = new collections.ArrayBuffer(8);
    let int32Array: collections.Int32Array = new collections.Int32Array(buffer);

    console.info(`${name} task ${index} - Initial Int32Array: [${Array.from(int32Array)}]`);

    let dataArray: ArrayLike<number> = [1, 2, 3];
    let offset: number = 3;
    int32Array.set(dataArray, offset);
    console.info(`${name} task ${index} - After set: [${Array.from(int32Array)}]`);

    let expectedValues: number[] = [0, 0, 0, 1, 2, 3, 0, 0];

    if (int32Array.length !== expectedValues.length) {
      throw new Error(`Length mismatch: expected ${expectedValues.length}, got ${int32Array.length}`);
    }

  } catch (e) {
    console.info(`${name} task ${index} error: ${e.message}`);
  }
}

@Concurrent
export async function test_int32array_slice_001(name: string, index: number) {
  try {
    console.info(`${name} task ${index} start`);

    let originalValues: number[] = [1, 2, 3, 4, 5];
    let int32Array: collections.Int32Array = new collections.Int32Array(originalValues);

    console.info(`${name} task ${index} - Original array: [${Array.from(int32Array)}]`);

    let start: number | undefined;
    let end: number | undefined;
    let expectedValues: number[];

    if (index % 3 === 0) {
      start = undefined;
      end = undefined;
      expectedValues = [1, 2, 3, 4, 5];
      console.info(`${name} task ${index} - slice() without parameters`);
    } else if (index % 3 === 1) {
      start = 1;
      end = 3;
      expectedValues = [2, 3];
      console.info(`${name} task ${index} - slice(1, 3)`);
    } else if (index % 3 === 2) {
      start = -2;
      end = undefined;
      expectedValues = [4, 5];
      console.info(`${name} task ${index} - slice(-2)`);
    } else {
      // 默认情况下，返回整个数组（理论上不会到达这里，因为 index % 3 只有 0,1,2）
      start = undefined;
      end = undefined;
      expectedValues = [1, 2, 3, 4, 5];
      console.info(`${name} task ${index} - slice() without parameters (default)`);
    }

    // 执行slice方法
    let sliced: collections.Int32Array;
    if (start === undefined && end === undefined) {
      sliced = int32Array.slice();
    } else if (end === undefined) {
      sliced = int32Array.slice(start);
    } else {
      sliced = int32Array.slice(start, end);
    }

    console.info(`${name} task ${index} - Sliced array: [${Array.from(sliced)}]`);

    if (sliced.length !== expectedValues.length) {
      throw new Error(`Length mismatch: expected ${expectedValues.length}, got ${sliced.length}`);
    }

    for (let i = 0; i < sliced.length; i++) {
      if (sliced[i] !== expectedValues[i]) {
        throw new Error(`Element at index ${i} mismatch: expected ${expectedValues[i]}, got ${sliced[i]}`);
      }
    }

    console.info(`${name} task ${index} - Slice successful`);

  } catch (e) {
    console.info(`${name} task ${index} error: ${e.message}`);
  }
}

@Concurrent
export async function test_int32array_sort_fixed_001(name: string, index: number) {
  try {
    console.info(`${name} task ${index} start`);

    let originalValues: number[] = [1, 3, 5, 4, 2];
    let int32Array: collections.Int32Array = new collections.Int32Array(originalValues);

    console.info(`${name} task ${index} - Original array: [${Array.from(int32Array)}]`);

    let compareFn: ((a: number, b: number) => number) | undefined;
    let expectedValues: number[];

    if (index % 3 === 0) {
      // 不传参数，按升序排序
      compareFn = undefined;
      expectedValues = [1, 2, 3, 4, 5];
      console.info(`${name} task ${index} - sort() without parameters`);
    } else if (index % 3 === 1) {
      // 传入升序比较函数 (a - b)
      compareFn = (a: number, b: number) => a - b;
      expectedValues = [1, 2, 3, 4, 5];
      console.info(`${name} task ${index} - sort((a, b) => a - b)`);
    } else if (index % 3 === 2) {
      // 传入降序比较函数 (b - a)
      compareFn = (a: number, b: number) => b - a;
      expectedValues = [5, 4, 3, 2, 1];
      console.info(`${name} task ${index} - sort((a, b) => b - a)`);
    } else {
      compareFn = undefined;
      expectedValues = [1, 2, 3, 4, 5];
      console.info(`${name} task ${index} - sort() without parameters (default)`);
    }

    let sorted: collections.Int32Array;
    if (compareFn === undefined) {
      sorted = int32Array.sort();
    } else {
      sorted = int32Array.sort(compareFn);
    }

    console.info(`${name} task ${index} - Sorted array: [${Array.from(sorted)}]`);

    if (sorted.length !== expectedValues.length) {
      throw new Error(`Length mismatch: expected ${expectedValues.length}, got ${sorted.length}`);
    }

    console.info(`${name} task ${index} - Sort successful`);

  } catch (e) {
    console.info(`${name} task ${index} error: ${e.message}`);

  }
}

@Concurrent
export async function test_int32array_subarray_fixed_001(name: string, index: number) {
  try {
    console.info(`${name} task ${index} start`);

    let buffer: collections.ArrayBuffer = new collections.ArrayBuffer(8);
    let int32Array: collections.Int32Array = new collections.Int32Array(buffer);

    int32Array.set([1, 2, 3, 4, 5]);
    console.info(`${name} task ${index} - Original array: [${Array.from(int32Array)}]`);

    let subArray: collections.Int32Array = int32Array.subarray();
    console.info(`${name} task ${index} - SubArray (before set): [${Array.from(subArray)}]`);

    subArray.set([10, 20, 30]);
    console.info(`${name} task ${index} - SubArray (after set): [${Array.from(subArray)}]`);

    // 预期结果
    let expectedSubArrayValues: number[] = [10, 20, 30, 4, 5];
    let expectedInt32ArrayValues: number[] = [10, 20, 30, 4, 5];

    // 验证subArray的内容
    if (subArray.length !== expectedSubArrayValues.length) {
      throw new Error(`SubArray length mismatch: expected ${expectedSubArrayValues.length}, got ${subArray.length}`);
    }

    for (let i = 0; i < subArray.length; i++) {
      if (subArray[i] !== expectedSubArrayValues[i]) {
        throw new Error(`SubArray element at index ${i} mismatch: expected ${expectedSubArrayValues[i]}, got ${subArray[i]}`);
      }
    }

    if (int32Array.length !== expectedInt32ArrayValues.length) {
      throw new Error(`Original Int32Array length mismatch: expected ${expectedInt32ArrayValues.length}, got ${int32Array.length}`);
    }

    for (let i = 0; i < int32Array.length; i++) {
      if (int32Array[i] !== expectedInt32ArrayValues[i]) {
        throw new Error(`Original Int32Array element at index ${i} mismatch: expected ${expectedInt32ArrayValues[i]}, got ${int32Array[i]}`);
      }
    }

    console.info(`${name} task ${index} - SubArray and Original Int32Array validation successful`);

  } catch (e) {
    console.info(`${name} task ${index} error: ${e.message}`);
  }
}

@Concurrent
export async function test_int32array_at_fixed_001(name: string, index: number) {
  try {
    console.info(`${name} task ${index} start`);
    let originalValues: number[] = [1, 2, 3, 4, 5];
    let int32Array: collections.Int32Array = new collections.Int32Array(originalValues);

    console.info(`${name} task ${index} - Original array: [${Array.from(int32Array)}]`);
    let atIndex: number;
    let expectedValue: number | undefined;

    if (index % 3 === 0) {
      // at(2) -> 预期返回 3
      atIndex = 2;
      expectedValue = 3;
      console.info(`${name} task ${index} - at(2)`);
    } else if (index % 3 === 1) {
      // at(-1) -> 预期返回 5
      atIndex = -1;
      expectedValue = 5;
      console.info(`${name} task ${index} - at(-1)`);
    } else if (index % 3 === 2) {
      // at(6) -> 预期返回 undefined
      atIndex = 6;
      expectedValue = undefined;
      console.info(`${name} task ${index} - at(6)`);
    } else {
      // 默认情况下，at(2) -> 预期返回 3（理论上不会到达这里，因为 index % 3 只有 0,1,2）
      atIndex = 2;
      expectedValue = 3;
      console.info(`${name} task ${index} - at(2) (default)`);
    }

    let value: number | undefined = int32Array.at(atIndex);
    console.info(`${name} task ${index} - at(${atIndex}) returned: ${value}`);

    if (value !== expectedValue) {
      throw new Error(`At index ${atIndex} mismatch: expected ${expectedValue}, got ${value}`);
    }

    console.info(`${name} task ${index} - at() successful`);

  } catch (e) {
    console.info(`${name} task ${index} error: ${e.message}`);
  }
}

@Concurrent
export async function test_int32array_includes_fixed_001(name: string, index: number) {
  try {
    console.info(`${name} task ${index} start`);

    // 创建固定的初始数组 [1, 2, 3]
    let originalValues: number[] = [1, 2, 3];
    let int32Array: collections.Int32Array = new collections.Int32Array(originalValues);

    console.info(`${name} task ${index} - Original array: [${Array.from(int32Array)}]`);

    // 基于任务索引定义固定的includes参数
    let searchElement: number;
    let expectedResult: boolean;

    if (index % 3 === 0) {
      searchElement = 2;
      expectedResult = true;
      console.info(`${name} task ${index} - includes(2)`);
    } else if (index % 3 === 1) {
      searchElement = 4;
      expectedResult = false;
      console.info(`${name} task ${index} - includes(4)`);
    } else if (index % 3 === 2) {
      searchElement = 3;
      expectedResult = false;
      console.info(`${name} task ${index} - includes(3, 3)`);
    } else {
      searchElement = 2;
      expectedResult = true;
      console.info(`${name} task ${index} - includes(2) (default)`);
    }

    let result: boolean;
    result = int32Array.includes(searchElement);

    if (result !== expectedResult) {
      throw new Error(`Includes mismatch: expected ${expectedResult}, got ${result} for searchElement ${searchElement} `);
    }

    console.info(`${name} task ${index} - includes() successful`);

  } catch (e) {
    console.info(`${name} task ${index} error: ${e.message}`);
  }
}

@Concurrent
export async function test_int32array_entries_fixed_001(name: string, index: number) {
  try {
    console.info(`${name} task ${index} start`);

    let originalValues: number[] = [11, 22, 33];
    let int32Array: collections.Int32Array = new collections.Int32Array(originalValues);

    console.info(`${name} task ${index} - Original array: [${Array.from(int32Array)}]`);

    let iterator: IterableIterator<[number, number]> = int32Array.entries();
    console.info(`${name} task ${index} - Iterator obtained`);

    let expectedEntries: [number, number][] = [
      [0, 11],
      [1, 22],
      [2, 33]
    ];

    for (let i = 0; i < expectedEntries.length; i++) {
      let next = iterator.next();
      if (next.done) {
        throw new Error(`Iterator ended prematurely at index ${i}`);
      }
      let currentValue: [number, number] | undefined = next.value;
      if (currentValue === undefined) {
        throw new Error(`Iterator returned undefined value at index ${i}`);
      }

      let expectedEntry = expectedEntries[i];
      if (currentValue[0] !== expectedEntry[0] || currentValue[1] !== expectedEntry[1]) {
        throw new Error(`Entry at index ${i} mismatch: expected [${expectedEntry[0]}, ${expectedEntry[1]}], got [${currentValue[0]}, ${currentValue[1]}]`);
      }

      console.info(`${name} task ${index} - Entry ${i}: [${currentValue[0]}, ${currentValue[1]}]`);
    }

    let next = iterator.next();
    if (!next.done) {
      throw new Error(`Iterator returned additional unexpected entry: [${next.value?.[0]}, ${next.value?.[1]}]`);
    }

    console.info(`${name} task ${index} - entries() successful`);

  } catch (e) {
    console.info(`${name} task ${index} error: ${e.message}`);
  }
}

@Concurrent
export async function test_int32array_keys_fixed_001(name: string, index: number) {
  try {
    console.info(`${name} task ${index} start`);

    let originalValues: number[] = [1, 2, 3, 4, 5];
    let int32Array: collections.Int32Array = new collections.Int32Array(originalValues);

    console.info(`${name} task ${index} - Original array: [${Array.from(int32Array)}]`);

    let iterator: IterableIterator<number> = int32Array.keys();
    console.info(`${name} task ${index} - Iterator obtained`);

    let expectedKeys: number[] = [0, 1, 2, 3, 4];

    let i = 0;
    for (const key of iterator) {
      if (i >= expectedKeys.length) {
        throw new Error(`Iterator returned unexpected additional key: ${key}`);
      }
      if (key !== expectedKeys[i]) {
        throw new Error(`Key at index ${i} mismatch: expected ${expectedKeys[i]}, got ${key}`);
      }
      console.info(`${name} task ${index} - Key ${i}: ${key}`);
      i++;
    }

    if (i < expectedKeys.length) {
      throw new Error(`Iterator ended prematurely, missing key: ${expectedKeys[i]}`);
    }

    console.info(`${name} task ${index} - keys() successful`);

  } catch (e) {
    console.info(`${name} task ${index} error: ${e.message}`);

  }
}

@Concurrent
export async function test_int32array_values_fixed_001(name: string, index: number) {
  try {
    console.info(`${name} task ${index} start`);

    let originalValues: number[] = [1, 2, 3, 4, 5];
    let int32Array: collections.Int32Array = new collections.Int32Array(originalValues);

    console.info(`${name} task ${index} - Original array: [${Array.from(int32Array)}]`);

    let iterator: IterableIterator<number> = int32Array.values();
    console.info(`${name} task ${index} - Iterator obtained`);

    let expectedValues: number[] = [1, 2, 3, 4, 5];

    let i = 0;
    for (const value of iterator) {
      if (value !== expectedValues[i]) {
        throw new Error(`Value at index ${i} mismatch: expected ${expectedValues[i]}, got ${value}`);
      }
      console.info(`${name} task ${index} - Value ${i}: ${value}`);
      i++;
    }
    console.info(`${name} task ${index} - values() successful`);

  } catch (e) {
    console.info(`${name} task ${index} error: ${e.message}`);
  }
}

@Concurrent
export async function test_int32array_index_access_fixed_001(name: string, index: number) {
  try {
    console.info(`${name} task ${index} start`);

    let originalValues: number[] = [1, 2, 4];
    let int32Array: collections.Int32Array = new collections.Int32Array(originalValues);

    console.info(`${name} task ${index} - Original array: [${Array.from(int32Array)}]`);

    let accessIndex: number = 1;
    let expectedValue: number = 2;

    let value: number = int32Array[accessIndex];
    console.info(`${name} task ${index} - Element at index ${accessIndex}: ${value}`);

    if (value !== expectedValue) {
      throw new Error(`Index ${accessIndex} mismatch: expected ${expectedValue}, got ${value}`);
    }

    console.info(`${name} task ${index} - Index access successful`);

  } catch (e) {
    console.info(`${name} task ${index} error: ${e.message}`);
  }
}