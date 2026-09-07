'use static';


/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  beforeAll,
  afterEach,
  beforeEach,
  afterAll,
  describe,
  it,
  expect,
  TestType,
  Size,
  Level
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function int32ArrayForEachPart03Test(): void {
  describe('Int32ArrayForEachPart03Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART03_TEST_MINDMAP_0100
     * @tc.name int32ArrayForEachPart03TestMindmapTest001
     * @tc.desc Verify forEach() callbackfn null ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart03TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      try {
        arr.forEach(null as Object as (value: number, index: int, array: Int32Array) => void);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART03_TEST_MINDMAP_0200
     * @tc.name int32ArrayForEachPart03TestMindmapTest002
     * @tc.desc Verify forEach() callbackfn undefined ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart03TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      try {
        arr.forEach(undefined as Object as (value: number, index: int, array: Int32Array) => void);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART03_TEST_MINDMAP_0300
     * @tc.name int32ArrayForEachPart03TestMindmapTest003
     * @tc.desc Verify forEach() callbackfn number ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart03TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      try {
        arr.forEach(42 as Object as (value: number, index: int, array: Int32Array) => void);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART03_TEST_MINDMAP_0400
     * @tc.name int32ArrayForEachPart03TestMindmapTest004
     * @tc.desc Verify forEach() callbackfn string ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart03TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      try {
        arr.forEach('notAFn' as Object as (value: number, index: int, array: Int32Array) => void);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART03_TEST_MINDMAP_0500
     * @tc.name int32ArrayForEachPart03TestMindmapTest005
     * @tc.desc Verify forEach() callbackfn true ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart03TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      try {
        arr.forEach(true as Object as (value: number, index: int, array: Int32Array) => void);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART03_TEST_MINDMAP_0600
     * @tc.name int32ArrayForEachPart03TestMindmapTest006
     * @tc.desc Verify forEach() callbackfn Int32Array ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart03TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let notFn: Object = new Int32Array(0);
      try {
        arr.forEach(notFn as (value: number, index: int, array: Int32Array) => void);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART03_TEST_MINDMAP_0700
     * @tc.name int32ArrayForEachPart03TestMindmapTest007
     * @tc.desc Verify forEach() callbackfn Object ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart03TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let obj: Object = {};
      try {
        arr.forEach(obj as (value: number, index: int, array: Int32Array) => void);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART03_TEST_MINDMAP_0800
     * @tc.name int32ArrayForEachPart03TestMindmapTest008
     * @tc.desc Verify forEach() ArrayBuffer 0 callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart03TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(0);
      let arr: Int32Array = new Int32Array(buf, 0, 0);
      let invoked: boolean = false;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        invoked = true;
      });
      expect(invoked).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART03_TEST_MINDMAP_0900
     * @tc.name int32ArrayForEachPart03TestMindmapTest009
     * @tc.desc Verify forEach() subarray(0,0) callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart03TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = new Int32Array([10, 20, 30]);
      let empty: Int32Array = base.subarray(0, 0);
      let count: int = 0;
      empty.forEach((v: number, i: int, a: Int32Array): void => {
        count++;
      });
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART03_TEST_MINDMAP_1000
     * @tc.name int32ArrayForEachPart03TestMindmapTest010
     * @tc.desc Verify forEach() subarray(length,length) callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart03TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = new Int32Array([10, 20, 30]);
      let empty: Int32Array = base.subarray(base.length, base.length);
      let count: int = 0;
      empty.forEach((v: number, i: int, a: Int32Array): void => {
        count++;
      });
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART03_TEST_MINDMAP_1100
     * @tc.name int32ArrayForEachPart03TestMindmapTest011
     * @tc.desc Verify forEach() Int32Array.of() callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart03TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of();
      let count: int = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        count++;
      });
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART03_TEST_MINDMAP_1200
     * @tc.name int32ArrayForEachPart03TestMindmapTest012
     * @tc.desc Verify forEach callback receives correct element value for single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart03TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([77]);
      let seen: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        seen = v;
      });
      expect(seen).assertEqual(77);
      {
        let arr: Int32Array = new Int32Array([77]);
        let seenIdx: int = -1;
        arr.forEach((v: number, i: int, a: Int32Array): void => {
          seenIdx = i;
        });
        expect(seenIdx).assertEqual(0);
      }
      {
        let arr: Int32Array = new Int32Array([77]);
        let sameRef: boolean = false;
        arr.forEach((v: number, i: int, a: Int32Array): void => {
          sameRef = (a === arr);
        });
        expect(sameRef).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART03_TEST_MINDMAP_1300
     * @tc.name int32ArrayForEachPart03TestMindmapTest013
     * @tc.desc Verify forEach propagates exception thrown from callback with correct name and message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart03TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1]);
      try {
        arr.forEach((v: number, i: int, a: Int32Array): void => {
          throw new Error('boom');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('boom');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART03_TEST_MINDMAP_1400
     * @tc.name int32ArrayForEachPart03TestMindmapTest014
     * @tc.desc Verify forEach iterates exactly four times for 4-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart03TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 5, 5, 5]);
      let count: int = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        count++;
      });
      expect(count).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART03_TEST_MINDMAP_1500
     * @tc.name int32ArrayForEachPart03TestMindmapTest015
     * @tc.desc Verify forEach() 0 value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart03TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0]);
      let allZero: boolean = true;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        if (v !== 0) {
          allZero = false;
        }
      });
      expect(allZero).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART03_TEST_MINDMAP_1600
     * @tc.name int32ArrayForEachPart03TestMindmapTest016
     * @tc.desc Verify forEach() MAX (2147483647) value MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart03TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647, 2147483647]);
      let allMax: boolean = true;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        if (v !== 2147483647) {
          allMax = false;
        }
      });
      expect(allMax).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART03_TEST_MINDMAP_1700
     * @tc.name int32ArrayForEachPart03TestMindmapTest017
     * @tc.desc Verify forEach() MIN (-2147483648) value MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart03TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2147483648, -2147483648]);
      let allMin: boolean = true;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        if (v !== -2147483648) {
          allMin = false;
        }
      });
      expect(allMin).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART03_TEST_MINDMAP_1800
     * @tc.name int32ArrayForEachPart03TestMindmapTest018
     * @tc.desc Verify forEach() index 0,1,2...length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart03TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([9, 9, 9, 9, 9]);
      let expected: int = 0;
      let indicesOk: boolean = true;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        if (i !== expected) {
          indicesOk = false;
        }
        expected++;
      });
      expect(indicesOk).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART03_TEST_MINDMAP_1900
     * @tc.name int32ArrayForEachPart03TestMindmapTest019
     * @tc.desc Verify forEach stops at index 2 when exception thrown from callback, visits 3 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart03TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7, 7, 7, 7, 7]);
      let visited: int = 0;
      try {
        arr.forEach((v: number, i: int, a: Int32Array): void => {
          visited++;
          if (i === 2) {
            throw new Error('stop');
          }
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('stop');
      }
      expect(visited).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART03_TEST_MINDMAP_2000
     * @tc.name int32ArrayForEachPart03TestMindmapTest020
     * @tc.desc Verify forEach() propagates RangeError and TypeError names
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart03TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      try {
        arr.forEach((v: number, i: int, a: Int32Array): void => {
          throw new RangeError('oob');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      try {
        arr.forEach((v: number, i: int, a: Int32Array): void => {
          throw new TypeError('t');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART03_TEST_MINDMAP_2100
     * @tc.name int32ArrayForEachPart03TestMindmapTest021
     * @tc.desc Verify forEach stops early when exception thrown at index 1 of 5-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart03TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let lastVisited: int = -1;
      try {
        arr.forEach((v: number, i: int, a: Int32Array): void => {
          lastVisited = i;
          if (i === 1) {
            throw new Error('mid');
          }
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('mid');
      }
      expect(lastVisited).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART03_TEST_MINDMAP_2200
     * @tc.name int32ArrayForEachPart03TestMindmapTest022
     * @tc.desc Verify forEach visits all elements before exception thrown on last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart03TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let visitedCount: int = 0;
      try {
        arr.forEach((v: number, i: int, a: Int32Array): void => {
          visitedCount++;
          if (i === arr.length - 1) {
            throw new Error('last');
          }
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('last');
      }
      expect(visitedCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART03_TEST_MINDMAP_2300
     * @tc.name int32ArrayForEachPart03TestMindmapTest023
     * @tc.desc Verify forEach throws immediately on first element, control never reaches code after throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart03TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let reached: boolean = false;
      try {
        arr.forEach((v: number, i: int, a: Int32Array): void => {
          throw new Error('x');
        });
        reached = true;
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('x');
      }
      expect(reached).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART03_TEST_MINDMAP_2400
     * @tc.name int32ArrayForEachPart03TestMindmapTest024
     * @tc.desc Verify outer forEach continues after inner forEach throws caught exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart03TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let outer: Int32Array = new Int32Array([1, 2]);
      let outerVisited: int = 0;
      outer.forEach((vo: number, io: int, ao: Int32Array): void => {
        outerVisited++;
        let inner: Int32Array = new Int32Array([10, 20]);
        try {
          inner.forEach((vi: number, ii: int, ai: Int32Array): void => {
            if (ii === 0) {
              throw new Error('inner');
            }
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.message).assertEqual('inner');
        }
      });
      expect(outerVisited).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART03_TEST_MINDMAP_2500
     * @tc.name int32ArrayForEachPart03TestMindmapTest025
     * @tc.desc Verify forEach() index 0 index 1,2...length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart03TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let visitedMask: int = 0;
      try {
        arr.forEach((v: number, i: int, a: Int32Array): void => {
          visitedMask = visitedMask | (1 << i);
          if (i === 0) {
            throw new Error('zero');
          }
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('zero');
      }
      expect(visitedMask).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART03_TEST_MINDMAP_2600
     * @tc.name int32ArrayForEachPart03TestMindmapTest026
     * @tc.desc Verify forEach() returns undefined after visiting all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart03TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let count: int = 0;
      let result: void = arr.forEach((v: number, i: int, a: Int32Array): void => {
        count++;
        return undefined;
      });
      expect(count).assertEqual(4);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART03_TEST_MINDMAP_2700
     * @tc.name int32ArrayForEachPart03TestMindmapTest027
     * @tc.desc Verify forEach() $_set index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart03TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let seenAt1: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        if (i === 0) {
          a.$_set(0, 100);
        }
        if (i === 1) {
          seenAt1 = v;
        }
      });
      expect(seenAt1).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART03_TEST_MINDMAP_2800
     * @tc.name int32ArrayForEachPart03TestMindmapTest028
     * @tc.desc Verify forEach() $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart03TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let seenAt2: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        if (i === 0) {
          a.$_set(2, 999);
        }
        if (i === 2) {
          seenAt2 = v;
        }
      });
      expect(seenAt2).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART03_TEST_MINDMAP_2900
     * @tc.name int32ArrayForEachPart03TestMindmapTest029
     * @tc.desc Verify forEach() $_set i+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart03TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let seenAt1: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        if (i === 0) {
          a.$_set(1, 200);
        }
        if (i === 1) {
          seenAt1 = v;
        }
      });
      expect(seenAt1).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART03_TEST_MINDMAP_3000
     * @tc.name int32ArrayForEachPart03TestMindmapTest030
     * @tc.desc Verify forEach iterates all elements while callback mutates previous elements to -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart03TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let count: int = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        if (i > 0) {
          a.$_set(i - 1, -1);
        }
        count++;
      });
      expect(count).assertEqual(4);
      expect(arr.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART03_TEST_MINDMAP_3100
     * @tc.name int32ArrayForEachPart03TestMindmapTest031
     * @tc.desc Verify forEach() array 0 value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart03TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let zeros: boolean = true;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        if (i === 0) {
          a.$_set(1, 0);
          a.$_set(2, 0);
          a.$_set(3, 0);
        } else {
          if (v !== 0) {
            zeros = false;
          }
        }
      });
      expect(zeros).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART03_TEST_MINDMAP_3200
     * @tc.name int32ArrayForEachPart03TestMindmapTest032
     * @tc.desc Verify forEach callback reaches the last element index length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart03TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let reachedLast: boolean = false;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        if (i === a.length - 1) {
          reachedLast = true;
        }
      });
      expect(reachedLast).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART03_TEST_MINDMAP_3300
     * @tc.name int32ArrayForEachPart03TestMindmapTest033
     * @tc.desc Verify forEach length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart03TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let lenBefore: int = arr.length;
      let seen: number[] = [];
      let callCount: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        callCount++;
        seen.push(v);
      });
      expect(callCount).assertEqual(arr.length);
      for (let idx: int = 0; idx < seen.length; idx = idx + 1) {
        expect(seen[idx]).assertEqual(arr.$_get(idx));
      }
      expect(arr.length).assertEqual(lenBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART03_TEST_MINDMAP_3400
     * @tc.name int32ArrayForEachPart03TestMindmapTest034
     * @tc.desc Verify forEach() Number.NaN ToInt32 0 value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart03TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([Number.NaN]);
      let seen: number = -1;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        seen = v;
      });
      expect(seen).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART03_TEST_MINDMAP_3500
     * @tc.name int32ArrayForEachPart03TestMindmapTest035
     * @tc.desc Verify forEach() +Number.POSITIVE_INFINITY ToInt32 0 value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart03TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([Number.POSITIVE_INFINITY]);
      let seen: number = -1;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        seen = v;
      });
      expect(seen).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART03_TEST_MINDMAP_3600
     * @tc.name int32ArrayForEachPart03TestMindmapTest036
     * @tc.desc Verify forEach() -Number.POSITIVE_INFINITY ToInt32 0 value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart03TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-Number.POSITIVE_INFINITY]);
      let seen: number = -1;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        seen = v;
      });
      expect(seen).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART03_TEST_MINDMAP_3700
     * @tc.name int32ArrayForEachPart03TestMindmapTest037
     * @tc.desc Verify forEach() 3.9 ToInt32 3 value 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart03TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3.9 as number]);
      let seen: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        seen = v;
      });
      expect(seen).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART03_TEST_MINDMAP_3800
     * @tc.name int32ArrayForEachPart03TestMindmapTest038
     * @tc.desc Verify forEach() -3.9 ToInt32 -3 value -3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart03TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-3.9 as number]);
      let seen: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        seen = v;
      });
      expect(seen).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART03_TEST_MINDMAP_3900
     * @tc.name int32ArrayForEachPart03TestMindmapTest039
     * @tc.desc Verify forEach() 2147483648 -2147483648 value MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart03TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483648 as number]);
      let seen: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        seen = v;
      });
      expect(seen).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART03_TEST_MINDMAP_4000
     * @tc.name int32ArrayForEachPart03TestMindmapTest040
     * @tc.desc Verify forEach() -2147483649 2147483647 value MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart03TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2147483649 as number]);
      let seen: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        seen = v;
      });
      expect(seen).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART03_TEST_MINDMAP_4100
     * @tc.name int32ArrayForEachPart03TestMindmapTest041
     * @tc.desc Verify forEach() value/index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart03TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, 0, 1]);
      let pairs: string = '';
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        pairs = pairs + i + ':' + v + ',';
      });
      expect(pairs).assertEqual('0:-1,1:0,2:1,');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART03_TEST_MINDMAP_4200
     * @tc.name int32ArrayForEachPart03TestMindmapTest042
     * @tc.desc Verify forEach() index 2 index 0 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart03TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      try {
        arr.forEach((v: number, i: int, a: Int32Array): void => {
          a.$_set(i, v * 10);
          if (i === 2) {
            throw new Error('stop');
          }
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('stop');
      }
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(1)).assertEqual(20);
      expect(arr.$_get(2)).assertEqual(30);
      expect(arr.$_get(3)).assertEqual(4);
      expect(arr.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART03_TEST_MINDMAP_4300
     * @tc.name int32ArrayForEachPart03TestMindmapTest043
     * @tc.desc Verify forEach does not mutate array when exception thrown on first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart03TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      try {
        arr.forEach((v: number, i: int, a: Int32Array): void => {
          throw new Error('early');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('early');
      }
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(1)).assertEqual(20);
      expect(arr.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART03_TEST_MINDMAP_4400
     * @tc.name int32ArrayForEachPart03TestMindmapTest044
     * @tc.desc Verify forEach ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart03TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let a: Int32Array = new Int32Array(buf);
      let b: Int32Array = new Int32Array(buf);
      a.$_set(0, 1);
      a.$_set(1, 2);
      a.$_set(2, 3);
      let seen: number[] = [];
      b.forEach((v: number, i: int, arr: Int32Array): void => {
        if (i === 0) {
          a.$_set(2, 99);
        }
        seen.push(v);
      });
      expect(seen[0]).assertEqual(1);
      expect(seen[2]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART03_TEST_MINDMAP_4500
     * @tc.name int32ArrayForEachPart03TestMindmapTest045
     * @tc.desc Verify forEach byteOffset 0 index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart03TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let full: Int32Array = new Int32Array(buf);
      full.$_set(0, 100);
      full.$_set(1, 200);
      full.$_set(2, 300);
      full.$_set(3, 400);
      let view: Int32Array = new Int32Array(buf, 4, 2);
      let firstValue: number = 0;
      let firstIndex: int = -1;
      view.forEach((v: number, i: int, a: Int32Array): void => {
        if (i === 0) {
          firstValue = v;
          firstIndex = i;
        }
      });
      expect(firstValue).assertEqual(200);
      expect(firstIndex).assertEqual(0);
      expect(view.length).assertEqual(2);
    });


  });
}
