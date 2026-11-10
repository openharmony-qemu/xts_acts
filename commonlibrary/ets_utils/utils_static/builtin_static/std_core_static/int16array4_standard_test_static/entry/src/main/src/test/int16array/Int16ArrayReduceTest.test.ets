'use static';

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

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '@ohos/hypium-static/src/main/indexStatic';

import Utils from './../Util.test';

class ReducePart01Stats {
  sum: number = 0;
  count: number = 0;
}

class ReducePart01Box {
  value: number = 0;
}

class ReduceP03Accumulator { sum: number = 0; count: number = 0; }

class ReduceP03Box { value: number = 0; }

class ReduceP03Acc { sum: number = 0; }

class ReduceP03ImmBox { value: number = 0; }

class ReduceP03TimeBox { t: number = 0; }

class ReducePart04AccBox {
  sum: number = 0;
  cnt: number = 0;
}

class ReducePart04Box {
  val: number = 0;
}

class ReducePart04Tag {
  id: number = 0;
  name: string = "";
}

function sumCallbackInt16ArrayReducePart04Test008(prev: number, curr: number, idx: int, a: Int16Array): number {
  return prev + curr;
}

export default function Int16ArrayReduceTest(): void {
  describe('Int16ArrayReduceTest', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REDUCE_0100
     * @tc.name testReduceGeneral001
     * @tc.desc Verify reduce accumulation results for normal arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReduceGeneral001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr: Int16Array = Int16Array.of(5, 10);
        let capturedPrevRound2: number = 0;
        arr.reduce<number>((prev: number, curr: number, idx: int, a: Int16Array): number => {
          if (idx === 1) { capturedPrevRound2 = prev; }
          return prev + curr;
        }, 3);
        expect(capturedPrevRound2).assertEqual(8);

      }
      {
        let arr: Int16Array = new Int16Array(0);
        let called: boolean = false;
        let result: number = arr.reduce<number>((prev: number, curr: number, idx: int, a: Int16Array): number => {
          called = true;
          return prev + curr;
        }, 99);
        expect(called).assertFalse();
        expect(result).assertEqual(99);

      }
      {
        let arr: Int16Array = Int16Array.of(7);
        let callCount: number = 0;
        let result: number = arr.reduce<number>((prev: number, curr: number, idx: int, a: Int16Array): number => {
          callCount++;
          return prev + curr;
        }, 10);
        expect(callCount).assertEqual(1);
        expect(result).assertEqual(17);

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let externalOffset: number = 5;
        let result: number = arr.reduce<number>((prev: number, curr: number, idx: int, a: Int16Array): number => prev + curr + externalOffset, 0);
        expect(result).assertEqual(21);

      }
      {
        let arr: Int16Array = new Int16Array(0);
        let result: number = arr.reduce<number>((prev: number, curr: number, idx: int, a: Int16Array): number => prev + curr, 0);
        expect(result).assertEqual(0);

      }
      {
        let arr: Int16Array = Int16Array.of(9);
        let result: number = arr.reduce<number>((prev: number, curr: number, idx: int, a: Int16Array): number => prev + curr, 0);
        expect(result).assertEqual(9);

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2);
        let result: number = arr.reduce<number>((prev: number, curr: number, idx: int, a: Int16Array): number => prev + curr, 5e-324);
        let resultValue1: boolean = result > 3.0;
        expect(resultValue1).assertFalse();

      }
      {
        let arr: Int16Array = new Int16Array(0);
        let result: string = arr.reduce<string>((prev: string, curr: number, idx: int, a: Int16Array): string => prev + curr.toString(), "");
        expect(result).assertEqual("");

      }
      {
        let arr: Int16Array = new Int16Array(0);
        let result: string = arr.reduce<string>((prev: string, curr: number, idx: int, a: Int16Array): string => prev + curr.toString(), "hello");
        expect(result).assertEqual("hello");

      }
      {
        let arr: Int16Array = Int16Array.of(1, -1, 3);
        let result: boolean = arr.reduce<boolean>((prev: boolean, curr: number, idx: int, a: Int16Array): boolean => prev && curr > 0, true);
        expect(result).assertFalse();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REDUCE_0200
     * @tc.name testReduceGeneral002
     * @tc.desc Verify reduce accumulation results for normal arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReduceGeneral002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr: Int16Array = Int16Array.of(0, 0, 1);
        let result: boolean = arr.reduce<boolean>((prev: boolean, curr: number, idx: int, a: Int16Array): boolean => prev || curr !== 0, false);
        expect(result).assertTrue();

      }
      {
        let arr: Int16Array = Int16Array.of(0, 0, 0);
        let result: boolean = arr.reduce<boolean>((prev: boolean, curr: number, idx: int, a: Int16Array): boolean => prev || curr !== 0, false);
        expect(result).assertFalse();

      }
      {
        let arr: Int16Array = new Int16Array(0);
        let result: boolean = arr.reduce<boolean>((prev: boolean, curr: number, idx: int, a: Int16Array): boolean => prev && curr > 0, true);
        expect(result).assertTrue();

      }
      {
        let arr: Int16Array = new Int16Array(0);
        let result: boolean = arr.reduce<boolean>((prev: boolean, curr: number, idx: int, a: Int16Array): boolean => prev || curr > 0, false);
        expect(result).assertFalse();

      }
      {
        let arr: Int16Array = new Int16Array(0);
        let initVal: number = 42;
        let result: number = arr.reduce<number>((prev: number, curr: number, idx: int, a: Int16Array): number => prev + curr, initVal);
        expect(result).assertEqual(initVal);

      }
      {
        let arr = new Int16Array([1, 2, 3, 4]);
        let result = arr.reduce((prev, curr, idx, array) => prev + curr);
        expect(result).assertEqual(10);

      }
      {
        let arr = new Int16Array([100, 1, 1]);
        let orderTrace: number[] = [];
        arr.reduce((prev, curr, idx, array) => {
          orderTrace.push(curr);
          return prev - curr;
        });
        let resultValue1: number = orderTrace[0];
        let expectedValue1: number = 1;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = orderTrace[1];
        let expectedValue2: number = 1;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let result = arr.reduce<number>((prev: number, curr: number, idx: int, a: Int16Array): number => {
          if (idx === 2) { a.$_set(0, 999); }
          return prev + curr;
        }, 0);
        expect(result).assertEqual(6);
        let resultValue1: number = arr.$_get(0);
        let expectedValue1: int = 999;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let trace: number[] = [];
        arr.reduce<number>((prev: number, curr: number, idx: int, a: Int16Array): number => {
          trace.push(curr);
          return prev + curr;
        }, 0);
        let resultValue1: int = trace.length;
        let expectedValue1: int = 3;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = trace[0];
        let expectedValue2: int = 1;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = trace[2];
        let expectedValue3: int = 3;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        let arr: Int16Array = new Int16Array(0);
        let init: ReduceP03Box = new ReduceP03Box();
        init.value = 42;
        let result = arr.reduce<ReduceP03Box>((prev: ReduceP03Box, curr: number, idx: int, a: Int16Array): ReduceP03Box => {
          prev.value = prev.value + curr;
          return prev;
        }, init);
        let resultValue1: boolean = result === init;
        expect(resultValue1).assertTrue();
        let resultValue2: number = result.value;
        let expectedValue2: int = 42;
        expect(resultValue2).assertEqual(expectedValue2);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REDUCE_0300
     * @tc.name testReduceGeneral003
     * @tc.desc Verify reduce accumulation results for normal arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReduceGeneral003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr: Int16Array = new Int16Array(0);
        let result: number = arr.reduce<number>((prev: number, curr: number, idx: int, a: Int16Array): number => prev + curr, 42);
        expect(result).assertEqual(42);

      }
      {
        let arr = Int16Array.of(0, 1, 2);
        let r = arr.reduce((prev, curr, idx, a) => prev + curr);
        let resultValue1: boolean = r >= 0;
        expect(resultValue1).assertTrue();

      }
      {
        let arr = Int16Array.of(1, 1);
        let r = arr.reduce<number>((prev, curr, idx, a) => prev + curr, 0.5);
        expect(r).assertEqual(2.5);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REDUCE_0400
     * @tc.name testReduceCallback001
     * @tc.desc Verify reduce callback parameters traversal order and invocation counts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReduceCallback001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr: Int16Array = Int16Array.of(42, 99);
        let captured: number = 0;
        arr.reduce<number>((prev: number, curr: number, idx: int, a: Int16Array): number => {
          if (idx === 0) { captured = curr; }
          return prev + curr;
        }, 0);
        expect(captured).assertEqual(42);

      }
      {
        let arr: Int16Array = Int16Array.of(7, 13);
        let captured: number = 0;
        arr.reduce<number>((prev: number, curr: number, idx: int, a: Int16Array): number => {
          if (idx === 1) { captured = curr; }
          return prev + curr;
        }, 0);
        expect(captured).assertEqual(13);

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
        let captured: number = 0;
        arr.reduce<number>((prev: number, curr: number, idx: int, a: Int16Array): number => {
          if (idx === 4) { captured = curr; }
          return prev + curr;
        }, 0);
        expect(captured).assertEqual(5);

      }
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30);
        let capturedIdx: number = -1;
        arr.reduce<number>((prev: number, curr: number, idx: int, a: Int16Array): number => {
          capturedIdx = idx;
          return prev + curr;
        }, 0);
        expect(capturedIdx).assertEqual(2);

      }
      {
        let arr: Int16Array = Int16Array.of(7);
        let capturedPrev: number = 0;
        arr.reduce<number>((prev: number, curr: number, idx: int, a: Int16Array): number => {
          capturedPrev = prev;
          return prev + curr;
        }, 100);
        expect(capturedPrev).assertEqual(100);

      }
      {
        let arr = new Int16Array([1, 2, 3]);
        let result = arr.reduce((prev, curr, idx, array) => prev + curr);
        expect(result).assertEqual(6);

      }
      {
        let arr = new Int16Array([100, 30, 20]);
        let result = arr.reduce((prev, curr, idx, array) => prev - curr);
        expect(result).assertEqual(50);

      }
      {
        let arr = new Int16Array([2, 3, 4]);
        let result = arr.reduce((prev, curr, idx, array) => prev * curr);
        expect(result).assertEqual(24);

      }
      {
        let arr = new Int16Array([100, 2, 5]);
        let result = arr.reduce((prev, curr, idx, array) => prev / curr);
        expect(result).assertEqual(10);

      }
      {
        let arr = new Int16Array([1, 2, 4]);
        let result = arr.reduce((prev, curr, idx, array) => prev | curr);
        expect(result).assertEqual(7);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REDUCE_0500
     * @tc.name testReduceCallback002
     * @tc.desc Verify reduce callback parameters traversal order and invocation counts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReduceCallback002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr = new Int16Array([7, 3, 5]);
        let result = arr.reduce((prev, curr, idx, array) => prev ^ curr);
        expect(result).assertEqual(1);

      }
      {
        let arr = new Int16Array([1, 2, 3]);
        let result = arr.reduce((prev, curr, idx, array) => 0);
        expect(result).assertEqual(0);

      }
      {
        let arr = new Int16Array([10, 20]);
        let accessedAll = false;
        arr.reduce((prev, curr, idx, array) => {
          if (prev === 10 && curr === 20 && idx === 1 && array.length === 2) {
            accessedAll = true;
          }
          return prev + curr;
        });
        expect(accessedAll).assertTrue();

      }
      {
        let arr = new Int16Array([100, 200, 300]);
        let firstIdx: int = -1;
        arr.reduce((prev, curr, idx, array) => {
          if (firstIdx === -1) {
            firstIdx = idx;
          }
          return prev + curr;
        });
        expect(firstIdx).assertEqual(1);

      }
      {
        let arr = new Int16Array([1, 2, 3, 4, 5]);
        let indices: int[] = [];
        arr.reduce((prev, curr, idx, array) => {
          indices.push(idx);
          return prev + curr;
        });
        let resultValue1: number = indices[0];
        let expectedValue1: int = 1;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = indices[1];
        let expectedValue2: int = 2;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = indices[2];
        let expectedValue3: int = 3;
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: number = indices[3];
        let expectedValue4: int = 4;
        expect(resultValue4).assertEqual(expectedValue4);

      }
      {
        let arr = new Int16Array([1, 2, 3, 4]);
        let capturedLength: int = 0;
        arr.reduce((prev, curr, idx, array) => {
          capturedLength = array.length;
          return prev + curr;
        });
        expect(capturedLength).assertEqual(4);

      }
      {
        let arr = new Int16Array([42, 10]);
        let firstPrev: number = 0;
        arr.reduce((prev, curr, idx, array) => {
          firstPrev = prev;
          return prev + curr;
        });
        expect(firstPrev).assertEqual(42);

      }
      {
        let arr = new Int16Array([5, 99]);
        let firstCurr: number = 0;
        arr.reduce((prev, curr, idx, array) => {
          firstCurr = curr;
          return prev + curr;
        });
        expect(firstCurr).assertEqual(99);

      }
      {
        let arr = new Int16Array([10, 20]);
        let callCount = 0;
        arr.reduce((prev, curr, idx, array) => {
          callCount++;
          return prev + curr;
        });
        expect(callCount).assertEqual(1);

      }
      {
        let arr = new Int16Array([1, 2, 3, 4, 5]);
        let callCount = 0;
        arr.reduce((prev, curr, idx, array) => {
          callCount++;
          return prev + curr;
        });
        expect(callCount).assertEqual(4);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REDUCE_0600
     * @tc.name testReduceCallback003
     * @tc.desc Verify reduce callback parameters traversal order and invocation counts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReduceCallback003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30);
        let indices: number[] = [];
        arr.reduce<number>((prev: number, curr: number, idx: int, a: Int16Array): number => {
          indices.push(idx);
          return prev + curr;
        }, 0);
        let resultValue1: number = indices[0];
        let expectedValue1: int = 0;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = indices[1];
        let expectedValue2: int = 1;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = indices[2];
        let expectedValue3: int = 2;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        let arr = Int16Array.of(10, 20, 30);
        let idxNoInit: int = -1;
        let idxWithInit: int = -1;
        arr.reduce((prev, curr, idx, a) => { if (idxNoInit === -1) { idxNoInit = idx; } return prev + curr; });
        arr.reduce<number>((prev, curr, idx, a) => { if (idxWithInit === -1) { idxWithInit = idx; } return prev + curr; }, 0);
        expect(idxNoInit).assertEqual(1);
        expect(idxWithInit).assertEqual(0);

      }
      {
        let arr = Int16Array.of(42, 99);
        let prevNoInit: number = 0;
        let prevWithInit: number = 0;
        arr.reduce((prev, curr, idx, a) => { prevNoInit = prev; return prev + curr; });
        arr.reduce<number>((prev, curr, idx, a) => { prevWithInit = prev; return prev + curr; }, 100);
        expect(prevNoInit).assertEqual(42);
        expect(prevWithInit).assertEqual(142);

      }
      {
        let arr = Int16Array.of(1, 2, 3, 4);
        let cntNoInit: number = 0;
        let cntWithInit: number = 0;
        arr.reduce((prev, curr, idx, a) => { cntNoInit++; return prev + curr; });
        arr.reduce<number>((prev, curr, idx, a) => { cntWithInit++; return prev + curr; }, 0);
        expect(cntNoInit).assertEqual(3);
        expect(cntWithInit).assertEqual(4);

      }
      {
        let arr = Int16Array.of(5, 5);
        let c1: number = 0;
        let c2: number = 0;
        arr.reduce((prev, curr, idx, a) => { c1++; return prev + curr; });
        arr.reduce<number>((prev, curr, idx, a) => { c2++; return prev + curr; }, 0);
        expect(c1).assertEqual(1);
        expect(c2).assertEqual(2);

      }
      {
        let arr = Int16Array.of(1, 2, 3);
        let ref0: Int16Array | null = null;
        let ref1: Int16Array | null = null;
        arr.reduce<number>((prev, curr, idx, a) => {
          if (idx === 0) { ref0 = a; }
          if (idx === 1) { ref1 = a; }
          return prev + curr;
        }, 0);
        let resultValue1: boolean = ref0 === ref1;
        expect(resultValue1).assertTrue();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REDUCE_0700
     * @tc.name testReduceSingle001
     * @tc.desc Verify reduce on single-element arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReduceSingle001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let called = false;
        let arr = new Int16Array([0]);
        let result = arr.reduce((prev, curr, idx, array) => {
          called = true;
          return prev + curr;
        });
        expect(result).assertEqual(0);
        expect(called).assertFalse();

      }
      {
        let arr = new Int16Array([1]);
        let result = arr.reduce((prev, curr, idx, array) => prev + curr);
        expect(result).assertEqual(1);

      }
      {
        let arr = new Int16Array([-1]);
        let result = arr.reduce((prev, curr, idx, array) => prev + curr);
        expect(result).assertEqual(-1);

      }
      {
        let arr = Int16Array.of(7);
        let cntNoInit: number = 0;
        let cntWithInit: number = 0;
        arr.reduce((prev, curr, idx, a) => { cntNoInit++; return prev + curr; });
        arr.reduce<number>((prev, curr, idx, a) => { cntWithInit++; return prev + curr; }, 0);
        expect(cntNoInit).assertEqual(0);
        expect(cntWithInit).assertEqual(1);

      }
      {
        let arr = Int16Array.of(5);
        let r1 = arr.reduce((prev, curr, idx, a) => prev + curr);
        let r2 = arr.reduce<number>((prev, curr, idx, a) => prev + curr, 10);
        expect(r1).assertEqual(5);
        expect(r2).assertEqual(15);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REDUCE_0800
     * @tc.name testReduceImmunity001
     * @tc.desc Verify reduce leaves the source array buffer and views unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReduceImmunity001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let buf = new ArrayBuffer(6);
        let arr = new Int16Array(buf, 0, 3);
        arr.$_set(0, 10);
        arr.$_set(1, 20);
        arr.$_set(2, 30);
        let result = arr.reduce((prev, curr, idx, array) => prev + curr);
        expect(result).assertEqual(60);

      }
      {
        let arr = new Int16Array([3, 5, 7]);
        arr.reduce((prev, curr, idx, array) => prev + curr);
        let resultValue1: number = arr.$_get(0);
        let expectedValue1: int = 3;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = arr.$_get(1);
        let expectedValue2: int = 5;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = arr.$_get(2);
        let expectedValue3: int = 7;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        let buf = new ArrayBuffer(10);
        let parent = new Int16Array(buf, 0, 5);
        parent.$_set(0, 1); parent.$_set(1, 2); parent.$_set(2, 3); parent.$_set(3, 4); parent.$_set(4, 5);
        let child = new Int16Array(buf, 2, 3);
        let r = child.reduce((prev, curr, idx, a) => prev + curr);
        expect(r).assertEqual(9);
        let resultValue1: number = parent.$_get(2);
        let expectedValue1: int = 3;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = parent.$_get(3);
        let expectedValue2: int = 4;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = parent.$_get(4);
        let expectedValue3: int = 5;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        let buf = new ArrayBuffer(8);
        let a = new Int16Array(buf, 0, 2);
        let b = new Int16Array(buf, 2, 2);
        a.$_set(0, 10); a.$_set(1, 20);
        b.$_set(0, 30); b.$_set(1, 40);
        a.reduce<number>((prev, curr, idx, ax) => prev + curr, 0);
        let resultValue1: number = b.$_get(0);
        let expectedValue1: int = 30;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = b.$_get(1);
        let expectedValue2: int = 40;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let buf = new ArrayBuffer(8);
        let a = new Int16Array(buf, 0, 2);
        let b = new Int16Array(buf, 4, 2);
        a.$_set(0, 1); a.$_set(1, 2);
        b.$_set(0, 3); b.$_set(1, 4);
        a.reduce((prev, curr, idx, ax) => prev + curr);
        let resultValue1: int = b.byteOffset;
        let expectedValue1: int = 4;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let buf = new ArrayBuffer(6);
        let a = new Int16Array(buf, 0, 2);
        let b = new Int16Array(buf, 2, 1);
        a.$_set(0, 5); a.$_set(1, 6);
        b.$_set(0, 7);
        a.reduce((prev, curr, idx, ax) => prev + curr);
        let resultValue1: boolean = b.buffer === buf;
        expect(resultValue1).assertTrue();

      }
      {
        let arr = Int16Array.of(1, 2, 3);
        let isSame: boolean = false;
        arr.reduce<number>((prev, curr, idx, a) => {
          if (idx === 0) { isSame = (a === arr); }
          return prev + curr;
        }, 0);
        expect(isSame).assertTrue();

      }
      {
        let buf = new ArrayBuffer(10);
        let a = new Int16Array(buf, 0, 3);
        let b = new Int16Array(buf, 6, 2);
        a.$_set(0, 1); a.$_set(1, 2); a.$_set(2, 3);
        b.$_set(0, 7); b.$_set(1, 8);
        a.reduce((prev, curr, idx, ax) => prev + curr);
        let resultValue1: int = b.length;
        let expectedValue1: int = 2;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr = Int16Array.of(1, 2, 3, 4);
        let r = arr.reduce<number>((prev, curr, idx, a) => {
          if (idx === 0) { a.$_set(2, 99); }
          return prev + curr;
        }, 0);
        expect(r).assertEqual(106);

      }
      {
        let arr1 = Int16Array.of(1, 2, 3);
        let buf = new ArrayBuffer(6);
        let arr2 = new Int16Array(buf, 0, 3);
        arr2.$_set(0, 1); arr2.$_set(1, 2); arr2.$_set(2, 3);
        let resultValue1: number = arr1.reduce((prev, curr, idx, a) => prev + curr);
        let expectedValue1: number = arr2.reduce((prev, curr, idx, a) => prev + curr);
        expect(resultValue1).assertEqual(expectedValue1);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REDUCE_0900
     * @tc.name testReduceImmunity002
     * @tc.desc Verify reduce leaves the source array buffer and views unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReduceImmunity002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let buf = new ArrayBuffer(8);
        let a = new Int16Array(buf, 0, 2);
        let b = new Int16Array(buf, 4, 2);
        a.$_set(0, 1); a.$_set(1, 2);
        b.$_set(0, 10); b.$_set(1, 20);
        let ra = a.reduce<number>((prev, curr, idx, ax) => prev + curr, 0);
        let rb = b.reduce<number>((prev, curr, idx, ax) => prev + curr, 0);
        expect(ra).assertEqual(3);
        expect(rb).assertEqual(30);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REDUCE_1000
     * @tc.name testReduceBoundary001
     * @tc.desc Verify reduce with Int16 boundary and special numeric values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReduceBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let result: number = arr.reduce<number>((prev: number, curr: number, idx: int, a: Int16Array): number => prev + curr, 32767);
        expect(result).assertEqual(32773);

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let result: number = arr.reduce<number>((prev: number, curr: number, idx: int, a: Int16Array): number => prev + curr, -32768);
        expect(result).assertEqual(-32762);

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let result: number = arr.reduce<number>((prev: number, curr: number, idx: int, a: Int16Array): number => prev + curr, Double.NEGATIVE_INFINITY);
        expect(result).assertEqual(Double.NEGATIVE_INFINITY);

      }
      {
        let arr: Int16Array = Int16Array.of(-5, 10, 3, 20, 7);
        let result: number = arr.reduce<number>((prev: number, curr: number, idx: int, a: Int16Array): number => prev > curr ? prev : curr, Double.NEGATIVE_INFINITY);
        expect(result).assertEqual(20);

      }
      {
        let arr = new Int16Array([5, 12, 3, 9]);
        let result = arr.reduce((prev, curr, idx, array) => Math.max(prev, curr));
        expect(result).assertEqual(12);

      }
      {
        let arr = new Int16Array([5, 12, 3, 9]);
        let result = arr.reduce((prev, curr, idx, array) => Math.min(prev, curr));
        expect(result).assertEqual(3);

      }
      {
        let arr = new Int16Array([1, 2]);
        let result = arr.reduce((prev, curr, idx, array) => Double.NEGATIVE_INFINITY);
        expect(result).assertEqual(Double.NEGATIVE_INFINITY);

      }
      {
        let arr = new Int16Array([32767]);
        let result = arr.reduce((prev, curr, idx, array) => prev + curr);
        expect(result).assertEqual(32767);

      }
      {
        let arr = new Int16Array([-32768]);
        let result = arr.reduce((prev, curr, idx, array) => prev + curr);
        expect(result).assertEqual(-32768);

      }
      {
        let arr = new Int16Array([32767, -32768]);
        let result = arr.reduce((prev, curr, idx, array) => prev + curr);
        expect(result).assertEqual(-1);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REDUCE_1100
     * @tc.name testReduceBoundary002
     * @tc.desc Verify reduce with Int16 boundary and special numeric values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReduceBoundary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr = new Int16Array([32767, 32767]);
        let midVal: number = 0;
        arr.reduce((prev, curr, idx, array) => {
          midVal = prev + curr;
          return midVal;
        });
        expect(midVal).assertEqual(65534);

      }
      {
        let arr = new Int16Array([32767, 1, 2]);
        let firstPrev: number = 0;
        arr.reduce((prev, curr, idx, array) => {
          firstPrev = prev;
          return prev + curr;
        });
        expect(firstPrev).assertEqual(32768);

      }
      {
        let arr = new Int16Array([-32768, 1, 2]);
        let firstPrev: number = 0;
        arr.reduce((prev, curr, idx, array) => {
          firstPrev = prev;
          return prev + curr;
        });
        expect(firstPrev).assertEqual(-32767);

      }
      {
        let arr = new Int16Array([Double.NEGATIVE_INFINITY, 5]);
        let result = arr.reduce((prev, curr, idx, array) => prev + curr);
        expect(result).assertEqual(5);

      }
      {
        let arr: Int16Array = Int16Array.of(-32768, 1);
        let captured: number = 0;
        arr.reduce<string>((prev: string, curr: number, idx: int, a: Int16Array): string => {
          if (idx === 0) { captured = curr; }
          return prev + curr.toString();
        }, "");
        expect(captured).assertEqual(-32768);

      }
      {
        let arr: Int16Array = Int16Array.of(32767, 0);
        let captured: number = 0;
        arr.reduce<string>((prev: string, curr: number, idx: int, a: Int16Array): string => {
          if (idx === 0) { captured = curr; }
          return prev + curr.toString();
        }, "");
        expect(captured).assertEqual(32767);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REDUCE_1200
     * @tc.name testReduceOverload001
     * @tc.desc Verify reduce overload resolution between no-init and with-init forms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReduceOverload001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr = Int16Array.of(10, 20, 30);
        let r1 = arr.reduce(sumCallbackInt16ArrayReducePart04Test008);
        let r2 = arr.reduce<number>(sumCallbackInt16ArrayReducePart04Test008, 0);
        expect(r1).assertEqual(60);
        expect(r2).assertEqual(60);

      }
      {
        let arr = Int16Array.of(3, 6, 9);
        arr.reduce((prev, curr, idx, a) => prev + curr);
        let resultValue1: number = arr.$_get(0);
        let expectedValue1: int = 3;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = arr.$_get(1);
        let expectedValue2: int = 6;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = arr.$_get(2);
        let expectedValue3: int = 9;
        expect(resultValue3).assertEqual(expectedValue3);
        arr.reduce<number>((prev, curr, idx, a) => prev + curr, 0);
        let resultValue4: number = arr.$_get(0);
        let expectedValue4: int = 3;
        expect(resultValue4).assertEqual(expectedValue4);
        let resultValue5: number = arr.$_get(1);
        let expectedValue5: int = 6;
        expect(resultValue5).assertEqual(expectedValue5);
        let resultValue6: number = arr.$_get(2);
        let expectedValue6: int = 9;
        expect(resultValue6).assertEqual(expectedValue6);

      }
      {
        let arr = Int16Array.of(1, 2, 3);
        arr.reduce((prev, curr, idx, a) => prev + curr);
        let resultValue1: int = arr.length;
        let expectedValue1: int = 3;
        expect(resultValue1).assertEqual(expectedValue1);
        arr.reduce<number>((prev, curr, idx, a) => prev + curr, 0);
        let resultValue2: int = arr.length;
        let expectedValue2: int = 3;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let arr = Int16Array.of(1, 2, 3, 4, 5);
        let origByteLen: number = arr.byteLength;
        arr.reduce((prev, curr, idx, a) => prev + curr);
        let resultValue1: int = arr.byteLength;
        let expectedValue1: number = origByteLen;
        expect(resultValue1).assertEqual(expectedValue1);
        arr.reduce<number>((prev, curr, idx, a) => prev + curr, 0);
        let resultValue2: int = arr.byteLength;
        let expectedValue2: number = origByteLen;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let arr = Int16Array.of(1, 2, 3);
        let r1 = arr.reduce((prev, curr, idx, a) => prev + curr);
        let r2 = arr.reduce<number>((prev, curr, idx, a) => prev + curr, 0);
        let resultValue1: boolean = isFinite(r1);
        expect(resultValue1).assertTrue();
        let resultValue2: boolean = isFinite(r2);
        expect(resultValue2).assertTrue();

      }
      {
        let arr = Int16Array.of(1, 2, 3);
        arr.reduce((prev, curr, idx, a) => prev + curr);
        let ts1: string = arr.toString();
        let arr2 = Int16Array.of(1, 2, 3);
        arr2.reduce<number>((prev, curr, idx, a) => prev + curr, 0);
        let ts2: string = arr2.toString();
        expect(ts1).assertEqual(ts2);

      }
      {
        let arr = Int16Array.of(1, 2, 3, 4);
        arr.reduce((prev, curr, idx, a) => prev + curr);
        let resultValue1: int = arr.length;
        let expectedValue1: int = 4;
        expect(resultValue1).assertEqual(expectedValue1);
        arr.reduce<number>((prev, curr, idx, a) => prev + curr, 0);
        let resultValue2: int = arr.length;
        let expectedValue2: int = 4;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let arr = Int16Array.of(1, 2);
        arr.reduce((prev, curr, idx, a) => prev + curr);
        let resultValue1: int = arr.BYTES_PER_ELEMENT;
        let expectedValue1: int = 2;
        expect(resultValue1).assertEqual(expectedValue1);
        arr.reduce<number>((prev, curr, idx, a) => prev + curr, 0);
        let resultValue2: int = arr.BYTES_PER_ELEMENT;
        let expectedValue2: int = 2;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let buf = new ArrayBuffer(10);
        let arr = new Int16Array(buf, 2, 3);
        arr.$_set(0, 1); arr.$_set(1, 2); arr.$_set(2, 3);
        let origOff: number = arr.byteOffset;
        arr.reduce((prev, curr, idx, a) => prev + curr);
        let resultValue1: int = arr.byteOffset;
        let expectedValue1: number = origOff;
        expect(resultValue1).assertEqual(expectedValue1);
        arr.reduce<number>((prev, curr, idx, a) => prev + curr, 0);
        let resultValue2: int = arr.byteOffset;
        let expectedValue2: number = origOff;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let arr = Int16Array.of(2, 4, 6);
        let r1 = arr.reduce((prev, curr, idx, a) => prev + curr);
        let r2 = arr.reduce<number>((prev, curr, idx, a) => prev * curr, 1);
        let r3 = arr.reduce((prev, curr, idx, a) => prev - curr);
        expect(r1).assertEqual(12);
        expect(r2).assertEqual(48);
        expect(r3).assertEqual(-8);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REDUCE_1300
     * @tc.name testReduceOverload002
     * @tc.desc Verify reduce overload resolution between no-init and with-init forms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReduceOverload002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr = Int16Array.of(1, 2, 3);
        let bufBefore = arr.buffer;
        arr.reduce((prev, curr, idx, a) => prev + curr);
        let resultValue1: boolean = arr.buffer === bufBefore;
        expect(resultValue1).assertTrue();
        arr.reduce<number>((prev, curr, idx, a) => prev + curr, 0);
        let resultValue2: boolean = arr.buffer === bufBefore;
        expect(resultValue2).assertTrue();

      }
      {
        let arr = Int16Array.of(1, 2, 3);
        let bufByteLen: number = arr.buffer.byteLength;
        arr.reduce((prev, curr, idx, a) => prev + curr);
        arr.reduce<number>((prev, curr, idx, a) => prev + curr, 0);
        arr.reduce((prev, curr, idx, a) => prev * curr);
        let resultValue1: int = arr.buffer.byteLength;
        let expectedValue1: number = bufByteLen;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr1 = Int16Array.of(10, 20);
        let arr2 = Int16Array.of(10, 20);
        arr1.reduce((prev, curr, idx, a) => prev + curr);
        arr2.reduce<number>((prev, curr, idx, a) => prev + curr, 0);
        let resultValue1: number = arr1.$_get(0);
        let expectedValue1: number = arr2.$_get(0);
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = arr1.$_get(1);
        let expectedValue2: number = arr2.$_get(1);
        expect(resultValue2).assertEqual(expectedValue2);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REDUCE_1400
     * @tc.name testReduceTypes001
     * @tc.desc Verify reduce with various generic U types and object accumulators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReduceTypes001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30);
        let result: number = arr.reduce<number>((prev: number, curr: number, idx: int, a: Int16Array): number => prev + curr, 0);
        expect(result).assertEqual(60);

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let result: string = arr.reduce<string>((prev: string, curr: number, idx: int, a: Int16Array): string => prev + curr.toString(), "");
        expect(result).assertEqual("123");

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let result: boolean = arr.reduce<boolean>((prev: boolean, curr: number, idx: int, a: Int16Array): boolean => prev && curr > 0, true);
        expect(result).assertTrue();

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2);
        let captured: string = "";
        arr.reduce<string>((prev: string, curr: number, idx: int, a: Int16Array): string => {
          if (idx === 0) { captured = prev; }
          return prev + curr.toString();
        }, "start-");
        expect(captured).assertEqual("start-");

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2);
        let captured: boolean = true;
        arr.reduce<boolean>((prev: boolean, curr: number, idx: int, a: Int16Array): boolean => {
          if (idx === 0) { captured = prev; }
          return prev || curr > 0;
        }, false);
        expect(captured).assertFalse();

      }
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30);
        let init: ReducePart01Stats = new ReducePart01Stats();
        init.sum = 0;
        init.count = 0;
        let result: ReducePart01Stats = arr.reduce<ReducePart01Stats>((prev: ReducePart01Stats, curr: number, idx: int, a: Int16Array): ReducePart01Stats => {
          let next: ReducePart01Stats = new ReducePart01Stats();
          next.sum = prev.sum + curr;
          next.count = prev.count + 1;
          return next;
        }, init);
        let resultValue1: number = result.sum;
        let expectedValue1: int = 60;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = result.count;
        let expectedValue2: int = 3;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let arr: Int16Array = new Int16Array(0);
        let init: ReducePart01Box = new ReducePart01Box();
        init.value = 42;
        let result: ReducePart01Box = arr.reduce<ReducePart01Box>((prev: ReducePart01Box, curr: number, idx: int, a: Int16Array): ReducePart01Box => {
          let next: ReducePart01Box = new ReducePart01Box();
          next.value = prev.value + curr;
          return next;
        }, init);
        expect(result).assertEqual(init);
        let resultValue1: number = result.value;
        let expectedValue1: int = 42;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let init: number[] = [];
        let result: number[] = arr.reduce<number[]>((prev: number[], curr: number, idx: int, a: Int16Array): number[] => {
          prev.push(curr);
          return prev;
        }, init);
        let resultValue1: int = result.length;
        let expectedValue1: int = 3;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = result[0];
        let expectedValue2: int = 1;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = result[2];
        let expectedValue3: int = 3;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        let arr: Int16Array = Int16Array.of(4, 5);
        let init: number[] = [1, 2, 3];
        let result: number[] = arr.reduce<number[]>((prev: number[], curr: number, idx: int, a: Int16Array): number[] => {
          prev.push(curr);
          return prev;
        }, init);
        let resultValue1: int = result.length;
        let expectedValue1: int = 5;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = result[0];
        let expectedValue2: int = 1;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = result[4];
        let expectedValue3: int = 5;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        let arr: Int16Array = Int16Array.of(100, 200, 300);
        let result: bigint = arr.reduce<bigint>((prev: bigint, curr: number, idx: int, a: Int16Array): bigint => prev + BigInt(curr), BigInt(0));
        expect(result).assertEqual(BigInt(600));

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REDUCE_1500
     * @tc.name testReduceTypes002
     * @tc.desc Verify reduce with various generic U types and object accumulators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReduceTypes002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr: Int16Array = new Int16Array(0);
        let result: bigint = arr.reduce<bigint>((prev: bigint, curr: number, idx: int, a: Int16Array): bigint => prev + BigInt(curr), BigInt(1000));
        expect(result).assertEqual(BigInt(1000));

      }
      {
        let arr: Int16Array = Int16Array.of(10, 20);
        let result: long = arr.reduce<long>((prev: long, curr: number, idx: int, a: Int16Array): long => prev + curr.toLong(), Int.toLong(0));
        expect(result).assertEqual(Int.toLong(30));

      }
      {
        let arr: Int16Array = Int16Array.of(100, 200);
        let init: ReduceP03TimeBox = new ReduceP03TimeBox(); init.t = 0;
        let result = arr.reduce<ReduceP03TimeBox>((prev: ReduceP03TimeBox, curr: number, idx: int, a: Int16Array): ReduceP03TimeBox => { let n: ReduceP03TimeBox = new ReduceP03TimeBox(); n.t = prev.t + curr; return n; }, init);
        let resultValue1: number = result.t;
        let expectedValue1: int = 300;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = Int16Array.of(1);
        let init: RegExp = new RegExp("a", "g");
        let result = arr.reduce<RegExp>((prev: RegExp, curr: number, idx: int, a: Int16Array): RegExp => new RegExp(prev.source + curr.toString(), "g"), init);
        let resultValue1: string = result.source;
        let expectedValue1: string = "a1";
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2);
        let init: Map<string, number> = new Map<string, number>();
        let result = arr.reduce<Map<string, number>>((prev: Map<string, number>, curr: number, idx: int, a: Int16Array): Map<string, number> => {
          prev.set("k" + curr.toString(), curr);
          return prev;
        }, init);
        let resultValue1: number = result.size;
        let expectedValue1: int = 2;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = Int16Array.of(10, 20);
        let init: Set<number> = new Set<number>();
        let result = arr.reduce<Set<number>>((prev: Set<number>, curr: number, idx: int, a: Int16Array): Set<number> => {
          prev.add(curr);
          return prev;
        }, init);
        let resultValue1: number = result.size;
        let expectedValue1: int = 2;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = Int16Array.of(50);
        let init: ReduceP03TimeBox = new ReduceP03TimeBox(); init.t = 1000;
        let captured: ReduceP03TimeBox = new ReduceP03TimeBox();
        arr.reduce<ReduceP03TimeBox>((prev: ReduceP03TimeBox, curr: number, idx: int, a: Int16Array): ReduceP03TimeBox => {
          captured = prev;
          let n: ReduceP03TimeBox = new ReduceP03TimeBox(); n.t = prev.t + curr; return n;
        }, init);
        let resultValue1: number = captured.t;
        let expectedValue1: int = 1000;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = Int16Array.of(1);
        let init: RegExp = new RegExp("hello", "g");
        let captured: RegExp = new RegExp("", "");
        arr.reduce<RegExp>((prev: RegExp, curr: number, idx: int, a: Int16Array): RegExp => {
          captured = prev;
          return new RegExp(prev.source + curr.toString(), "g");
        }, init);
        let resultValue1: string = captured.source;
        let expectedValue1: string = "hello";
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = Int16Array.of(5);
        let init: Map<string, number> = new Map<string, number>();
        init.set("x", 1);
        let isSameRef: boolean = false;
        arr.reduce<Map<string, number>>((prev: Map<string, number>, curr: number, idx: int, a: Int16Array): Map<string, number> => {
          isSameRef = (prev === init);
          prev.set("y", curr);
          return prev;
        }, init);
        expect(isSameRef).assertTrue();

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let result = arr.reduce<double>((prev: double, curr: number, idx: int, a: Int16Array): double => prev + curr, 0.0);
        expect(result).assertEqual(6.0);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REDUCE_1600
     * @tc.name testReduceTypes003
     * @tc.desc Verify reduce with various generic U types and object accumulators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReduceTypes003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr: Int16Array = Int16Array.of(1, 2);
        let result = arr.reduce<double>((prev: double, curr: number, idx: int, a: Int16Array): double => prev + curr, 0.5);
        expect(result).assertEqual(3.5);

      }
      {
        let arr: Int16Array = new Int16Array(0);
        let result = arr.reduce<double>((prev: double, curr: number, idx: int, a: Int16Array): double => prev + curr, 3.14);
        expect(result).assertEqual(3.14);

      }
      {
        let arr: Int16Array = Int16Array.of(2);
        let called: boolean = false;
        let result = arr.reduce<double>((prev: double, curr: number, idx: int, a: Int16Array): double => {
          called = true;
          return prev + curr;
        }, 1.1);
        expect(called).assertTrue();
        expect(result).assertEqual(3.1);

      }
      {
        let arr: Int16Array = Int16Array.of(3, 4);
        let result = arr.reduce<double>((prev: double, curr: number, idx: int, a: Int16Array): double => prev + curr, 0.0);
        expect(result).assertEqual(7.0);

      }
      {
        let arr: Int16Array = new Int16Array(0);
        let result = arr.reduce<double>((prev: double, curr: number, idx: int, a: Int16Array): double => prev + curr, 1.0);
        expect(result).assertEqual(1.0);

      }
      {
        let arr: Int16Array = Int16Array.of(10, 20);
        let result = arr.reduce<byte>((prev: byte, curr: number, idx: int, a: Int16Array): byte => Int.toByte((prev + curr).toInt()), Int.toByte(0));
        expect(result).assertEqual(Int.toByte(30));

      }
      {
        let arr: Int16Array = new Int16Array(0);
        let result = arr.reduce<byte>((prev: byte, curr: number, idx: int, a: Int16Array): byte => prev, Int.toByte(5));
        expect(result).assertEqual(Int.toByte(5));

      }
      {
        let arr: Int16Array = Int16Array.of(100, 200);
        let result = arr.reduce<short>((prev: short, curr: number, idx: int, a: Int16Array): short => Int.toShort((prev + curr).toInt()), Int.toShort(0));
        expect(result).assertEqual(Int.toShort(300));

      }
      {
        let arr: Int16Array = new Int16Array(0);
        let result = arr.reduce<short>((prev: short, curr: number, idx: int, a: Int16Array): short => prev, Int.toShort(10));
        expect(result).assertEqual(Int.toShort(10));

      }
      {
        let arr: Int16Array = new Int16Array(0);
        let result = arr.reduce<number>((prev: number, curr: number, idx: int, a: Int16Array): number => prev, 97);
        expect(result).assertEqual(97);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REDUCE_1700
     * @tc.name testReduceTypes004
     * @tc.desc Verify reduce with various generic U types and object accumulators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReduceTypes004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr: Int16Array = Int16Array.of(100, 200, 300);
        let init: ReduceP03TimeBox = new ReduceP03TimeBox(); init.t = 0;
        let result = arr.reduce<ReduceP03TimeBox>((prev: ReduceP03TimeBox, curr: number, idx: int, a: Int16Array): ReduceP03TimeBox => { let n: ReduceP03TimeBox = new ReduceP03TimeBox(); n.t = prev.t + curr; return n; }, init);
        let resultValue1: number = result.t;
        let expectedValue1: int = 600;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = new Int16Array(0);
        let init: ReduceP03TimeBox = new ReduceP03TimeBox(); init.t = 9999;
        let result = arr.reduce<ReduceP03TimeBox>((prev: ReduceP03TimeBox, curr: number, idx: int, a: Int16Array): ReduceP03TimeBox => { let n: ReduceP03TimeBox = new ReduceP03TimeBox(); n.t = prev.t + curr; return n; }, init);
        let resultValue1: boolean = result === init;
        expect(resultValue1).assertTrue();

      }
      {
        let arr: Int16Array = Int16Array.of(500);
        let init: ReduceP03TimeBox = new ReduceP03TimeBox(); init.t = 0;
        let result = arr.reduce<ReduceP03TimeBox>((prev: ReduceP03TimeBox, curr: number, idx: int, a: Int16Array): ReduceP03TimeBox => { let n: ReduceP03TimeBox = new ReduceP03TimeBox(); n.t = prev.t + curr; return n; }, init);
        let resultValue1: number = result.t;
        let expectedValue1: int = 500;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: boolean = result instanceof ReduceP03TimeBox;
        expect(resultValue2).assertTrue();

      }
      {
        let arr: Int16Array = new Int16Array(0);
        let init: RegExp = new RegExp("test", "i");
        let result = arr.reduce<RegExp>((prev: RegExp, curr: number, idx: int, a: Int16Array): RegExp => new RegExp(prev.source + curr.toString(), prev.flags), init);
        let resultValue1: boolean = result === init;
        expect(resultValue1).assertTrue();

      }
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30);
        let init: Map<string, number> = new Map<string, number>();
        let result = arr.reduce<Map<string, number>>((prev: Map<string, number>, curr: number, idx: int, a: Int16Array): Map<string, number> => {
          prev.set("k" + idx.toString(), curr);
          return prev;
        }, init);
        let resultValue1: number = result.size;
        let expectedValue1: int = 3;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2 = result.get("k0");
        let expectedValue2: int = 10;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3 = result.get("k2");
        let expectedValue3: int = 30;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        let arr: Int16Array = Int16Array.of(4, 5);
        let init: Map<string, number> = new Map<string, number>();
        init.set("a", 1);
        init.set("b", 2);
        let result = arr.reduce<Map<string, number>>((prev: Map<string, number>, curr: number, idx: int, a: Int16Array): Map<string, number> => {
          prev.set("n" + curr.toString(), curr);
          return prev;
        }, init);
        let resultValue1: number = result.size;
        let expectedValue1: int = 4;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2 = result.get("a");
        let expectedValue2: int = 1;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3 = result.get("n5");
        let expectedValue3: int = 5;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        let arr: Int16Array = new Int16Array(0);
        let init: Map<string, number> = new Map<string, number>();
        init.set("x", 99);
        let result = arr.reduce<Map<string, number>>((prev: Map<string, number>, curr: number, idx: int, a: Int16Array): Map<string, number> => prev, init);
        let resultValue1: boolean = result === init;
        expect(resultValue1).assertTrue();
        let resultValue2: number = result.size;
        let expectedValue2: int = 1;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let arr: Int16Array = Int16Array.of(5, 10, 15);
        let init: Set<number> = new Set<number>();
        let result = arr.reduce<Set<number>>((prev: Set<number>, curr: number, idx: int, a: Int16Array): Set<number> => {
          prev.add(curr);
          return prev;
        }, init);
        let resultValue1: number = result.size;
        let expectedValue1: int = 3;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: boolean = result.has(5);
        expect(resultValue2).assertTrue();
        let resultValue3: boolean = result.has(15);
        expect(resultValue3).assertTrue();

      }
      {
        let arr: Int16Array = Int16Array.of(3, 4);
        let init: Set<number> = new Set<number>();
        init.add(1);
        init.add(2);
        let result = arr.reduce<Set<number>>((prev: Set<number>, curr: number, idx: int, a: Int16Array): Set<number> => {
          prev.add(curr);
          return prev;
        }, init);
        let resultValue1: number = result.size;
        let expectedValue1: int = 4;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: boolean = result.has(1);
        expect(resultValue2).assertTrue();
        let resultValue3: boolean = result.has(4);
        expect(resultValue3).assertTrue();

      }
      {
        let arr: Int16Array = new Int16Array(0);
        let init: Set<number> = new Set<number>();
        init.add(42);
        let result = arr.reduce<Set<number>>((prev: Set<number>, curr: number, idx: int, a: Int16Array): Set<number> => prev, init);
        let resultValue1: boolean = result === init;
        expect(resultValue1).assertTrue();
        let resultValue2: number = result.size;
        let expectedValue2: int = 1;
        expect(resultValue2).assertEqual(expectedValue2);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REDUCE_1800
     * @tc.name testReduceTypes005
     * @tc.desc Verify reduce with various generic U types and object accumulators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReduceTypes005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let init: Float32Array = new Float32Array(0);
        let result = arr.reduce<Float32Array>((prev: Float32Array, curr: number, idx: int, a: Int16Array): Float32Array => {
          let merged: Float32Array = new Float32Array(prev.length + 1);
          for (let i = 0; i < prev.length; i++) {
            merged.$_set(i, prev.$_get(i));
          }
          merged.$_set(prev.length, curr);
          return merged;
        }, init);
        let resultValue1: int = result.length;
        let expectedValue1: int = 3;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = result.$_get(0);
        let expectedValue2: int = 1;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = result.$_get(2);
        let expectedValue3: int = 3;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        let arr: Int16Array = Int16Array.of(4, 5);
        let init: Float32Array = new Float32Array(3);
        init.$_set(0, 1);
        init.$_set(1, 2);
        init.$_set(2, 3);
        let result = arr.reduce<Float32Array>((prev: Float32Array, curr: number, idx: int, a: Int16Array): Float32Array => {
          let merged: Float32Array = new Float32Array(prev.length + 1);
          for (let i = 0; i < prev.length; i++) {
            merged.$_set(i, prev.$_get(i));
          }
          merged.$_set(prev.length, curr);
          return merged;
        }, init);
        let resultValue1: int = result.length;
        let expectedValue1: int = 5;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = result.$_get(0);
        let expectedValue2: int = 1;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = result.$_get(4);
        let expectedValue3: int = 5;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        let arr: Int16Array = Int16Array.of(10, 20);
        let init: Float64Array = new Float64Array(0);
        let result = arr.reduce<Float64Array>((prev: Float64Array, curr: number, idx: int, a: Int16Array): Float64Array => {
          let merged: Float64Array = new Float64Array(prev.length + 1);
          for (let i = 0; i < prev.length; i++) {
            merged.$_set(i, prev.$_get(i));
          }
          merged.$_set(prev.length, curr);
          return merged;
        }, init);
        let resultValue1: int = result.length;
        let expectedValue1: int = 2;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = result.$_get(0);
        let expectedValue2: int = 10;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = result.$_get(1);
        let expectedValue3: int = 20;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2);
        let init: Map<string, number> = new Map<string, number>();
        let result = arr.reduce<Map<string, number>>((prev: Map<string, number>, curr: number, idx: int, a: Int16Array): Map<string, number> => {
          prev.set("k" + idx.toString(), curr);
          return prev;
        }, init);
        let resultValue1 = result.get("k0");
        let expectedValue1: int = 1;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2 = result.get("k1");
        let expectedValue2: int = 2;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let arr: Int16Array = Int16Array.of(3);
        let init: Map<string, number> = new Map<string, number>();
        init.set("existing", 100);
        let result = arr.reduce<Map<string, number>>((prev: Map<string, number>, curr: number, idx: int, a: Int16Array): Map<string, number> => {
          prev.set("newKey", curr);
          return prev;
        }, init);
        let resultValue1 = result.get("existing");
        let expectedValue1: int = 100;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2 = result.get("newKey");
        let expectedValue2: int = 3;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let arr: Int16Array = new Int16Array(0);
        let init: Map<string, number> = new Map<string, number>();
        init.set("a", 1);
        let result = arr.reduce<Map<string, number>>((prev: Map<string, number>, curr: number, idx: int, a: Int16Array): Map<string, number> => prev, init);
        let resultValue1: boolean = result === init;
        expect(resultValue1).assertTrue();
        let resultValue2 = result.get("a");
        let expectedValue2: int = 1;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30);
        let init: ReduceP03Accumulator = new ReduceP03Accumulator();
        let result = arr.reduce<ReduceP03Accumulator>((prev: ReduceP03Accumulator, curr: number, idx: int, a: Int16Array): ReduceP03Accumulator => {
          prev.sum = prev.sum + curr;
          prev.count = prev.count + 1;
          return prev;
        }, init);
        let resultValue1: number = result.sum;
        let expectedValue1: int = 60;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = result.count;
        let expectedValue2: int = 3;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let arr: Int16Array = Int16Array.of(1);
        let re1: RegExp = new RegExp("test", "g");
        let re2: RegExp = new RegExp("test", "g");
        let r1 = arr.reduce<RegExp>((prev: RegExp, curr: number, idx: int, a: Int16Array): RegExp => new RegExp(prev.source + curr.toString(), prev.flags), re1);
        let r2 = arr.reduce<RegExp>((prev: RegExp, curr: number, idx: int, a: Int16Array): RegExp => new RegExp(prev.source + curr.toString(), prev.flags), re2);
        let resultValue1: string = r1.source;
        let expectedValue1: string = r2.source;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: string = r1.flags;
        let expectedValue2: string = r2.flags;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let arr: Int16Array = Int16Array.of(1);
        let d: ReduceP03TimeBox = new ReduceP03TimeBox(); d.t = 0;
        let re: RegExp = new RegExp("x", "g");
        let r1 = arr.reduce<ReduceP03TimeBox>((prev: ReduceP03TimeBox, curr: number, idx: int, a: Int16Array): ReduceP03TimeBox => { let n: ReduceP03TimeBox = new ReduceP03TimeBox(); n.t = prev.t + curr; return n; }, d);
        let r2 = arr.reduce<RegExp>((prev: RegExp, curr: number, idx: int, a: Int16Array): RegExp => new RegExp(prev.source + curr.toString(), prev.flags), re);
        let resultValue1: boolean = r1 instanceof ReduceP03TimeBox;
        expect(resultValue1).assertTrue();
        let resultValue2: boolean = r2 instanceof RegExp;
        expect(resultValue2).assertTrue();

      }
      {
        let arr: Int16Array = Int16Array.of(5);
        let a: ReduceP03Acc = new ReduceP03Acc();
        let r1 = arr.reduce<ReduceP03Acc>((prev: ReduceP03Acc, curr: number, idx: int, a: Int16Array): ReduceP03Acc => { prev.sum = prev.sum + curr; return prev; }, a);
        let r2 = arr.reduce<double>((prev, curr, idx, a_arr) => prev + curr, 0.0);
        let resultValue1: number = r1.sum;
        let expectedValue1: int = 5;
        expect(resultValue1).assertEqual(expectedValue1);
        expect(r2).assertEqual(5.0);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REDUCE_1900
     * @tc.name testReduceTypes006
     * @tc.desc Verify reduce with various generic U types and object accumulators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReduceTypes006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr = Int16Array.of(1, 2, 3);
        let result = arr.reduce<number>((prev, curr, idx, a) => prev + curr, 0);
        expect(result).assertEqual(6);

      }
      {
        let arr = Int16Array.of(1, 2, 3);
        let result = arr.reduce<string>((prev, curr, idx, a) => prev + curr.toString(), "");
        expect(result).assertEqual("123");

      }
      {
        let arr = Int16Array.of(1, 2, 3);
        let result = arr.reduce<boolean>((prev, curr, idx, a) => prev && curr > 0, true);
        expect(result).assertTrue();

      }
      {
        let arr = Int16Array.of(1, 2, 3);
        let result = arr.reduce<bigint>((prev, curr, idx, a) => prev + BigInt(curr), BigInt(0));
        expect(result).assertEqual(BigInt(6));

      }
      {
        let arr = new Int16Array(0);
        let result = arr.reduce<bigint>((prev, curr, idx, a) => prev + BigInt(curr), BigInt(42));
        expect(result).assertEqual(BigInt(42));

      }
      {
        let arr = Int16Array.of(5);
        let callCount: number = 0;
        arr.reduce<number>((prev, curr, idx, a) => {
          callCount++;
          return prev + curr;
        }, 0);
        expect(callCount).assertEqual(1);

      }
      {
        let arr = Int16Array.of(10, 20);
        let initAcc: ReducePart04AccBox = new ReducePart04AccBox();
        initAcc.sum = 0;
        initAcc.cnt = 0;
        let r = arr.reduce<ReducePart04AccBox>((prev, curr, idx, a) => {
          let next: ReducePart04AccBox = new ReducePart04AccBox();
          next.sum = prev.sum + curr;
          next.cnt = prev.cnt + 1;
          return next;
        }, initAcc);
        let resultValue1: number = r.sum;
        let expectedValue1: int = 30;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = r.cnt;
        let expectedValue2: int = 2;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let arr = Int16Array.of(1, 2, 3);
        let refs: ReducePart04Box[] = [];
        let initBox: ReducePart04Box = new ReducePart04Box();
        initBox.val = 0;
        arr.reduce<ReducePart04Box>((prev, curr, idx, a) => {
          refs.push(prev);
          let next: ReducePart04Box = new ReducePart04Box();
          next.val = prev.val + curr;
          return next;
        }, initBox);
        let resultValue1: boolean = refs[0] !== refs[1];
        expect(resultValue1).assertTrue();
        let resultValue2: boolean = refs[1] !== refs[2];
        expect(resultValue2).assertTrue();

      }
      {
        let arr = new Int16Array(0);
        let init: ReducePart04Tag = new ReducePart04Tag();
        init.id = 1;
        init.name = "test";
        let r = arr.reduce<ReducePart04Tag>((prev, curr, idx, a) => prev, init);
        let resultValue1: boolean = r === init;
        expect(resultValue1).assertTrue();

      }
      {
        let arr = new Int16Array(0);
        let init: string = "preserved";
        let r = arr.reduce<string>((prev, curr, idx, a) => prev + curr.toString(), init);
        expect(r).assertEqual("preserved");

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REDUCE_2000
     * @tc.name testReduceError001
     * @tc.desc Verify reduce propagates errors and throws TypeError on empty array without initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReduceError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        try {
          arr.reduce<number>((prev: number, curr: number, idx: int, a: Int16Array): number => {
            if (idx === 0) { throw new TypeError("fail at first"); }
            return prev + curr;
          }, 0);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
        }

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4);
        try {
          arr.reduce<number>((prev: number, curr: number, idx: int, a: Int16Array): number => {
            if (idx === 1) { throw new TypeError("fail at middle"); }
            return prev + curr;
          }, 0);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
        }

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2);
        try {
          arr.reduce<number>((prev: number, curr: number, idx: int, a: Int16Array): number => {
            throw new TypeError("callback error");
          }, 0);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
        }

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let externalAcc: number = 0;
        try {
          arr.reduce<number>((prev: number, curr: number, idx: int, a: Int16Array): number => {
            externalAcc = externalAcc + curr;
            if (idx === 1) { throw new TypeError("stop"); }
            return prev + curr;
          }, 0);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
        }
        expect(externalAcc).assertEqual(3);

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        try {
          arr.reduce<number>((prev: number, curr: number, idx: int, a: Int16Array): number => {
            throw new TypeError("intentional");
          }, 0);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
        }

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let sideEffect: number = 0;
        try {
          arr.reduce<number>((prev: number, curr: number, idx: int, a: Int16Array): number => {
            sideEffect = sideEffect + 1;
            if (idx === 1) { throw new TypeError("mid fail"); }
            return prev + curr;
          }, 0);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
        }
        expect(sideEffect).assertEqual(2);

      }
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30);
        try {
          arr.reduce<number>((prev: number, curr: number, idx: int, a: Int16Array): number => {
            if (idx === 0) { throw new TypeError("fail"); }
            return prev + curr;
          }, 0);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
        }
        let resultValue1: number = arr.$_get(0);
        let expectedValue1: int = 10;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = arr.$_get(1);
        let expectedValue2: int = 20;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = arr.$_get(2);
        let expectedValue3: int = 30;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4);
        let originalLen: number = arr.length;
        try {
          arr.reduce<number>((prev: number, curr: number, idx: int, a: Int16Array): number => {
            throw new TypeError("abort");
          }, 0);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
        }
        let resultValue1: int = arr.length;
        let expectedValue1: number = originalLen;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr = new Int16Array([1, 2, 3]);
        try {
          arr.reduce((prev, curr, idx, array) => {
            throw new TypeError('callback error');
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
        }

      }
      {
        let arr = new Int16Array([5, 6]);
        try {
          arr.reduce((prev, curr, idx, array) => {
            throw new TypeError('type error in callback');
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REDUCE_2100
     * @tc.name testReduceError002
     * @tc.desc Verify reduce propagates errors and throws TypeError on empty array without initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReduceError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr = new Int16Array([10, 20]);
        try {
          arr.reduce((prev, curr, idx, array) => {
            throw new RangeError('range error in callback');
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }

      }
      {
        let arr = new Int16Array();
        try {
          arr.reduce((prev, curr, idx, array) => prev + curr);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
        }

      }
      {
        let arr = new Int16Array([42]);
        let result = arr.reduce((prev, curr, idx, array) => {
          throw new TypeError('should not be called');
        });
        expect(result).assertEqual(42);

      }
      {
        let arr = new Int16Array([1, 2, 3]);
        let secondCallExecuted = false;
        try {
          arr.reduce((prev, curr, idx, array) => {
            if (idx === 1) {
              throw new TypeError('first call error');
            }
            secondCallExecuted = true;
            return prev + curr;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
        }
        expect(secondCallExecuted).assertFalse();

      }
      {
        let arr = new Int16Array([10, 20, 30]);
        let firstCallDone = false;
        try {
          arr.reduce((prev, curr, idx, array) => {
            if (idx === 1) {
              firstCallDone = true;
            }
            if (idx === 2) {
              throw new TypeError('second call error');
            }
            return prev + curr;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
        }
        expect(firstCallDone).assertTrue();

      }
      {
        let arr = new Int16Array([5, 6, 7]);
        try {
          arr.reduce((prev, curr, idx, array) => {
            throw new TypeError('fail');
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
        }
        let resultValue1: number = arr.$_get(0);
        let expectedValue1: int = 5;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = arr.$_get(1);
        let expectedValue2: int = 6;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = arr.$_get(2);
        let expectedValue3: int = 7;
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: int = arr.length;
        let expectedValue4: int = 3;
        expect(resultValue4).assertEqual(expectedValue4);

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2);
        let init: Error = new Error("start");
        let result = arr.reduce<Error>((prev: Error, curr: number, idx: int, a: Int16Array): Error => new Error(prev.message + "-" + curr.toString()), init);
        let resultValue1: string = result.message;
        let expectedValue1: string = "start-1-2";
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = new Int16Array(0);
        let init: Error = new Error("empty");
        let result = arr.reduce<Error>((prev: Error, curr: number, idx: int, a: Int16Array): Error => new Error(prev.message + curr.toString()), init);
        let resultValue1: boolean = result === init;
        expect(resultValue1).assertTrue();

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4);
        let afterThrowCalls: number = 0;
        try {
          arr.reduce<number>((prev: number, curr: number, idx: int, a: Int16Array): number => {
            if (idx === 0) { throw new TypeError("first round fail"); }
            afterThrowCalls++;
            return prev + curr;
          }, 0);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
        }
        expect(afterThrowCalls).assertEqual(0);

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2);
        try {
          arr.reduce<string>((prev: string, curr: number, idx: int, a: Int16Array): string => {
            throw new TypeError("string reduce fail");
          }, "");
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REDUCE_2200
     * @tc.name testReduceError003
     * @tc.desc Verify reduce propagates errors and throws TypeError on empty array without initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReduceError003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr: Int16Array = Int16Array.of(100, 200, 300);
        try {
          arr.reduce<number>((prev: number, curr: number, idx: int, a: Int16Array): number => {
            throw new TypeError("abort");
          }, 0);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
        }
        let resultValue1: number = arr.$_get(0);
        let expectedValue1: int = 100;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = arr.$_get(1);
        let expectedValue2: int = 200;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = arr.$_get(2);
        let expectedValue3: int = 300;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
        let originalLen: number = arr.length;
        try {
          arr.reduce<number>((prev: number, curr: number, idx: int, a: Int16Array): number => {
            if (idx === 2) { throw new TypeError("mid"); }
            return prev + curr;
          }, 0);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
        }
        let resultValue1: int = arr.length;
        let expectedValue1: number = originalLen;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4);
        let sideEffectSum: number = 0;
        try {
          arr.reduce<number>((prev: number, curr: number, idx: int, a: Int16Array): number => {
            sideEffectSum = sideEffectSum + curr;
            if (idx === 2) { throw new TypeError("stop at idx 2"); }
            return prev + curr;
          }, 0);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
        }
        expect(sideEffectSum).assertEqual(6);

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2);
        let init: ReduceP03ImmBox = new ReduceP03ImmBox();
        init.value = 10;
        try {
          arr.reduce<ReduceP03ImmBox>((prev: ReduceP03ImmBox, curr: number, idx: int, a: Int16Array): ReduceP03ImmBox => {
            if (idx === 0) { throw new TypeError("early fail"); }
            let next: ReduceP03ImmBox = new ReduceP03ImmBox();
            next.value = prev.value + curr;
            return next;
          }, init);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
        }
        let resultValue1: number = init.value;
        let expectedValue1: int = 10;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        try {
          arr.reduce<number>((prev: number, curr: number, idx: int, a: Int16Array): number => {
            throw new TypeError("type error");
          }, 0);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
        }

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2);
        try {
          arr.reduce<number>((prev: number, curr: number, idx: int, a: Int16Array): number => {
            throw new RangeError("range error");
          }, 0);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }

      }
      {
        let arr = new Int16Array(0);
        try {
          arr.reduce((prev, curr, idx, a) => prev + curr);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
        }

      }
      {
        let arr = new Int16Array(0);
        try {
          arr.reduce((prev, curr, idx, a) => prev + curr);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
        }
        let resultValue1: int = arr.length;
        let expectedValue1: int = 0;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr = new Int16Array(0);
        try {
          arr.reduce((prev, curr, idx, a) => prev + curr);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
        }
        let resultValue1: int = arr.BYTES_PER_ELEMENT;
        let expectedValue1: int = 2;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr = new Int16Array(0);
        try {
          arr.reduce((prev, curr, idx, a) => prev + curr);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
        }
        let r = arr.reduce<number>((prev, curr, idx, a) => prev + curr, 7);
        expect(r).assertEqual(7);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REDUCE_2300
     * @tc.name testReduceError004
     * @tc.desc Verify reduce propagates errors and throws TypeError on empty array without initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReduceError004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr = Int16Array.of(1, 2, 3);
        let orig: Int16Array = arr;
        try {
          arr.reduce<number>((prev, curr, idx, a) => {
            throw new TypeError("fail");
          }, 0);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
        }
        let resultValue1: boolean = arr instanceof Int16Array;
        expect(resultValue1).assertTrue();
        let resultValue3: boolean = arr === orig;
        expect(resultValue3).assertTrue();

      }
      {
        let arr = Int16Array.of(1, 2, 3);
        try {
          arr.reduce<number>((prev, curr, idx, a) => {
            throw new TypeError("fail");
          }, 0);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
        }
        let resultValue1: int = arr.length;
        let expectedValue1: int = 3;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr = Int16Array.of(1, 2, 3, 4);
        let origByteLen: number = arr.byteLength;
        try {
          arr.reduce<number>((prev, curr, idx, a) => {
            throw new TypeError("fail");
          }, 0);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
        }
        let resultValue1: int = arr.byteLength;
        let expectedValue1: number = origByteLen;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr = Int16Array.of(10, 20, 30);
        try {
          arr.reduce<number>((prev, curr, idx, a) => {
            throw new TypeError("fail");
          }, 0);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
        }
        let resultValue1: number = arr.$_get(0);
        let expectedValue1: int = 10;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = arr.$_get(1);
        let expectedValue2: int = 20;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = arr.$_get(2);
        let expectedValue3: int = 30;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        let arr = Int16Array.of(1, 2);
        try {
          arr.reduce<number>((prev, curr, idx, a) => {
            throw new TypeError("fail");
          }, 0);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
        }
        let resultValue1: int = arr.BYTES_PER_ELEMENT;
        let expectedValue1: int = 2;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr = Int16Array.of(5, 6, 7, 8);
        try {
          arr.reduce((prev, curr, idx, a) => {
            throw new TypeError("fail");
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
        }
        let resultValue1: int = arr.length;
        let expectedValue1: int = 4;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr = Int16Array.of(11, 22, 33);
        try {
          arr.reduce((prev, curr, idx, a) => {
            throw new TypeError("fail");
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
        }
        let resultValue1: number = arr.$_get(0);
        let expectedValue1: int = 11;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = arr.$_get(1);
        let expectedValue2: int = 22;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = arr.$_get(2);
        let expectedValue3: int = 33;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        let arr = Int16Array.of(1, 2, 3, 4);
        let sideSeq: number[] = [];
        try {
          arr.reduce((prev, curr, idx, a) => {
            sideSeq.push(curr);
            if (idx === 2) { throw new TypeError("abort"); }
            return prev + curr;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
        }
        let resultValue1: int = sideSeq.length;
        let expectedValue1: int = 2;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = sideSeq[0];
        let expectedValue2: int = 2;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = sideSeq[1];
        let expectedValue3: int = 3;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        let arr = Int16Array.of(1, 2, 3, 4, 5);
        let arrRef: Int16Array = arr;
        try {
          arr.reduce<number>((prev, curr, idx, a) => {
            if (idx === 2) { throw new TypeError("mid fail"); }
            return prev + curr;
          }, 0);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
        }
        let resultValue1: boolean = arr === arrRef;
        expect(resultValue1).assertTrue();

      }
      {
        let arr = Int16Array.of(10, 20, 30);
        try {
          arr.reduce((prev, curr, idx, a) => {
            throw new TypeError("fail");
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
        }
        let r = arr.reduce<number>((prev, curr, idx, a) => prev + curr, 0);
        expect(r).assertEqual(60);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REDUCE_2400
     * @tc.name testReduceError005
     * @tc.desc Verify reduce propagates errors and throws TypeError on empty array without initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReduceError005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr = Int16Array.of(10, 20, 30);
        try {
          arr.reduce<number>((prev, curr, idx, a) => {
            throw new TypeError("fail");
          }, 0);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
        }
        let r = arr.reduce((prev, curr, idx, a) => prev + curr);
        expect(r).assertEqual(60);

      }
      {
        let arr = new Int16Array(0);
        try {
          arr.reduce((prev, curr, idx, a) => prev + curr);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
        }
        try {
          arr.reduce((prev, curr, idx, a) => prev + curr);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
        }

      }
      {
        let buf = new ArrayBuffer(8);
        let arr = new Int16Array(buf, 2, 3);
        let origOffset: number = arr.byteOffset;
        try {
          arr.reduce((prev, curr, idx, a) => {
            throw new TypeError("fail");
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
        }
        let resultValue1: int = arr.byteOffset;
        let expectedValue1: number = origOffset;
        expect(resultValue1).assertEqual(expectedValue1);

      }
    });

  });
}
