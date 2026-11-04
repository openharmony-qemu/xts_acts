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

class PredicateHelperInstance {
  threshold: int = 0;
  constructor(threshold: int) {
    this.threshold = threshold;
  }
  isAboveThreshold(element: number, index: int, array: Int16Array): boolean {
    return element > this.threshold;
  }
}

function isPositive(element: number, index: int, array: Int16Array): boolean {
  return element > 0;
}

class PredicateHelperStatic {
  static isPositive(element: number, index: int, array: Int16Array): boolean {
    return element > 0;
  }
}

export default function int16ArrayEveryPart02Test(): void {
  describe('Int16ArrayEveryPart02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_EVERY_PART02_0100
     * @tc.name int16ArrayEveryPart02Test001
     * @tc.desc Merged batch (5 tests): predicate internals using other APIs: Math.sign/floor/ceil/round checks plus an entries-iterator sum.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayEveryPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify every() predicate using Math.sign(element) equals 1 on an all-positive array returns true ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4);
        let result: boolean = arr.every((element: number, _index: int, _array: Int16Array): boolean => {
          return Math.sign(element) === 1;
        });
        expect(result).assertTrue();
      }

      // --- [2] Verify every() predicate using Math.floor(element) equals element on an integer-valued array returns true ---
      {
        let arr: Int16Array = Int16Array.of(-10, 0, 10);
        let result: boolean = arr.every((element: number, _index: int, _array: Int16Array): boolean => {
          return Math.floor(element) === element;
        });
        expect(result).assertTrue();
      }

      // --- [3] Verify every() predicate requiring Math.ceil of each halved element to be at least 1 returns true on positive values ---
      {
        let arr: Int16Array = Int16Array.of(2, 3, 5, 8);
        let result: boolean = arr.every((element: number, _index: int, _array: Int16Array): boolean => {
          return Math.ceil(element / 2) >= 1;
        });
        expect(result).assertTrue();
      }

      // --- [4] Verify every() predicate requiring Math.round of each halved even element to double back to the element returns true ---
      {
        let arr: Int16Array = Int16Array.of(2, 4, 6, 10);
        let result: boolean = arr.every((element: number, _index: int, _array: Int16Array): boolean => {
          return Math.round(element / 2) * 2 === element;
        });
        expect(result).assertTrue();
      }

      // --- [5] Verify every() predicate that sums the entries iterator of a constant-10 array equals length times ten returns true ---
      {
        let arr: Int16Array = Int16Array.of(10, 10, 10, 10);
        let result: boolean = arr.every((element: number, _index: int, _array: Int16Array): boolean => {
          let total: number = 0;
          for (const e of _array.entries()) {
            total = total + e[1];
          }
          return total === _array.length * 10;
        });
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_EVERY_PART02_0200
     * @tc.name int16ArrayEveryPart02Test002
     * @tc.desc Merged batch (4 tests): predicate internals using other APIs: filter keeps a match, findLastIndex, entries index/value and identity map.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayEveryPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify every() predicate testing that filtering for the element keeps at least one match returns true ---
      {
        let arr: Int16Array = Int16Array.of(3, 3, 5);
        let result: boolean = arr.every((element: number, _index: int, _array: Int16Array): boolean => {
          return _array.filter((x: number): boolean => x === element).length >= 1;
        });
        expect(result).assertTrue();
      }

      // --- [2] Verify every() predicate testing that findLastIndex of the element is not before the current index returns true ---
      {
        let arr: Int16Array = Int16Array.of(2, 4, 6);
        let result: boolean = arr.every((element: number, _index: int, _array: Int16Array): boolean => {
          return _array.findLastIndex((x: number): boolean => x === element) >= _index;
        });
        expect(result).assertTrue();
      }

      // --- [3] Verify every() predicate testing that the entries iterator index equals the current index and value returns true ---
      {
        let arr: Int16Array = Int16Array.of(6, 7, 8);
        let result: boolean = arr.every((element: number, _index: int, _array: Int16Array): boolean => {
          let matches: boolean = false;
          for (const e of _array.entries()) {
            if (e[0] === _index && e[1] === element) {
              matches = true;
            }
          }
          return matches;
        });
        expect(result).assertTrue();
      }

      // --- [4] Verify every() predicate testing that an identity map read at the index equals the element returns true ---
      {
        let arr: Int16Array = Int16Array.of(5, 6, 7);
        let result: boolean = arr.every((element: number, _index: int, _array: Int16Array): boolean => {
          return _array.map((v: number): number => v).$_get(_index) === element;
        });
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_EVERY_PART02_0300
     * @tc.name int16ArrayEveryPart02Test003
     * @tc.desc Single test: comparing every() element against the first yields true on a constant array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayEveryPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify every() predicate comparing each element with $_get(0) returns true on a constant array ---
      {
        let arr: Int16Array = Int16Array.of(8, 8, 8);
        let result: boolean = arr.every((element: number, _index: int, _array: Int16Array): boolean => {
          return element === _array.$_get(0);
        });
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_EVERY_PART02_0400
     * @tc.name int16ArrayEveryPart02Test004
     * @tc.desc Merged batch (5 tests): construction sources and views: toSorted copy, map plus one, filtered positives, slice and subarray view.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayEveryPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify every() predicate element>0 returns true on a toSorted() copy while the original is unmutated ---
      {
        let arr: Int16Array = Int16Array.of(3, 1, 2);
        let sorted: Int16Array = arr.toSorted();
        let result: boolean = sorted.every((element: number, _index: int, _array: Int16Array): boolean => element > 0);
        expect(result).assertTrue();
        expect(arr.$_get(0)).assertEqual(3);
      }

      // --- [2] Verify every() predicate element>1 returns true on the map result of adding 1 to each element ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let mapped: Int16Array = arr.map((v: number): number => v + 1);
        let result: boolean = mapped.every((element: number, _index: int, _array: Int16Array): boolean => {
          return element > 1;
        });
        expect(result).assertTrue();
      }

      // --- [3] Verify every() predicate element>0 returns true on the filter result keeping only positives ---
      {
        let arr: Int16Array = Int16Array.of(2, 5, 8);
        let kept: Int16Array = arr.filter((v: number): boolean => v > 0);
        let result: boolean = kept.every((element: number, _index: int, _array: Int16Array): boolean => {
          return element > 0;
        });
        expect(result).assertTrue();
      }

      // --- [4] Verify every() predicate element>0 returns true on the slice of an array from index 1 to 3 ---
      {
        let arr: Int16Array = Int16Array.of(9, 4, 5, 6);
        let part: Int16Array = arr.slice(1, 3);
        let result: boolean = part.every((element: number, _index: int, _array: Int16Array): boolean => {
          return element > 0;
        });
        expect(result).assertTrue();
      }

      // --- [5] Verify every() predicate element>=0 returns true on a subarray view of the middle elements ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
        let view: Int16Array = arr.subarray(1, 4);
        let result: boolean = view.every((element: number, _index: int, _array: Int16Array): boolean => {
          return element >= 0;
        });
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_EVERY_PART02_0500
     * @tc.name int16ArrayEveryPart02Test005
     * @tc.desc Merged batch (5 tests): predicate result evaluation: small and 100-element arrays, named function, class static, class instance threshold and unconditional false.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayEveryPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify every() predicate element > 0 returns true on 3-element and 100-element arrays ---
      {
        let arr: Int16Array = new Int16Array([1, 2, 3]);
        let result: boolean = arr.every((element: number, index: int, array: Int16Array): boolean => {
          return element > 0;
        });
        expect(result).assertTrue();

        let source: int[] = [];
        for (let k: int = 1; k <= 100; k++) {
          source.push(k);
        }
        let arrBig: Int16Array = new Int16Array(source);
        let resultBig: boolean = arrBig.every((element: number, index: int, array: Int16Array): boolean => {
          return element > 0;
        });
        expect(resultBig).assertTrue();
      }

      // --- [2] Verify every() predicate element > 0 named function predicate returns true ---
      {
        let arr: Int16Array = new Int16Array([3, 7, 11]);
        let result: boolean = arr.every(isPositive);
        expect(result).assertTrue();
      }

      // --- [3] Verify every() predicate element > 0 class static predicate returns true ---
      {
        let arr: Int16Array = new Int16Array([2, 4, 8]);
        let result: boolean = arr.every(PredicateHelperStatic.isPositive);
        expect(result).assertTrue();
      }

      // --- [4] Verify every() predicate element > this.threshold class instance predicate returns true ---
      {
        let helper: PredicateHelperInstance = new PredicateHelperInstance(0);
        let arr: Int16Array = new Int16Array([1, 3, 5]);
        let result: boolean = arr.every((element: number, index: int, array: Int16Array): boolean => {
          return helper.isAboveThreshold(element, index, array);
        });
        expect(result).assertTrue();
      }

      // --- [5] Verify every() returns false when the predicate is unconditionally false ---
      {
        let arr: Int16Array = new Int16Array([10, 20, 30]);
        let result: boolean = arr.every((element: number, index: int, array: Int16Array): boolean => {
          return false;
        });
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_EVERY_PART02_0600
     * @tc.name int16ArrayEveryPart02Test006
     * @tc.desc Merged batch (5 tests): predicate result evaluation: threshold, $_set mutation during iteration, full visit, array length and element versus $_get(index).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayEveryPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify every() predicate element > threshold returns true ---
      {
        let threshold: int = 5;
        let arr: Int16Array = new Int16Array([6, 8, 10]);
        let result: boolean = arr.every((element: number, index: int, array: Int16Array): boolean => {
          return element > threshold;
        });
        expect(result).assertTrue();
      }

      // --- [2] Verify every() returns true when the predicate mutates a later element via $_set during iteration ---
      {
        let arr: Int16Array = new Int16Array([1, 2, 3]);
        let seen: number = 0;
        let visits: int = 0;
        let result: boolean = arr.every((element: number, index: int, array: Int16Array): boolean => {
          visits = visits + 1;
          if (index === 1) {
            seen = element;
          }
          if (index === 0) {
            array.$_set(1, 99);
          }
          return true;
        });
        expect(result).assertTrue();
        expect(visits).assertEqual(3);
        expect(seen).assertEqual(99);
        expect(arr.join(',')).assertEqual('1,99,3');
      }

      // --- [3] Verify every() returns true after visiting every element when all elements satisfy the predicate ---
      {
        let arr: Int16Array = new Int16Array([1, 3, 5, 7]);
        let visitCount: int = 0;
        let result: boolean = arr.every((element: number, index: int, array: Int16Array): boolean => {
          visitCount = visitCount + 1;
          return element % 2 === 1;
        });
        expect(result).assertTrue();
        expect(visitCount).assertEqual(4);
      }

      // --- [4] Verify every() predicate array.length === len returns true ---
      {
        let arr: Int16Array = new Int16Array([11, 22, 33]);
        let len: int = arr.length;
        let result: boolean = arr.every((element: number, index: int, array: Int16Array): boolean => {
          return array.length === len;
        });
        expect(result).assertTrue();
      }

      // --- [5] Verify every() predicate element === array.$_get(index) returns true ---
      {
        let arr: Int16Array = new Int16Array([5, 10, 15]);
        let result: boolean = arr.every((element: number, index: int, array: Int16Array): boolean => {
          return element === array.$_get(index);
        });
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_EVERY_PART02_0700
     * @tc.name int16ArrayEveryPart02Test007
     * @tc.desc Merged batch (5 tests): predicate result evaluation: map plus one, find definedness, reduce sum, filtered length and square-of-index relation.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayEveryPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify every() predicate that maps the array with +1 and reads the mapped index equals element+1 returns true ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let result: boolean = arr.every((element: number, index: int, array: Int16Array): boolean => {
          return array.map((v: number, _i: int, _a: Int16Array): number => v + 1).$_get(index) === element + 1;
        });
        expect(result).assertTrue();
      }

      // --- [2] Verify every() predicate that finds the current element in the array and checks the result is defined returns true ---
      {
        let arr: Int16Array = Int16Array.of(5, 6, 7);
        let result: boolean = arr.every((element: number, _index: int, array: Int16Array): boolean => {
          return array.find((v: number, _i: int, _a: Int16Array): boolean => v === element) !== undefined;
        });
        expect(result).assertTrue();
      }

      // --- [3] Verify every() predicate that reduces the array to its sum and compares with that sum returns true ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let result: boolean = arr.every((element: number, _index: int, array: Int16Array): boolean => {
          return array.reduce((acc: number, v: number, _i: int, _a: Int16Array): number => acc + v, 0) === 6;
        });
        expect(result).assertTrue();
      }

      // --- [4] Verify every() predicate that filters for positive values and checks the filtered length equals array.length returns true ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let result: boolean = arr.every((element: number, _index: int, array: Int16Array): boolean => {
          return array.filter((v: number, _i: int, _a: Int16Array): boolean => v > 0).length === array.length;
        });
        expect(result).assertTrue();
      }

      // --- [5] Verify every() returns true when each element equals the square of its index ---
      {
        let arr: Int16Array = new Int16Array(4);
        for (let i: int = 0; i < 4; i++) {
          arr.$_set(i, i * i);
        }
        let result: boolean = arr.every((element: number, index: int, array: Int16Array): boolean => {
          return element === index * index;
        });
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_EVERY_PART02_0800
     * @tc.name int16ArrayEveryPart02Test008
     * @tc.desc Merged batch (5 tests): predicate exceptions: first zero TypeError, second-element throw count, TypeError name, RangeError name and indexOf-then-throw.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayEveryPart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify every() throws TypeError when first element is zero ---
      {
        let arr: Int16Array = new Int16Array([0, 1, 2]);
        try {
          arr.every((element: number, index: int, array: Int16Array): boolean => {
            if (element === 0) {
              throw new TypeError('zero element error');
            }
            return element > 0;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
        }
      }

      // --- [2] Verify every() predicate that throws Error on the second element of an array built by from(Set) stops with two predicate calls ---
      {
        let s: Set<int> = new Set<int>();
        s.add(1);
        s.add(2);
        s.add(3);
        let arr: Int16Array = Int16Array.from(s);
        let calls: int = 0;
        try {
          arr.every((element: number, index: int, _array: Int16Array): boolean => {
            calls = calls + 1;
            if (index === 1) {
              throw new Error('second element');
            }
            return true;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        expect(calls).assertEqual(2);
      }

      // --- [3] Verify every() predicate that throws TypeError on a copy-constructed array propagates the TypeError name ---
      {
        let arr: Int16Array = new Int16Array(Int16Array.of(1, 2, 3));
        try {
          arr.every((element: number, _index: int, _array: Int16Array): boolean => {
            throw new TypeError('bad type');
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
        }
      }

      // --- [4] Verify every() predicate that throws RangeError on an array built by from(Array, mapfn) propagates the RangeError name ---
      {
        let src: int[] = [1, 2];
        let arr: Int16Array = Int16Array.from(src, (v: int, k: double): double => v + k);
        try {
          arr.every((element: number, _index: int, _array: Int16Array): boolean => {
            throw new RangeError('out of range');
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
      }

      // --- [5] Verify every() predicate that reads array.indexOf then throws Error on the last element of a copy-constructed array propagates the Error ---
      {
        let arr: Int16Array = new Int16Array(Int16Array.of(2, 4, 6));
        try {
          arr.every((element: number, index: int, array: Int16Array): boolean => {
            let pos: int = array.indexOf(element);
            if (index === 2) {
              throw new Error('last element');
            }
            return pos >= 0;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_EVERY_PART02_0900
     * @tc.name int16ArrayEveryPart02Test009
     * @tc.desc Merged batch (3 tests): predicate exceptions: nested map callback, negative element on a Map source, and findLastIndex failure before throwing.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayEveryPart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify every() propagates an Error thrown by a nested map callback invoked from the predicate ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        try {
          arr.every((element: number, _index: int, _array: Int16Array): boolean => {
            _array.map((v: number): number => {
              throw new Error('inner');
            });
            return true;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
      }

      // --- [2] Verify every() propagates an Error thrown once a negative element is seen on a from(Map.values()) source ---
      {
        let m: Map<string, number> = new Map<string, number>();
        m.set('a', 10);
        m.set('b', -20);
        let arr: Int16Array = Int16Array.from(m.values());
        try {
          arr.every((element: number, _index: int, _array: Int16Array): boolean => {
            if (element < 0) {
              throw new Error('neg');
            }
            return true;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
      }

      // --- [3] Verify every() propagates an Error thrown after failing to locate the element with findLastIndex ---
      {
        let arr: Int16Array = Int16Array.of(4, 5, 6);
        try {
          arr.every((element: number, _index: int, _array: Int16Array): boolean => {
            let idx: number = _array.findLastIndex((x: number): boolean => x === element + 100);
            if (idx < 0) {
              throw new Error('missing');
            }
            return true;
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_EVERY_PART02_1000
     * @tc.name int16ArrayEveryPart02Test010
     * @tc.desc Merged batch (5 tests): short-circuit, visit order and call counts: unvisited tail, empty vacuous result, all zeros, first odd and second-element lower bound.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayEveryPart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify every() short-circuit leaves the later elements unvisited after a first false ---
      {
        let arr: Int16Array = Int16Array.of(-1, 2, 3);
        let seen: int[] = [];
        arr.every((element: number, _index: int, _array: Int16Array): boolean => {
          seen.push(_index);
          return element > 0;
        });
        expect(seen.length).assertEqual(1);
      }

      // --- [2] Verify every() on empty Int16Array returns true vacuously without side effects ---
      {
        let arr: Int16Array = new Int16Array(0);
        let sideEffect: int = 0;
        let result: boolean = arr.every((element: number, index: int, array: Int16Array): boolean => {
          sideEffect = sideEffect + 1;
          return element > 0;
        });
        expect(result).assertTrue();
        expect(sideEffect).assertEqual(0);

        let arr2: Int16Array = new Int16Array(0);
        let result2: boolean = arr2.every((element: number, index: int, array: Int16Array): boolean => {
          return element !== 0;
        });
        expect(result2).assertTrue();

        let buf: ArrayBuffer = new ArrayBuffer(0);
        let arr3: Int16Array = new Int16Array(buf);
        let result3: boolean = arr3.every((element: number, index: int, array: Int16Array): boolean => {
          return false;
        });
        expect(result3).assertTrue();

        let arr4: Int16Array = new Int16Array(0);
        let result4: boolean = arr4.every((element: number, index: int, array: Int16Array): boolean => {
          return false;
        });
        expect(result4).assertTrue();
      }

      // --- [3] Verify every() returns true and visits every element when all elements are zero and equal to zero ---
      {
        let arr: Int16Array = new Int16Array([0, 0, 0]);
        let callCount: int = 0;
        let result: boolean = arr.every((element: number, index: int, array: Int16Array): boolean => {
          callCount = callCount + 1;
          return element === 0;
        });
        expect(result).assertTrue();
        expect(callCount).assertEqual(3);
      }

      // --- [4] Verify every() returns false at the first odd element after four predicate calls ---
      {
        let arr: Int16Array = Int16Array.of(2, 4, 6, 7, 8);
        let visitCount: int = 0;
        let result: boolean = arr.every((element: number, _index: int, _array: Int16Array): boolean => {
          visitCount = visitCount + 1;
          return element % 2 === 0;
        });
        expect(result).assertFalse();
        expect(visitCount).assertEqual(4);
      }

      // --- [5] Verify every() returns false after two calls when the second element fails a lower bound ---
      {
        let arr: Int16Array = Int16Array.of(5, 4, 3);
        let visitCount: int = 0;
        let result: boolean = arr.every((element: number, _index: int, _array: Int16Array): boolean => {
          visitCount = visitCount + 1;
          return element >= 5;
        });
        expect(result).assertFalse();
        expect(visitCount).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_EVERY_PART02_1100
     * @tc.name int16ArrayEveryPart02Test011
     * @tc.desc Merged batch (4 tests): non-mutation and buffer integrity: metadata unchanged, offset views, empty view and checked element stability.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayEveryPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify every() leaves byteLength, byteOffset and BYTES_PER_ELEMENT unchanged regardless of outcome ---
      {
        let arr: Int16Array = new Int16Array([1, 2, 3]);
        let blBefore: int = arr.byteLength;
        arr.every((element: number, index: int, array: Int16Array): boolean => {
          return true;
        });
        arr.every((element: number, index: int, array: Int16Array): boolean => {
          return element > 0;
        });
        arr.every((element: number, index: int, array: Int16Array): boolean => {
          return false;
        });
        expect(arr.byteLength).assertEqual(arr.length * 2);
        expect(arr.byteLength).assertEqual(blBefore);
        expect(arr.byteOffset).assertEqual(0);
        expect(arr.BYTES_PER_ELEMENT).assertEqual(2);
        arr.every((element: number, index: int, array: Int16Array): boolean => {
          return false;
        });
        expect(arr.BYTES_PER_ELEMENT).assertEqual(2);

        let bpeBefore: int = arr.BYTES_PER_ELEMENT;
        arr.every((element: number, index: int, array: Int16Array): boolean => {
          return element > 0;
        });
        expect(arr.BYTES_PER_ELEMENT).assertEqual(bpeBefore);
      }

      // --- [2] Verify every() keeps ArrayBuffer view byteOffset unchanged for offset 0 and 4 ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(8);
        let arr: Int16Array = new Int16Array(buf, 0, 2);
        let boBefore: int = arr.byteOffset;
        arr.every((element: number, index: int, array: Int16Array): boolean => {
          return true;
        });
        expect(arr.byteOffset).assertEqual(boBefore);

        let buf2: ArrayBuffer = new ArrayBuffer(10);
        let arr2: Int16Array = new Int16Array(buf2, 4, 2);
        let boBefore2: int = arr2.byteOffset;
        arr2.every((element: number, index: int, array: Int16Array): boolean => {
          return true;
        });
        expect(arr2.byteOffset).assertEqual(boBefore2);
      }

      // --- [3] Verify every() keeps empty ArrayBuffer view byteOffset unchanged ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(4);
        let arr: Int16Array = new Int16Array(buf, 2, 0);
        let boBefore: int = arr.byteOffset;
        arr.every((element: number, index: int, array: Int16Array): boolean => {
          return true;
        });
        expect(arr.byteOffset).assertEqual(boBefore);
      }

      // --- [4] Verify every() leaves the checked element unchanged for index 0 and last across MAX, MIN, negative and zero arrays ---
      {
        let sources: int[][] = [[42, 10, 20], [1, 2, 99], [32767, 0, -1], [-32768, 0, 1], [-5, 10, 20], [0, 10, 20]];
        let checkedIndices: int[] = [0, 2, 0, 0, 0, 0];
        let predicateKinds: int[] = [0, 1, 2, 2, 3, 4];
        for (let i: int = 0; i < sources.length; i++) {
          let arr: Int16Array = Int16Array.from(sources[i]);
          let checked: int = checkedIndices[i];
          let predicateKind: int = predicateKinds[i];
          let before: number = arr.$_get(checked);
          arr.every((element: number, index: int, array: Int16Array): boolean => {
            if (predicateKind === 0) {
              return element > 0;
            }
            if (predicateKind === 1) {
              return element < 100;
            }
            if (predicateKind === 2) {
              return element !== 0;
            }
            if (predicateKind === 3) {
              return element !== -5;
            }
            return element >= 0;
          });
          expect(arr.$_get(checked)).assertEqual(before);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_EVERY_PART02_1200
     * @tc.name int16ArrayEveryPart02Test012
     * @tc.desc Merged batch (5 tests): non-mutation and buffer integrity: rebuilt from source, DataView bytes, separate-array mutation, byteLength and integer rounding.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayEveryPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify every() predicate element>0 returns true on an array rebuilt by from(Int16Array.of) and keeps the length ---
      {
        let arr: Int16Array = Int16Array.of(6, 7, 8);
        let copy: Int16Array = Int16Array.from(arr);
        let result: boolean = copy.every((element: number, _index: int, _array: Int16Array): boolean => {
          return element > 0;
        });
        expect(result).assertTrue();
        expect(copy.length).assertEqual(3);
      }

      // --- [2] Verify every() keeps the DataView-visible bytes unchanged after a true result ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(6);
        let arr: Int16Array = new Int16Array(buf);
        arr.$_set(0, 5);
        arr.$_set(1, 10);
        arr.$_set(2, 15);
        let dv: DataView = new DataView(buf);
        let before: number = dv.getInt16(2, true);
        let result: boolean = arr.every((element: number, _index: int, _array: Int16Array): boolean => {
          return element > 0;
        });
        expect(result).assertTrue();
        expect(dv.getInt16(2, true)).assertEqual(before);
      }

      // --- [3] Verify every() predicate mutating a separate array does not change the iterated array or the result ---
      {
        let other: Int16Array = Int16Array.of(9, 9, 9);
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let result: boolean = arr.every((element: number, _index: int, _array: Int16Array): boolean => {
          other.$_set(_index, 0);
          return element > 0;
        });
        expect(result).assertTrue();
        expect(arr.join(',')).assertEqual('1,2,3');
      }

      // --- [4] Verify every() keeps the byteLength of a length-constructed array unchanged after a true result ---
      {
        let arr: Int16Array = new Int16Array(4);
        arr.$_set(0, 1);
        arr.$_set(1, 2);
        arr.$_set(2, 3);
        arr.$_set(3, 4);
        let before: number = arr.byteLength;
        let result: boolean = arr.every((element: number, _index: int, _array: Int16Array): boolean => {
          return element > 0;
        });
        expect(result).assertTrue();
        expect(arr.byteLength).assertEqual(before);
      }

      // --- [5] Verify every() predicate requiring Math.round of each element to leave it unchanged returns true on integers ---
      {
        let arr: Int16Array = Int16Array.of(-4, 2, 6);
        let result: boolean = arr.every((element: number, _index: int, _array: Int16Array): boolean => {
          return Math.round(element) === element;
        });
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_EVERY_PART02_1300
     * @tc.name int16ArrayEveryPart02Test013
     * @tc.desc Merged batch (2 tests): empty, single-element and degenerate arrays: empty length stays zero and an empty slice never calls the predicate.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayEveryPart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify every() keeps empty array length 0 ---
      {
        let arr: Int16Array = new Int16Array([]);
        arr.every((element: number, index: int, array: Int16Array): boolean => {
          return element > 0;
        });
        expect(arr.length).assertEqual(0);
      }

      // --- [2] Verify every() returns true for an empty slice(0,0) and never invokes the predicate ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let empty: Int16Array = arr.slice(0, 0);
        let calls: int[] = [];
        let result: boolean = empty.every((element: number, _index: int, _array: Int16Array): boolean => {
          calls.push(_index);
          return false;
        });
        expect(result).assertTrue();
        expect(calls.length).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_EVERY_PART02_1400
     * @tc.name int16ArrayEveryPart02Test014
     * @tc.desc Merged batch (5 tests): boundary and truncation visibility: truncated floats, wrapped readback, boundary arithmetic, MAX/MIN comparisons and below-minimum failure.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayEveryPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify every() predicate sees truncated float $_set values ---
      {
        let cases: number[][] = [[3.7, 3], [-3.7, -3]];
        for (let i: int = 0; i < cases.length; i++) {
          let arr: Int16Array = new Int16Array(1);
          arr.$_set(0, cases[i][0]);
          let result: boolean = arr.every((element: number, index: int, array: Int16Array): boolean => {
            return element === cases[i][1];
          });
          expect(result).assertTrue();
        }
      }

      // --- [2] Verify every() over wrapped and truncated $_set elements keeps each within int16 range and reads back -32768, 3, 32767, -3, 4464 and -1 ---
      {
        let arr: Int16Array = new Int16Array(6);
        arr.$_set(0, 32768);
        arr.$_set(1, 3.7);
        arr.$_set(2, -32769);
        arr.$_set(3, -3.7);
        arr.$_set(4, 70000);
        arr.$_set(5, 65535);
        let inRange: boolean = arr.every((element: number, _index: int, _array: Int16Array): boolean => {
          return element >= -32768 && element <= 32767;
        });
        expect(inRange).assertTrue();
        expect(arr.$_get(0)).assertEqual(-32768);
        expect(arr.$_get(1)).assertEqual(3);
        expect(arr.$_get(2)).assertEqual(32767);
        expect(arr.$_get(3)).assertEqual(-3);
        expect(arr.$_get(4)).assertEqual(4464);
        expect(arr.$_get(5)).assertEqual(-1);
      }

      // --- [3] Verify every() predicate arithmetic on wrapped int16 boundary values ---
      {
        let cases: number[][] = [[32768, 1, -32767], [-32769, -1, 32766]];
        for (let i: int = 0; i < cases.length; i++) {
          let arr: Int16Array = new Int16Array(1);
          arr.$_set(0, cases[i][0]);
          let result: boolean = arr.every((element: number, index: int, array: Int16Array): boolean => {
            return element + cases[i][1] === cases[i][2];
          });
          expect(result).assertTrue();
        }
      }

      // --- [4] Verify every() MAX and MIN boundary comparisons ---
      {
        let arr: Int16Array = new Int16Array([32767]);
        let result: boolean = arr.every((element: number, index: int, array: Int16Array): boolean => {
          return element > 32766;
        });
        expect(result).assertTrue();

        let arr2: Int16Array = new Int16Array([32767, 32767, 32767]);
        let result2: boolean = arr2.every((element: number, index: int, array: Int16Array): boolean => {
          return element >= 32767;
        });
        expect(result2).assertTrue();

        let arr3: Int16Array = new Int16Array([-32768, -32768, -32768]);
        let result3: boolean = arr3.every((element: number, index: int, array: Int16Array): boolean => {
          return element <= -32768;
        });
        expect(result3).assertTrue();
      }

      // --- [5] Verify every() returns false after one call when the predicate tests below the int16 minimum ---
      {
        let arr: Int16Array = new Int16Array([-32768, -32768, -32768]);
        let callCount: int = 0;
        let result: boolean = arr.every((element: number, index: int, array: Int16Array): boolean => {
          callCount = callCount + 1;
          return element < -32768;
        });
        expect(result).assertFalse();
        expect(callCount).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_EVERY_PART02_1500
     * @tc.name int16ArrayEveryPart02Test015
     * @tc.desc Merged batch (2 tests): boundary and truncation visibility: both int16 bounds on a copied source, and negative zero treated as zero.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayEveryPart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify every() element<=32767 and element>=-32768 return true on from(another Int16Array) sources at both bounds ---
      {
        let bounds: int[] = [32767, -32768];
        let predicateKinds: int[] = [0, 1];
        for (let i: int = 0; i < bounds.length; i++) {
          let base: Int16Array = Int16Array.of(bounds[i], bounds[i]);
          let arr: Int16Array = Int16Array.from(base);
          let predicateKind: int = predicateKinds[i];
          let result: boolean = arr.every((element: number, _index: int, _array: Int16Array): boolean => {
            if (predicateKind === 0) {
              return element <= 32767;
            }
            return element >= -32768;
          });
          expect(result).assertTrue();
        }
      }

      // --- [2] Verify every() predicate treating a negative-zero $_set element as equal to zero returns true ---
      {
        let arr: Int16Array = new Int16Array(2);
        arr.$_set(0, -0);
        arr.$_set(1, 0);
        let result: boolean = arr.every((element: number, _index: int, _array: Int16Array): boolean => {
          return element === 0;
        });
        expect(result).assertTrue();
        expect(arr.$_get(0)).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_EVERY_PART02_1600
     * @tc.name int16ArrayEveryPart02Test016
     * @tc.desc Merged batch (5 tests): predicate internals using other APIs: byteOffset, BYTES_PER_ELEMENT relation, indexOf, lastIndexOf and includes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayEveryPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify every() predicate reading array.byteOffset equals 0 returns true ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let result: boolean = arr.every((element: number, _index: int, array: Int16Array): boolean => {
          return array.byteOffset === 0;
        });
        expect(result).assertTrue();
      }

      // --- [2] Verify every() predicate combining the static Int16Array.BYTES_PER_ELEMENT with array.length and array.byteLength returns true ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let result: boolean = arr.every((element: number, _index: int, array: Int16Array): boolean => {
          return Int16Array.BYTES_PER_ELEMENT * array.length === array.byteLength;
        });
        expect(result).assertTrue();
      }

      // --- [3] Verify every() predicate calling array.indexOf(element) equals the current index returns true ---
      {
        let arr: Int16Array = Int16Array.of(4, 5, 6);
        let result: boolean = arr.every((element: number, index: int, array: Int16Array): boolean => {
          return array.indexOf(element) === index;
        });
        expect(result).assertTrue();
      }

      // --- [4] Verify every() predicate calling array.lastIndexOf(element) is not below the current index returns true for distinct elements ---
      {
        let arr: Int16Array = Int16Array.of(4, 5, 6);
        let result: boolean = arr.every((element: number, index: int, array: Int16Array): boolean => {
          return array.lastIndexOf(element) >= index;
        });
        expect(result).assertTrue();
      }

      // --- [5] Verify every() predicate calling array.includes(element) returns true for every element ---
      {
        let arr: Int16Array = Int16Array.of(7, 8, 9);
        let result: boolean = arr.every((element: number, _index: int, array: Int16Array): boolean => {
          return array.includes(element);
        });
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_EVERY_PART02_1700
     * @tc.name int16ArrayEveryPart02Test017
     * @tc.desc Merged batch (5 tests): predicate internals using other APIs: keys count, values iterator, at(index), findLast and reduce sum.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayEveryPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify every() predicate that counts the keys iterator of the array equals its length returns true ---
      {
        let arr: Int16Array = Int16Array.of(7, 8, 9);
        let result: boolean = arr.every((element: number, _index: int, _array: Int16Array): boolean => {
          let cnt: number = 0;
          for (const k of _array.keys()) {
            cnt = cnt + 1;
          }
          return cnt === _array.length;
        });
        expect(result).assertTrue();
      }

      // --- [2] Verify every() predicate reading every value from the values iterator and matching the current element returns true ---
      {
        let arr: Int16Array = Int16Array.of(4, 4, 4);
        let result: boolean = arr.every((element: number, _index: int, _array: Int16Array): boolean => {
          let ok: boolean = true;
          for (const v of _array.values()) {
            if (v !== element) {
              ok = false;
            }
          }
          return ok;
        });
        expect(result).assertTrue();
      }

      // --- [3] Verify every() predicate testing that at(index) equals the current element returns true ---
      {
        let arr: Int16Array = Int16Array.of(11, 22, 33, 44);
        let result: boolean = arr.every((element: number, _index: int, _array: Int16Array): boolean => {
          return _array.at(_index) === element;
        });
        expect(result).assertTrue();
      }

      // --- [4] Verify every() predicate testing that findLast of the element returns that element again returns true ---
      {
        let arr: Int16Array = Int16Array.of(5, 6, 7, 8);
        let result: boolean = arr.every((element: number, _index: int, _array: Int16Array): boolean => {
          return _array.findLast((x: number): boolean => x === element) === element;
        });
        expect(result).assertTrue();
      }

      // --- [5] Verify every() predicate comparing the reduce sum with length times the current element returns true on a constant array ---
      {
        let arr: Int16Array = Int16Array.of(6, 6, 6);
        let result: boolean = arr.every((element: number, _index: int, _array: Int16Array): boolean => {
          return _array.reduce((acc: number, v: number): number => acc + v, 0) === _array.length * element;
        });
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_EVERY_PART02_1800
     * @tc.name int16ArrayEveryPart02Test018
     * @tc.desc Merged batch (5 tests): predicate internals using other APIs: some(), DataView element, suffix-slice head, last $_get value and buffer byteLength relation.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayEveryPart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify every() predicate that tests some() against the current element returns true ---
      {
        let arr: Int16Array = Int16Array.of(8, 9, 10);
        let result: boolean = arr.every((element: number, _index: int, array: Int16Array): boolean => {
          return array.some((v: number, _i: int, _a: Int16Array): boolean => v === element);
        });
        expect(result).assertTrue();
      }

      // --- [2] Verify every() predicate reading the DataView element at twice the index equals the element ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(6);
        let arr: Int16Array = new Int16Array(buf);
        arr.$_set(0, 7);
        arr.$_set(1, 8);
        arr.$_set(2, 9);
        let dv: DataView = new DataView(buf);
        let result: boolean = arr.every((element: number, _index: int, _array: Int16Array): boolean => {
          return dv.getInt16(_index * 2, true) === element;
        });
        expect(result).assertTrue();
      }

      // --- [3] Verify every() predicate testing that the head of the suffix slice equals the current element returns true ---
      {
        let arr: Int16Array = Int16Array.of(3, 6, 9);
        let result: boolean = arr.every((element: number, _index: int, _array: Int16Array): boolean => {
          return _array.slice(_index).$_get(0) === element;
        });
        expect(result).assertTrue();
      }

      // --- [4] Verify every() predicate testing that the last element read by $_get equals a captured value returns true ---
      {
        let arr: Int16Array = Int16Array.of(2, 4, 6);
        let last: number = arr.$_get(2);
        let result: boolean = arr.every((element: number, _index: int, _array: Int16Array): boolean => {
          return _array.$_get(_array.length - 1) === last;
        });
        expect(result).assertTrue();
      }

      // --- [5] Verify every() predicate testing that the backing buffer byteLength is at least the view byteLength returns true ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4);
        let result: boolean = arr.every((element: number, _index: int, _array: Int16Array): boolean => {
          return _array.buffer.byteLength >= _array.byteLength;
        });
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_EVERY_PART02_1900
     * @tc.name int16ArrayEveryPart02Test019
     * @tc.desc Merged batch (4 tests): construction sources and views: from(), ArrayBuffer views including an offset, Map.values and Map.keys sources.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayEveryPart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify every() operates on an array produced by Int16Array.from ---
      {
        let source: int[] = [2, 4, 6, 8];
        let arr: Int16Array = Int16Array.from(source);
        let result: boolean = arr.every((element: number, index: int, array: Int16Array): boolean => {
          return element % 2 === 0;
        });
        expect(result).assertTrue();
      }

      // --- [2] Verify every() operates on Int16Array views over ArrayBuffers including a non-zero byteOffset view ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(6);
        let arr: Int16Array = new Int16Array(buf, 0, 3);
        arr.$_set(0, 1);
        arr.$_set(1, 2);
        arr.$_set(2, 3);
        let result: boolean = arr.every((element: number, index: int, array: Int16Array): boolean => {
          return element > 0;
        });
        expect(result).assertTrue();

        let buf2: ArrayBuffer = new ArrayBuffer(10);
        let view: Int16Array = new Int16Array(buf2, 2, 4);
        view.$_set(0, 1);
        view.$_set(1, 1);
        view.$_set(2, 1);
        view.$_set(3, 1);
        let result2: boolean = view.every((element: number, index: int, array: Int16Array): boolean => {
          return element === 1;
        });
        expect(result2).assertTrue();
      }

      // --- [3] Verify every() predicate element>0 returns true over an array built by from(Map.values()) and leaves the source map at two entries ---
      {
        let m: Map<string, number> = new Map<string, number>();
        m.set('a', 12);
        m.set('b', 34);
        let arr: Int16Array = Int16Array.from(m.values());
        let result: boolean = arr.every((element: number, _index: int, _array: Int16Array): boolean => {
          return element > 0;
        });
        expect(result).assertTrue();
        expect(m.size).assertEqual(2);
      }

      // --- [4] Verify every() predicate element%2===0 returns true on an array built by from(Map.keys()) ---
      {
        let m: Map<number, string> = new Map<number, string>();
        m.set(2, 'a');
        m.set(4, 'b');
        m.set(6, 'c');
        let arr: Int16Array = Int16Array.from(m.keys());
        let result: boolean = arr.every((element: number, _index: int, _array: Int16Array): boolean => {
          return element % 2 === 0;
        });
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_EVERY_PART02_2000
     * @tc.name int16ArrayEveryPart02Test020
     * @tc.desc Merged batch (5 tests): construction sources and views: with() head overwrite, Array.from, subarray versus full array, nested every on one element and prefix subarray.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayEveryPart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify every() predicate element>0 returns true on the with(0,5) result that overwrites a negative head ---
      {
        let arr: Int16Array = Int16Array.of(-1, 2, 3);
        let patched: Int16Array = arr.with(0, 5);
        let result: boolean = patched.every((element: number, _index: int, _array: Int16Array): boolean => {
          return element > 0;
        });
        expect(result).assertTrue();
      }

      // --- [2] Verify every() predicate element>=0 returns true on the array built by Array.from of the source ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let copy: Int16Array = Int16Array.from(Array.from(arr));
        let result: boolean = copy.every((element: number, _index: int, _array: Int16Array): boolean => {
          return element >= 0;
        });
        expect(result).assertTrue();
      }

      // --- [3] Verify every() over a subarray view returns true while the full array with a negative tail returns false ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, -3);
        let head: Int16Array = arr.subarray(0, 2);
        let headAll: boolean = head.every((element: number, _index: int, _array: Int16Array): boolean => element > 0);
        expect(headAll).assertTrue();

        let fullAll: boolean = arr.every((element: number, _index: int, _array: Int16Array): boolean => element > 0);
        expect(fullAll).assertFalse();
      }

      // --- [4] Verify every() predicate that runs every() over a one-element subarray returns true ---
      {
        let arr: Int16Array = Int16Array.of(4, 5, 6);
        let result: boolean = arr.every((element: number, _index: int, _array: Int16Array): boolean => {
          return _array.subarray(_index, _index + 1).every((inner: number): boolean => inner === element);
        });
        expect(result).assertTrue();
      }

      // --- [5] Verify every() of the array and of a prefix subarray both return true ---
      {
        let arr: Int16Array = Int16Array.of(2, 4, 6, 8);
        expect(arr.every((element: number, _index: int, _array: Int16Array): boolean => element % 2 === 0)).assertTrue();

        let prefix: Int16Array = arr.subarray(0, 2);
        expect(prefix.every((element: number, _index: int, _array: Int16Array): boolean => element % 2 === 0)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_EVERY_PART02_2100
     * @tc.name int16ArrayEveryPart02Test021
     * @tc.desc Single test: the four zero comparisons (<0, >=0, <=0, >0) yield the expected verdicts when the source spans negatives and non-negatives.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayEveryPart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify every() predicate comparisons against zero (< 0, >= 0, <= 0 and > 0) on negative and non-negative arrays return the expected verdicts ---
      {
        let negative: Int16Array = Int16Array.of(-7, -14, -21);
        let nonNegative: Int16Array = Int16Array.of(0, 8, 16);
        let allBelowZero: boolean = negative.every((element: number, _index: int, _array: Int16Array): boolean => {
          return element < 0;
        });
        expect(allBelowZero).assertTrue();
        let noneBelowZero: boolean = nonNegative.every((element: number, _index: int, _array: Int16Array): boolean => {
          return element < 0;
        });
        expect(noneBelowZero).assertFalse();
        let allAtLeastZero: boolean = nonNegative.every((element: number, _index: int, _array: Int16Array): boolean => {
          return element >= 0;
        });
        expect(allAtLeastZero).assertTrue();
        let negativeAtLeastZero: boolean = negative.every((element: number, _index: int, _array: Int16Array): boolean => {
          return element >= 0;
        });
        expect(negativeAtLeastZero).assertFalse();
        let allAtMostZero: boolean = negative.every((element: number, _index: int, _array: Int16Array): boolean => {
          return element <= 0;
        });
        expect(allAtMostZero).assertTrue();
        let nonNegativeAtMostZero: boolean = nonNegative.every((element: number, _index: int, _array: Int16Array): boolean => {
          return element <= 0;
        });
        expect(nonNegativeAtMostZero).assertFalse();
        let positive: Int16Array = nonNegative.slice(1);
        let allAboveZero: boolean = positive.every((element: number, _index: int, _array: Int16Array): boolean => {
          return element > 0;
        });
        expect(allAboveZero).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_EVERY_PART02_2200
     * @tc.name int16ArrayEveryPart02Test022
     * @tc.desc Merged batch (5 tests): predicate result evaluation: of() source, nested every, doubled threshold, hexadecimal literals in range and monotonic sequences.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayEveryPart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify every() operates on an array produced by Int16Array.of ---
      {
        let arr: Int16Array = Int16Array.of(3, 6, 9, 12);
        let result: boolean = arr.every((element: number, index: int, array: Int16Array): boolean => {
          return element % 3 === 0;
        });
        expect(result).assertTrue();
      }

      // --- [2] Verify every() supports a predicate that itself calls every() on the same array ---
      {
        let arr: Int16Array = new Int16Array([5, 5, 5]);
        let result: boolean = arr.every((element: number, index: int, array: Int16Array): boolean => {
          return array.every((inner: number, i: int, a: Int16Array): boolean => {
            return inner === element;
          });
        });
        expect(result).assertTrue();
      }

      // --- [3] Verify every() predicate element * 2 >= 10 returns true ---
      {
        let arr: Int16Array = Int16Array.of(5, 10, 15);
        let result: boolean = arr.every((element: number, index: int, array: Int16Array): boolean => {
          let doubled: number = element * 2;
          return doubled >= 10;
        });
        expect(result).assertTrue();
      }

      // --- [4] Verify every() predicate keeping each hex-literal element within int16 range returns true ---
      {
        let arr: Int16Array = Int16Array.of(0x7FFF, -0x8000, 0x1);
        let result: boolean = arr.every((element: number, _index: int, _array: Int16Array): boolean => {
          return element <= 32767 && element >= -32768;
        });
        expect(result).assertTrue();
      }

      // --- [5] Verify every() detects non-decreasing 1,3,5,7 and non-increasing 9,5,3,1 against the predecessor ---
      {
        let sources: int[][] = [[1, 3, 5, 7], [9, 5, 3, 1]];
        let ascending: boolean[] = [true, false];
        for (let i: int = 0; i < sources.length; i++) {
          let arr: Int16Array = Int16Array.from(sources[i]);
          let nonDecreasing: boolean = ascending[i];
          let sorted: boolean = arr.every((element: number, index: int, array: Int16Array): boolean => {
            if (index === 0) {
              return true;
            }
            let prev: number = array.at(index - 1) as number;
            return nonDecreasing ? element >= prev : element <= prev;
          });
          expect(sorted).assertTrue();
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_EVERY_PART02_2300
     * @tc.name int16ArrayEveryPart02Test023
     * @tc.desc Merged batch (5 tests): predicate result evaluation: 200 elements below 1000, locale-string length, three-value threshold, arithmetic progression and first-element equality.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayEveryPart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify every() on a 200-element array with predicate element<1000 returns true ---
      {
        let arr: Int16Array = new Int16Array(200);
        for (let i: int = 0; i < 200; i++) {
          arr.$_set(i, i % 100);
        }
        let result: boolean = arr.every((element: number, _index: int, _array: Int16Array): boolean => {
          return element < 1000;
        });
        expect(result).assertTrue();
      }

      // --- [2] Verify every() returns true when the locale string length equals twice the array length minus one ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let result: boolean = arr.every((element: number, _index: int, array: Int16Array): boolean => {
          return array.toLocaleString().length === array.length * 2 - 1;
        });
        expect(result).assertTrue();
      }

      // --- [3] Verify every() returns true when all elements exceed three and false when a later one does not ---
      {
        let arr: Int16Array = Int16Array.of(4, 5, 6);
        let result: boolean = arr.every((element: number, _index: int, array: Int16Array): boolean => {
          return element > 3;
        });
        expect(result).assertTrue();

        let arr2: Int16Array = Int16Array.of(4, 2, 6);
        let result2: boolean = arr2.every((element: number, _index: int, array: Int16Array): boolean => {
          return element > 3;
        });
        expect(result2).assertFalse();
      }

      // --- [4] Verify every() confirms the elements form an arithmetic progression from the first element ---
      {
        let arr: Int16Array = Int16Array.of(10, 11, 12, 13);
        let step: number = 1;
        let ok: boolean = arr.every((element: number, index: int, array: Int16Array): boolean => {
          return element === (array.at(0) as number) + index * step;
        });
        expect(ok).assertTrue();
      }

      // --- [5] Verify every() confirms each element equals the captured first element ---
      {
        let arr: Int16Array = Int16Array.of(7, 7, 7);
        let first: number = arr.at(0) as number;
        expect(arr.every((element: number): boolean => element === first)).assertTrue();
      }
    });

  });
}
