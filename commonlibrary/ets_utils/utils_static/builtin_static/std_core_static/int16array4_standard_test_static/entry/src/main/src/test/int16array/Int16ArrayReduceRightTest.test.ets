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
} from '../../../../hypium/index';

import Utils from './../Util.test';

class ReduceRightPart01AccStats {
  sum: number = 0;
  count: number = 0;
}

class ReduceRightPart01Accumulator {
  value: number = 0;
}

function subFnInt16ArrayReduceRightPart02Test003(prev: number, curr: number, idx: int, a: Int16Array): number {
  return prev - curr;
}

class ReduceRightPart03ImmBox {
  value: number = 0;
}

class ReduceRightPart03Accumulator {
  sum: number = 0;
}

class ReduceRightPart03Box {
  value: number = 0;
}

class ReduceRightPart03Acc {
  sum: number = 0;
  count: number = 0;
}

class ReduceRightPart03Pair {
  a: number = 0;
  b: number = 0;
}

class ReduceRightPart04Counter {
  count: number = 0;
}

export default function Int16ArrayReduceRightTest(): void {
  describe('Int16ArrayReduceRightTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REDUCERIGHT_0100
     * @tc.name testReduceRightGeneral001
     * @tc.desc Verify reduceRight accumulation results for normal arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReduceRightGeneral001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let result: number = arr.reduceRight<number>((prev: number, curr: number): number => {
          return prev + curr;
        }, 0);
        expect(result).assertEqual(6);

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2);
        let result: number = arr.reduceRight<number>((prev: number, curr: number): number => {
          return prev + curr;
        }, 3.14);
        expect(result).assertEqual(6.140000000000001);

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2);
        let result: number = arr.reduceRight<number>((prev: number, curr: number): number => {
          return prev + curr;
        }, 0.0);
        expect(result).assertEqual(3.0);

      }
      {
        let arr = Int16Array.of(10, 20, 30);
        arr.reduceRight((prev: number, curr: number): number => {
          return prev + curr;
        }, 0);
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
        let arr = Int16Array.of(0, 0);
        let result = arr.reduceRight((prev: number, curr: number, idx: int, a: Int16Array): number => prev + curr);
        expect(result).assertEqual(0);

      }
      {
        let arr = Int16Array.of(7, 7, 7);
        let result = arr.reduceRight((prev: number, curr: number, idx: int, a: Int16Array): number => prev + curr);
        expect(result).assertEqual(21);

      }
      {
        let arr = Int16Array.of(-3, -3, -3);
        let result = arr.reduceRight((prev: number, curr: number, idx: int, a: Int16Array): number => prev + curr);
        expect(result).assertEqual(-9);

      }
      {
        let arr = Int16Array.of(0, -5, 10);
        let result = arr.reduceRight((prev: number, curr: number, idx: int, a: Int16Array): number => prev + curr);
        expect(result).assertEqual(5);

      }
      {
        let values: number[] = [];
        for (let i = 0; i < 100; i++) {
          values.push(1);
        }
        let arr = Int16Array.from(values);
        let result = arr.reduceRight((prev: number, curr: number, idx: int, a: Int16Array): number => prev + curr);
        expect(result).assertEqual(100);

      }
      {
        let arr = Int16Array.of(10, 5, 1);
        let result = arr.reduceRight((prev: number, curr: number, idx: int, a: Int16Array): number => prev - curr - 10);
        expect(result).assertEqual(-34);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REDUCERIGHT_0200
     * @tc.name testReduceRightGeneral002
     * @tc.desc Verify reduceRight accumulation results for normal arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReduceRightGeneral002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr = Int16Array.of(5, 5);
        let result = arr.reduceRight((prev: number, curr: number, idx: int, a: Int16Array): number => prev - curr);
        expect(result).assertEqual(0);

      }
      {
        let arr: Int16Array = Int16Array.of(99, 0, 1);
        let captured: number = -1;
        arr.reduceRight<number>((prev: number, curr: number, idx: int, a: Int16Array): number => {
          if (idx === 1) { captured = curr; }
          return prev + curr;
        }, 0);
        expect(captured).assertEqual(0);

      }
      {
        let arr: Int16Array = Int16Array.of(10, -1, 5);
        let captured: number = 0;
        arr.reduceRight<number>((prev: number, curr: number, idx: int, a: Int16Array): number => {
          if (idx === 1) { captured = curr; }
          return prev + curr;
        }, 0);
        expect(captured).assertEqual(-1);

      }
      {
        let arr: Int16Array = Int16Array.of(42);
        let capturedIdx: number = -1;
        arr.reduceRight<number>((prev: number, curr: number, idx: int, a: Int16Array): number => {
          capturedIdx = idx;
          return prev + curr;
        }, 0);
        expect(capturedIdx).assertEqual(0);

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4);
        let lengthsConsistent: boolean = true;
        arr.reduceRight<number>((prev: number, curr: number, idx: int, a: Int16Array): number => {
          if (a.length !== 4) { lengthsConsistent = false; }
          return prev + curr;
        }, 0);
        expect(lengthsConsistent).assertTrue();

      }
      {
        let arr: Int16Array = Int16Array.of(5, 10, 15, 20);
        let readViaArray: number = 0;
        arr.reduceRight<number>((prev: number, curr: number, idx: int, a: Int16Array): number => {
          readViaArray = a.$_get(0);
          return prev + curr;
        }, 0);
        expect(readViaArray).assertEqual(5);

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let isSameRef: boolean = false;
        arr.reduceRight<number>((prev: number, curr: number, idx: int, a: Int16Array): number => {
          if (idx === 0) { isSameRef = (a === arr); }
          return prev + curr;
        }, 0);
        expect(isSameRef).assertTrue();

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let result: number = arr.reduceRight<number>((prev: number, curr: number, idx: int, a: Int16Array): number => {
          if (idx === 0) { a.$_set(2, 999); }
          return prev + curr;
        }, 0);
        expect(result).assertEqual(6);
        let resultValue1: number = arr.$_get(2);
        let expectedValue1: int = 999;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let outer: Int16Array = Int16Array.of(1, 2);
        let outerResult: number = outer.reduceRight<number>((prev: number, curr: number, idx: int, a: Int16Array): number => {
          let inner: Int16Array = Int16Array.of(curr, curr + 1);
          let innerSum: number = inner.reduceRight<number>((p: number, c: number, i: int, ia: Int16Array): number => p + c, 0);
          return prev + innerSum;
        }, 0);
        expect(outerResult).assertEqual(8);

      }
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30);
        let trace: number[] = [];
        arr.reduceRight<number>((prev: number, curr: number, idx: int, a: Int16Array): number => {
          trace.push(curr);
          return prev + curr;
        }, 0);
        let resultValue1: number = trace[0];
        let expectedValue1: int = 30;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = trace[1];
        let expectedValue2: int = 20;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = trace[2];
        let expectedValue3: int = 10;
        expect(resultValue3).assertEqual(expectedValue3);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REDUCERIGHT_0300
     * @tc.name testReduceRightGeneral003
     * @tc.desc Verify reduceRight accumulation results for normal arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReduceRightGeneral003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr: Int16Array = Int16Array.of(-5, 10);
        let result: string = arr.reduceRight<string>((prev: string, curr: number, idx: int, a: Int16Array): string => prev + "_" + curr.toString(), "");
        expect(result).assertEqual("_10_-5");

      }
      {
        let arr: Int16Array = new Int16Array(0);
        let init: ReduceRightPart03Box = new ReduceRightPart03Box();
        init.value = 42;
        let result: ReduceRightPart03Box = arr.reduceRight<ReduceRightPart03Box>((prev: ReduceRightPart03Box, curr: number, idx: int, a: Int16Array): ReduceRightPart03Box => {
          prev.value = prev.value + curr;
          return prev;
        }, init);
        let resultValue1: boolean = result === init;
        expect(resultValue1).assertTrue();

      }
      {
        let arr: Int16Array = Int16Array.of(5, 10);
        let init: ReduceRightPart03Pair = new ReduceRightPart03Pair();
        init.a = 1;
        init.b = 2;
        let result: ReduceRightPart03Pair = arr.reduceRight<ReduceRightPart03Pair>((prev: ReduceRightPart03Pair, curr: number, idx: int, a: Int16Array): ReduceRightPart03Pair => {
          let p: ReduceRightPart03Pair = new ReduceRightPart03Pair();
          p.a = prev.a + curr;
          p.b = prev.b + 1;
          return p;
        }, init);
        let resultValue1: number = result.a;
        let expectedValue1: int = 16;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = result.b;
        let expectedValue2: int = 4;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        try {
          arr.reduceRight<number>((prev: number, curr: number, idx: int, a: Int16Array): number => {
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
          arr.reduceRight<number>((prev: number, curr: number, idx: int, a: Int16Array): number => {
            throw new RangeError("range error");
          }, 0);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REDUCERIGHT_0400
     * @tc.name testReduceRightCallback001
     * @tc.desc Verify reduceRight callback parameters traversal order and invocation counts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReduceRightCallback001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr = Int16Array.of(1, 2, 3);
        let result: number = arr.reduceRight((prev: number, curr: number): number => {
          return prev + curr;
        }, 100);
        expect(result).assertEqual(106);

      }
      {
        let arr = Int16Array.of(1, 2, 3);
        let result = arr.reduceRight((prev: number, curr: number): number => {
          return prev;
        }, 42);
        expect(result).assertEqual(42);

      }
      {
        let arr = Int16Array.of(1, 2, 3);
        let result = arr.reduceRight((prev: number, curr: number): number => {
          return prev + curr;
        }, 0);
        expect(result).assertEqual(6);

      }
      {
        let arr = Int16Array.of(2, 3, 4);
        let result = arr.reduceRight((prev: number, curr: number): number => {
          return prev * curr;
        }, 1);
        expect(result).assertEqual(24);

      }
      {
        let arr = Int16Array.of(1, 2, 3);
        let result = arr.reduceRight((prev: number, curr: number): number => {
          return prev - curr;
        }, 10);
        expect(result).assertEqual(4);

      }
      {
        let arr = Int16Array.of(1, 2, 3);
        let result = arr.reduceRight((prev: number, curr: number, idx: int): number => {
          return prev + curr + Number(idx);
        }, 0);
        expect(result).assertEqual(9);

      }
      {
        let arr = Int16Array.of(1, 2, 3);
        let result = arr.reduceRight((prev: number, curr: number, idx: int, a: Int16Array): number => {
          return prev + curr + Number(a.length);
        }, 0);
        expect(result).assertEqual(15);

      }
      {
        let arr = Int16Array.of(10, 20);
        let result = arr.reduceRight((prev: number, curr: number, idx: int, a: Int16Array): number => {
          return prev + curr + Number(idx) + Number(a.length);
        }, 0);
        expect(result).assertEqual(35);

      }
      {
        let arr = Int16Array.of(1, 2);
        let fn = (prev: number, curr: number): number => { return prev + curr; };
        let result = arr.reduceRight(fn, 0);
        expect(result).assertEqual(3);

      }
      {
        let arr = Int16Array.of(1, 2, 3);
        let result = arr.reduceRight((prev: number, curr: number): number => {
          return 999;
        }, 0);
        expect(result).assertEqual(999);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REDUCERIGHT_0500
     * @tc.name testReduceRightCallback002
     * @tc.desc Verify reduceRight callback parameters traversal order and invocation counts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReduceRightCallback002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let multiplier: number = 3;
        let arr = Int16Array.of(1, 2, 3);
        let result = arr.reduceRight((prev: number, curr: number): number => {
          return prev + curr * multiplier;
        }, 0);
        expect(result).assertEqual(18);

      }
      {
        let callCount: number = 0;
        let arr = Int16Array.of(7, 8, 9);
        arr.reduceRight((prev: number, curr: number): number => {
          callCount++;
          return prev + curr;
        }, 0);
        expect(callCount).assertEqual(3);

      }
      {
        let arr = Int16Array.of(1, -2, 3);
        let result = arr.reduceRight((prev: number, curr: number): number => {
          if (curr > 0) {
            return prev + curr;
          }
          return prev;
        }, 0);
        expect(result).assertEqual(4);

      }
      {
        let doubleFn = (x: number): number => { return x * 2; };
        let arr = Int16Array.of(1, 2);
        let result = arr.reduceRight((prev: number, curr: number): number => {
          return prev + doubleFn(curr);
        }, 0);
        expect(result).assertEqual(6);

      }
      {
        let arr = Int16Array.of(1, 2, 3);
        let allCorrect: boolean = true;
        arr.reduceRight((prev: number, curr: number, idx: int, a: Int16Array): number => {
          if (a.$_get(idx) !== curr) {
            allCorrect = false;
          }
          return prev + curr;
        }, 0);
        expect(allCorrect).assertTrue();

      }
      {
        let arr = Int16Array.of(1, 2, 3);
        let result = arr.reduceRight((prev: number, curr: number): number => {
          let doubled: number = curr * 2;
          let added: number = prev + doubled;
          return added;
        }, 0);
        expect(result).assertEqual(12);

      }
      {
        let arr = Int16Array.of(1, 2, 3);
        let result = arr.reduceRight((prev: number, curr: number, idx: int): number => {
          if (idx === 0) {
            return prev + curr * 10;
          }
          return prev + curr;
        }, 0);
        expect(result).assertEqual(15);

      }
      {
        let arr = Int16Array.of(1, -2, 3);
        let result = arr.reduceRight((prev: number, curr: number): number => {
          if (curr < 0) {
            return prev;
          }
          return prev + curr;
        }, 0);
        expect(result).assertEqual(4);

      }
      {
        let arr = Int16Array.of(1, 5, 3);
        let result = arr.reduceRight((prev: number, curr: number): number => {
          if (curr > prev) {
            return curr;
          }
          return prev;
        }, 0);
        expect(result).assertEqual(5);

      }
      {
        let arr = Int16Array.of(1, 2);
        let result: boolean = arr.reduceRight((prev: boolean, curr: number): boolean => {
          return prev && (curr > 0);
        }, true);
        expect(result).assertTrue();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REDUCERIGHT_0600
     * @tc.name testReduceRightCallback003
     * @tc.desc Verify reduceRight callback parameters traversal order and invocation counts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReduceRightCallback003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr = Int16Array.of(1, 2, 3);
        let result = arr.reduceRight((prev: number, curr: number): number => {
          return prev * 10 + curr;
        }, 0);
        expect(result).assertEqual(321);

      }
      {
        let arr = Int16Array.of(7);
        let result = arr.reduceRight((prev: number, curr: number): number => {
          return prev + curr;
        }, 10);
        expect(result).assertEqual(17);

      }
      {
        let arr = Int16Array.of(1, 2, 3);
        let lenBefore: number = Number(arr.length);
        arr.reduceRight((prev: number, curr: number): number => {
          return prev + curr;
        }, 0);
        let resultValue1: number = Number(arr.length);
        let expectedValue1: number = lenBefore;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr = Int16Array.of(-32768, -1);
        let result = arr.reduceRight((prev: number, curr: number): number => {
          return prev + curr;
        }, 0);
        expect(result).assertEqual(-32769);

      }
      {
        let firstIdx: number = -1;
        let arr = Int16Array.of(10, 20, 30);
        arr.reduceRight((prev: number, curr: number, idx: int): number => {
          if (firstIdx === -1) {
            firstIdx = Number(idx);
          }
          return prev + curr;
        }, 0);
        expect(firstIdx).assertEqual(2);

      }
      {
        let lastIdx: number = -1;
        let arr = Int16Array.of(10, 20, 30);
        arr.reduceRight((prev: number, curr: number, idx: int): number => {
          lastIdx = Number(idx);
          return prev + curr;
        }, 0);
        expect(lastIdx).assertEqual(0);

      }
      {
        let arr = Int16Array.of(10, 20, 30);
        let result = arr.reduceRight((prev: number, curr: number, idx: int, a: Int16Array): number => prev - curr);
        expect(result).assertEqual(0);

      }
      {
        let arr = Int16Array.of(1, 2, 3, 4);
        let result = arr.reduceRight((prev: number, curr: number, idx: int, a: Int16Array): number => prev + curr);
        expect(result).assertEqual(10);

      }
      {
        let arr = Int16Array.of(5, 10, 15);
        let result = arr.reduceRight(subFnInt16ArrayReduceRightPart02Test003);
        expect(result).assertEqual(0);

      }
      {
        let arr = Int16Array.of(2, 3, 4);
        let result = arr.reduceRight((prev: number, curr: number, idx: int, a: Int16Array): number => prev * curr);
        expect(result).assertEqual(24);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REDUCERIGHT_0700
     * @tc.name testReduceRightCallback004
     * @tc.desc Verify reduceRight callback parameters traversal order and invocation counts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReduceRightCallback004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr = Int16Array.of(2, 4, 16);
        let result = arr.reduceRight((prev: number, curr: number, idx: int, a: Int16Array): number => prev / curr);
        expect(result).assertEqual(2);

      }
      {
        let arr = Int16Array.of(1, 2, 4);
        let result = arr.reduceRight((prev: number, curr: number, idx: int, a: Int16Array): number => prev | curr);
        expect(result).assertEqual(7);

      }
      {
        let arr = Int16Array.of(7, 3, 1);
        let result = arr.reduceRight((prev: number, curr: number, idx: int, a: Int16Array): number => prev & curr);
        expect(result).assertEqual(1);

      }
      {
        let arr = Int16Array.of(1, 2, 5);
        let firstPrev: number = 0;
        arr.reduceRight((prev: number, curr: number, idx: int, a: Int16Array): number => {
          firstPrev = prev;
          return prev + curr;
        });
        expect(firstPrev).assertEqual(7);

      }
      {
        let arr = Int16Array.of(10, 20, 30);
        let secondPrev: number = 0;
        let callCount: number = 0;
        arr.reduceRight((prev: number, curr: number, idx: int, a: Int16Array): number => {
          callCount++;
          if (callCount === 2) {
            secondPrev = prev;
          }
          return prev - curr;
        });
        expect(secondPrev).assertEqual(10);

      }
      {
        let arr = Int16Array.of(100, 0, -50);
        let result = arr.reduceRight((prev: number, curr: number, idx: int, a: Int16Array): number => prev + curr);
        expect(result).assertEqual(50);

      }
      {
        let arr = Int16Array.of(100, 200, 300);
        let firstCurr: number = 0;
        let visited: boolean = false;
        arr.reduceRight((prev: number, curr: number, idx: int, a: Int16Array): number => {
          if (!visited) {
            firstCurr = curr;
            visited = true;
          }
          return prev + curr;
        });
        expect(firstCurr).assertEqual(200);

      }
      {
        let arr = Int16Array.of(7, 8, 9, 10);
        let lastCurr: number = 0;
        arr.reduceRight((prev: number, curr: number, idx: int, a: Int16Array): number => {
          lastCurr = curr;
          return prev + curr;
        });
        expect(lastCurr).assertEqual(7);

      }
      {
        let arr = Int16Array.of(10, 20, 30, 40);
        let currValues: number[] = [];
        arr.reduceRight((prev: number, curr: number, idx: int, a: Int16Array): number => {
          currValues.push(curr);
          return prev + curr;
        });
        let resultValue1: number = currValues[0];
        let expectedValue1: int = 30;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = currValues[1];
        let expectedValue2: int = 20;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = currValues[2];
        let expectedValue3: int = 10;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        let arr = Int16Array.of(-5, -10, 1);
        let result = arr.reduceRight((prev: number, curr: number, idx: int, a: Int16Array): number => prev + curr);
        expect(result).assertEqual(-14);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REDUCERIGHT_0800
     * @tc.name testReduceRightCallback005
     * @tc.desc Verify reduceRight callback parameters traversal order and invocation counts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReduceRightCallback005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr = Int16Array.of(5, 10, 15, 20);
        let firstIdx: number = -1;
        let visited: boolean = false;
        arr.reduceRight((prev: number, curr: number, idx: int, a: Int16Array): number => {
          if (!visited) {
            firstIdx = idx;
            visited = true;
          }
          return prev + curr;
        });
        expect(firstIdx).assertEqual(2);

      }
      {
        let arr = Int16Array.of(3, 6, 9);
        let lastIdx: number = -1;
        arr.reduceRight((prev: number, curr: number, idx: int, a: Int16Array): number => {
          lastIdx = idx;
          return prev + curr;
        });
        expect(lastIdx).assertEqual(0);

      }
      {
        let arr = Int16Array.of(1, 2, 3, 4, 5);
        let indices: number[] = [];
        arr.reduceRight((prev: number, curr: number, idx: int, a: Int16Array): number => {
          indices.push(idx);
          return prev + curr;
        });
        let resultValue1: number = indices[0];
        let expectedValue1: int = 3;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = indices[1];
        let expectedValue2: int = 2;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = indices[2];
        let expectedValue3: int = 1;
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: number = indices[3];
        let expectedValue4: int = 0;
        expect(resultValue4).assertEqual(expectedValue4);

      }
      {
        let arr = Int16Array.of(1, 2, 3, 4);
        let lastIdx: int = -1;
        arr.reduceRight((prev: number, curr: number, idx: int, a: Int16Array): number => {
          lastIdx = idx;
          return prev + curr;
        });
        expect(lastIdx).assertEqual(0);

      }
      {
        let arr = Int16Array.of(1, 2, 3);
        let captured: Int16Array | null = null;
        arr.reduceRight((prev: number, curr: number, idx: int, a: Int16Array): number => {
          captured = a;
          return prev + curr;
        });
        let sameRef: boolean = captured === arr;
        expect(sameRef).assertTrue();

      }
      {
        let arr = Int16Array.of(10, 20, 30, 40);
        let lenMatch: boolean = true;
        arr.reduceRight((prev: number, curr: number, idx: int, a: Int16Array): number => {
          if (a.length !== arr.length) {
            lenMatch = false;
          }
          return prev + curr;
        });
        expect(lenMatch).assertTrue();

      }
      {
        let arr = Int16Array.of(5, 10, 15);
        let firstViaParam: number = 0;
        arr.reduceRight((prev: number, curr: number, idx: int, a: Int16Array): number => {
          firstViaParam = a.$_get(0);
          return prev + curr;
        });
        expect(firstViaParam).assertEqual(5);

      }
      {
        let arr = Int16Array.of(7, 14, 21);
        let lastViaParam: number = 0;
        arr.reduceRight((prev: number, curr: number, idx: int, a: Int16Array): number => {
          lastViaParam = a.$_get(a.length - 1);
          return prev + curr;
        });
        expect(lastViaParam).assertEqual(21);

      }
      {
        let arr = Int16Array.of(1, 2, 3);
        let paramLen: int = 0;
        let paramFirst: number = 0;
        arr.reduceRight((prev: number, curr: number, idx: int, a: Int16Array): number => {
          paramLen = a.length;
          paramFirst = a.$_get(0);
          return prev + curr;
        });
        let resultValue1: int = paramLen;
        let expectedValue1: int = 3;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = paramFirst;
        let expectedValue2: int = 1;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let arr = Int16Array.of(10, 20, 30);
        let result = arr.reduceRight((prev: number, curr: number, idx: int, a: Int16Array): number => {
          if (idx === 1) {
            a.$_set(0, 99);
          }
          return prev + curr;
        });
        expect(result).assertEqual(149);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REDUCERIGHT_0900
     * @tc.name testReduceRightCallback006
     * @tc.desc Verify reduceRight callback parameters traversal order and invocation counts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReduceRightCallback006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr = Int16Array.of(1, 2, 3);
        let externalSum: number = 0;
        arr.reduceRight((prev: number, curr: number, idx: int, a: Int16Array): number => {
          externalSum += curr;
          return prev + curr;
        });
        expect(externalSum).assertEqual(3);

      }
      {
        let arr = Int16Array.of(10, 20, 30, 40);
        let extCallCount: number = 0;
        arr.reduceRight((prev: number, curr: number, idx: int, a: Int16Array): number => {
          extCallCount++;
          return prev + curr;
        });
        expect(extCallCount).assertEqual(3);

      }
      {
        let arr = Int16Array.of(1, 2, 3);
        let nestedResult: number = 0;
        arr.reduceRight((prev: number, curr: number, idx: int, a: Int16Array): number => {
          if (idx === 1) {
            let inner = Int16Array.of(10, 20);
            nestedResult = inner.reduceRight((p: number, c: number, i: int, ar: Int16Array): number => p - c);
          }
          return prev + curr;
        });
        expect(nestedResult).assertEqual(10);

      }
      {
        let arr = Int16Array.of(2, 4, 6);
        let flag: boolean = false;
        let result = arr.reduceRight((prev: number, curr: number, idx: int, a: Int16Array): number => {
          flag = true;
          return prev * curr;
        });
        expect(flag).assertTrue();
        expect(result).assertEqual(48);

      }
      {
        let arr = Int16Array.of(2, 3, 4);
        let result = arr.reduceRight((prev: number, curr: number, idx: int, a: Int16Array): number => {
          if (idx === 1) {
            return 0.5;
          }
          return prev + curr;
        });
        expect(result).assertEqual(2.5);

      }
      {
        let arr = Int16Array.of(5, -0);
        let result = arr.reduceRight((prev: number, curr: number, idx: int, a: Int16Array): number => -0);
        expect(result).assertEqual(0);

      }
      {
        let arr = Int16Array.of(10, 20, 30, 40);
        let result = arr.reduceRight((prev: number, curr: number, idx: int, a: Int16Array): number => idx);
        expect(result).assertEqual(0);

      }
      {
        let arr = Int16Array.of(-5, 10, -3);
        let result = arr.reduceRight((prev: number, curr: number, idx: int, a: Int16Array): number => {
          if (curr >= 0) {
            return prev + curr;
          }
          return prev - curr;
        });
        expect(result).assertEqual(12);

      }
      {
        let arr = Int16Array.of(1, 1, 1, 1);
        let result = arr.reduceRight((prev: number, curr: number, idx: int, a: Int16Array): number => {
          return (idx % 2 === 0) ? prev + curr : prev * curr;
        });
        expect(result).assertEqual(3);

      }
      {
        let arr = Int16Array.of(-10, -20, -30);
        let result = arr.reduceRight((prev: number, curr: number, idx: int, a: Int16Array): number => prev + Math.abs(curr));
        expect(result).assertEqual(0);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REDUCERIGHT_1000
     * @tc.name testReduceRightCallback007
     * @tc.desc Verify reduceRight callback parameters traversal order and invocation counts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReduceRightCallback007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr = Int16Array.of(5, 10, 15);
        let firstCall: boolean = true;
        let result = arr.reduceRight((prev: number, curr: number, idx: int, a: Int16Array): number => {
          if (firstCall) {
            firstCall = false;
            return 0;
          }
          return prev + curr;
        });
        expect(result).assertEqual(5);

      }
      {
        let arr = Int16Array.of(1, 2, 3, 4, 5);
        let result = arr.reduceRight((prev: number, curr: number, idx: int, a: Int16Array): number => prev - curr);
        expect(result).assertEqual(-5);

      }
      {
        let arr = Int16Array.from([3, 6, 9]);
        let result = arr.reduceRight((prev: number, curr: number, idx: int, a: Int16Array): number => prev - curr);
        expect(result).assertEqual(0);

      }
      {
        let arr = Int16Array.of(0, 1, 2, 3);
        let result = arr.reduceRight((prev: number, curr: number, idx: int, a: Int16Array): number => prev + curr);
        expect(result).assertEqual(6);

      }
      {
        let arr = Int16Array.of(10, 5, 0);
        let firstPrev: number = -999;
        let visited: boolean = false;
        arr.reduceRight((prev: number, curr: number, idx: int, a: Int16Array): number => {
          if (!visited) {
            firstPrev = prev;
            visited = true;
          }
          return prev + curr;
        });
        expect(firstPrev).assertEqual(0);

      }
      {
        let arr = Int16Array.of(1, 2, 3);
        let result = arr.reduceRight((prev: number, curr: number, idx: int, a: Int16Array): number => 0);
        expect(result).assertEqual(0);

      }
      {
        let arr: Int16Array = Int16Array.of(100, 200, 300);
        let firstCurr: number = 0;
        arr.reduceRight<number>((prev: number, curr: number, idx: int, a: Int16Array): number => {
          if (firstCurr === 0) { firstCurr = curr; }
          return prev + curr;
        }, 0);
        expect(firstCurr).assertEqual(300);

      }
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30);
        let secondCurr: number = 0;
        let round: number = 0;
        arr.reduceRight<number>((prev: number, curr: number, idx: int, a: Int16Array): number => {
          round++;
          if (round === 2) { secondCurr = curr; }
          return prev + curr;
        }, 0);
        expect(secondCurr).assertEqual(20);

      }
      {
        let arr: Int16Array = Int16Array.of(5, 10, 15);
        let lastCurr: number = 0;
        arr.reduceRight<number>((prev: number, curr: number, idx: int, a: Int16Array): number => {
          lastCurr = curr;
          return prev + curr;
        }, 0);
        expect(lastCurr).assertEqual(5);

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4);
        let seq: number[] = [];
        arr.reduceRight<number>((prev: number, curr: number, idx: int, a: Int16Array): number => {
          seq.push(curr);
          return prev + curr;
        }, 0);
        let resultValue1: number = seq[0];
        let expectedValue1: int = 4;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = seq[1];
        let expectedValue2: int = 3;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = seq[2];
        let expectedValue3: int = 2;
        expect(resultValue3).assertEqual(expectedValue3);
        let resultValue4: number = seq[3];
        let expectedValue4: int = 1;
        expect(resultValue4).assertEqual(expectedValue4);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REDUCERIGHT_1100
     * @tc.name testReduceRightCallback008
     * @tc.desc Verify reduceRight callback parameters traversal order and invocation counts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReduceRightCallback008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30);
        let indices: number[] = [];
        arr.reduceRight<number>((prev: number, curr: number, idx: int, a: Int16Array): number => {
          indices.push(idx);
          return prev + curr;
        }, 0);
        let resultValue1: number = indices[0];
        let expectedValue1: int = 2;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = indices[1];
        let expectedValue2: int = 1;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = indices[2];
        let expectedValue3: int = 0;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
        let firstIdx: number = -1;
        arr.reduceRight<number>((prev: number, curr: number, idx: int, a: Int16Array): number => {
          if (firstIdx === -1) { firstIdx = idx; }
          return prev + curr;
        }, 0);
        expect(firstIdx).assertEqual(4);

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4);
        let capturedAfterMod: number = 0;
        arr.reduceRight<number>((prev: number, curr: number, idx: int, a: Int16Array): number => {
          if (idx === 3) { a.$_set(1, 99); }
          if (idx === 2) { capturedAfterMod = a.$_get(1); }
          return prev + curr;
        }, 0);
        expect(capturedAfterMod).assertEqual(99);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REDUCERIGHT_1200
     * @tc.name testReduceRightSingle001
     * @tc.desc Verify reduceRight on single-element arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReduceRightSingle001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr = Int16Array.of(99);
        let prevSeen: boolean = false;
        arr.reduceRight((prev: number, curr: number, idx: int, a: Int16Array): number => {
          prevSeen = true;
          return prev + curr;
        });
        expect(prevSeen).assertFalse();

      }
      {
        let arr = Int16Array.of(100, 200);
        let callIdx: number = -1;
        arr.reduceRight((prev: number, curr: number, idx: int, a: Int16Array): number => {
          callIdx = idx;
          return prev + curr;
        });
        expect(callIdx).assertEqual(0);

      }
      {
        let arr = Int16Array.of(42);
        let idxCount: number = 0;
        arr.reduceRight((prev: number, curr: number, idx: int, a: Int16Array): number => {
          idxCount++;
          return prev + curr;
        });
        expect(idxCount).assertEqual(0);

      }
      {
        let arr = Int16Array.of(0);
        let called: boolean = false;
        let result = arr.reduceRight((prev: number, curr: number, idx: int, a: Int16Array): number => {
          called = true;
          return prev + curr;
        });
        expect(result).assertEqual(0);
        expect(called).assertFalse();

      }
      {
        let arr = Int16Array.of(1);
        let result = arr.reduceRight((prev: number, curr: number, idx: int, a: Int16Array): number => prev + curr);
        expect(result).assertEqual(1);

      }
      {
        let arr = Int16Array.of(-1);
        let result = arr.reduceRight((prev: number, curr: number, idx: int, a: Int16Array): number => prev + curr);
        expect(result).assertEqual(-1);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REDUCERIGHT_1300
     * @tc.name testReduceRightImmunity001
     * @tc.desc Verify reduceRight leaves the source array buffer and views unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReduceRightImmunity001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr = Int16Array.of(1, 2, 3, 4);
        let result = arr.reduceRight((prev: number, curr: number, idx: int, a: Int16Array): number => {
          a.$_set(a.length - 1, 99);
          return prev + curr;
        });
        expect(result).assertEqual(10);

      }
      {
        let arr = Int16Array.of(1, 2, 3, 4);
        let origLen: number = arr.length;
        arr.reduceRight((prev: number, curr: number, idx: int, a: Int16Array): number => prev + curr);
        let resultValue1: int = arr.length;
        let expectedValue1: number = origLen;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr = Int16Array.of(10, 20, 30);
        let firstBefore: number = arr.$_get(0);
        arr.reduceRight((prev: number, curr: number, idx: int, a: Int16Array): number => prev + curr);
        let resultValue1: number = arr.$_get(0);
        let expectedValue1: number = firstBefore;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr = Int16Array.of(1, 2, 3);
        let origByteLen: number = arr.byteLength;
        arr.reduceRight((prev: number, curr: number, idx: int, a: Int16Array): number => prev + curr);
        let resultValue1: int = arr.byteLength;
        let expectedValue1: number = origByteLen;
        expect(resultValue1).assertEqual(expectedValue1);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REDUCERIGHT_1400
     * @tc.name testReduceRightBoundary001
     * @tc.desc Verify reduceRight with Int16 boundary and special numeric values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReduceRightBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let result: number = arr.reduceRight<number>((prev: number, curr: number): number => {
          return prev + curr;
        }, Double.NaN);
        let resultValue1: boolean = isNaN(result);
        expect(resultValue1).assertTrue();

      }
      {
        let arr: Int16Array = new Int16Array(0);
        let result: number = arr.reduceRight<number>((prev: number, curr: number): number => {
          return prev + curr;
        }, 2147483647);
        expect(result).assertEqual(2147483647);

      }
      {
        let arr = Int16Array.of(32767, 1);
        let result = arr.reduceRight((prev: number, curr: number): number => {
          return prev + curr;
        }, 0);
        expect(result).assertEqual(32768);

      }
      {
        let arr = Int16Array.of(32767, 32767, 32767);
        let result = arr.reduceRight((prev: number, curr: number, idx: int, a: Int16Array): number => prev + curr);
        expect(result).assertEqual(98301);

      }
      {
        let arr = Int16Array.of(-32768, -32768, -32768);
        let result = arr.reduceRight((prev: number, curr: number, idx: int, a: Int16Array): number => prev + curr);
        expect(result).assertEqual(-98304);

      }
      {
        let arr = Int16Array.of(1, 32767, 0);
        let result = arr.reduceRight((prev: number, curr: number, idx: int, a: Int16Array): number => prev + curr);
        expect(result).assertEqual(32768);

      }
      {
        let arr = Int16Array.of(1, -32768, 0);
        let result = arr.reduceRight((prev: number, curr: number, idx: int, a: Int16Array): number => prev + curr);
        expect(result).assertEqual(-32767);

      }
      {
        let arr = Int16Array.of(1, 0, 0);
        let result = arr.reduceRight((prev: number, curr: number, idx: int, a: Int16Array): number => {
          if (idx === 1) {
            return Double.POSITIVE_INFINITY;
          }
          return prev + curr;
        });
        expect(result).assertEqual(Double.POSITIVE_INFINITY);

      }
      {
        let arr = Int16Array.of(1, 0, 0);
        let result = arr.reduceRight((prev: number, curr: number, idx: int, a: Int16Array): number => Number.MAX_VALUE);
        expect(result).assertEqual(Number.MAX_VALUE);

      }
      {
        let arr = Int16Array.of(32767);
        let result = arr.reduceRight((prev: number, curr: number, idx: int, a: Int16Array): number => prev + curr);
        expect(result).assertEqual(32767);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REDUCERIGHT_1500
     * @tc.name testReduceRightBoundary002
     * @tc.desc Verify reduceRight with Int16 boundary and special numeric values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReduceRightBoundary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr = Int16Array.of(-32768);
        let result = arr.reduceRight((prev: number, curr: number, idx: int, a: Int16Array): number => prev + curr);
        expect(result).assertEqual(-32768);

      }
      {
        let arr: Int16Array = Int16Array.of(-32768, 0, 1);
        let captured: number = 99999;
        arr.reduceRight<string>((prev: string, curr: number, idx: int, a: Int16Array): string => {
          if (idx === 0) { captured = curr; }
          return prev + curr.toString();
        }, "");
        expect(captured).assertEqual(-32768);

      }
      {
        let arr: Int16Array = Int16Array.of(0, 32767);
        let captured: number = -99999;
        arr.reduceRight<string>((prev: string, curr: number, idx: int, a: Int16Array): string => {
          if (idx === 1) { captured = curr; }
          return prev + curr.toString();
        }, "");
        expect(captured).assertEqual(32767);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REDUCERIGHT_1600
     * @tc.name testReduceRightOverload001
     * @tc.desc Verify reduceRight overload resolution between no-init and with-init forms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReduceRightOverload001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr = Int16Array.of(10, 20, 30);
        const result: number = arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => prev - cur);
        expect(result).assertEqual(30 - 20 - 10);

      }
      {
        const arr = Int16Array.of(10, 20, 30);
        const result: number = arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => prev - cur, 0);
        expect(result).assertEqual(0 - 30 - 20 - 10);

      }
      {
        const arr = Int16Array.of(10, 20, 30);
        const result: string = arr.reduceRight((prev: string, cur: number, idx: int, a: Int16Array) => prev + cur.toString(), "init");
        expect(result).assertEqual("init302010");

      }
      {
        const arr = Int16Array.of(1, 0, 1);
        const result: boolean = arr.reduceRight((prev: boolean, cur: number, idx: int, a: Int16Array) => prev && (cur !== 0), true);
        expect(result).assertFalse();

      }
      {
        const arr = Int16Array.of(5, 15, 25);
        const result: number = arr.reduceRight<number>((prev: number, cur: number, idx: int, a: Int16Array) => prev * cur, 1);
        expect(result).assertEqual(1 * 25 * 15 * 5);

      }
      {
        const arr = Int16Array.of(100, 200, 300);
        const result: string = arr.reduceRight<string>((prev: string, cur: number, idx: int, a: Int16Array) => prev + cur.toString(), "x");
        expect(result).assertEqual("x300200100");

      }
      {
        const arr = Int16Array.of(2, 4, 6);
        const result: boolean = arr.reduceRight<boolean>((prev: boolean, cur: number, idx: int, a: Int16Array) => prev || (cur > 10), false);
        expect(result).assertFalse();

      }
      {
        const arr = Int16Array.of(7, 14, 21);
        const r1: number = arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => prev - cur);
        const r2: number = arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => prev - cur, 21);
        expect(r1).assertEqual(0);
        expect(r2).assertEqual(-21);

      }
      {
        const arr = Int16Array.of(2, 3, 4);
        const r1: number = arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => prev + cur);
        const r2: number = arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => prev + cur, 0);
        expect(r1).assertEqual(4 + 3 + 2);
        expect(r2).assertEqual(0 + 4 + 3 + 2);

      }
      {
        const arr = Int16Array.of(1, 2, 3);
        const result: number =arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array): number => prev * cur);
        expect(result).assertEqual(3 * 2 * 1);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REDUCERIGHT_1700
     * @tc.name testReduceRightOverload002
     * @tc.desc Verify reduceRight overload resolution between no-init and with-init forms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReduceRightOverload002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr = Int16Array.of(5, 10);
        const result = arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => prev + cur);
        expect(result).assertEqual(15);

      }
      {
        const arr = Int16Array.of(1, 2, 3);
        const result: number = arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => prev * 2 + cur);
        expect(result).assertEqual((3 * 2 + 2) * 2 + 1);

      }
      {
        const arr = Int16Array.of(40, 30, 20);
        const r2: number = arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => prev - cur);
        const r1: number = arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => prev - cur, 100);
        expect(r2).assertEqual(20 - 30 - 40);
        expect(r1).assertEqual(100 - 20 - 30 - 40);

      }
      {
        const arr = Int16Array.of(1, 2, 32767);
        const result: number = arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => prev - cur);
        expect(result).assertEqual(32767 - 2 - 1);

      }
      {
        const arr = Int16Array.of(1, 2);
        const result: string = arr.reduceRight((prev: string, cur: number, idx: int, a: Int16Array): string => prev + cur.toString(), "prefix");
        let resultValue2: int = result.length;
        let expectedValue2: int = "prefix21".length;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        const arr = Int16Array.of(1, 2, 3);
        const result: number = arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => prev + cur * 0.5);
        expect(result).assertEqual(3 + 2 * 0.5 + 1 * 0.5);

      }
      {
        const arr: Int16Array = Int16Array.of(10, 20, 30);
        const r2: number = arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array): number => prev - cur);
        const r1: number = arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array): number => prev - cur, 100);
        expect(r2).assertEqual(30 - 20 - 10);
        expect(r1).assertEqual(100 - 30 - 20 - 10);

      }
      {
        const arr = Int16Array.of(100, 200);
        const result = arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => prev - cur);
        expect(result).assertEqual(100);

      }
      {
        const arr = Int16Array.of(2, 4, 6);
        const mid: number = arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => prev + cur);
        const finalResult: number = arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => prev - cur, mid);
        expect(mid).assertEqual(6 + 4 + 2);
        expect(finalResult).assertEqual(mid - 6 - 4 - 2);

      }
      {
        const arr = new Int16Array(0);
        const result: number = arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => prev + cur, 42);
        expect(result).assertEqual(42);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REDUCERIGHT_1800
     * @tc.name testReduceRightOverload003
     * @tc.desc Verify reduceRight overload resolution between no-init and with-init forms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReduceRightOverload003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr = Int16Array.of(5, 15, 25);
        try {
          arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => {
            if (cur === 15) {
              throw new TypeError("mid fail");
            }
            return prev + cur;
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
        const arr = Int16Array.of(10, 20, 30);
        let iterCount = 0;
        try {
          arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => {
            iterCount = iterCount + 1;
            if (iterCount >= 3) {
              throw new TypeError("last fail");
            }
            return prev + cur;
          }, 0);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
        }
        let resultValue1: number = arr.$_get(0 as int);
        let expectedValue1: int = 10;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = arr.$_get(1 as int);
        let expectedValue2: int = 20;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = arr.$_get(2 as int);
        let expectedValue3: int = 30;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        const arr = Int16Array.of(7, 14, 21);
        try {
          arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => {
            throw new TypeError("fail");
          }, 0);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
        }
        const result: number = arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => prev + cur);
        expect(result).assertEqual(21 + 14 + 7);

      }
      {
        const arr = Int16Array.of(1, 2, 3, 4, 5);
        try {
          arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => {
            if (cur === 3) {
              throw new TypeError("fail");
            }
            return prev + cur;
          }, 0);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
        }
        const elem: number = arr.$_get(0 as int);
        expect(elem).assertEqual(1);

      }
      {
        const arr = Int16Array.of(100, 200, 300);
        try {
          arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => {
            if (cur === 100) {
              throw new TypeError("fail");
            }
            return prev + cur;
          }, 0);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
        }
        let resultValue1: number = arr.$_get(0 as int);
        let expectedValue1: int = 100;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = arr.$_get(1 as int);
        let expectedValue2: int = 200;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = arr.$_get(2 as int);
        let expectedValue3: int = 300;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        const arr = Int16Array.of(10, 20);
        const result: number = arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => prev + cur);
        let resultValue1: string = result.toString();
        let expectedValue1: string = "30";
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        const arr = Int16Array.of(1, 2);
        const result: number = arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => prev + cur);
        let resultValue1: string = result.toFixed(1);
        let expectedValue1: string = "3.0";
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        const arr = Int16Array.of(1, 2);
        const result: number = arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => prev + Double.NaN);
        let resultValue1: boolean = isNaN(result);
        expect(resultValue1).assertTrue();

      }
      {
        const arr = Int16Array.of(10, 20, 30);
        let capturedArray: Int16Array | null = null;
        arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => {
          capturedArray = a;
          return prev + cur;
        });
        let resultValue1: boolean = capturedArray === arr;
        expect(resultValue1).assertTrue();

      }
      {
        const arr = Int16Array.of(5, 10, 15);
        let capturedArray: Int16Array | null = null;
        arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => {
          capturedArray = a;
          return prev + cur;
        }, 0);
        let resultValue1: boolean = capturedArray === arr;
        expect(resultValue1).assertTrue();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REDUCERIGHT_1900
     * @tc.name testReduceRightOverload004
     * @tc.desc Verify reduceRight overload resolution between no-init and with-init forms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReduceRightOverload004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr = Int16Array.of(1, 2, 3);
        arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => {
          if (idx === 1) {
            a.$_set(1 as int, 99);
          }
          return prev + cur;
        });
        let resultValue1: number = arr.$_get(1 as int);
        let expectedValue1: int = 99;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        const arr = Int16Array.of(1, 2, 3);
        arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => {
          if (idx === 0) {
            a.$_set(0 as int, 77);
          }
          return prev + cur;
        }, 0);
        let resultValue1: number = arr.$_get(0 as int);
        let expectedValue1: int = 77;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        const arr = Int16Array.of(10, 20, 30);
        let indices: number[] = [];
        arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => {
          indices.push(idx);
          return prev + cur;
        });
        let resultValue1: number = indices[0];
        let expectedValue1: int = 1;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = indices[1];
        let expectedValue2: int = 0;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        const arr = Int16Array.of(10, 20, 30);
        let indices: number[] = [];
        arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => {
          indices.push(idx);
          return prev + cur;
        }, 0);
        let resultValue1: number = indices[0];
        let expectedValue1: int = 2;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = indices[1];
        let expectedValue2: int = 1;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = indices[2];
        let expectedValue3: int = 0;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        const arr = Int16Array.of(10, 20, 30);
        let visited: number[] = [];
        arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => {
          visited.push(cur);
          return prev + cur;
        });
        let resultValue1: number = visited[0];
        let expectedValue1: int = 20;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = visited[1];
        let expectedValue2: int = 10;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        const arr = Int16Array.of(10, 20, 30);
        let visited: number[] = [];
        arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => {
          visited.push(cur);
          return prev + cur;
        }, 0);
        let resultValue1: number = visited[0];
        let expectedValue1: int = 30;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = visited[1];
        let expectedValue2: int = 20;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = visited[2];
        let expectedValue3: int = 10;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        const arr = Int16Array.of(1, 2, 3, 4);
        let capturedLength: number = -1;
        arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => {
          capturedLength = a.length;
          return prev + cur;
        });
        expect(capturedLength).assertEqual(4);

      }
      {
        const arr = Int16Array.of(1, 2, 3, 4);
        let capturedLength: number = -1;
        arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => {
          capturedLength = a.length;
          return prev + cur;
        }, 0);
        expect(capturedLength).assertEqual(4);

      }
      {
        const arr = Int16Array.of(2, 3, 4);
        const r1: number = arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => prev * cur);
        const r2: number = arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => prev + cur);
        expect(r1).assertEqual(4 * 3 * 2);
        expect(r2).assertEqual(4 + 3 + 2);

      }
      {
        const arr = Int16Array.of(2, 3, 4);
        const r1: number = arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => prev * cur, 1);
        const r2: number = arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => prev + cur, 0);
        expect(r1).assertEqual(1 * 4 * 3 * 2);
        expect(r2).assertEqual(0 + 4 + 3 + 2);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REDUCERIGHT_2000
     * @tc.name testReduceRightOverload005
     * @tc.desc Verify reduceRight overload resolution between no-init and with-init forms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReduceRightOverload005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr = Int16Array.of(5, 10, 15);
        arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => prev + cur);
        let resultValue1: number = arr.$_get(0 as int);
        let expectedValue1: int = 5;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = arr.$_get(1 as int);
        let expectedValue2: int = 10;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = arr.$_get(2 as int);
        let expectedValue3: int = 15;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        const arr = Int16Array.of(3, 6, 9);
        arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => prev + cur, 0);
        let resultValue1: number = arr.$_get(0 as int);
        let expectedValue1: int = 3;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = arr.$_get(1 as int);
        let expectedValue2: int = 6;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = arr.$_get(2 as int);
        let expectedValue3: int = 9;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        const init: ReduceRightPart04Counter = new ReduceRightPart04Counter();
        const arr = Int16Array.of(1, 2, 3);
        const result: ReduceRightPart04Counter = arr.reduceRight<ReduceRightPart04Counter>((prev: ReduceRightPart04Counter, cur: number, idx: int, a: Int16Array) => {
          prev.count = prev.count + cur;
          return prev;
        }, init);
        let resultValue1: boolean = result === init;
        expect(resultValue1).assertTrue();
        let resultValue2: number = result.count;
        let expectedValue2: int = 6;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = init.count;
        let expectedValue3: int = 6;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        const arr = Int16Array.of(10, 20, 30);
        let secondCur: number = 0;
        arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => {
          if (idx === 2) {
            a.$_set(1 as int, 99);
            return prev + cur;
          }
          if (idx === 1) {
            secondCur = cur;
          }
          return prev + cur;
        });
        expect(secondCur).assertEqual(20);

      }
      {
        const arr = Int16Array.of(1, 2, 3);
        let capturedByteLen: number = 0;
        arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => {
          capturedByteLen = a.byteLength;
          return prev + cur;
        });
        expect(capturedByteLen).assertEqual(6);

      }
      {
        const arr = Int16Array.of(1, 2, 3);
        let capturedByteLen: number = 0;
        arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => {
          capturedByteLen = a.byteLength;
          return prev + cur;
        }, 0);
        expect(capturedByteLen).assertEqual(6);

      }
      {
        const arr = Int16Array.of(1, 2, 3);
        const rOvl2: number = arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => prev - cur);
        const rOvl1: number = arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => prev * cur, 1);
        expect(rOvl2).assertEqual(3 - 2 - 1);
        expect(rOvl1).assertEqual(1 * 3 * 2 * 1);

      }
      {
        const arr = Int16Array.of(1, 2, 3, 4);
        let allSame: boolean = true;
        arr.reduceRight((prev: boolean, cur: number, idx: int, a: Int16Array) => {
          if (a !== arr) {
            allSame = false;
          }
          return prev;
        }, true);
        expect(allSame).assertTrue();

      }
      {
        const arr = Int16Array.of(1, 2, 3);
        let lastIdx: number = -1;
        arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => {
          lastIdx = idx;
          return prev + cur;
        });
        expect(lastIdx).assertEqual(0);

      }
      {
        const arr = Int16Array.of(1, 2, 3);
        let lastIdx: number = -1;
        arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => {
          lastIdx = idx;
          return prev + cur;
        }, 0);
        expect(lastIdx).assertEqual(0);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REDUCERIGHT_2100
     * @tc.name testReduceRightOverload006
     * @tc.desc Verify reduceRight overload resolution between no-init and with-init forms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReduceRightOverload006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr = Int16Array.of(1, 2, 3);
        let len2: number = 0;
        let len1: number = 0;
        arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => {
          len2 = a.length;
          return prev + cur;
        });
        arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => {
          len1 = a.length;
          return prev + cur;
        }, 0);
        expect(len2).assertEqual(3);
        expect(len1).assertEqual(3);

      }
      {
        const arr = Int16Array.of(100, 200, 300);
        let callCount: number = 0;
        arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => {
          callCount = callCount + 1;
          return prev + cur;
        });
        expect(callCount).assertEqual(2);

      }
      {
        const arr = Int16Array.of(100, 200, 300);
        let callCount: number = 0;
        arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => {
          callCount = callCount + 1;
          return prev + cur;
        }, 0);
        expect(callCount).assertEqual(3);

      }
      {
        const arr = Int16Array.of(42);
        let callCount: number = 0;
        const result: number = arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => {
          callCount = callCount + 1;
          return prev + cur;
        });
        expect(callCount).assertEqual(0);
        expect(result).assertEqual(42);

      }
      {
        const arr = Int16Array.of(42);
        let callCount: number = 0;
        const result: number = arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => {
          callCount = callCount + 1;
          return prev + cur;
        }, 100);
        expect(callCount).assertEqual(1);
        expect(result).assertEqual(142);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REDUCERIGHT_2200
     * @tc.name testReduceRightTypesPrim001
     * @tc.desc Verify reduceRight with primitive generic U types and initial values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReduceRightTypesPrim001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr = Int16Array.of(1, 2, 3);
        let result: bigint = arr.reduceRight((prev: bigint, curr: number): bigint => {
          return prev + BigInt(curr);
        }, BigInt(0));
        expect(result).assertEqual(BigInt(6));

      }
      {
        let arr = Int16Array.of(1, 2, 3);
        let result = arr.reduceRight((prev: number, curr: number): number => {
          return prev + curr;
        }, 10);
        expect(result).assertEqual(16);

      }
      {
        let arr = Int16Array.of(1, 2, 3);
        let result = arr.reduceRight((prev: number, curr: number): number => {
          return prev + curr;
        }, -5);
        expect(result).assertEqual(1);

      }
      {
        let arr = Int16Array.of(10, 20, 30);
        let result = arr.reduceRight((prev: number, curr: number): number => {
          return prev + curr;
        }, 100);
        expect(result).assertEqual(160);

      }
      {
        let arr = Int16Array.of(5);
        let result = arr.reduceRight((prev: number, curr: number): number => {
          return prev + curr;
        }, 0);
        expect(result).assertEqual(5);

      }
      {
        let arr = new Int16Array(0);
        let result = arr.reduceRight((prev: number, curr: number): number => {
          return prev + curr;
        }, 0);
        expect(result).assertEqual(0);

      }
      {
        let arr = Int16Array.of(1, 2);
        let result = arr.reduceRight((prev: number, curr: number): number => {
          return prev + curr;
        }, 0.5);
        expect(result).assertEqual(3.5);

      }
      {
        let arr = Int16Array.of(1, 2);
        let result = arr.reduceRight((prev: number, curr: number): number => {
          return prev + curr;
        }, Double.POSITIVE_INFINITY);
        expect(result).assertEqual(Double.POSITIVE_INFINITY);

      }
      {
        let arr = Int16Array.of(1, 2);
        let result = arr.reduceRight((prev: number, curr: number): number => {
          return prev + curr;
        }, -Double.POSITIVE_INFINITY);
        expect(result).assertEqual(-Double.POSITIVE_INFINITY);

      }
      {
        let arr = Int16Array.of(-1, -2, -3);
        let result = arr.reduceRight((prev: number, curr: number): number => {
          return prev + curr;
        }, 0);
        expect(result).assertEqual(-6);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REDUCERIGHT_2300
     * @tc.name testReduceRightTypesPrim002
     * @tc.desc Verify reduceRight with primitive generic U types and initial values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReduceRightTypesPrim002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr = Int16Array.of(32767);
        let result = arr.reduceRight((prev: number, curr: number): number => {
          return prev + curr;
        }, 0);
        expect(result).assertEqual(32767);

      }
      {
        let arr = Int16Array.of(-32768);
        let result = arr.reduceRight((prev: number, curr: number): number => {
          return prev + curr;
        }, 0);
        expect(result).assertEqual(-32768);

      }
      {
        let arr = Int16Array.of(0, 0, 0);
        let result = arr.reduceRight((prev: number, curr: number): number => {
          return prev + curr;
        }, 0);
        expect(result).assertEqual(0);

      }
      {
        let arr = new Int16Array(0);
        let result = arr.reduceRight((prev: number, curr: number): number => {
          return prev + curr;
        }, 42);
        expect(result).assertEqual(42);

      }
      {
        let arr = Int16Array.of(1, -1, 2, -2);
        let result = arr.reduceRight((prev: number, curr: number): number => {
          return prev + curr;
        }, 0);
        expect(result).assertEqual(0);

      }
      {
        let arr = Int16Array.of(1, 2, 3);
        let result = arr.reduceRight((prev: number, curr: number): number => {
          return prev + curr;
        }, 1000000);
        expect(result).assertEqual(1000006);

      }
      {
        let arr = Int16Array.of(32767, -32768);
        let result = arr.reduceRight((prev: number, curr: number): number => {
          return prev + curr;
        }, 0);
        expect(result).assertEqual(-1);

      }
      {
        let arr = Int16Array.of(1, 2, 3);
        let result: string = arr.reduceRight((prev: string, curr: number): string => {
          return prev + curr.toString();
        }, "pre:");
        expect(result).assertEqual("pre:321");

      }
      {
        let arr = Int16Array.of(0, -1, 32767);
        let result: string = arr.reduceRight((prev: string, curr: number): string => {
          return prev + curr.toString();
        }, "");
        expect(result).assertEqual("32767-10");

      }
      {
        let arr = Int16Array.of(5);
        let result: string = arr.reduceRight((prev: string, curr: number): string => {
          return prev + curr.toString();
        }, "");
        expect(result).assertEqual("5");

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REDUCERIGHT_2400
     * @tc.name testReduceRightTypesPrim003
     * @tc.desc Verify reduceRight with primitive generic U types and initial values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReduceRightTypesPrim003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr = new Int16Array(0);
        let result: string = arr.reduceRight((prev: string, curr: number): string => {
          return prev + curr.toString();
        }, "x");
        expect(result).assertEqual("x");

      }
      {
        let arr = Int16Array.of(10, 20, 30);
        let result: string = arr.reduceRight((prev: string, curr: number): string => {
          return prev + curr.toString();
        }, "");
        expect(result).assertEqual("302010");

      }
      {
        let arr = Int16Array.of(1, 2, 3);
        let result: boolean = arr.reduceRight((prev: boolean, curr: number): boolean => {
          return prev && (curr !== 0);
        }, true);
        expect(result).assertTrue();

      }
      {
        let arr = Int16Array.of(1, 2, 3);
        let result: boolean = arr.reduceRight((prev: boolean, curr: number): boolean => {
          return prev || (curr > 2);
        }, false);
        expect(result).assertTrue();

      }
      {
        let arr = new Int16Array(0);
        let result: boolean = arr.reduceRight((prev: boolean, curr: number): boolean => {
          return prev && (curr !== 0);
        }, true);
        expect(result).assertTrue();

      }
      {
        let arr = Int16Array.of(1, 2, 3);
        let result: bigint = arr.reduceRight((prev: bigint, curr: number): bigint => {
          return prev + BigInt(curr);
        }, BigInt(100));
        expect(result).assertEqual(BigInt(106));

      }
      {
        let arr = new Int16Array(0);
        let result: bigint = arr.reduceRight((prev: bigint, curr: number): bigint => {
          return prev + BigInt(curr);
        }, BigInt(0));
        expect(result).assertEqual(BigInt(0));

      }
      {
        let arr = Int16Array.of(50, 30, 20);
        let result = arr.reduceRight((prev: number, curr: number): number => {
          return prev + curr;
        }, -100);
        expect(result).assertEqual(0);

      }
      {
        let arr = Int16Array.of(1, 2, 3, 4, 5);
        let result = arr.reduceRight((prev: number, curr: number): number => {
          return prev + curr;
        }, 0);
        expect(result).assertEqual(15);

      }
      {
        let arr = Int16Array.of(1, 2, 3);
        let result = arr.reduceRight((prev: number, curr: number): number => {
          return prev + curr * curr;
        }, 0);
        expect(result).assertEqual(14);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REDUCERIGHT_2500
     * @tc.name testReduceRightTypesPrim004
     * @tc.desc Verify reduceRight with primitive generic U types and initial values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReduceRightTypesPrim004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr = Int16Array.of(10000, 20000);
        let result = arr.reduceRight((prev: number, curr: number): number => {
          return prev + curr;
        }, 0);
        expect(result).assertEqual(30000);

      }
      {
        let arr = Int16Array.of(1, 2);
        let result = arr.reduceRight((prev: number, curr: number): number => {
          return prev + curr;
        }, 0);
        expect(result).assertEqual(3);

      }
      {
        let arr = Int16Array.of(1, 2);
        let result: bigint = arr.reduceRight((prev: bigint, curr: number): bigint => {
          return prev + BigInt(curr);
        }, BigInt(0));
        expect(result).assertEqual(BigInt(3));

      }
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30);
        let result: string = arr.reduceRight<string>((prev: string, curr: number, idx: int, a: Int16Array): string => prev + curr.toString(), "");
        expect(result).assertEqual("302010");

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let result: number = arr.reduceRight<number>((prev: number, curr: number, idx: int, a: Int16Array): number => prev + curr, 0);
        expect(result).assertEqual(6);

      }
      {
        let arr: Int16Array = Int16Array.of(10, 20);
        let init: ReduceRightPart03Accumulator = new ReduceRightPart03Accumulator();
        let result: ReduceRightPart03Accumulator = arr.reduceRight<ReduceRightPart03Accumulator>((prev: ReduceRightPart03Accumulator, curr: number, idx: int, a: Int16Array): ReduceRightPart03Accumulator => {
          prev.sum = prev.sum + curr;
          return prev;
        }, init);
        let resultValue1: number = result.sum;
        let expectedValue1: int = 30;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = Int16Array.of(10, 20);
        let capturedPrev: string = "";
        let capturedCurr: number = 0;
        arr.reduceRight<string>((prev: string, curr: number, idx: int, a: Int16Array): string => {
          capturedPrev = prev;
          capturedCurr = curr;
          return prev + curr.toString();
        }, "INIT");
        expect(capturedPrev).assertEqual("INIT20");
        expect(capturedCurr).assertEqual(10);

      }
      {
        let arr: Int16Array = Int16Array.of(5, 15);
        let capturedPrev: number = -999;
        arr.reduceRight<number>((prev: number, curr: number, idx: int, a: Int16Array): number => {
          capturedPrev = prev;
          return prev + curr;
        }, 100);
        expect(capturedPrev).assertEqual(115);

      }
      {
        let arr: Int16Array = Int16Array.of(3);
        let init: ReduceRightPart03Box = new ReduceRightPart03Box();
        init.value = 99;
        let isSameRef: boolean = false;
        arr.reduceRight<ReduceRightPart03Box>((prev: ReduceRightPart03Box, curr: number, idx: int, a: Int16Array): ReduceRightPart03Box => {
          isSameRef = (prev === init);
          prev.value = prev.value + curr;
          return prev;
        }, init);
        expect(isSameRef).assertTrue();

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let result: string = arr.reduceRight<string>((prev: string, curr: number, idx: int, a: Int16Array): string => prev + "-" + curr.toString(), "start");
        expect(result).assertEqual("start-3-2-1");

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REDUCERIGHT_2600
     * @tc.name testReduceRightTypesPrim005
     * @tc.desc Verify reduceRight with primitive generic U types and initial values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReduceRightTypesPrim005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr: Int16Array = new Int16Array(0);
        let result: string = arr.reduceRight<string>((prev: string, curr: number, idx: int, a: Int16Array): string => prev + curr.toString(), "hello");
        expect(result).assertEqual("hello");

      }
      {
        let arr: Int16Array = Int16Array.of(42);
        let result: string = arr.reduceRight<string>((prev: string, curr: number, idx: int, a: Int16Array): string => prev + curr.toString() + "]", "[");
        expect(result).assertEqual("[42]");

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let result: number = arr.reduceRight<number>((prev: number, curr: number, idx: int, a: Int16Array): number => prev - curr, 100);
        expect(result).assertEqual(94);

      }
      {
        let arr: Int16Array = new Int16Array(0);
        let result: number = arr.reduceRight<number>((prev: number, curr: number, idx: int, a: Int16Array): number => prev + curr, 9999);
        expect(result).assertEqual(9999);

      }
      {
        let arr: Int16Array = Int16Array.of(5);
        let callCount: number = 0;
        let result: number = arr.reduceRight<number>((prev: number, curr: number, idx: int, a: Int16Array): number => {
          callCount++;
          return prev + curr;
        }, 0);
        expect(callCount).assertEqual(1);
        expect(result).assertEqual(5);

      }
      {
        let arr: Int16Array = Int16Array.of(-32768, 32767);
        let result: number = arr.reduceRight<number>((prev: number, curr: number, idx: int, a: Int16Array): number => prev + curr, 0);
        expect(result).assertEqual(-1);

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let result: double = arr.reduceRight<double>((prev: double, curr: number, idx: int, a: Int16Array): double => prev + curr, 0.0);
        expect(result).assertEqual(6.0);

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2);
        let result: double = arr.reduceRight<double>((prev: double, curr: number, idx: int, a: Int16Array): double => prev + curr, 0.5);
        expect(result).assertEqual(3.5);

      }
      {
        let arr: Int16Array = new Int16Array(0);
        let result: double = arr.reduceRight<double>((prev: double, curr: number, idx: int, a: Int16Array): double => prev + curr, 3.14);
        expect(result).assertEqual(3.14);

      }
      {
        let arr: Int16Array = Int16Array.of(1);
        let result: double = arr.reduceRight<double>((prev: double, curr: number, idx: int, a: Int16Array): double => prev + curr, 0.0);
        expect(result).assertEqual(1);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REDUCERIGHT_2700
     * @tc.name testReduceRightTypesPrim006
     * @tc.desc Verify reduceRight with primitive generic U types and initial values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReduceRightTypesPrim006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr: Int16Array = Int16Array.of(3, 4);
        let result: float = arr.reduceRight<float>((prev: float, curr: number, idx: int, a: Int16Array): float => Double.toFloat(prev + curr), 0.0 as float);
        expect(result).assertEqual(7.0 as float);

      }
      {
        let arr: Int16Array = new Int16Array(0);
        let result: float = arr.reduceRight<float>((prev: float, curr: number, idx: int, a: Int16Array): float => Double.toFloat(prev + curr), 1.0 as float);
        expect(result).assertEqual(1.0 as float);

      }
      {
        let arr: Int16Array = Int16Array.of(10, 20);
        let result: byte = arr.reduceRight<byte>((prev: byte, curr: number, idx: int, a: Int16Array): byte => Int.toByte((prev + curr).toInt()), Int.toByte(0));
        expect(result).assertEqual(Int.toByte(30));

      }
      {
        let arr: Int16Array = new Int16Array(0);
        let result: byte = arr.reduceRight<byte>((prev: byte, curr: number, idx: int, a: Int16Array): byte => prev, Int.toByte(5));
        expect(result).assertEqual(Int.toByte(5));

      }
      {
        let arr: Int16Array = Int16Array.of(100, 200);
        let result: short = arr.reduceRight<short>((prev: short, curr: number, idx: int, a: Int16Array): short => Int.toShort((prev + curr).toInt()), Int.toShort(0));
        expect(result).assertEqual(Int.toShort(300));

      }
      {
        let arr: Int16Array = new Int16Array(0);
        let result: short = arr.reduceRight<short>((prev: short, curr: number, idx: int, a: Int16Array): short => prev, Int.toShort(1));
        expect(result).assertEqual(Int.toShort(1));

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2);
        let result: number = arr.reduceRight<number>((prev: number, curr: number, idx: int, a: Int16Array): number => prev + curr, 65);
        expect(result).assertEqual(68);

      }
      {
        let arr: Int16Array = new Int16Array(0);
        let result: number = arr.reduceRight<number>((prev: number, curr: number, idx: int, a: Int16Array): number => prev, 97);
        expect(result).assertEqual(97);

      }
      {
        let arr: Int16Array = Int16Array.of(1000, 2000);
        let result: long = arr.reduceRight<long>((prev: long, curr: number, idx: int, a: Int16Array): long => (prev + curr.toLong()), Int.toLong(0));
        expect(result).assertEqual(Int.toLong(3000));

      }
      {
        let arr: Int16Array = new Int16Array(0);
        let result: long = arr.reduceRight<long>((prev: long, curr: number, idx: int, a: Int16Array): long => prev, Int.toLong(999));
        expect(result).assertEqual(Int.toLong(999));

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REDUCERIGHT_2800
     * @tc.name testReduceRightTypesPrim007
     * @tc.desc Verify reduceRight with primitive generic U types and initial values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReduceRightTypesPrim007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr: Int16Array = Int16Array.of(1, 1);
        let result: boolean = arr.reduceRight<boolean>((prev: boolean, curr: number, idx: int, a: Int16Array): boolean => prev && (curr > 0), true);
        expect(result).assertTrue();

      }
      {
        let arr: Int16Array = new Int16Array(0);
        let result: boolean = arr.reduceRight<boolean>((prev: boolean, curr: number, idx: int, a: Int16Array): boolean => prev && (curr > 0), true);
        expect(result).assertTrue();

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let result: bigint = arr.reduceRight<bigint>((prev: bigint, curr: number, idx: int, a: Int16Array): bigint => prev + BigInt(curr), BigInt(0));
        expect(result).assertEqual(BigInt(6));

      }
      {
        let arr: Int16Array = new Int16Array(0);
        let result: bigint = arr.reduceRight<bigint>((prev: bigint, curr: number, idx: int, a: Int16Array): bigint => prev + BigInt(curr), BigInt(42));
        expect(result).assertEqual(BigInt(42));

      }
      {
        let arr: Int16Array = Int16Array.of(7, 14, 21);
        let manualSum: number = 0;
        for (let i = arr.length - 1; i >= 0; i--) {
          manualSum = manualSum + arr.$_get(i);
        }
        let result: number = arr.reduceRight<number>((prev: number, curr: number, idx: int, a: Int16Array): number => prev + curr, 0);
        expect(result).assertEqual(manualSum);

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2);
        let result: number = arr.reduceRight<number>((prev: number, curr: number, idx: int, a: Int16Array): number => prev + curr, 0);
        expect(result).assertEqual(3);

      }
      {
        const arr = Int16Array.of(1, 2, 3);
        const result: number = arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => prev * cur, 10);
        expect(result).assertEqual(10 * 3 * 2 * 1);

      }
      {
        const arr = Int16Array.of(1, 2, 3);
        const result: number = arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => prev * 2 + cur, 0);
        expect(result).assertEqual((((0 * 2 + 3) * 2 + 2) * 2 + 1));

      }
      {
        const arr = Int16Array.of(1, 2, 3);
        const result: number = arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => prev - cur, 32767);
        expect(result).assertEqual(32767 - 3 - 2 - 1);

      }
      {
        const arr = Int16Array.of(5, 6, 7);
        const rExplicit: number = arr.reduceRight<number>((prev: number, cur: number, idx: int, a: Int16Array) => prev * cur, 2);
        const rInferred: number = arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => prev * cur, 2);
        expect(rExplicit).assertEqual(rInferred);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REDUCERIGHT_2900
     * @tc.name testReduceRightTypesPrim008
     * @tc.desc Verify reduceRight with primitive generic U types and initial values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReduceRightTypesPrim008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr = Int16Array.of(2, 3, 4);
        const r1: number = arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => prev + cur);
        const r2: number = arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => prev + cur, 0);
        expect(r1).assertEqual(r2);

      }
      {
        const arr = Int16Array.of(1, 2, 3);
        const result: number = arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => prev + cur * 0.5, 0.0);
        expect(result).assertEqual(0.0 + 3 * 0.5 + 2 * 0.5 + 1 * 0.5);

      }
      {
        const arr = Int16Array.of(5, 10, 15);
        const rOvl1: number = arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => prev - cur, 0);
        const rOvl2: number = arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => prev - cur);
        expect(rOvl1).assertEqual(0 - 15 - 10 - 5);
        expect(rOvl2).assertEqual(15 - 10 - 5);

      }
      {
        const arr = Int16Array.of(2, 3, 4);
        const r2: number = arr.reduceRight( (prev: number, cur: number, idx: int, a: Int16Array): number => prev * cur);
        const r1: number = arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array): number => prev * cur, 1);
        expect(r2).assertEqual(4 * 3 * 2);
        expect(r1).assertEqual(1 * 4 * 3 * 2);

      }
      {
        const arr = Int16Array.of(7, 8);
        const r1 = arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => prev + cur, 0);
        const r2 = arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => prev + cur);
        expect(r1).assertEqual(15);
        expect(r2).assertEqual(15);

      }
      {
        const arr = Int16Array.of(1, 2, 3);
        const result: number = arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => prev - cur, 10);
        expect(result).assertEqual(10 - 3 - 2 - 1);

      }
      {
        const arr = Int16Array.of(5, 10, 15);
        const result: number = arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => prev + cur, -10);
        expect(result).assertEqual(-10 + 15 + 10 + 5);

      }
      {
        const arr = Int16Array.of(1, 2);
        const rNum = arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => prev + cur, 0);
        const rStr = arr.reduceRight<string>((prev: string, cur: number, idx: int, a: Int16Array) => prev + cur.toString(), "s");
        expect(rNum).assertEqual(3);
        expect(rStr).assertEqual("s21");

      }
      {
        const arr = Int16Array.of(10000, 20000, 30000);
        const r1: number = arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => prev + cur, 0);
        const r2: number = arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => prev + cur);
        expect(r1).assertEqual(60000);
        expect(r2).assertEqual(60000);

      }
      {
        const arr = Int16Array.of(1, 1, 1);
        const r1: number = arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => prev * 2 + cur, 10);
        const r2: number = arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => prev * 2 + cur);
        expect(r1).assertEqual(((10 * 2 + 1) * 2 + 1) * 2 + 1);
        expect(r2).assertEqual((1 * 2 + 1) * 2 + 1);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REDUCERIGHT_3000
     * @tc.name testReduceRightTypesPrim009
     * @tc.desc Verify reduceRight with primitive generic U types and initial values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReduceRightTypesPrim009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr = Int16Array.of(1, 2);
        const result = arr.reduceRight<string>((prev: string, cur: number, idx: int, a: Int16Array) => prev + cur.toString(), "x");
        expect(result).assertEqual("x21");

      }
      {
        const arr = Int16Array.of(1, 2);
        const result: string = arr.reduceRight<string>((prev: string, cur: number, idx: int, a: Int16Array) => prev + cur.toString(), "a");
        let resultValue1: string = result.toString();
        let expectedValue1: string = "a21";
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        const arr = Int16Array.of(1, 2, 3);
        const result: string = arr.reduceRight<string>((prev: string, cur: number, idx: int, a: Int16Array) => prev + cur.toString(), "p");
        let resultValue1: int = result.length;
        let expectedValue1: int = "p321".length;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        const arr = Int16Array.of(5, 6);
        const result = arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => prev * cur, 1);
        expect(result).assertEqual(30);

      }
      {
        const arr = Int16Array.of(1, 0);
        const result = arr.reduceRight<boolean>((prev: boolean, cur: number, idx: int, a: Int16Array) => prev && (cur === 0), true);
        expect(result).assertFalse();

      }
      {
        const arr = Int16Array.of(1, 2);
        const r: number = arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => prev + cur, 0);
        expect(r).assertEqual(3);

      }
      {
        const arr = Int16Array.of(1, 2);
        const init = "start";
        let firstPrev: string = "";
        arr.reduceRight<string>((prev: string, cur: number, idx: int, a: Int16Array) => {
          if (firstPrev.length === 0) {
            firstPrev = prev;
          }
          return prev + cur.toString();
        }, init);
        expect(firstPrev).assertEqual("start");

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REDUCERIGHT_3100
     * @tc.name testReduceRightTypesObj001
     * @tc.desc Verify reduceRight with object generic U types and object accumulators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReduceRightTypesObj001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr = Int16Array.of(1, 2);
        let init: ReduceRightPart01AccStats = new ReduceRightPart01AccStats();
        let result: ReduceRightPart01AccStats = arr.reduceRight((prev: ReduceRightPart01AccStats, curr: number): ReduceRightPart01AccStats => {
          let s: ReduceRightPart01AccStats = new ReduceRightPart01AccStats();
          s.sum = prev.sum + curr;
          s.count = prev.count + 1;
          return s;
        }, init);
        let resultValue1: number = result.sum;
        let expectedValue1: int = 3;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = result.count;
        let expectedValue2: int = 2;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let arr = Int16Array.of(1, 2, 3);
        let init: ReduceRightPart01AccStats = new ReduceRightPart01AccStats();
        let result: ReduceRightPart01AccStats = arr.reduceRight((prev: ReduceRightPart01AccStats, curr: number): ReduceRightPart01AccStats => {
          let s: ReduceRightPart01AccStats = new ReduceRightPart01AccStats();
          s.sum = prev.sum + curr;
          s.count = prev.count + 1;
          return s;
        }, init);
        let resultValue1: number = result.sum;
        let expectedValue1: int = 6;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = result.count;
        let expectedValue2: int = 3;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let arr = new Int16Array(0);
        let init: ReduceRightPart01AccStats = new ReduceRightPart01AccStats();
        let result: ReduceRightPart01AccStats = arr.reduceRight((prev: ReduceRightPart01AccStats, curr: number): ReduceRightPart01AccStats => {
          let s: ReduceRightPart01AccStats = new ReduceRightPart01AccStats();
          s.sum = prev.sum + curr;
          s.count = prev.count + 1;
          return s;
        }, init);
        let resultValue1: number = result.sum;
        let expectedValue1: int = 0;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = result.count;
        let expectedValue2: int = 0;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let arr = Int16Array.of(1, 2, 3);
        let init: ReduceRightPart01Accumulator = new ReduceRightPart01Accumulator();
        let result: ReduceRightPart01Accumulator = arr.reduceRight((prev: ReduceRightPart01Accumulator, curr: number): ReduceRightPart01Accumulator => {
          let acc: ReduceRightPart01Accumulator = new ReduceRightPart01Accumulator();
          acc.value = prev.value + curr;
          return acc;
        }, init);
        let resultValue1: number = result.value;
        let expectedValue1: int = 6;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr = Int16Array.of(1);
        let init: ReduceRightPart01AccStats = new ReduceRightPart01AccStats();
        let result: ReduceRightPart01AccStats = arr.reduceRight((prev: ReduceRightPart01AccStats, curr: number): ReduceRightPart01AccStats => {
          let s: ReduceRightPart01AccStats = new ReduceRightPart01AccStats();
          s.sum = prev.sum + curr;
          s.count = prev.count + 1;
          return s;
        }, init);
        expect(result.sum).assertEqual(1);
        expect(result.count).assertEqual(1);

      }
      {
        let arr: Int16Array = Int16Array.of(100, 200, 300);
        let init: Date = new Date(0);
        let result: Date = arr.reduceRight<Date>((prev: Date, curr: number, idx: int, a: Int16Array): Date => new Date(prev.getTime() + curr.toLong()), init);
        let resultValue1: number = result.getTime();
        let expectedValue1: int = 600;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2);
        let init: RegExp = new RegExp("a", "g");
        let result: RegExp = arr.reduceRight<RegExp>((prev: RegExp, curr: number, idx: int, a: Int16Array): RegExp => new RegExp(prev.source + curr.toString(), prev.flags), init);
        let resultValue1: string = result.source;
        let expectedValue1: string = "a21";
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30);
        let init: Map<string, number> = new Map<string, number>();
        let result: Map<string, number> = arr.reduceRight<Map<string, number>>((prev: Map<string, number>, curr: number, idx: int, a: Int16Array) => {
          prev.set("k" + idx.toString(), curr);
          return prev;
        }, init);
        let resultValue1: number = result.size;
        let expectedValue1: int = 3;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = Int16Array.of(5, 10, 15);
        let init: Set<number> = new Set<number>();
        let result: Set<number> = arr.reduceRight<Set<number>>((prev: Set<number>, curr: number, idx: int, a: Int16Array) => {
          prev.add(curr);
          return prev;
        }, init);
        let resultValue1: number = result.size;
        let expectedValue1: int = 3;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = Int16Array.of(50);
        let init: Date = new Date(1000);
        let isSameRef: boolean = false;
        arr.reduceRight<Date>((prev: Date, curr: number, idx: int, a: Int16Array): Date => {
          isSameRef = (prev === init);
          return new Date(prev.getTime() + curr.toLong());
        }, init);
        expect(isSameRef).assertTrue();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REDUCERIGHT_3200
     * @tc.name testReduceRightTypesObj002
     * @tc.desc Verify reduceRight with object generic U types and object accumulators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReduceRightTypesObj002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr: Int16Array = Int16Array.of(1);
        let init: RegExp = new RegExp("prefix", "g");
        let capturedSource: string = "";
        arr.reduceRight<RegExp>((prev: RegExp, curr: number, idx: int, a: Int16Array): RegExp => {
          capturedSource = prev.source;
          return new RegExp(prev.source + curr.toString(), prev.flags);
        }, init);
        expect(capturedSource).assertEqual("prefix");

      }
      {
        let arr: Int16Array = Int16Array.of(5);
        let init: Map<string, number> = new Map<string, number>();
        init.set("x", 10);
        let isSameRef: boolean = false;
        arr.reduceRight<Map<string, number>>((prev: Map<string, number>, curr: number, idx: int, a: Int16Array) => {
          isSameRef = (prev === init);
          prev.set("y", curr);
          return prev;
        }, init);
        expect(isSameRef).assertTrue();

      }
      {
        let arr: Int16Array = Int16Array.of(7);
        let init: Set<number> = new Set<number>();
        init.add(42);
        let isSameRef: boolean = false;
        arr.reduceRight<Set<number>>((prev: Set<number>, curr: number, idx: int, a: Int16Array) => {
          isSameRef = (prev === init);
          prev.add(curr);
          return prev;
        }, init);
        expect(isSameRef).assertTrue();

      }
      {
        let arr: Int16Array = new Int16Array(0);
        let init: Date = new Date(9999);
        let result: Date = arr.reduceRight<Date>((prev: Date, curr: number, idx: int, a: Int16Array): Date => new Date(prev.getTime() + curr.toLong()), init);
        let resultValue1: boolean = result === init;
        expect(resultValue1).assertTrue();

      }
      {
        let arr: Int16Array = Int16Array.of(1);
        let init: Date = new Date(0);
        let result: Date = arr.reduceRight<Date>((prev: Date, curr: number, idx: int, a: Int16Array): Date => new Date(prev.getTime() + curr.toLong()), init);
        let resultValue1: boolean = result instanceof Date;
        expect(resultValue1).assertTrue();

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let init: RegExp = new RegExp("a", "g");
        let result: RegExp = arr.reduceRight<RegExp>((prev: RegExp, curr: number, idx: int, a: Int16Array): RegExp => new RegExp(prev.source + curr.toString(), prev.flags), init);
        let resultValue1: string = result.source;
        let expectedValue1: string = "a321";
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = new Int16Array(0);
        let init: RegExp = new RegExp("test", "i");
        let result: RegExp = arr.reduceRight<RegExp>((prev: RegExp, curr: number, idx: int, a: Int16Array): RegExp => new RegExp(prev.source + curr.toString(), prev.flags), init);
        let resultValue1: boolean = result === init;
        expect(resultValue1).assertTrue();

      }
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30);
        let init: Map<string, number> = new Map<string, number>();
        let result: Map<string, number> = arr.reduceRight<Map<string, number>>((prev: Map<string, number>, curr: number, idx: int, a: Int16Array) => {
          prev.set("k" + idx.toString(), curr);
          return prev;
        }, init);
        let resultValue1: number = result.size;
        let expectedValue1: int = 3;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2 = result.get("k2");
        let expectedValue2: int = 30;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3 = result.get("k0");
        let expectedValue3: int = 10;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        let arr: Int16Array = new Int16Array(0);
        let init: Map<string, number> = new Map<string, number>();
        init.set("x", 99);
        let result: Map<string, number> = arr.reduceRight<Map<string, number>>((prev: Map<string, number>, curr: number, idx: int, a: Int16Array) => prev, init);
        let resultValue1: boolean = result === init;
        expect(resultValue1).assertTrue();
        let resultValue2: number = result.size;
        let expectedValue2: int = 1;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let arr: Int16Array = Int16Array.of(5, 10, 15);
        let init: Set<number> = new Set<number>();
        let result: Set<number> = arr.reduceRight<Set<number>>((prev: Set<number>, curr: number, idx: int, a: Int16Array) => {
          prev.add(curr);
          return prev;
        }, init);
        let resultValue1: number = result.size;
        let expectedValue1: int = 3;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: boolean = result.has(15);
        expect(resultValue2).assertTrue();
        let resultValue3: boolean = result.has(5);
        expect(resultValue3).assertTrue();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REDUCERIGHT_3300
     * @tc.name testReduceRightTypesObj003
     * @tc.desc Verify reduceRight with object generic U types and object accumulators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReduceRightTypesObj003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr: Int16Array = new Int16Array(0);
        let init: Set<number> = new Set<number>();
        init.add(42);
        let result: Set<number> = arr.reduceRight<Set<number>>((prev: Set<number>, curr: number, idx: int, a: Int16Array) => prev, init);
        let resultValue1: boolean = result === init;
        expect(resultValue1).assertTrue();
        let resultValue2: number = result.size;
        let expectedValue2: int = 1;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let init: Float32Array = new Float32Array(0);
        let result: Float32Array = arr.reduceRight<Float32Array>((prev: Float32Array, curr: number, idx: int, a: Int16Array): Float32Array => {
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

      }
      {
        let arr: Int16Array = new Int16Array(0);
        let init: Float32Array = new Float32Array(2);
        init.$_set(0, 10);
        init.$_set(1, 20);
        let result: Float32Array = arr.reduceRight<Float32Array>((prev: Float32Array, curr: number, idx: int, a: Int16Array): Float32Array => prev, init);
        let resultValue1: boolean = result === init;
        expect(resultValue1).assertTrue();

      }
      {
        let arr: Int16Array = Int16Array.of(1);
        let init: Float32Array = new Float32Array(1);
        init.$_set(0, 0);
        let result: Float32Array = arr.reduceRight<Float32Array>((prev: Float32Array, curr: number, idx: int, a: Int16Array): Float32Array => {
          prev.$_set(0, prev.$_get(0) + curr);
          return prev;
        }, init);
        let resultValue1: boolean = result instanceof Float32Array;
        expect(resultValue1).assertTrue();

      }
      {
        let arr: Int16Array = Int16Array.of(10, 20);
        let init: Float64Array = new Float64Array(0);
        let result: Float64Array = arr.reduceRight<Float64Array>((prev: Float64Array, curr: number, idx: int, a: Int16Array): Float64Array => {
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

      }
      {
        let arr: Int16Array = new Int16Array(0);
        let init: Float64Array = new Float64Array(1);
        init.$_set(0, 3.14);
        let result: Float64Array = arr.reduceRight<Float64Array>((prev: Float64Array, curr: number, idx: int, a: Int16Array): Float64Array => prev, init);
        let resultValue1: boolean = result === init;
        expect(resultValue1).assertTrue();

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2);
        let init: Record<string, number> = {} as Record<string, number>;
        let result: Record<string, number> = arr.reduceRight<Record<string, number>>((prev: Record<string, number>, curr: number, idx: int, a: Int16Array) => {
          prev["k" + idx.toString()] = curr;
          return prev;
        }, init);
        let resultValue1 = result["k1"];
        let expectedValue1: int = 2;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2 = result["k0"];
        let expectedValue2: int = 1;
        expect(resultValue2).assertEqual(expectedValue2);

      }
      {
        let arr: Int16Array = new Int16Array(0);
        let init: Record<string, number> = {} as Record<string, number>;
        init["a"] = 1;
        let result: Record<string, number> = arr.reduceRight<Record<string, number>>((prev: Record<string, number>, curr: number, idx: int, a: Int16Array) => prev, init);
        let resultValue1: boolean = result === init;
        expect(resultValue1).assertTrue();

      }
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30);
        let init: ReduceRightPart03Acc = new ReduceRightPart03Acc();
        let result: ReduceRightPart03Acc = arr.reduceRight<ReduceRightPart03Acc>((prev: ReduceRightPart03Acc, curr: number, idx: int, a: Int16Array): ReduceRightPart03Acc => {
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
        let arr: Int16Array = Int16Array.of(100);
        let d1: Date = new Date(500);
        let d2: Date = new Date(500);
        let r1 = arr.reduceRight<Date>((prev: Date, curr: number, idx: int, a: Int16Array): Date => new Date(prev.getTime() + curr.toLong()), d1);
        let r2 = arr.reduceRight<Date>((prev: Date, curr: number, idx: int, a: Int16Array): Date => new Date(prev.getTime() + curr.toLong()), d2);
        let resultValue1: number = r1.getTime();
        let expectedValue1: number = r2.getTime();
        expect(resultValue1).assertEqual(expectedValue1);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REDUCERIGHT_3400
     * @tc.name testReduceRightTypesObj004
     * @tc.desc Verify reduceRight with object generic U types and object accumulators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReduceRightTypesObj004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr: Int16Array = Int16Array.of(1);
        let re1: RegExp = new RegExp("test", "g");
        let re2: RegExp = new RegExp("test", "g");
        let r1 = arr.reduceRight<RegExp>((prev: RegExp, curr: number, idx: int, a: Int16Array): RegExp => new RegExp(prev.source + curr.toString(), prev.flags), re1);
        let r2 = arr.reduceRight<RegExp>((prev: RegExp, curr: number, idx: int, a: Int16Array): RegExp => new RegExp(prev.source + curr.toString(), prev.flags), re2);
        let resultValue1: string = r1.source;
        let expectedValue1: string = r2.source;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2);
        let m1: Map<string, number> = new Map<string, number>();
        let m2: Map<string, number> = new Map<string, number>();
        let r1 = arr.reduceRight<Map<string, number>>((prev: Map<string, number>, curr: number, idx: int, a: Int16Array) => {
          prev.set("k" + curr.toString(), curr);
          return prev;
        }, m1);
        let r2 = arr.reduceRight<Map<string, number>>((prev: Map<string, number>, curr: number, idx: int, a: Int16Array) => {
          prev.set("k" + curr.toString(), curr);
          return prev;
        }, m2);
        let resultValue1: number = r1.size;
        let expectedValue1: number = r2.size;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let s1: Set<number> = new Set<number>();
        let s2: Set<number> = new Set<number>();
        let r1 = arr.reduceRight<Set<number>>((prev: Set<number>, curr: number, idx: int, a: Int16Array) => {
          prev.add(curr);
          return prev;
        }, s1);
        let r2 = arr.reduceRight<Set<number>>((prev: Set<number>, curr: number, idx: int, a: Int16Array) => {
          prev.add(curr);
          return prev;
        }, s2);
        let resultValue1: number = r1.size;
        let expectedValue1: number = r2.size;
        expect(resultValue1).assertEqual(expectedValue1);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REDUCERIGHT_3500
     * @tc.name testReduceRightError001
     * @tc.desc Verify reduceRight propagates errors and throws TypeError on empty array without initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReduceRightError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr = Int16Array.of(1, 2, 3);
        try {
          arr.reduceRight((prev: number, curr: number): number => {
            throw new TypeError("test error");
          }, 0);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
        }

      }
      {
        let callCount: number = 0;
        let arr = Int16Array.of(1, 2, 3);
        try {
          arr.reduceRight((prev: number, curr: number): number => {
            callCount++;
            if (callCount === 1) {
              throw new TypeError("first call error");
            }
            return prev + curr;
          }, 0);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
        }
        expect(callCount).assertEqual(1);

      }
      {
        let callCount: number = 0;
        let arr = Int16Array.of(1, 2, 3);
        try {
          arr.reduceRight((prev: number, curr: number): number => {
            callCount++;
            if (callCount === 2) {
              throw new TypeError("middle call error");
            }
            return prev + curr;
          }, 0);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
        }
        expect(callCount).assertEqual(2);

      }
      {
        let callCount: number = 0;
        let arr = Int16Array.of(1, 2, 3);
        try {
          arr.reduceRight((prev: number, curr: number): number => {
            callCount++;
            if (callCount === 3) {
              throw new TypeError("last call error");
            }
            return prev + curr;
          }, 0);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
        }
        expect(callCount).assertEqual(3);

      }
      {
        let arr = new Int16Array(0);
        try {
          arr.reduceRight((prev: number, curr: number, idx: int, a: Int16Array): number => prev + curr);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
        }

      }
      {
        let arr = Int16Array.of(1, 2, 3);
        try {
          arr.reduceRight((prev: number, curr: number, idx: int, a: Int16Array): number => {
            throw new TypeError('fail');
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
        }

      }
      {
        let arr = Int16Array.of(10, 20, 30);
        try {
          arr.reduceRight((prev: number, curr: number, idx: int, a: Int16Array): number => {
            if (idx === 0) {
              throw new TypeError('last call');
            }
            return prev + curr;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
        }

      }
      {
        let arr = Int16Array.of(1, 2, 3, 4, 5);
        let afterThrowCallCount: number = 0;
        try {
          arr.reduceRight((prev: number, curr: number, idx: int, a: Int16Array): number => {
            if (idx === 2) {
              throw new TypeError('middle');
            }
            afterThrowCallCount++;
            return prev + curr;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
        }
        expect(afterThrowCallCount).assertEqual(1);

      }
      {
        let buf = new ArrayBuffer(0);
        let arr = new Int16Array(buf);
        try {
          arr.reduceRight((prev: number, curr: number, idx: int, a: Int16Array): number => prev + curr);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
        }

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2);
        let init: Error = new Error("start");
        let result: Error = arr.reduceRight<Error>((prev: Error, curr: number, idx: int, a: Int16Array): Error => new Error(prev.message + "-" + curr.toString()), init);
        let resultValue1: string = result.message;
        let expectedValue1: string = "start-2-1";
        expect(resultValue1).assertEqual(expectedValue1);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REDUCERIGHT_3600
     * @tc.name testReduceRightError002
     * @tc.desc Verify reduceRight propagates errors and throws TypeError on empty array without initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReduceRightError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let arr: Int16Array = new Int16Array(0);
        let init: Error = new Error("empty");
        let result: Error = arr.reduceRight<Error>((prev: Error, curr: number, idx: int, a: Int16Array): Error => new Error(prev.message + curr.toString()), init);
        let resultValue1: boolean = result === init;
        expect(resultValue1).assertTrue();

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4);
        let afterThrowCalls: number = 0;
        try {
          arr.reduceRight<number>((prev: number, curr: number, idx: int, a: Int16Array): number => {
            if (idx === 3) { throw new TypeError("first round fail"); }
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
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4);
        let sideEffectSum: number = 0;
        try {
          arr.reduceRight<number>((prev: number, curr: number, idx: int, a: Int16Array): number => {
            sideEffectSum = sideEffectSum + curr;
            if (idx === 1) { throw new TypeError("stop at idx 1"); }
            return prev + curr;
          }, 0);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
        }
        expect(sideEffectSum).assertEqual(9);

      }
      {
        let arr: Int16Array = Int16Array.of(100, 200, 300);
        try {
          arr.reduceRight<number>((prev: number, curr: number, idx: int, a: Int16Array): number => {
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
          arr.reduceRight<number>((prev: number, curr: number, idx: int, a: Int16Array): number => {
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
        let arr: Int16Array = Int16Array.of(1, 2);
        try {
          arr.reduceRight<string>((prev: string, curr: number, idx: int, a: Int16Array): string => {
            throw new TypeError("string reduceRight fail");
          }, "");
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
        }

      }
      {
        let arr: Int16Array = Int16Array.of(1, 2);
        let init: ReduceRightPart03ImmBox = new ReduceRightPart03ImmBox();
        init.value = 10;
        try {
          arr.reduceRight<ReduceRightPart03ImmBox>((prev: ReduceRightPart03ImmBox, curr: number, idx: int, a: Int16Array): ReduceRightPart03ImmBox => {
            if (idx === 1) { throw new TypeError("early fail"); }
            let next: ReduceRightPart03ImmBox = new ReduceRightPart03ImmBox();
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
        const arr = new Int16Array(0);
        try {
          arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => prev + cur);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
        }
        let resultValue1: int = arr.BYTES_PER_ELEMENT;
        let expectedValue1: int = 2;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        const arr = new Int16Array(0);
        try {
          arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => prev + cur);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
        }
        let resultValue1: int = arr.byteLength;
        let expectedValue1: int = 0;
        expect(resultValue1).assertEqual(expectedValue1);

      }
      {
        const arr = new Int16Array(0);
        try {
          arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => prev + cur);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
        }
        const result: number = arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => prev + cur, 99);
        expect(result).assertEqual(99);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REDUCERIGHT_3700
     * @tc.name testReduceRightError003
     * @tc.desc Verify reduceRight propagates errors and throws TypeError on empty array without initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReduceRightError003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const arr = Int16Array.of(10, 20, 30);
        try {
          arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => {
            throw new TypeError("fail");
          }, 0);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
        }
        let resultValue1: number = arr.$_get(0 as int);
        let expectedValue1: int = 10;
        expect(resultValue1).assertEqual(expectedValue1);
        let resultValue2: number = arr.$_get(1 as int);
        let expectedValue2: int = 20;
        expect(resultValue2).assertEqual(expectedValue2);
        let resultValue3: number = arr.$_get(2 as int);
        let expectedValue3: int = 30;
        expect(resultValue3).assertEqual(expectedValue3);

      }
      {
        const arr = new Int16Array(0);
        try {
          arr.reduceRight((prev: number, cur: number, idx: int, a: Int16Array) => prev + cur);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
        }
        const result: string = arr.reduceRight<string>((prev: string, cur: number, idx: int, a: Int16Array) => prev + cur.toString(), "ok");
        expect(result).assertEqual("ok");

      }
    });

  });
}
