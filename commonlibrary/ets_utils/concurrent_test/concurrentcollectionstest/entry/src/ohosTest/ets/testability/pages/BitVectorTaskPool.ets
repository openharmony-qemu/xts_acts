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
export async function test_bitvector_constructor_001_task(length: number, name: string, index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    let bitVector: collections.BitVector = new collections.BitVector(length);
  })
}

@Concurrent
export async function test_bitvector_push_001_task(initialLength: number, elements: number[], name: string, index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    try {
      let bitVector: collections.BitVector = new collections.BitVector(initialLength);

      console.info(`${name} - Initial BitVector length: ${bitVector.length}`);

      for (let i = 0; i < elements.length; i++) {
        const element = elements[i];
        const result = bitVector.push(element);
        console.info(`${name} - Pushed element: ${element}, returned: ${result}, current length: ${bitVector.length}`);

        if (result !== true) {
          console.info(`${name} - Push operation failed at index ${i}, returned: ${result}`);
        }
      }
    } catch (e) {
      console.info(`${name} - Error in task execution: ${e.message}`);
    }
  })
}

@Concurrent
export async function test_bitvector_pop_001_task(initialLength: number, elements: number[], name: string, index: number) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    try {
      let bitVector: collections.BitVector = new collections.BitVector(initialLength);
      console.info(`${name} - Initial BitVector length: ${bitVector.length}`);

      for (let i = 0; i < elements.length; i++) {
        const element = elements[i];
        const result = bitVector.push(element);
        console.info(`${name} - Pushed element: ${element}, returned: ${result}, current length: ${bitVector.length}`);

        if (result !== true) {
          console.info(`${name} - Push failed at index ${i}, returned: ${result}`);
        }
      }

      const poppedElement = bitVector.pop();
      console.info(`${name} - Popped element: ${poppedElement}`);

      if (poppedElement !== 0) {
        console.info(`${name} - Pop validation failed, expected 0 but got ${poppedElement}`);
      } else {
        console.info(`${name} - Pop validation passed, got expected value 0`);
      }

      const lengthAfterPop = bitVector.length;
      console.info(`${name} - Length after pop: ${lengthAfterPop}`);
      if (lengthAfterPop !== 4) {
        console.info(`${name} - Length after pop validation failed, expected 4 but got ${lengthAfterPop}`);
      } else {
        console.info(`${name} - Length after pop validation passed, got expected length 4`);
      }

    } catch (e) {
      console.info(`${name} - Error in task execution: ${e.message}`);
      if (true) {
        console.info(`${name} - Exception caught during task execution`);
      }
    }
  })
}

@Concurrent
export async function test_bitvector_has_001_task(
  initialLength: number,
  elements: number[],
  elementToFind: number,
  fromIndex: number,
  toIndex: number,
  name: string,
  index: number
) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    try {
      // 创建初始长度为0的BitVector
      let bitVector: collections.BitVector = new collections.BitVector(initialLength);
      console.info(`${name} - Initial BitVector length: ${bitVector.length}`);

      for (let i = 0; i < elements.length; i++) {
        const element = elements[i];
        const result = bitVector.push(element);
        console.info(`${name} - Pushed element: ${element}, returned: ${result}, current length: ${bitVector.length}`);

        if (result !== true) {
          console.info(`${name} - Push failed at index ${i}, returned: ${result}`);
        }
      }

      const hasResult = bitVector.has(elementToFind, fromIndex, toIndex);
      console.info(`${name} - has(${elementToFind}, ${fromIndex}, ${toIndex}) returned: ${hasResult}`);

      const expectedResult = true; // 您的示例应该返回 true

      if (hasResult !== expectedResult) {
        console.info(`${name} - has() validation failed, expected ${expectedResult} but got ${hasResult}`);
      } else {
        console.info(`${name} - has() validation passed, got expected result ${expectedResult}`);
      }

    } catch (e) {
      console.info(`${name} - Error in task execution: ${e.message}`);
      if (true) {
        console.info(`${name} - Exception caught during task execution`);
      }
    }
  })
}

@Concurrent
export async function test_bitvector_setBitsByRange_001_task(
  initialLength: number,
  elements: number[],
  elementToSet: number,
  fromIndex: number,
  toIndex: number,
  name: string,
  index: number
) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    try {
      let bitVector: collections.BitVector = new collections.BitVector(initialLength);
      console.info(`${name} - Initial BitVector length: ${bitVector.length}`);

      for (let i = 0; i < elements.length; i++) {
        const element = elements[i];
        const result = bitVector.push(element);
        console.info(`${name} - Pushed element: ${element}, returned: ${result}, current length: ${bitVector.length}`);

        if (result !== true) {
          console.info(`${name} - Push failed at index ${i}, returned: ${result}`);
        }
      }

      console.info(`${name} - Calling setBitsByRange(${elementToSet}, ${fromIndex}, ${toIndex})`);
      bitVector.setBitsByRange(elementToSet, fromIndex, toIndex);
      console.info(`${name} - setBitsByRange called successfully`);

    } catch (e) {
      console.info(`${name} - Error in task execution: ${e.message}`);
      if (true) {
        console.info(`${name} - Exception caught during setBitsByRange call`);
      }
    }
  })
}

@Concurrent
export async function test_bitvector_setAllBits_001_task(
  initialLength: number,
  elements: number[],
  elementToSet: number,
  name: string,
  index: number
) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    try {
      let bitVector: collections.BitVector = new collections.BitVector(initialLength);
      console.info(`${name} - Initial BitVector length: ${bitVector.length}`);

      for (let i = 0; i < elements.length; i++) {
        const element = elements[i];
        const result = bitVector.push(element);
        console.info(`${name} - Pushed element: ${element}, returned: ${result}, current length: ${bitVector.length}`);

        if (result !== true) {
          console.info(`${name} - Push failed at index ${i}, returned: ${result}`);
        }
      }

      console.info(`${name} - Calling setAllBits(${elementToSet})`);
      bitVector.setAllBits(elementToSet);
      console.info(`${name} - setAllBits called successfully`);

    } catch (e) {
      console.info(`${name} - Error in task execution: ${e.message}`);
      if (true) {
        console.info(`${name} - Exception caught during setAllBits call`);
      }
    }
  })
}

@Concurrent
export async function test_bitvector_range(bitVector: collections.BitVector, name: string, index: number) {
  // 所有对bitVector的操作都必须在锁内进行
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(async () => {
    try {
      // 测试不同的范围获取
      const range1 = bitVector.getBitsByRange(1, 3); // 预期 [1, 0]

      // 测试完整范围复制
      const range2 = bitVector.getBitsByRange(0, bitVector.length);
      if (range2.length !== bitVector.length) {
        throw new Error(`Range2 length should equal original, but got ${range2.length}`);
      }

      const start = (index * 4) % bitVector.length;
      const end = Math.min(start + 4, bitVector.length);
      const alignedStart = Math.floor(start / 4) * 4;
      const alignedEnd = Math.ceil(end / 4) * 4;
      const range3 = bitVector.getBitsByRange(alignedStart, alignedEnd);
      const expectedLength = end - start;

      if (range3.length !== expectedLength) {
        throw new Error(`Range3 expected length ${expectedLength}, but got ${range3.length}`);
      }

    } catch (e) {
      console.error(`Error in task ${index}: ${e.message}`);
    }
  });
}

@Concurrent
export async function test_bitvector_resize_001_task(
  initialLength: number,
  elements: number[],
  resizeToLarge: number,
  resizeToSmall: number,
  name: string,
  index: number
) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    try {
      let bitVector: collections.BitVector = new collections.BitVector(initialLength);
      console.info(`${name} - Initial BitVector length: ${bitVector.length}`);

      for (let i = 0; i < elements.length; i++) {
        const element = elements[i];
        const result = bitVector.push(element);
        console.info(`${name} - Pushed element: ${element}, returned: ${result}, current length: ${bitVector.length}`);

        if (result !== true) {
          console.info(`${name} - Push failed at index ${i}, returned: ${result}`);
        }
      }

      console.info(`${name} - Calling resize(${resizeToLarge})`);
      bitVector.resize(resizeToLarge);
      console.info(`${name} - resize(${resizeToLarge}) called`);

      const lengthAfterExpand = bitVector.length;
      console.info(`${name} - BitVector length after expand: ${lengthAfterExpand}`);
      if (lengthAfterExpand !== 10) {
        console.info(`${name} - Resize expand validation failed, expected 10 but got ${lengthAfterExpand}`);
      } else {
        console.info(`${name} - Resize expand validation passed, got expected length 10`);
      }

      console.info(`${name} - Calling resize(${resizeToSmall})`);
      bitVector.resize(resizeToSmall);
      console.info(`${name} - resize(${resizeToSmall}) called`);

      const lengthAfterShrink = bitVector.length;
      console.info(`${name} - BitVector length after shrink: ${lengthAfterShrink}`);
      if (lengthAfterShrink !== 3) {
        console.info(`${name} - Resize shrink validation failed, expected 3 but got ${lengthAfterShrink}`);
      } else {
        console.info(`${name} - Resize shrink validation passed, got expected length 3`);
      }

    } catch (e) {
      console.info(`${name} - Error in task execution: ${e.message}`);
      if (true) {
        console.info(`${name} - Exception caught during resize call`);
      }
    }
  })
}

@Concurrent
export async function test_bitvector_getBitCountByRange_001_task(
  initialLength: number,
  elements: number[],
  elementToCount: number,
  fromIndex: number,
  toIndex: number,
  name: string,
  index: number
) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    try {
      let bitVector: collections.BitVector = new collections.BitVector(initialLength);
      console.info(`${name} - Initial BitVector length: ${bitVector.length}`);

      for (let i = 0; i < elements.length; i++) {
        const element = elements[i];
        const result = bitVector.push(element);
        console.info(`${name} - Pushed element: ${element}, returned: ${result}, current length: ${bitVector.length}`);

        if (result !== true) {
          console.info(`${name} - Push failed at index ${i}, returned: ${result}`);
        }
      }

      console.info(`${name} - Calling getBitCountByRange(${elementToCount}, ${fromIndex}, ${toIndex})`);
      const count: number = bitVector.getBitCountByRange(elementToCount, fromIndex, toIndex);
      console.info(`${name} - getBitCountByRange returned: ${count}`);

      const expectedResult = 2;

      if (count !== expectedResult) {
        console.info(`${name} - getBitCountByRange validation failed, expected ${expectedResult} but got ${count}`);
      } else {
        console.info(`${name} - getBitCountByRange validation passed, got expected count ${expectedResult}`);
      }

    } catch (e) {
      console.info(`${name} - Error in task execution: ${e.message}`);
      if (true) {
        console.info(`${name} - Exception caught during getBitCountByRange call`);
      }
    }
  })
}

@Concurrent
export async function test_bitvector_getIndexOf_001_task(
  initialLength: number,
  elements: number[],
  elementToFind: number,
  fromIndex: number,
  toIndex: number,
  name: string,
  index: number
) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    try {
      let bitVector: collections.BitVector = new collections.BitVector(initialLength);
      console.info(`${name} - Initial BitVector length: ${bitVector.length}`);

      for (let i = 0; i < elements.length; i++) {
        const element = elements[i];
        const result = bitVector.push(element);
        console.info(`${name} - Pushed element: ${element}, returned: ${result}, current length: ${bitVector.length}`);

        if (result !== true) {
          console.info(`${name} - Push failed at index ${i}, returned: ${result}`);
        }
      }

      console.info(`${name} - Calling getIndexOf(${elementToFind}, ${fromIndex}, ${toIndex})`);
      const index: number = bitVector.getIndexOf(elementToFind, fromIndex, toIndex);
      console.info(`${name} - getIndexOf returned: ${index}`);

      const expectedResult = 2;

      if (index !== expectedResult) {
        console.info(`${name} - getIndexOf validation failed, expected ${expectedResult} but got ${index}`);
      } else {
        console.info(`${name} - getIndexOf validation passed, got expected index ${expectedResult}`);
      }

    } catch (e) {
      console.info(`${name} - Error in task execution: ${e.message}`);
      if (true) {
        console.info(`${name} - Exception caught during getIndexOf call`);
      }
    }
  })
}

@Concurrent
export async function test_bitvector_getLastIndexOf_001_task(
  initialLength: number,
  elements: number[],
  elementToFind: number,
  fromIndex: number,
  toIndex: number,
  name: string,
  index: number
) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    try {
      let bitVector: collections.BitVector = new collections.BitVector(initialLength);
      console.info(`${name} - Initial BitVector length: ${bitVector.length}`);

      for (let i = 0; i < elements.length; i++) {
        const element = elements[i];
        const result = bitVector.push(element);
        console.info(`${name} - Pushed element: ${element}, returned: ${result}, current length: ${bitVector.length}`);

        if (result !== true) {
          console.info(`${name} - Push failed at index ${i}, returned: ${result}`);
        }
      }

      console.info(`${name} - Calling getLastIndexOf(${elementToFind}, ${fromIndex}, ${toIndex})`);
      const index: number = bitVector.getLastIndexOf(elementToFind, fromIndex, toIndex);
      console.info(`${name} - getLastIndexOf returned: ${index}`);

      const expectedResult = 2;

      if (index !== expectedResult) {
        console.info(`${name} - getLastIndexOf validation failed, expected ${expectedResult} but got ${index}`);
      } else {
        console.info(`${name} - getLastIndexOf validation passed, got expected index ${expectedResult}`);
      }

    } catch (e) {
      console.info(`${name} - Error in task execution: ${e.message}`);
      if (true) {
        console.info(`${name} - Exception caught during getLastIndexOf call`);
      }
    }
  })
}

@Concurrent
export async function test_bitvector_flipBitByIndex_001_task(
  initialLength: number,
  elements: number[],
  indexToFlip: number,
  name: string,
  index: number
) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    try {
      let bitVector: collections.BitVector = new collections.BitVector(initialLength);
      console.info(`${name} - Initial BitVector length: ${bitVector.length}`);

      for (let i = 0; i < elements.length; i++) {
        const element = elements[i];
        const result = bitVector.push(element);
        console.info(`${name} - Pushed element: ${element}, returned: ${result}, current length: ${bitVector.length}`);

        if (result !== true) {
          console.info(`${name} - Push failed at index ${i}, returned: ${result}`);
        }
      }

      console.info(`${name} - Calling flipBitByIndex(${indexToFlip})`);
      bitVector.flipBitByIndex(indexToFlip);
      console.info(`${name} - flipBitByIndex called successfully`);

    } catch (e) {
      console.info(`${name} - Error in task execution: ${e.message}`);
      if (true) {
        console.info(`${name} - Exception caught during flipBitByIndex call`);
      }
    }
  })
}

@Concurrent
export async function test_bitvector_flipBitsByRange_001_task(
  initialLength: number,
  elements: number[],
  fromIndex: number,
  toIndex: number,
  name: string,
  index: number
) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    try {
      let bitVector: collections.BitVector = new collections.BitVector(initialLength);
      console.info(`${name} - Initial BitVector length: ${bitVector.length}`);

      for (let i = 0; i < elements.length; i++) {
        const element = elements[i];
        const result = bitVector.push(element);
        console.info(`${name} - Pushed element: ${element}, returned: ${result}, current length: ${bitVector.length}`);

        if (result !== true) {
          console.info(`${name} - Push failed at index ${i}, returned: ${result}`);
        }
      }

      console.info(`${name} - Calling flipBitsByRange(${fromIndex}, ${toIndex})`);
      bitVector.flipBitsByRange(fromIndex, toIndex);
      console.info(`${name} - flipBitsByRange called successfully`);

    } catch (e) {
      console.info(`${name} - Error in task execution: ${e.message}`);
      if (true) {
        console.info(`${name} - Exception caught during flipBitsByRange call`);
      }
    }
  })
}

@Concurrent
export async function test_bitvector_values_001_task(
  initialLength: number,
  elements: number[],
  name: string,
  index: number
) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    try {
      // 创建初始长度为0的BitVector
      let bitVector: collections.BitVector = new collections.BitVector(initialLength);
      console.info(`${name} - Initial BitVector length: ${bitVector.length}`);

      // 按照固定顺序 push 元素 [0, 1, 0, 1, 0]
      for (let i = 0; i < elements.length; i++) {
        const element = elements[i];
        const result = bitVector.push(element);
        console.info(`${name} - Pushed element: ${element}, returned: ${result}, current length: ${bitVector.length}`);

        // 使用 if 判断代替 expect
        if (result !== true) {
          console.info(`${name} - Push failed at index ${i}, returned: ${result}`);
        }
      }

      console.info(`${name} - Calling values()`);
      const iter: IterableIterator<number> = bitVector.values();
      console.info(`${name} - values() iterator obtained`);

      let temp: IteratorResult<number> = iter.next();
      let output: string[] = [];
      while (!temp.done) {
        const value = temp.value;
        console.info(JSON.stringify(value));
        output.push(JSON.stringify(value));
        temp = iter.next();
      }

      const expectedOutputCount = elements.length;
      console.info(`${name} - Iterated through ${output.length} elements`);

      if (output.length !== expectedOutputCount) {
        console.info(`${name} - Values iteration validation failed, expected ${expectedOutputCount} elements but got ${output.length}`);
      } else {
        console.info(`${name} - Values iteration validation passed, iterated through ${output.length} elements as expected`);
      }

    } catch (e) {
      console.info(`${name} - Error in task execution: ${e.message}`);
    }
  })
}

@Concurrent
export async function test_bitvector_index_accessor_001_task(
  initialLength: number,
  elements: number[],
  indexToAccess: number,
  name: string,
  index: number
) {
  await ArkTSUtils.locks.AsyncLock.request(name).lockAsync(() => {
    try {
      let bitVector: collections.BitVector = new collections.BitVector(initialLength);
      console.info(`${name} - Initial BitVector length: ${bitVector.length}`);

      for (let i = 0; i < elements.length; i++) {
        const element = elements[i];
        const result = bitVector.push(element);
        console.info(`${name} - Pushed element: ${element}, returned: ${result}, current length: ${bitVector.length}`);

        if (result !== true) {
          console.info(`${name} - Push failed at index ${i}, returned: ${result}`);
        }
      }

      console.info(`${name} - Accessing bitVector[${indexToAccess}] (expected: 1)`);
      const value = bitVector[indexToAccess];
      console.info(`${name} - bitVector[${indexToAccess}] = ${value}`);

      const expectedResult = 1;

      if (value !== expectedResult) {
        console.info(`${name} - Index access validation failed, expected ${expectedResult} but got ${value}`);
      } else {
        console.info(`${name} - Index access validation passed, got expected value ${expectedResult}`);
      }

    } catch (e) {
      console.info(`${name} - Error in task execution: ${e.message}`);
      if (true) {
        console.info(`${name} - Exception caught during index access`);
      }
    }
  })
}
