'use static'
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from './../Util.test';


class ArrayIteratorHelper<T> implements Iterator<T> {
  private items: T[];
  private idx: int = 0;
  constructor(items: T[]) {
    this.items = items;
  }
  public next(): IteratorResult<T> {
    if (this.idx < this.items.length) {
      let i = this.idx;
      this.idx = this.idx + 1;
      return new IteratorResult<T>(this.items[i]);
    }
    return new IteratorResult<T>();
  }
}

class BadIterator1 implements Iterator<number> {
  private _count: number = 0;
  public next(): IteratorResult<number> {
    this._count++;
    if (this._count > 1) {
      throw new Error("iterator error");
    }
    return new IteratorResult<number>(1);
  }
}

function myFn(x: number, collected: number[]): void {
  collected.push(x);
}

interface IdRecord {
  id: number;
}

export default function IteratorForEachTest(): void {
  describe('IteratorForEachTest',(): void => {
    beforeAll((): void => {
    });
    beforeEach(async():Promise<void> =>{
      await Utils.msSleep(30);
    });
    afterEach(():void =>{
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_FOR_EACH_0100
     * @tc.name testIteratorForEach001
     * @tc.desc Verify iteratorForEach with valid iterator and callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorForEach001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let collected: number[] = [];
      iteratorForEach(new ArrayIteratorHelper<number>([1, 2, 3]), (x: number): void => {
        collected.push(x);
      });
      expect(collected.length).assertEqual(3);
      expect(collected[0]).assertEqual(1);
      expect(collected[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_FOR_EACH_0200
     * @tc.name testIteratorForEach002
     * @tc.desc Verify iteratorForEach with string type iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorForEach002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let collected: string[] = [];
      iteratorForEach(new ArrayIteratorHelper<string>(["a", "b", "c"]), (x: string): void => {
        collected.push(x);
      });
      expect(collected.length).assertEqual(3);
      expect(collected[0]).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_FOR_EACH_0400
     * @tc.name testIteratorForEach004
     * @tc.desc Verify iteratorForEach with object type iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorForEach004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let item1: Record<string, number> = { "a": 1 } as Record<string, number>;
      let item2: Record<string, number> = { "a": 2 } as Record<string, number>;
      let items: Record<string, number>[] = [item1, item2];
      let collected: Record<string, number>[] = [];
      iteratorForEach(new ArrayIteratorHelper<Record<string, number>>(items), (x: Record<string, number>): void => {
        collected.push(x);
      });
      expect(collected.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_FOR_EACH_0500
     * @tc.name testIteratorForEach005
     * @tc.desc Verify iteratorForEach with array type iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorForEach005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let collected: number[][] = [];
      iteratorForEach(new ArrayIteratorHelper<number[]>([[1, 2], [3, 4]]), (x: number[]): void => {
        collected.push(x);
      });
      expect(collected.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_FOR_EACH_0600
     * @tc.name testIteratorForEach006
     * @tc.desc Verify iteratorForEach with empty iterator does not call callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorForEach006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let called: boolean = false;
      iteratorForEach(new ArrayIteratorHelper<number>([]), (x: number): void => {
        called = true;
      });
      expect(called).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_FOR_EACH_0700
     * @tc.name testIteratorForEach007
     * @tc.desc Verify iteratorForEach with single element iterator calls callback once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorForEach007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let callCount: number = 0;
      iteratorForEach(new ArrayIteratorHelper<number>([42]), (x: number): void => {
        callCount++;
      });
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_FOR_EACH_0800
     * @tc.name testIteratorForEach008
     * @tc.desc Verify iteratorForEach with multiple elements iterates all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorForEach008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let collected: number[] = [];
      iteratorForEach(new ArrayIteratorHelper<number>([1, 2, 3, 4, 5]), (x: number): void => {
        collected.push(x);
      });
      expect(collected.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_FOR_EACH_0900
     * @tc.name testIteratorForEach009
     * @tc.desc Verify iteratorForEach accepts Iterator<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorForEach009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iter: Iterator<number> = new ArrayIteratorHelper<number>([10]);
      let value: number = 0;
      iteratorForEach(iter, (x: number): void => {
        value = x;
      });
      expect(value).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_FOR_EACH_1000
     * @tc.name testIteratorForEach010
     * @tc.desc Verify iteratorForEach accepts Iterator<string>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorForEach010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iter: Iterator<string> = new ArrayIteratorHelper<string>(["text"]);
      let value: string = "";
      iteratorForEach(iter, (x: string): void => {
        value = x;
      });
      expect(value).assertEqual("text");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_FOR_EACH_1100
     * @tc.name testIteratorForEach011
     * @tc.desc Verify iteratorForEach with regular function callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorForEach011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let collected: number[] = [];
      iteratorForEach(new ArrayIteratorHelper<number>([1, 2]), (x: number): void => {
        myFn(x, collected);
      });
      expect(collected.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_FOR_EACH_1200
     * @tc.name testIteratorForEach012
     * @tc.desc Verify callback modifies external variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorForEach012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: number = 0;
      iteratorForEach(new ArrayIteratorHelper<number>([1, 2, 3]), (x: number): void => {
        count++;
      });
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_FOR_EACH_1300
     * @tc.name testIteratorForEach013
     * @tc.desc Verify iteratorForEach accepts a function callback for number values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorForEach013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum: number = 0;
      iteratorForEach(new ArrayIteratorHelper<number>([2, 3]), (x: number): void => {
        sum += x;
      });
      expect(sum).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_FOR_EACH_1400
     * @tc.name testIteratorForEach014
     * @tc.desc Verify iteratorForEach accepts a function callback for string values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorForEach014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "";
      iteratorForEach(new ArrayIteratorHelper<string>(["a", "b"]), (x: string): void => {
        text += x;
      });
      expect(text).assertEqual("ab");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_FOR_EACH_1500
     * @tc.name testIteratorForEach015
     * @tc.desc Verify iteratorForEach accepts a function callback for object values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorForEach015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let items: IdRecord[] = [{ id: 1 } as IdRecord, { id: 2 } as IdRecord];
      let ids: number[] = [];
      iteratorForEach(new ArrayIteratorHelper<IdRecord>(items), (x: IdRecord): void => {
        ids.push(x.id);
      });
      expect(ids.length).assertEqual(2);
      expect(ids[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_FOR_EACH_1600
     * @tc.name testIteratorForEach016
     * @tc.desc Verify callback throwing Error propagates correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorForEach016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let caught: boolean = false;
      try {
        iteratorForEach(new ArrayIteratorHelper<number>([1, 2, 3]), (x: number): void => {
          throw new Error("callback error");
        });
      } catch (e) {
        caught = e.name === 'Error' && e.message === 'callback error'
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_FOR_EACH_1800
     * @tc.name testIteratorForEach018
     * @tc.desc Verify all elements are correctly visited by callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorForEach018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let visited: number[] = [];
      iteratorForEach(new ArrayIteratorHelper<number>([10, 20, 30]), (x: number): void => {
        visited.push(x);
      });
      expect(visited.length).assertEqual(3);
      expect(visited[0]).assertEqual(10);
      expect(visited[1]).assertEqual(20);
      expect(visited[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_FOR_EACH_1900
     * @tc.name testIteratorForEach019
     * @tc.desc Verify callback invocation order matches iterator next() order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorForEach019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let order: string[] = [];
      iteratorForEach(new ArrayIteratorHelper<string>(["first", "second", "third"]), (x: string): void => {
        order.push(x);
      });
      expect(order[0]).assertEqual("first");
      expect(order[1]).assertEqual("second");
      expect(order[2]).assertEqual("third");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_FOR_EACH_2000
     * @tc.name testIteratorForEach020
     * @tc.desc Verify callback receives correct element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorForEach020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let expected: number[] = [1, 2, 3];
      let actual: number[] = [];
      iteratorForEach(new ArrayIteratorHelper<number>(expected), (x: number): void => {
        actual.push(x);
      });
      expect(actual[0]).assertEqual(expected[0]);
      expect(actual[1]).assertEqual(expected[1]);
      expect(actual[2]).assertEqual(expected[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_FOR_EACH_2200
     * @tc.name testIteratorForEach022
     * @tc.desc Verify generic V type is correctly passed to callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorForEach022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const stringIter: Iterator<string> = new ArrayIteratorHelper<string>(["hello", "world"]);
      let collected: string[] = [];
      iteratorForEach(stringIter, (x: string): void => {
        collected.push(x);
      });
      expect(collected.length).assertEqual(2);
      expect(collected[0]).assertEqual("hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_FOR_EACH_2300
     * @tc.name testIteratorForEach023
     * @tc.desc Verify iteratorForEach with 10000 elements completes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorForEach023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let largeArr: number[] = [];
      for (let i: number = 0; i < 10000; i++) {
        largeArr.push(i);
      }
      let sum: number = 0;
      iteratorForEach(new ArrayIteratorHelper<number>(largeArr), (x: number): void => {
        sum += x;
      });
      expect(sum).assertEqual(49995000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_FOR_EACH_2500
     * @tc.name testIteratorForEach025
     * @tc.desc Verify iteratorForEach handles iterator next() throwing Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorForEach025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let badIter: Iterator<number> = new BadIterator1();
      try {
        iteratorForEach(badIter, (x: number): void => {});
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
        expect(e.name).assertEqual("iterator error");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_FOR_EACH_2600
     * @tc.name testIteratorForEach026
     * @tc.desc Verify callback throwing Error stops iteration and propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorForEach026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let visited: number = 0;
      let caught: boolean = false;
      try {
        iteratorForEach(new ArrayIteratorHelper<number>([1, 2, 3, 4, 5]), (x: number): void => {
          visited++;
          if (x === 3) throw new Error("stop");
        });
      } catch (e) {
        caught = e.name === "Error" && e.message ==="stop"
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_FOR_EACH_2700
     * @tc.name testIteratorForEach027
     * @tc.desc Verify callback throwing inside iteratorForEach propagates and can be caught by try-catch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorForEach027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let caught: boolean = false;
      try {
        iteratorForEach(new ArrayIteratorHelper<number>([1, 2]), (x: number): void => {
          throw new Error("err");
        });
      } catch (e) {
        caught = e.name === 'Error' && e.message === 'err';
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_FOR_EACH_2800
     * @tc.name testIteratorForEach028
     * @tc.desc Verify V=union type: callback receives string|number type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorForEach028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const mixedIter: Iterator<string | number> = new ArrayIteratorHelper<string | number>(["a", 1, "b", 2]);
      let collected: (string | number)[] = [];
      iteratorForEach(mixedIter, (x: string | number): void => {
        collected.push(x);
      });
      expect(collected.length).assertEqual(4);
      expect(collected[0]).assertEqual("a");
      expect(collected[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ITERATOR_FOR_EACH_2900
     * @tc.name testIteratorForEach029
     * @tc.desc Verify iteratorForEach iterates a single-element iterator with Number.MAX_SAFE_INTEGER value (boundary)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIteratorForEach029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let callCount: number = 0;
      let captured: number = 0;
      iteratorForEach(
        new ArrayIteratorHelper<number>([Number.MAX_SAFE_INTEGER]),
        (x: number): void => {
          callCount++;
          captured = x;
        }
      );
      expect(callCount).assertEqual(1);
      expect(captured).assertEqual(Number.MAX_SAFE_INTEGER);
    });

  });
}
