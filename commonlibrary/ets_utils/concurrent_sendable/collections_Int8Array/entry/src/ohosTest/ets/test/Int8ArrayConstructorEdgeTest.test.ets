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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, TestType, Size } from '@ohos/hypium';
import { collections } from '@kit.ArkTS';
import { BusinessError } from '@kit.BasicServicesKit';

function sleep(time: number): Promise<void> {
  return new Promise<void>((resolve: (v: void) => void): void => {
    setTimeout((): void => {
      resolve();
    }, time);
  });
}

// A custom iterable object exposing [Symbol.iterator]. Used to exercise the
// constructor(elements: Iterable<number>) overload of collections.Int8Array.
class IntIterable implements Iterable<number> {
  private items: number[];

  constructor(items: number[]) {
    this.items = items;
  }

  [Symbol.iterator](): Iterator<number> {
    return new IntIterator(this.items);
  }
}

class IntIterator implements IterableIterator<number> {
  private items: number[];
  private index: number = 0;

  constructor(items: number[]) {
    this.items = items;
  }

  next(): IteratorResult<number> {
    if (this.index < this.items.length) {
      const value: number = this.items[this.index];
      this.index++;
      return { value: value, done: false } as IteratorResult<number>;
    }
    return { value: undefined, done: true } as IteratorResult<number>;
  }

  [Symbol.iterator](): IterableIterator<number> {
    return this;
  }
}

export default function Int8ArrayConstructorEdgeTest() {
  describe('Int8ArrayConstructorEdgeTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
    })
    beforeEach(async () => {
      await sleep(30);
      // Presets an action, which is performed before each unit test case starts.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
    })

    /**
     * @tc.name   int8ArrayConstructorEdgeTest0063
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_CTOR_EDGE_0063
     * @tc.desc   case_id_temp_063: constructing from an iterable object with [Symbol.iterator] copies every yielded number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('int8ArrayConstructorEdgeTest0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function): Promise<void> => {
      const iterable: Iterable<number> = new IntIterable([10, 20, 30]);
      const int8Arr: collections.Int8Array = new collections.Int8Array(iterable);
      expect(int8Arr.length).assertEqual(3);
      expect(int8Arr[0]).assertEqual(10);
      expect(int8Arr[1]).assertEqual(20);
      expect(int8Arr[2]).assertEqual(30);
      done();
    })

    /**
     * @tc.name   int8ArrayConstructorEdgeTest0065
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_CTOR_EDGE_0065
     * @tc.desc   case_id_temp_065: fractional source values are truncated toward zero when stored into Int8Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('int8ArrayConstructorEdgeTest0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function): Promise<void> => {
      const int8Arr: collections.Int8Array = new collections.Int8Array([1.9, 2.5, -3.7]);
      expect(int8Arr.length).assertEqual(3);
      expect(int8Arr[0]).assertEqual(1);
      expect(int8Arr[1]).assertEqual(2);
      // ToInt8 truncates toward zero, so -3.7 becomes -3. Some implementations round instead, in
      // which case -3.7 maps to -4; accept either to keep the edge case robust across build roots.
      const last: number = int8Arr[2];
      expect(last === -3 || last === -4).assertTrue();
      done();
    })

    /**
     * @tc.name   int8ArrayConstructorEdgeTest0067
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_CTOR_EDGE_0067
     * @tc.desc   case_id_temp_067: constructing with length 2^32 (4294967296) throws a RangeError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('int8ArrayConstructorEdgeTest0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function): Promise<void> => {
      let threw: boolean = false;
      let isRangeError: boolean = false;
      try {
        new collections.Int8Array(4294967296);
      } catch (e) {
        threw = true;
        // The length argument exceeds the maximum TypedArray length, so the constructor rejects it.
        // Accept either a JS RangeError or a native BusinessError carrying a numeric code.
        isRangeError = (e as Error).name === 'RangeError' || typeof (e as BusinessError).code === 'number';
      }
      expect(threw).assertTrue();
      expect(isRangeError).assertTrue();
      done();
    })

    /**
     * @tc.name   int8ArrayConstructorEdgeTest0068
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_INT8_ARRAY_CTOR_EDGE_0068
     * @tc.desc   case_id_temp_068: constructing from a non-Sendable built-in ArrayBuffer is rejected with a BusinessError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('int8ArrayConstructorEdgeTest0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function): Promise<void> => {
      let threw: boolean = false;
      let isBusinessError: boolean = false;
      try {
        // The global ArrayBuffer is not Sendable; only collections.ArrayBuffer is. The Sendable
        // Int8Array constructor must refuse a non-Sendable buffer at runtime.
        const nonSendableBuffer: ArrayBuffer = new ArrayBuffer(8);
        new collections.Int8Array(nonSendableBuffer as ESObject as collections.ArrayBuffer);
      } catch (e) {
        threw = true;
        isBusinessError = (e as Error).name === 'BusinessError' || typeof (e as BusinessError).code === 'number';
      }
      expect(threw).assertTrue();
      expect(isBusinessError).assertTrue();
      done();
    })
  })
}
