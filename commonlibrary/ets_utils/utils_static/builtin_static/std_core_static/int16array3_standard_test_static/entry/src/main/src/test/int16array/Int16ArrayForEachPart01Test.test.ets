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
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '@ohos/hypium-static/src/main/indexStatic';
import Utils from '../Util.test';

let gTrackedValueForEachPart01Test004: number = 0;

let gTrackedIndexForEachPart01Test004: int = -1;

function namedCb_int16ArrayForEachPart01Test004(value: number, index: int, array: Int16Array): void {
  gTrackedValueForEachPart01Test004 = value;
  gTrackedIndexForEachPart01Test004 = index;
}

function level1_075(): void {
  level2_075();
}

function level2_075(): void {
  level3_075();
}

function level3_075(): void {
  throw new Error('deep-error');
}

function thrower_074(): void {
  throw new Error('helper-throw');
}

export default function int16ArrayForEachPart01Test(): void {
  describe('Int16ArrayForEachPart01Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FOREACH_PART01_0100
     * @tc.name int16ArrayForEachPart01Test001
     * @tc.desc Merged batch (5 tests): callback exceptions and abort: Error/TypeError propagation, last-element throw after full visit, mid-iteration abort and preserved names.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayForEachPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify forEach propagates the callback's thrown Error and TypeError with their names preserved ---
      {
        let cases: string[][] = [['Error', 'fail at 0'], ['TypeError', 'type error']];
        for (let i: int = 0; i < cases.length; i++) {
          let arr: Int16Array = new Int16Array([1, 2, 3]);
          let calls: int = 0;
          try {
            arr.forEach((value: number, index: int, array: Int16Array): void => {
              calls = calls + 1;
              if (cases[i][0] === 'TypeError') {
                throw new TypeError(cases[i][1]);
              }
              throw new Error(cases[i][1]);
            });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual(cases[i][0]);
          }
          expect(calls).assertEqual(1);
        }
      }

      // --- [2] Verify a callback throwing on the last element still visits every element before the Error propagates ---
      {
        let arr: Int16Array = new Int16Array([11, 22, 33]);
        let visitCount: int = 0;
        try {
          arr.forEach((value: number, index: int, array: Int16Array): void => {
            visitCount = visitCount + 1;
            if (index === arr.length - 1) {
              throw new Error('fail at last');
            }
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        expect(visitCount).assertEqual(3);
      }

      // --- [3] Verify a callback throwing mid-iteration aborts forEach so later elements are never visited ---
      {
        let arr: Int16Array = new Int16Array([10, 20, 30, 40, 50]);
        let visitedAfterThrow: int = 0;
        try {
          arr.forEach((value: number, index: int, array: Int16Array): void => {
            if (index === 2) {
              throw new Error('fail at middle');
            }
            visitedAfterThrow = index;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        expect(visitedAfterThrow).assertEqual(1);
      }

      // --- [4] Verify forEach callbackfn throws TypeError and RangeError preserved through propagation ---
      {
        let arr: Int16Array = new Int16Array([1]);
        let caught: boolean = false;
        try {
          arr.forEach((value: number, index: int, array: Int16Array): void => {
            throw new TypeError();
          });
          expect().assertFail();
        } catch (e) {
          caught = true;
          expect(e.name).assertEqual('TypeError');
        }
        expect(caught).assertTrue();

        let arr2: Int16Array = new Int16Array([1]);
        let caught2: boolean = false;
        try {
          arr2.forEach((value: number, index: int, array: Int16Array): void => {
            throw new RangeError();
          });
          expect().assertFail();
        } catch (e) {
          caught2 = true;
          expect(e.name).assertEqual('RangeError');
        }
        expect(caught2).assertTrue();
      }

      // --- [5] Verify forEach propagates a callback exception preserving the error name ---
      {
        let types: string[] = ['Error', 'RangeError', 'TypeError', 'Error', 'Error'];
        let messages: string[] = ['custom-error-msg', 'out-of-range', 'type-mismatch', '', 'forEach callback failed at runtime'];
        for (let i: int = 0; i < types.length; i++) {
          let arr: Int16Array = new Int16Array([1, 2, 3]);
          try {
            arr.forEach((value: number, index: int, array: Int16Array) => {
              if (types[i] === 'TypeError') {
                throw new TypeError(messages[i]);
              } else if (types[i] === 'RangeError') {
                throw new RangeError(messages[i]);
              }
              throw new Error(messages[i]);
            });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual(types[i]);
            expect(e.message).assertEqual(messages[i]);
          }
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FOREACH_PART01_0200
     * @tc.name int16ArrayForEachPart01Test002
     * @tc.desc Merged batch (5 tests): callback exceptions and abort: $_set out-of-range continuation, conditional throw, construction coverage, post-throw usability and length before throw.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayForEachPart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify forEach $_set with out-of-range index throws RangeError inside callback and continues ---
      {
        let indices: int[] = [-1, 3, 4, -4, 2147483647];
        for (let i: int = 0; i < indices.length; i++) {
          let arr: Int16Array = new Int16Array([11, 22, 33]);
          let count: int = 0;
          arr.forEach((value: number, index: int, array: Int16Array) => {
            try {
              array.$_set(indices[i], 99);
              expect().assertFail();
            } catch (e) {
              expect(e.name).assertEqual('RangeError');
            }
            count = count + 1;
          });
          expect(count).assertEqual(3);
          expect(arr.$_get(0)).assertEqual(11);
          expect(arr.$_get(1)).assertEqual(22);
          expect(arr.$_get(2)).assertEqual(33);
        }
        let arr2: Int16Array = new Int16Array([1, 2, 3, 4]);
        arr2.forEach((value: number, index: int, array: Int16Array) => {
          try {
            array.$_set(array.length, 99);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('RangeError');
          }
        });
        expect(arr2.$_get(0)).assertEqual(1);
        expect(arr2.$_get(3)).assertEqual(4);
      }

      // --- [2] Verify forEach conditional throw based on value or index stops iteration with preceding elements processed ---
      {
        let cases: int[][] = [
          [0, 100, 32767, 200, 32767, 1],
          [1, 50, -32768, 60, -32768, 1],
          [2, 5, -3, 0, 7, 0, 2],
          [3, -5, -3, 1, 2, 3, 2],
          [4, 10, 20, -5, 30, -8, 2],
          [5, 1, 2, 3, 4, 5, 6, 3],
          [6, 1, 2, 3, 4, 5, 0],
          [7, 11, 22, 33, 44, 3]
        ];
        for (let i: int = 0; i < cases.length; i++) {
          let mode: int = cases[i][0];
          let data: number[] = [];
          let j: int = 1;
          while (j < cases[i].length - 1) {
            data.push(cases[i][j]);
            j = j + 1;
          }
          let arr: Int16Array = new Int16Array(data);
          let expected: int = cases[i][cases[i].length - 1];
          let count: int = 0;
          try {
            arr.forEach((value: number, index: int, array: Int16Array) => {
              let shouldThrow: boolean = false;
              if (mode === 0) {
                shouldThrow = value === 32767;
              } else if (mode === 1) {
                shouldThrow = value === -32768;
              } else if (mode === 2) {
                shouldThrow = value === 0;
              } else if (mode === 3) {
                shouldThrow = value > 0;
              } else if (mode === 4) {
                shouldThrow = value < 0;
              } else if (mode === 5) {
                shouldThrow = index >= 3;
              } else if (mode === 6) {
                shouldThrow = index % 2 === 0;
              } else if (mode === 7) {
                shouldThrow = index === array.length - 1;
              }
              if (shouldThrow) {
                throw new Error('conditional-abort');
              }
              count = count + 1;
            });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
          }
          expect(count).assertEqual(expected);
        }
        let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
        let processed: int = 0;
        let shouldThrow: boolean = false;
        try {
          arr.forEach((value: number, index: int, array: Int16Array) => {
            if (index === 2) {
              shouldThrow = true;
            }
            if (shouldThrow) {
              throw new Error('dynamic-flag');
            }
            processed = processed + 1;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        expect(processed).assertEqual(2);
      }

      // --- [3] Verify forEach throw propagates for Int16Array.of, from, buffer, and subarray constructions ---
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30);
        try {
          arr.forEach((value: number, index: int, array: Int16Array) => {
            throw new Error('of-throw');
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        let arrFrom: Int16Array = Int16Array.from([5, 15, 25, 35]);
        try {
          arrFrom.forEach((value: number, index: int, array: Int16Array) => {
            if (index === 2) {
              throw new Error('from-throw');
            }
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        let buf: ArrayBuffer = new ArrayBuffer(6);
        let arrBuf: Int16Array = new Int16Array(buf);
        arrBuf.$_set(0, 100);
        arrBuf.$_set(1, 200);
        arrBuf.$_set(2, 300);
        try {
          arrBuf.forEach((value: number, index: int, array: Int16Array) => {
            if (value === 200) {
              throw new Error('buffer-throw');
            }
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        let parent: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
        let sub: Int16Array = parent.subarray(1, 4);
        try {
          sub.forEach((value: number, index: int, array: Int16Array) => {
            if (index === 1) {
              throw new Error('subarray-throw');
            }
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
      }

      // --- [4] Verify array after forEach throws array still usable for subsequent $_get operations, unmodified elements, subsequent forEach works, modifications before throw persist ---
      {
        let arr: Int16Array = new Int16Array([7, 8, 9, 10]);
        try {
          arr.forEach((value: number, index: int, array: Int16Array) => {
            if (index === 1) {
              throw new Error('mid-abort');
            }
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        expect(arr.$_get(0)).assertEqual(7);
        expect(arr.$_get(2)).assertEqual(9);
        expect(arr.$_get(3)).assertEqual(10);

        let arr2: Int16Array = new Int16Array([1, 2, 3, 4]);
        try {
          arr2.forEach((value: number, index: int, array: Int16Array) => {
            if (index === 1) {
              throw new Error('first-abort');
            }
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        let secondCount: int = 0;
        arr2.forEach((value: number, index: int, array: Int16Array) => {
          secondCount = secondCount + 1;
        });
        expect(secondCount).assertEqual(4);

        let arr3: Int16Array = new Int16Array([10, 20, 30, 40]);
        try {
          arr3.forEach((value: number, index: int, array: Int16Array) => {
            array.$_set(index, index * 100);
            if (index === 2) {
              throw new Error('mod-abort');
            }
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        expect(arr3.$_get(0)).assertEqual(0);
        expect(arr3.$_get(1)).assertEqual(100);
        expect(arr3.$_get(2)).assertEqual(200);
      }

      // --- [5] Verify forEach callbackfn reads array.length on the iteration before throwing length equals original value ---
      {
        let arr: Int16Array = new Int16Array([3, 6, 9, 12]);
        let lenAtThrow: int = -1;
        try {
          arr.forEach((value: number, index: int, array: Int16Array) => {
            if (index === 2) {
              lenAtThrow = array.length;
              throw new Error('check-len');
            }
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        expect(lenAtThrow).assertEqual(4);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FOREACH_PART01_0300
     * @tc.name int16ArrayForEachPart01Test003
     * @tc.desc Merged batch (5 tests): callback exceptions and abort: includes-then-throw, Set source at index 1, interior partial sum, toReversed copy and filter-result name.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayForEachPart01Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify forEach callbackfn calling array.includes then throwing Error on the last element propagates the Error ---
      {
        let arr: Int16Array = Int16Array.of(4, 5);
        try {
          arr.forEach((element: number, index: int, array: Int16Array): void => {
            if (array.includes(element) && index === 1) {
              throw new Error('includes seen');
            }
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
      }

      // --- [2] Verify forEach callbackfn throwing Error at index 1 on an array built by from(Set) stops after two calls ---
      {
        let s: Set<int> = new Set<int>();
        s.add(1);
        s.add(2);
        s.add(3);
        s.add(4);
        let arr: Int16Array = Int16Array.from(s);
        let calls: int = 0;
        try {
          arr.forEach((element: number, index: int, _array: Int16Array): void => {
            calls = calls + 1;
            if (index === 1) {
              throw new Error('mid');
            }
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        expect(calls).assertEqual(2);
      }

      // --- [3] Verify forEach callbackfn throwing Error at an interior index keeps the partial sum of the earlier elements ---
      {
        let src: int[] = [1, 2, 3, 4];
        let arr: Int16Array = Int16Array.from(src, (v: int, _k: double): double => v);
        let sum: number = 0;
        try {
          arr.forEach((element: number, index: int, _array: Int16Array): void => {
            sum = sum + element;
            if (index === 2) {
              throw new Error('after partial');
            }
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        let want: int = 6;
        expect(sum).assertEqual(want);
      }

      // --- [4] Verify forEach callbackfn throwing Error on the toReversed() copy propagates while the original is unmutated ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let rev: Int16Array = arr.toReversed();
        try {
          rev.forEach((element: number, _index: int, _array: Int16Array): void => {
            throw new Error('rev fail');
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        expect(arr.$_get(0)).assertEqual(1);
      }

      // --- [5] Verify forEach callbackfn throwing Error on a filter() result propagates the Error name ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4);
        let filtered: Int16Array = arr.filter((v: number, _i: int, _a: Int16Array): boolean => v > 2);
        try {
          filtered.forEach((element: number, _index: int, _array: Int16Array): void => {
            throw new Error('filter fail');
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FOREACH_PART01_0400
     * @tc.name int16ArrayForEachPart01Test004
     * @tc.desc Merged batch (4 tests): callback exceptions and abort: direct and filtered propagation, first-index throw, Map-source partial sum and triple-nested throw.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayForEachPart01Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify forEach propagates an Error thrown by the callback on a direct source and on a filter result of it ---
      {
        let base: Int16Array = Int16Array.of(1, 2, 3, 4);
        let direct: Int16Array = Int16Array.from(base);
        let evens: Int16Array = direct.filter((v: number): boolean => v % 2 === 0);
        let sources: Int16Array[] = [direct, evens];
        for (let s: int = 0; s < sources.length; s++) {
          let arr: Int16Array = sources[s];
          try {
            arr.forEach((value: number, index: int, array: Int16Array): void => {
              throw new Error('keep-me');
            });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
          }
        }
      }

      // --- [2] Verify forEach callback throwing at the first index prevents the remaining visits ---
      {
        let arr: Int16Array = Int16Array.of(9, 8, 7, 6);
        let calls: int = 0;
        try {
          arr.forEach((value: number, index: int, array: Int16Array): void => {
            calls = calls + 1;
            throw new Error('first');
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        expect(calls).assertEqual(1);
      }

      // --- [3] Verify forEach callback throwing keeps the partial sum of the earlier from(Map.values()) elements ---
      {
        let m: Map<string, number> = new Map<string, number>();
        m.set('a', 5);
        m.set('b', 10);
        m.set('c', 15);
        let arr: Int16Array = Int16Array.from(m.values());
        let total: number = 0;
        try {
          arr.forEach((value: number, index: int, array: Int16Array): void => {
            if (index === 2) {
              throw new Error('third');
            }
            total = total + value;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        expect(total).assertEqual(15);
      }

      // --- [4] Verify a triple-nested forEach whose innermost callback throws propagates through all levels ---
      {
        let a: Int16Array = Int16Array.of(1);
        let b: Int16Array = Int16Array.of(2);
        let c: Int16Array = Int16Array.of(3);
        try {
          a.forEach((v1: number, i1: int, a1: Int16Array): void => {
            b.forEach((v2: number, i2: int, a2: Int16Array): void => {
              c.forEach((v3: number, i3: int, a3: Int16Array): void => {
                throw new Error('deep');
              });
            });
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FOREACH_PART01_0500
     * @tc.name int16ArrayForEachPart01Test005
     * @tc.desc Merged batch (5 tests): call counts, visit order and index parameters: invocation counts, index 0, unit increments, last index and subarray-only visits.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayForEachPart01Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify forEach callbackfn invoked exactly N times for arrays of various lengths with three-parameter, two-parameter, and zero-parameter callback forms ---
      {
        let arr: Int16Array = new Int16Array([10, 20, 30]);
        let callCount: int = 0;
        arr.forEach((value: number, index: int, array: Int16Array): void => {
          callCount = callCount + 1;
        });
        expect(callCount).assertEqual(3);

        let data: number[][] = [[], [88], [1, 2, 3, 4], [0, 0, 0, 0, 0], [1, 2, 3, 4, 5, 6, 7], [4, 5, 6], [7, 8, 9]];
        let expected: int[] = [0, 1, 4, 5, 7, 3, 3];
        for (let i: int = 0; i < data.length; i++) {
          let a: Int16Array = new Int16Array(data[i]);
          let count: int = 0;
          a.forEach((value: number, index: int, array: Int16Array): void => {
            count = count + 1;
          });
          expect(count).assertEqual(expected[i]);
        }
        let arrLen: Int16Array = new Int16Array(4);
        let countLen: int = 0;
        let allZero: boolean = true;
        arrLen.forEach((value: number, index: int, array: Int16Array): void => {
          countLen = countLen + 1;
          if (value !== 0) {
            allZero = false;
          }
        });
        expect(countLen).assertEqual(4);
        expect(allZero).assertTrue();

        let arrTwo: Int16Array = new Int16Array([7, 8, 9]);
        let countTwo: int = 0;
        arrTwo.forEach((value: number, index: int): void => {
          countTwo = countTwo + 1;
        });
        expect(countTwo).assertEqual(3);

        let arrZero: Int16Array = new Int16Array([1, 2, 3, 4]);
        let hits: int = 0;
        arrZero.forEach((): void => {
          hits = hits + 1;
        });
        expect(hits).assertEqual(4);
      }

      // --- [2] Verify forEach callbackfn first invocation receives index 0 ---
      {
        let arr: Int16Array = new Int16Array([100, 200, 300]);
        let firstIndex: int = -1;
        arr.forEach((value: number, index: int, array: Int16Array): void => {
          if (firstIndex === -1) {
            firstIndex = index;
          }
        });
        expect(firstIndex).assertEqual(0);
      }

      // --- [3] Verify forEach callbackfn index parameter increments by exactly 1 for each subsequent invocation ---
      {
        let arr: Int16Array = new Int16Array([10, 20, 30, 40, 50]);
        let prevIndex: int = -1;
        let incrementsByOne: boolean = true;
        arr.forEach((value: number, index: int, array: Int16Array): void => {
          if (prevIndex !== -1 && index !== prevIndex + 1) {
            incrementsByOne = false;
          }
          prevIndex = index;
        });
        expect(incrementsByOne).assertTrue();
      }

      // --- [4] Verify forEach callbackfn last invocation receives index equal to array length minus 1 ---
      {
        let arr: Int16Array = new Int16Array([5, 6, 7, 8, 9]);
        let lastIndex: int = -1;
        arr.forEach((value: number, index: int, array: Int16Array): void => {
          lastIndex = index;
        });
        expect(lastIndex).assertEqual(4);
      }

      // --- [5] Verify forEach over a subarray view visits only the viewed elements in order ---
      {
        let base: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
        let arr: Int16Array = base.subarray(1, 4);
        let seen: number[] = [];
        arr.forEach((value: number, _index: int, _array: Int16Array): void => {
          seen.push(value);
        });
        expect(seen.join(',')).assertEqual('20,30,40');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FOREACH_PART01_0600
     * @tc.name int16ArrayForEachPart01Test006
     * @tc.desc Merged batch (5 tests): call counts, visit order and index parameters: entries-index agreement, single element, construction counts/sums, of() order and default zeros.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayForEachPart01Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify forEach callback locating the current index through the entries iterator equals the index parameter ---
      {
        let arr: Int16Array = Int16Array.of(2, 4, 6);
        let matches: int = 0;
        arr.forEach((value: number, index: int, array: Int16Array): void => {
          for (const e of array.entries()) {
            if (e[1] === value && e[0] === index) {
              matches = matches + 1;
            }
          }
        });
        expect(matches).assertEqual(3);
      }

      // --- [2] Verify forEach over a single-element array invokes the callback exactly once ---
      {
        let arr: Int16Array = Int16Array.of(99);
        let calls: int = 0;
        arr.forEach((value: number, index: int, array: Int16Array): void => {
          calls = calls + 1;
        });
        expect(calls).assertEqual(1);
      }

      // --- [3] Verify forEach visits every element across new/of/from/subarray constructions with count and sum checks ---
      {
        let cases: number[][] = [[3, 10, 20, 30], [3, 1, 2, 3], [3, 4, 5, 6], [3, 7, 8, 9]];
        for (let i: int = 0; i < cases.length; i++) {
          let vals: number[] = [];
          let k: int = 1;
          while (k < cases[i].length) {
            vals.push(cases[i][k]);
            k = k + 1;
          }
          let arr: Int16Array = new Int16Array(vals);
          let count: int = 0;
          arr.forEach((value: number, index: int, array: Int16Array) => {
            count = count + 1;
          });
          expect(count).assertEqual(cases[i][0]);
        }
        let arrOf: Int16Array = Int16Array.of(1, 2, 3);
        let countOf: int = 0;
        arrOf.forEach((value: number, index: int, array: Int16Array) => {
          countOf = countOf + 1;
        });
        expect(countOf).assertEqual(3);

        let arrFrom: Int16Array = Int16Array.from([4, 5, 6]);
        let countFrom: int = 0;
        arrFrom.forEach((value: number, index: int, array: Int16Array) => {
          countFrom = countFrom + 1;
        });
        expect(countFrom).assertEqual(3);

        let parent: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
        let sub: Int16Array = parent.subarray(1, 4);
        let countSub: int = 0;
        sub.forEach((value: number, index: int, array: Int16Array) => {
          countSub = countSub + 1;
        });
        expect(countSub).assertEqual(3);

        let arrLarge: Int16Array = new Int16Array(100);
        let countLarge: int = 0;
        arrLarge.forEach((value: number, index: int, array: Int16Array) => {
          countLarge = countLarge + 1;
        });
        expect(countLarge).assertEqual(100);

        let arrSum: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
        let countSum: int = 0;
        let total: number = 0;
        arrSum.forEach((value: number, index: int, array: Int16Array) => {
          countSum = countSum + 1;
          total = total + value;
        });
        expect(countSum).assertEqual(5);
        expect(total).assertEqual(15);
      }

      // --- [4] Verify forEach over an of() array visits every element in order ---
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30);
        let trace: string = '';
        arr.forEach((value: number, index: int, _array: Int16Array): void => {
          trace = trace + index + ':' + value + ';';
        });
        expect(trace).assertEqual('0:10;1:20;2:30;');
      }

      // --- [5] Verify forEach over a length-constructed array visits every default zero element ---
      {
        let arr: Int16Array = new Int16Array(3);
        let seen: number[] = [];
        arr.forEach((value: number, _index: int, _array: Int16Array): void => {
          seen.push(value);
        });
        expect(seen.join(',')).assertEqual('0,0,0');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FOREACH_PART01_0700
     * @tc.name int16ArrayForEachPart01Test007
     * @tc.desc Merged batch (2 tests): call counts, visit order and index parameters: boundary-value order from a copied source and return value ignored.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayForEachPart01Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify forEach over a from(another) source visits boundary values in order ---
      {
        let base: Int16Array = Int16Array.of(32767, -32768, 0);
        let arr: Int16Array = Int16Array.from(base);
        let seen: number[] = [];
        arr.forEach((value: number, _index: int, _array: Int16Array): void => {
          seen.push(value);
        });
        expect(seen.join(',')).assertEqual('32767,-32768,0');
      }

      // --- [2] Verify forEach ignores the callback return value and visits every element ---
      {
        let arr: Int16Array = Int16Array.of(2, 4, 6);
        let collected: number[] = [];
        arr.forEach((value: number, index: int, _array: Int16Array): void => {
          collected.push(value * index);
          return;
        });
        expect(collected.join(',')).assertEqual('0,4,12');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FOREACH_PART01_0800
     * @tc.name int16ArrayForEachPart01Test008
     * @tc.desc Merged batch (5 tests): mutation and array state during iteration: mixed-sign parity, fill zeros, reverse, sort and view-write visibility.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayForEachPart01Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify forEach iterates mixed positive, negative, and zero values with correct values, per-element even/odd counting, and mutation persistence on a second pass ---
      {
        let arr: Int16Array = new Int16Array([-5, 0, 5, -10, 10]);
        let sum: number = 0;
        arr.forEach((value: number): void => {
          sum = sum + value;
        });
        expect(sum).assertEqual(0);

        let arrParity: Int16Array = new Int16Array([1, 2, 3, 4]);
        let evens: int = 0;
        let odds: int = 0;
        arrParity.forEach((value: number, index: int, array: Int16Array): void => {
          if (value % 2 === 0) {
            evens = evens + 1;
          } else {
            odds = odds + 1;
          }
        });
        expect(evens).assertEqual(2);
        expect(odds).assertEqual(2);

        let arrMut: Int16Array = new Int16Array([1, 2, 3]);
        arrMut.forEach((value: number, index: int, array: Int16Array): void => {
          array.$_set(index, 99);
        });
        let all99: boolean = true;
        arrMut.forEach((value: number): void => {
          if (value !== 99) { all99 = false; }
        });
        expect(all99).assertTrue();
      }

      // --- [2] Verify forEach called immediately after fill(0) on existing array iterates all zeros correctly ---
      {
        let arr: Int16Array = new Int16Array([5, 5, 5]);
        arr.fill(0);
        let nonZeroFound: boolean = false;
        arr.forEach((value: number): void => {
          if (value !== 0) { nonZeroFound = true; }
        });
        expect(nonZeroFound).assertFalse();
      }

      // --- [3] Verify forEach called after reverse() iterates reversed values in index order ---
      {
        let arr: Int16Array = new Int16Array([1, 2, 3, 4]);
        arr.reverse();
        let collected: number[] = [0, 0, 0, 0];
        let pos: int = 0;
        arr.forEach((value: number): void => {
          collected[pos] = value;
          pos = pos + 1;
        });
        expect(collected[0]).assertEqual(4);
        expect(collected[3]).assertEqual(1);
      }

      // --- [4] Verify forEach called after sort() iterates sorted values in index order ---
      {
        let arr: Int16Array = new Int16Array([30, 10, 20]);
        arr.sort();
        let prev: number = -32769;
        let sorted: boolean = true;
        arr.forEach((value: number): void => {
          if (value < prev) { sorted = false; }
          prev = value;
        });
        expect(sorted).assertTrue();
      }

      // --- [5] Verify a forEach callback write through a view updates the shared buffer at that index only ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(8);
        let parent: Int16Array = new Int16Array(buf);
        parent.$_set(0, 1);
        parent.$_set(1, 2);
        parent.$_set(2, 3);
        parent.$_set(3, 4);
        let view: Int16Array = parent.subarray(1, 3);
        view.forEach((value: number, index: int, _array: Int16Array): void => {
          if (value === 2) {
            view.$_set(index, 99);
          }
        });
        expect(parent.$_get(1)).assertEqual(99);
        expect(parent.$_get(0)).assertEqual(1);
        expect(parent.$_get(3)).assertEqual(4);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FOREACH_PART01_0900
     * @tc.name int16ArrayForEachPart01Test009
     * @tc.desc Single test: a from(copy) source still visits its elements in the original order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayForEachPart01Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify forEach over a from(another) source preserves the element order after iteration ---
      {
        let base: Int16Array = Int16Array.of(9, 7, 5);
        let arr: Int16Array = Int16Array.from(base);
        let seq: number[] = [];
        arr.forEach((value: number, index: int, array: Int16Array): void => {
          seq.push(value);
        });
        expect(seq[0]).assertEqual(9);
        expect(seq[1]).assertEqual(7);
        expect(seq[2]).assertEqual(5);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FOREACH_PART01_1000
     * @tc.name int16ArrayForEachPart01Test010
     * @tc.desc Merged batch (5 tests): callback internals using other APIs: includes, indexOf sum, slice/$_get, map/$_get and find results.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayForEachPart01Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify forEach callbackfn calling array.includes(element) succeeds for every element ---
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30);
        let count: int = 0;
        arr.forEach((element: number, _index: int, array: Int16Array): void => {
          if (array.includes(element)) {
            count = count + 1;
          }
        });
        let want: int = 3;
        expect(count).assertEqual(want);
      }

      // --- [2] Verify forEach summing indexOf(value) over distinct elements yields the triangular total ---
      {
        let arr: Int16Array = Int16Array.of(4, 5, 6, 7);
        let idxSum: number = 0;
        arr.forEach((value: number, _index: int, array: Int16Array): void => {
          idxSum = idxSum + array.indexOf(value);
        });
        expect(idxSum).assertEqual(6);
      }

      // --- [3] Verify forEach callbackfn summing array.slice(index,index+1).$_get(0) equals the element sum ---
      {
        let arr: Int16Array = Int16Array.of(5, 6, 7);
        let sum: number = 0;
        arr.forEach((element: number, index: int, array: Int16Array): void => {
          sum = sum + array.slice(index, index + 1).$_get(0);
        });
        let want: int = 18;
        expect(sum).assertEqual(want);
      }

      // --- [4] Verify forEach callbackfn summing array.map(v*10).$_get(index) equals ten times the element sum ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let sum: number = 0;
        arr.forEach((element: number, index: int, array: Int16Array): void => {
          sum = sum + array.map((v: number, _i: int, _a: Int16Array): number => v * 10).$_get(index);
        });
        let want: int = 60;
        expect(sum).assertEqual(want);
      }

      // --- [5] Verify forEach over find() results collects the matching value for each element ---
      {
        let arr: Int16Array = Int16Array.of(3, 4, 5);
        let seen: number[] = [];
        arr.forEach((value: number, _index: int, array: Int16Array): void => {
          let f: number | undefined = array.find((v: number): boolean => v === value);
          seen.push(f as number);
        });
        expect(seen.join(',')).assertEqual('3,4,5');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FOREACH_PART01_1100
     * @tc.name int16ArrayForEachPart01Test011
     * @tc.desc Merged batch (5 tests): callback internals using other APIs: values count, absolute-sum, even/odd counters, duplicate detection and with() sum.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayForEachPart01Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify forEach callback counting the values iterator length equals the array length each visit ---
      {
        let arr: Int16Array = Int16Array.of(7, 7);
        let total: number = 0;
        arr.forEach((value: number, index: int, array: Int16Array): void => {
          let c: number = 0;
          for (const v of array.values()) {
            c = c + 1;
          }
          expect(c).assertEqual(array.length);

          total = total + c;
        });
        expect(total).assertEqual(4);
      }

      // --- [2] Verify forEach callback accumulating Math.abs of each element equals the magnitude sum ---
      {
        let arr: Int16Array = Int16Array.of(-4, 5, -6);
        let total: number = 0;
        arr.forEach((value: number, index: int, array: Int16Array): void => {
          total = total + Math.abs(value);
        });
        expect(total).assertEqual(15);
      }

      // --- [3] Verify forEach callback splitting indices into even and odd counters yields the expected counts ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
        let evens: int = 0;
        let odds: int = 0;
        arr.forEach((value: number, index: int, array: Int16Array): void => {
          if (index % 2 === 0) {
            evens = evens + 1;
          } else {
            odds = odds + 1;
          }
        });
        expect(evens).assertEqual(3);
        expect(odds).assertEqual(2);
      }

      // --- [4] Verify forEach counting indexOf(value)!=index detects the repeated occurrences ---
      {
        let arr: Int16Array = Int16Array.of(3, 3, 6, 6);
        let dups: int = 0;
        arr.forEach((value: number, index: int, array: Int16Array): void => {
          if (array.indexOf(value) !== index) {
            dups = dups + 1;
          }
        });
        expect(dups).assertEqual(2);
      }

      // --- [5] Verify forEach over the with(index,value) result accumulates the updated sum ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let modified: Int16Array = arr.with(1, 20);
        let sum: number = 0;
        modified.forEach((element: number, _index: int, _array: Int16Array): void => {
          sum = sum + element;
        });
        let want: int = 24;
        expect(sum).assertEqual(want);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FOREACH_PART01_1200
     * @tc.name int16ArrayForEachPart01Test012
     * @tc.desc Merged batch (5 tests): construction sources and views: construction families, zero-offset view, non-zero-offset view, DataView read and Set sum.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayForEachPart01Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify forEach yields correct elements across literal, of, from and ArrayBuffer-view construction families ---
      {
        let arr: Int16Array = new Int16Array([3, 1, 4, 1, 5]);
        let sum: number = 0;
        arr.forEach((value: number): void => {
          sum = sum + value;
        });
        expect(sum).assertEqual(14);

        let arrOf: Int16Array = Int16Array.of(2, 4, 6, 8);
        let collectedOf: number[] = [0, 0, 0, 0];
        let posOf: int = 0;
        arrOf.forEach((value: number): void => {
          collectedOf[posOf] = value;
          posOf = posOf + 1;
        });
        expect(collectedOf[0]).assertEqual(2);
        expect(collectedOf[3]).assertEqual(8);

        let source: number[] = [9, 7, 5];
        let arrFrom: Int16Array = Int16Array.from(source);
        let sumFrom: number = 0;
        arrFrom.forEach((value: number): void => {
          sumFrom = sumFrom + value;
        });
        expect(sumFrom).assertEqual(21);

        let buf: ArrayBuffer = new ArrayBuffer(6);
        let arrBuf: Int16Array = new Int16Array(buf, 0, 3);
        arrBuf.$_set(0, 10);
        arrBuf.$_set(1, 20);
        arrBuf.$_set(2, 30);
        let sumBuf: number = 0;
        arrBuf.forEach((value: number): void => {
          sumBuf = sumBuf + value;
        });
        expect(sumBuf).assertEqual(60);

        let cases: number[][] = [[50, 60, 70], [5, 15, 25], [-100, 200], [10, 20, 30]];
        for (let i: int = 0; i < cases.length; i++) {
          let arrCase: Int16Array = new Int16Array(cases[i]);
          let collected: number[] = [];
          arrCase.forEach((value: number, index: int, array: Int16Array): void => {
            collected.push(value);
          });
          for (let j: int = 0; j < cases[i].length; j++) {
            expect(collected[j]).assertEqual(cases[i][j]);
          }
        }
      }

      // --- [2] Verify forEach on Int16Array created from ArrayBuffer with byteOffset 0 iterates all elements correctly ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(4);
        let arr: Int16Array = new Int16Array(buf, 0, 2);
        arr.$_set(0, 30);
        arr.$_set(1, 40);
        let sum: number = 0;
        arr.forEach((value: number): void => {
          sum = sum + value;
        });
        expect(sum).assertEqual(70);
      }

      // --- [3] Verify forEach on a view with a non-zero byteOffset iterates only that view's own elements ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(8);
        let arr: Int16Array = new Int16Array(buf, 4, 2);
        arr.$_set(0, 55);
        arr.$_set(1, 66);
        let collected: number[] = [0, 0];
        let pos: int = 0;
        arr.forEach((value: number): void => {
          collected[pos] = value;
          pos = pos + 1;
        });
        expect(collected[0]).assertEqual(55);
        expect(collected[1]).assertEqual(66);
      }

      // --- [4] Verify forEach accumulates elements read through a separate DataView over the same buffer ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(6);
        let arr: Int16Array = new Int16Array(buf);
        arr.$_set(0, 4);
        arr.$_set(1, 8);
        arr.$_set(2, 12);
        let dv: DataView = new DataView(buf);
        let total: number = 0;
        arr.forEach((value: number, index: int, array: Int16Array): void => {
          total = total + dv.getInt16(index * 2, true);
        });
        expect(total).assertEqual(24);
      }

      // --- [5] Verify forEach on an array built by from(Set) accumulates the element sum ---
      {
        let s: Set<int> = new Set<int>();
        s.add(5);
        s.add(10);
        s.add(15);
        let arr: Int16Array = Int16Array.from(s);
        let sum: number = 0;
        arr.forEach((element: number, _index: int, _array: Int16Array): void => {
          sum = sum + element;
        });
        let want: int = 30;
        expect(sum).assertEqual(want);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FOREACH_PART01_1300
     * @tc.name int16ArrayForEachPart01Test013
     * @tc.desc Merged batch (5 tests): iteration values and accumulation: three-parameter arrow, named function, mixed-sign sum, external accumulator and array reference.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayForEachPart01Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify forEach callbackfn as arrow function with all three typed parameters all elements processed correctly ---
      {
        let arr: Int16Array = new Int16Array([5, 15, 25]);
        let values: number[] = [0, 0, 0];
        let pos: int = 0;
        arr.forEach((value: number, index: int, array: Int16Array): void => {
          values[pos] = value;
          pos = pos + 1;
        });
        expect(values[0]).assertEqual(5);
        expect(values[1]).assertEqual(15);
        expect(values[2]).assertEqual(25);
      }

      // --- [2] Verify forEach callbackfn as top-level named function all elements processed correctly ---
      {
        gTrackedValueForEachPart01Test004 = 0;
        gTrackedIndexForEachPart01Test004 = -1;
        let arr: Int16Array = new Int16Array([42]);
        arr.forEach(namedCb_int16ArrayForEachPart01Test004);
        expect(gTrackedValueForEachPart01Test004).assertEqual(42);
      }

      // --- [3] Verify forEach callbackfn accumulates correct sum over arrays of positive, negative, and mixed-sign values ---
      {
        let cases: number[][] = [[3, 6, 9], [-10, -20, -30], [-5, 0, 5, -10, 10]];
        let expected: number[] = [18, -60, 0];
        for (let i: int = 0; i < cases.length; i++) {
          let arr: Int16Array = new Int16Array(cases[i]);
          let sum: number = 0;
          arr.forEach((value: number): void => {
            sum = sum + value;
          });
          expect(sum).assertEqual(expected[i]);
        }
      }

      // --- [4] Verify forEach accumulates each element value into an external accumulator over one pass ---
      {
        let arr: Int16Array = new Int16Array([2, 4, 6, 8]);
        let product: number = 1;
        arr.forEach((value: number, index: int, array: Int16Array): void => {
          product = product * value;
        });
        expect(product).assertEqual(384);
      }

      // --- [5] Verify forEach passes the array itself as the third callback argument, identical by reference ---
      {
        let arr: Int16Array = new Int16Array([1, 2]);
        let isSameRef: boolean = false;
        arr.forEach((value: number, index: int, array: Int16Array): void => {
          if (array === arr) {
            isSameRef = true;
          }
        });
        expect(isSameRef).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FOREACH_PART01_1400
     * @tc.name int16ArrayForEachPart01Test014
     * @tc.desc Merged batch (3 tests): iteration values and accumulation: largest-element index, caught RangeError continuing and interior local maxima.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayForEachPart01Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify forEach() tracks the index of the largest element through callback state ---
      {
        let arr: Int16Array = Int16Array.of(4, 9, 2, 8);
        let best: number = -1;
        let pos: int = -1;
        arr.forEach((value: number, index: int): void => {
          if (value > best) {
            best = value;
            pos = index;
          }
        });
        let want: int = 1;
        expect(pos).assertEqual(want);
      }

      // --- [2] Verify forEach callback catching a RangeError from $_get on a length-constructed array continues ---
      {
        let arr: Int16Array = new Int16Array(3);
        arr.$_set(0, 1);
        arr.$_set(1, 2);
        arr.$_set(2, 3);
        let caught: int = 0;
        arr.forEach((value: number, index: int, array: Int16Array): void => {
          try {
            array.$_get(array.length);
            expect().assertFail();
          } catch (err) {
            expect(err.name).assertEqual('RangeError');

            caught = caught + 1;
          }
        });
        expect(caught).assertEqual(3);
      }

      // --- [3] Verify forEach() counts the interior elements larger than both neighbours ---
      {
        let arr: Int16Array = Int16Array.of(1, 5, 2, 8, 3);
        let peaks: int = 0;
        arr.forEach((value: number, index: int, array: Int16Array): void => {
          if (index > 0 && index < array.length - 1) {
            if (value > (array.at(index - 1) as number) && value > (array.at(index + 1) as number)) {
              peaks = peaks + 1;
            }
          }
        });
        let want: int = 2;
        expect(peaks).assertEqual(want);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FOREACH_PART01_1500
     * @tc.name int16ArrayForEachPart01Test015
     * @tc.desc Merged batch (5 tests): callback exceptions and abort: counter before throw, $_set persistence, same-array nested throw, outer error after inner completion and inner write persistence.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayForEachPart01Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify forEach external counter incremented in callback before throw counter equals expected after catch, external flag set before throw remains true after catch ---
      {
        let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
        let counter: int = 0;
        try {
          arr.forEach((value: number, index: int, array: Int16Array) => {
            if (index === 2) {
              throw new Error('stop');
            }
            counter = counter + 1;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        expect(counter).assertEqual(2);

        let arr2: Int16Array = new Int16Array([1, 2, 3]);
        let flag: boolean = false;
        try {
          arr2.forEach((value: number, index: int, array: Int16Array) => {
            flag = true;
            if (index === 1) {
              throw new Error('fail');
            }
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        expect(flag).assertTrue();
      }

      // --- [2] Verify forEach $_set modifications persist when callback throws ---
      {
        let cases: int[][] = [
          [0, 2, 999, 2, 999],
          [0, 1, 0, 1, 0],
          [0, 1, 32767, 1, 32767],
          [0, 1, -32768, 1, -32768],
          [0, 1, -1, 1, -1],
          [0, 1, 32768, 1, -32768],
          [0, 0, 888, 0, 888]
        ];
        for (let i: int = 0; i < cases.length; i++) {
          let arr: Int16Array = new Int16Array([1, 2, 3, 4]);
          try {
            arr.forEach((value: number, index: int, array: Int16Array) => {
              if (index === cases[i][0]) {
                array.$_set(cases[i][1], cases[i][2]);
                throw new Error('abort');
              }
            });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
          }
          expect(arr.$_get(cases[i][3])).assertEqual(cases[i][4]);
        }
        let arr2: Int16Array = new Int16Array([1, 1, 1, 1, 1]);
        try {
          arr2.forEach((value: number, index: int, array: Int16Array) => {
            array.$_set(index, index * 10);
            if (index === 3) {
              throw new Error('halt');
            }
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        expect(arr2.$_get(0)).assertEqual(0);
        expect(arr2.$_get(1)).assertEqual(10);
        expect(arr2.$_get(2)).assertEqual(20);
        expect(arr2.$_get(3)).assertEqual(30);
      }

      // --- [3] Verify nested forEach on SAME array throw in inner forEach propagates to outer, outer forEach stops ---
      {
        let arr: Int16Array = new Int16Array([1, 2, 3]);
        let outerCount: int = 0;
        try {
          arr.forEach((outerValue: number, outerIndex: int, outerArray: Int16Array) => {
            outerCount = outerCount + 1;
            arr.forEach((innerValue: number, innerIndex: int, innerArray: Int16Array) => {
              if (outerIndex === 0 && innerIndex === 1) {
                throw new Error('inner-fail');
              }
            });
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        expect(outerCount).assertEqual(1);
      }

      // --- [4] Verify the outer callback's error propagates after an inner nested forEach has completed ---
      {
        let outer: Int16Array = new Int16Array([1, 2, 3]);
        let inner: Int16Array = new Int16Array([5, 6]);
        let innerSum: number = 0;
        let outerIndex: int = 0;
        try {
          outer.forEach((ov: number, oi: int, oa: Int16Array) => {
            outerIndex = oi;
            inner.forEach((iv: number, ii: int, ia: Int16Array) => {
              innerSum = innerSum + iv;
            });
            if (oi === 1) {
              throw new Error('outer-throw-after-inner');
            }
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        expect(innerSum).assertEqual(22);
        expect(outerIndex).assertEqual(1);
      }

      // --- [5] Verify a write made by an inner nested forEach persists even when that inner loop then throws ---
      {
        let arr: Int16Array = new Int16Array([1, 2, 3, 4]);
        try {
          arr.forEach((ov: number, oi: int, oa: Int16Array) => {
            if (oi === 0) {
              arr.forEach((iv: number, ii: int, ia: Int16Array) => {
                if (ii === 0) {
                  arr.$_set(2, 555);
                  throw new Error('abort-inner');
                }
              });
            }
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        expect(arr.$_get(2)).assertEqual(555);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FOREACH_PART01_1600
     * @tc.name int16ArrayForEachPart01Test016
     * @tc.desc Merged batch (5 tests): callback exceptions and abort: mutations made via the array argument, helper throws, a multi-level helper, a stored value before a throw and normal completion.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayForEachPart01Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a mutation made through the array parameter is visible after the callback throws ---
      {
        let arr: Int16Array = new Int16Array([1, 2, 3, 4]);
        let paramValue: number = 0;
        try {
          arr.forEach((value: number, index: int, array: Int16Array) => {
            array.$_set(0, 555);
            if (index === 1) {
              paramValue = array.$_get(0);
              throw new Error('param-check');
            }
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        expect(paramValue).assertEqual(555);
      }

      // --- [2] Verify callbackfn calls a helper function that throws error propagates through forEach correctly ---
      {
        let arr: Int16Array = new Int16Array([1, 2, 3]);
        try {
          arr.forEach((value: number, index: int, array: Int16Array) => {
            if (index === 1) {
              thrower_074();
            }
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
      }

      // --- [3] Verify an Error from a multi-level nested helper call propagates fully out of forEach ---
      {
        let arr: Int16Array = new Int16Array([5, 10]);
        try {
          arr.forEach((value: number, index: int, array: Int16Array) => {
            level1_075();
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
      }

      // --- [4] Verify a value stored in an external variable before the throw survives the catch ---
      {
        let arr: Int16Array = new Int16Array([2, 4, 6]);
        let saved: number = 0;
        try {
          arr.forEach((value: number, index: int, array: Int16Array): void => {
            saved = value * index;
            if (index === 1) {
              throw new Error('save-throw');
            }
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        expect(saved).assertEqual(4);
      }

      // --- [5] Verify forEach on normal Int16Array with no-throw callback completes fully, after-code executes, boundary values counted, large array fully iterated ---
      {
        let arr: Int16Array = new Int16Array([1, 3, 5]);
        let visits: int = 0;
        arr.forEach((value: number, index: int, array: Int16Array) => {
          visits = visits + 1;
          expect(value).assertEqual(array.$_get(index));
        });
        expect(visits).assertEqual(3);

        let arrB: Int16Array = new Int16Array([-32768, 0, 32767]);
        let countB: int = 0;
        arrB.forEach((value: number, index: int, array: Int16Array) => {
          countB = countB + 1;
        });
        expect(countB).assertEqual(3);

        let arrL: Int16Array = new Int16Array(100);
        let countL: int = 0;
        arrL.forEach((value: number, index: int, array: Int16Array) => {
          countL = countL + 1;
        });
        expect(countL).assertEqual(100);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FOREACH_PART01_1700
     * @tc.name int16ArrayForEachPart01Test017
     * @tc.desc Merged batch (4 tests): callback exceptions and abort: nested copy-constructed throw, stored index at 2, ArrayBuffer RangeError and at(-1)-then-throw.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayForEachPart01Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a nested forEach whose inner copy-constructed array callback throws Error propagates and stops the outer array built by from(Set) after one call ---
      {
        let s: Set<int> = new Set<int>();
        s.add(1);
        s.add(2);
        s.add(3);
        let outer: Int16Array = Int16Array.from(s);
        let inner: Int16Array = new Int16Array(Int16Array.of(9, 8));
        let outerCalls: int = 0;
        try {
          outer.forEach((element: number, _index: int, _array: Int16Array): void => {
            outerCalls = outerCalls + 1;
            inner.forEach((innerElement: number, _innerIndex: int, _innerArray: Int16Array): void => {
              throw new Error('inner fail');
            });
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        expect(outerCalls).assertEqual(1);
      }

      // --- [2] Verify forEach callbackfn storing the index into an external variable then throwing at index 2 keeps the stored index after the throw ---
      {
        let arr: Int16Array = new Int16Array(Int16Array.of(1, 2, 3, 4));
        let stored: int = -1;
        try {
          arr.forEach((element: number, index: int, _array: Int16Array): void => {
            stored = index;
            if (index === 2) {
              throw new Error('store fail');
            }
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        let want: int = 2;
        expect(stored).assertEqual(want);
      }

      // --- [3] Verify a RangeError thrown by the callback on an ArrayBuffer-backed array propagates ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(4);
        let arr: Int16Array = new Int16Array(buf);
        arr.$_set(0, 1);
        arr.$_set(1, 2);
        try {
          arr.forEach((value: number, index: int, array: Int16Array): void => {
            throw new RangeError('out');
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
      }

      // --- [4] Verify forEach propagates an Error thrown after reading at(-1) in the callback ---
      {
        let arr: Int16Array = Int16Array.of(5, 6, 7);
        try {
          arr.forEach((value: number, index: int, array: Int16Array): void => {
            let last: number | undefined = array.at(-1);
            throw new Error('after-' + last);
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FOREACH_PART01_1800
     * @tc.name int16ArrayForEachPart01Test018
     * @tc.desc Merged batch (3 tests): callback exceptions and abort: nested map callback, TypeError from a Map source and Error from a copied Map source.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayForEachPart01Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify forEach propagates an Error thrown by a nested map callback invoked inside the iteration ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        try {
          arr.forEach((value: number, index: int, array: Int16Array): void => {
            array.map((v: number): number => {
              throw new Error('inner-map');
            });
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
      }

      // --- [2] Verify forEach propagates a TypeError thrown by the callback from a from(Map.values()) source ---
      {
        let m: Map<string, number> = new Map<string, number>();
        m.set('a', 1);
        m.set('b', 2);
        let arr: Int16Array = Int16Array.from(m.values());
        try {
          arr.forEach((value: number, index: int, array: Int16Array): void => {
            throw new TypeError('msg-b');
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
        }
      }

      // --- [3] Verify forEach propagates an Error thrown by the callback on a copy-constructed from(Map.values()) source ---
      {
        let m: Map<string, number> = new Map<string, number>();
        m.set('a', 4);
        m.set('b', 8);
        let src: Int16Array = Int16Array.from(m.values());
        let arr: Int16Array = new Int16Array(src);
        try {
          arr.forEach((value: number, index: int, array: Int16Array): void => {
            if (index === 1) {
              throw new Error('copy');
            }
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FOREACH_PART01_1900
     * @tc.name int16ArrayForEachPart01Test019
     * @tc.desc Merged batch (5 tests): call counts, visit order and index parameters: $_set on a visited index, descending order, copied array, inclusive range and one pass over a large array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayForEachPart01Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a $_set on an already-visited index updates the array without revisiting or altering the captured value ---
      {
        let arr: Int16Array = new Int16Array([100, 200, 300]);
        let valueAt0: number = 0;
        arr.forEach((value: number, index: int, array: Int16Array): void => {
          if (index === 0) {
            valueAt0 = value;
          }
          if (index === 2) {
            array.$_set(0, 555);
          }
        });
        expect(valueAt0).assertEqual(100);
        expect(arr.$_get(0)).assertEqual(555);
      }

      // --- [2] Verify forEach over a descending array visits the values in index order rather than value order ---
      {
        let arr: Int16Array = Int16Array.of(5, 4, 3, 2, 1);
        let text: string = '';
        arr.forEach((value: number, index: int): void => {
          text = text + value.toString();
        });
        expect(text).assertEqual('54321');
      }

      // --- [3] Verify forEach over a copy constructed from another Int16Array visits all copied elements ---
      {
        let original: Int16Array = new Int16Array([12, 34, 56]);
        let copy: Int16Array = new Int16Array(original);
        let sum: number = 0;
        copy.forEach((value: number): void => {
          sum = sum + value;
        });
        expect(sum).assertEqual(102);
      }

      // --- [4] Verify forEach visits every index across the inclusive range from 0 to length minus 1 ---
      {
        let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
        let minIndexSeen: int = 999;
        let maxIndexSeen: int = -1;
        arr.forEach((value: number, index: int, array: Int16Array): void => {
          if (index < minIndexSeen) { minIndexSeen = index; }
          if (index > maxIndexSeen) { maxIndexSeen = index; }
        });
        expect(minIndexSeen).assertEqual(0);
        expect(maxIndexSeen).assertEqual(4);
      }

      // --- [5] Verify forEach visits every index of a large Int16Array exactly once in ascending order ---
      {
        let arr: Int16Array = new Int16Array(50);
        let i: int = 0;
        while (i < 50) {
          arr.$_set(i, (i * 7) % 100 - 50);
          i = i + 1;
        }
        let orderOk: boolean = true;
        let prev: int = -1;
        arr.forEach((value: number, index: int, array: Int16Array): void => {
          if (index !== prev + 1) {
            orderOk = false;
          }
          prev = index;
        });
        expect(orderOk).assertTrue();
        expect(prev).assertEqual(49);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FOREACH_PART01_2000
     * @tc.name int16ArrayForEachPart01Test020
     * @tc.desc Merged batch (5 tests): call counts, visit order and index parameters: partial fill and duplicates, Map insertion order with int16 wrapping, per-element rewrite, toSorted copy and odd filter.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayForEachPart01Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify forEach visits every element in order for a partially filled array and for an array holding duplicate values ---
      {
        let partiallyFilled: Int16Array = Int16Array.of(1, 2, 3, 4);
        partiallyFilled.fill(5, 1, 3);
        let duplicates: Int16Array = Int16Array.of(5, 5, 7, 5);
        let sources: Int16Array[] = [partiallyFilled, duplicates];
        let expected: string[] = ['1,5,5,4', '5,5,7,5'];
        for (let k: int = 0; k < sources.length; k++) {
          let seen: number[] = [];
          sources[k].forEach((value: number, _index: int, _array: Int16Array): void => {
            seen.push(value);
          });
          expect(seen.join(',')).assertEqual(expected[k]);
        }
      }

      // --- [2] Verify forEach over from(Map.values()) visits plain values in insertion order and wraps out-of-range stored values into int16 ---
      {
        let normal: Map<string, number> = new Map<string, number>();
        normal.set('x', 11);
        normal.set('y', 22);
        normal.set('z', 33);
        let wrapped: Map<string, number> = new Map<string, number>();
        wrapped.set('a', 70000);
        wrapped.set('b', -70000);
        let sources: Map<string, number>[] = [normal, wrapped];
        let expected: string[] = ['11,22,33', '4464,-4464'];
        for (let k: int = 0; k < sources.length; k++) {
          let arr: Int16Array = Int16Array.from(sources[k].values());
          let seen: number[] = [];
          arr.forEach((value: number, _index: int, _array: Int16Array): void => {
            seen.push(value);
          });
          expect(seen.join(',')).assertEqual(expected[k]);
        }
      }

      // --- [3] Verify a callback rewriting each element via $_set runs once per element and the writes persist ---
      {
        let arr: Int16Array = new Int16Array([1, 2, 3, 4]);
        let count: int = 0;
        arr.forEach((value: number, index: int, array: Int16Array) => {
          count++;
          array.$_set(index, value + 1);
        });
        expect(count).assertEqual(4);
        expect(arr.$_get(0)).assertEqual(2);
      }

      // --- [4] Verify forEach over the toSorted() copy concatenates values in ascending order ---
      {
        let arr: Int16Array = Int16Array.of(3, 1, 2);
        let sorted: Int16Array = arr.toSorted();
        let seq: string = '';
        sorted.forEach((element: number, _index: int, _array: Int16Array): void => {
          seq = seq + element;
        });
        let want: string = '123';
        expect(seq).assertEqual(want);
      }

      // --- [5] Verify forEach over the odd-only filter result visits only the filtered elements ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
        let filtered: Int16Array = arr.filter((v: number, _i: int, _a: Int16Array): boolean => v % 2 === 1);
        let count: int = 0;
        filtered.forEach((element: number, _index: int, _array: Int16Array): void => {
          count = count + 1;
        });
        let want: int = 3;
        expect(count).assertEqual(want);
      }
    });

  });
}
