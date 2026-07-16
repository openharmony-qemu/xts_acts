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
import Utils from '../Util.test';

interface Checker {
  threshold: number;
  check(v: number): boolean;
}

const checker: Checker = {
  threshold: 5,
  check(v: number): boolean {
    return v > this.threshold;
  }
};

interface Ctx {
  min: number;
  max: number;
}

const ctx: Ctx = { min: 1, max: 10 };

interface NodeWithNext {
  val: int;
  next: NodeWithNext | null;
}

export default function ArrayEveryTest2(): void {
  describe('ArrayEveryTest2', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_0100
     * @tc.name testArrayEvery001
     * @tc.desc Verify predicate modifies current element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const result = arr.every((v, i, a): boolean => {
        a[i] = v * 2;
        return true;
      });
      expect(result).assertTrue();
      expect(arr[0]).assertEqual(2);
      expect(arr[1]).assertEqual(4);
      expect(arr[2]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_0200
     * @tc.name testArrayEvery002
     * @tc.desc Verify predicate modifies subsequent unchecked element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4);
      arr.every((v, i, a): boolean => {
        if (i === 0) {
          a[2] = 99;
        }
        return true;
      });
      expect(arr[2]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_0300
     * @tc.name testArrayEvery003
     * @tc.desc Verify push during every iteration adds to traversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const result = arr.every((v, i, a): boolean => {
        if (i < 2) {
          a.push(v + 10);
        }
        return true;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_0400
     * @tc.name testArrayEvery004
     * @tc.desc Verify pop reduces traversal count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      let count = 0;
      arr.every((v, i, a): boolean => {
        count++;
        if (i === 0) {
          a.pop();
        }
        return true;
      });
      expect(count).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_0500
     * @tc.name testArrayEvery005
     * @tc.desc Verify shift during iteration causes index offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const seen: Array<number> = [];
      arr.every((v, i, a): boolean => {
        seen.push(v);
        if (i === 0) {
          a.shift();
        }
        return true;
      });
      expect(seen[0]).assertEqual(1);
      expect(seen[1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_0600
     * @tc.name testArrayEvery006
     * @tc.desc Verify unshift re-visits current element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(2, 3);
      const seen: Array<number> = [];
      arr.every((v, i, a): boolean => {
        seen.push(v);
        if (i === 0) {
          a.unshift(1);
        }
        return true;
      });
      expect(seen.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_0700
     * @tc.name testArrayEvery007
     * @tc.desc Verify sort during every completes traversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(3, 1, 2);
      const seen: Array<number> = [];
      arr.every((v, i, a): boolean => {
        seen.push(v);
        if (i === 0) {
          a.sort((x, y) => {
        return x - y;
      });
        }
        return true;
      });
      expect(seen.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_0800
     * @tc.name testArrayEvery008
     * @tc.desc Verify splice during every returns true for remaining
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const result = arr.every((v, i, a): boolean => {
        if (i === 0) {
          a.splice(1, 1);
        }
        return v > 0;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_0900
     * @tc.name testArrayEvery009
     * @tc.desc Verify setting length to 0 stops immediately
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      let count = 0;
      const result = arr.every((v, i, a): boolean => {
        count++;
        a.length = 0;
        return true;
      });
      expect(result).assertTrue();
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_1000
     * @tc.name testArrayEvery010
     * @tc.desc Verify splice clearing subsequent ends immediately
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const visited: Array<number> = [];
      arr.every((v, i, a): boolean => {
        visited.push(v);
        a.splice(i + 1);
        return true;
      });
      expect(visited.length).assertEqual(1);
      expect(visited[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_1100
     * @tc.name testArrayEvery011
     * @tc.desc Verify non-zero number returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const result = arr.every((v): boolean => {
        return true;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_1200
     * @tc.name testArrayEvery012
     * @tc.desc Verify zero returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const result = arr.every((v): boolean => {
        return false;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_1300
     * @tc.name testArrayEvery013
     * @tc.desc Verify non-empty string returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const result = arr.every((v): boolean => {
        return true;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_1400
     * @tc.name testArrayEvery014
     * @tc.desc Verify empty string returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const result = arr.every((v): boolean => {
        return false;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_1500
     * @tc.name testArrayEvery015
     * @tc.desc Verify object reference returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const result = arr.every((v): boolean => {
        return true;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_1600
     * @tc.name testArrayEvery016
     * @tc.desc Verify null returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const result = arr.every((v): boolean => {
        return false;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_1700
     * @tc.name testArrayEvery017
     * @tc.desc Verify external modification after short-circuit is preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4);
      arr.every((v) => {
        if (v === 2) {
          arr.push(5);
        }
        return v < 3;
      });
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_1800
     * @tc.name testArrayEvery018
     * @tc.desc Verify pop to length 1 during every stops
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      let count = 0;
      arr.every((v, i, a): boolean => {
        count++;
        while (a.length > 1) {
          a.pop();
        }
        return true;
      });
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_1900
     * @tc.name testArrayEvery019
     * @tc.desc Verify pushed elements are also checked by every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1);
      const seen: Array<number> = [];
      arr.every((v, i, a): boolean => {
        seen.push(v);
        if (i < 3) {
          a.push(v + 1);
        }
        return true;
      });
      expect(seen.length).assertEqual(1);
      expect(seen[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_2000
     * @tc.name testArrayEvery020
     * @tc.desc Verify setting elements to undefined still traversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      const seen: Array<number> = [];
      arr.every((v, i, a): boolean => {
        seen.push(v);
        if (i === 0) {
          a[3] = 0;
          a[4] = 0;
        }
        return true;
      });
      expect(seen.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_2100
     * @tc.name testArrayEvery021
     * @tc.desc Verify replace all subsequent elements causes false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const result = arr.every((v, i, a): boolean => {
        if (i === 0) {
          a[1] = -1;
          a[2] = -1;
        }
        return v > 0;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_2200
     * @tc.name testArrayEvery022
     * @tc.desc Verify reverse during every traverses all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4);
      const seen: Array<number> = [];
      arr.every((v, i, a): boolean => {
        seen.push(v);
        if (i === 0) {
          a.reverse();
        }
        return true;
      });
      expect(seen.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_2300
     * @tc.name testArrayEvery023
     * @tc.desc Verify fill during every causes false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const result = arr.every((v, i, a): boolean => {
        if (i === 0) {
          a.fill(0, 1);
        }
        return v > 0;
      });
      expect(result).assertFalse();
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_2400
     * @tc.name testArrayEvery024
     * @tc.desc Verify single element mutation with old value still passes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(5, (): int => 0);
      const result = arr.every((v, i, a): boolean => {
        a[0] = 0;
        return v > 0;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_2500
     * @tc.name testArrayEvery025
     * @tc.desc Verify two consecutive every calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(2, 4, 6, 8);
      const allEven = arr.every((v) => {
        return v % 2 === 0;
      });
      const allPositive = arr.every((v) => {
        return v > 0;
      });
      expect(allEven).assertTrue();
      expect(allPositive).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_2600
     * @tc.name testArrayEvery026
     * @tc.desc Verify every result as input to another every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(2, 4, 6);
      const r1 = arr.every((v) => {
        return v > 0;
      });
      const r2 = new Array<boolean>(r1).every((b) => b === true);
      expect(r2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_2700
     * @tc.name testArrayEvery027
     * @tc.desc Verify chain every with map and filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      const checked = arr.every((v) => {
        return v > 0;
      });
      const doubled = arr.map((v) => {
        return v * 2;
      });
      const filtered = arr.filter((v) => {
        return v > 2;
      });
      expect(checked).assertTrue();
      expect(doubled[0]).assertEqual(2);
      expect(filtered[0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_2800
     * @tc.name testArrayEvery028
     * @tc.desc Verify logical chain of every conditions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      const result = arr.every((v) => {
        return v > 5;
      }) && arr.every((v) => v < 40) && arr.every((v) => v % 10 === 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_2900
     * @tc.name testArrayEvery029
     * @tc.desc Verify exception in predicate stops iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      let count = 0;
      try {
        arr.every((v): boolean => {
          count++;
          if (v === 2) {
            throw new Error('stop');
          }
          return true;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_3000
     * @tc.name testArrayEvery030
     * @tc.desc Verify mutation before exception persists
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      try {
        arr.every((v, i, a): boolean => {
          if (i === 0) {
            a[1] = 999;
          }
          throw new Error('stop');
          expect().assertFail();
        });
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(arr[1]).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_3100
     * @tc.name testArrayEvery031
     * @tc.desc Verify type guard predicate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string | number>(1, 'hello', 2);
      const allNumbers = arr.every((v): boolean => typeof v === 'number');
      expect(allNumbers).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_3200
     * @tc.name testArrayEvery032
     * @tc.desc Verify manual error handling predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, -2, 3);
      const r = arr.every((v) => {
        if (v < 0) {
          return false;
        }
        return true;
      });
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_3300
     * @tc.name testArrayEvery033
     * @tc.desc Verify try-catch inside predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('1', 'abc', '3');
      const allNumeric = arr.every((v) => {
        try {
          parseInt(v);
          return true;
        } catch (e) {
          return false;
        }
      });
      expect(allNumeric).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_3400
     * @tc.name testArrayEvery034
     * @tc.desc Verify exception does not affect array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      try {
        arr.every((v) => {
          if (v === 2) {
            throw new Error('err');
          }
          return true;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_3500
     * @tc.name testArrayEvery035
     * @tc.desc Verify every and some duality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const notAllNegative = !arr.every((v) => v < 0);
      const someNotNegative = arr.some((v) => !(v < 0));
      expect(notAllNegative).assertEqual(someNotNegative);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_3600
     * @tc.name testArrayEvery036
     * @tc.desc Verify every and includes relation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      const allAbove0 = arr.every((v) => {
        return v > 0;
      });
      const hasNonPositive = arr.some((v) => v <= 0);
      expect(allAbove0).assertEqual(!hasNonPositive);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_3700
     * @tc.name testArrayEvery037
     * @tc.desc Verify double negation law
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      expect(arr.every((v) => {
        return v > 0;
      }) === !arr.some((v) => v <= 0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_3800
     * @tc.name testArrayEvery038
     * @tc.desc Verify every and reduce are equivalent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(2, 4, 6, 8);
      const everyEven = arr.every((v) => {
        return v % 2 === 0;
      });
      const reduceEven = arr.reduce((acc, v) => acc && v % 2 === 0, true);
      expect(everyEven).assertEqual(reduceEven);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_3900
     * @tc.name testArrayEvery039
     * @tc.desc Verify nested every on 2D array all positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Array<int>(1, 2, 3);
      const a2 = new Array<int>(4, 5, 6);
      const a3 = new Array<int>(7, 8, 9);
      const arr = new Array<Array<int>>(a1, a2, a3);
      const allPositive = arr.every((row) => row.every((v) => {
        return v > 0;
      }));
      expect(allPositive).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_4000
     * @tc.name testArrayEvery040
     * @tc.desc Verify nested every with partial failure
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Array<int>>(new Array<int>(1, 2), new Array<int>(-1, 4), new Array<int>(5, 6));
      const allRowsPositive = arr.every((row) => row.every((v) => {
        return v > 0;
      }));
      expect(allRowsPositive).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_4100
     * @tc.name testArrayEvery041
     * @tc.desc Verify nested every with outer index interaction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Array<int>>(new Array<int>(1, 2), new Array<int>(3, 4));
      const result = arr.every((row, i) => row.every((v, j) => v === i * 2 + j + 1));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_4200
     * @tc.name testArrayEvery042
     * @tc.desc Verify deep nested every on 3D array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Array<Array<int>>>(new Array<Array<int>>(new Array<int>(1)), new Array<Array<int>>(new Array<int>(2)));
      const r = arr.every((a) => a.every((b) => b.every((c) => c > 0)));
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_4300
     * @tc.name testArrayEvery043
     * @tc.desc Verify thisArg with object context
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(6, 7, 8, 9);
      const result = arr.every((v): boolean => checker.check(v));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_4400
     * @tc.name testArrayEvery044
     * @tc.desc Verify thisArg with custom range object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 5, 7);
      const result = arr.every((v): boolean => v >= ctx.min && v <= ctx.max);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_4500
     * @tc.name testArrayEvery045
     * @tc.desc Verify no thisArg means undefined this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const result = arr.every((v): boolean => {
        return true;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_4600
     * @tc.name testArrayEvery046
     * @tc.desc Verify thisArg with primitive value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const result = arr.every((v): boolean => v > 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_4700
     * @tc.name testArrayEvery047
     * @tc.desc Verify Math.floor in predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<double>(1.5, 2.7, 3.14);
      const result = arr.every((v) => Math.floor(v) > 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_4800
     * @tc.name testArrayEvery048
     * @tc.desc Verify regex test in predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('abc', 'def', 'ghi');
      const regex = new RegExp('^[a-z]{3}$');
      const result = arr.every((v): boolean => regex.test(v));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_4900
     * @tc.name testArrayEvery049
     * @tc.desc Verify string method startsWith in predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('hello', 'world');
      const result = arr.every((v) => v.startsWith('h') || v.startsWith('w'));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_5000
     * @tc.name testArrayEvery050
     * @tc.desc Verify bitwise power of 2 check in predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(2, 4, 8, 16);
      const result = arr.every((v) => (v & (v - 1)) === 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_5100
     * @tc.name testArrayEvery051
     * @tc.desc Verify sparse array every traversal includes holes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(3, (): int => 0);
      arr[0] = 1;
      arr[2] = 3;
      const visited: Array<number> = [];
      arr.every((v, i) => {
        visited.push(i);
        return true;
      });
      expect(visited.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_5200
     * @tc.name testArrayEvery052
     * @tc.desc Verify sparse fill then every fails first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(5, (): int => 0);
      arr[0] = 0;
      arr.fill(1, 1);
      const result = arr.every((v) => {
        return v > 0;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_5300
     * @tc.name testArrayEvery053
     * @tc.desc Verify delete then every yields undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int | undefined>(1, 2, 3);
      arr[1] = undefined;
      const result = arr.every((v) => v !== undefined);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_5400
     * @tc.name testArrayEvery054
     * @tc.desc Verify large sparse array every with negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1000, 0);
      arr[0] = 1;
      arr[999] = -1;
      const result = arr.every((v) => {
        return v > 0;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_5500
     * @tc.name testArrayEvery055
     * @tc.desc Verify push during every adds elements to traversal collection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const seen: Array<int> = [];
      const result = arr.every((v, i, a): boolean => {
        if (i < 2) {
          a.push(v + 10);
        }
        seen.push(v);
        return true;
      });
      expect(result).assertTrue();
      expect(seen.length >= 3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_5600
     * @tc.name testArrayEvery056
     * @tc.desc Verify byte array every with numeric comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<byte>(1, 2, 3);
      const result = arr.every((x: byte): boolean => x > 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_5700
     * @tc.name testArrayEvery057
     * @tc.desc Verify double array every with comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<double>(1.0, 2.0, 3.0);
      const result = arr.every((x: double): boolean => x > 0.0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_5800
     * @tc.name testArrayEvery058
     * @tc.desc Verify boolean array every with identity check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true, true, true);
      const result = arr.every((x: boolean): boolean => x === true);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_5900
     * @tc.name testArrayEvery059
     * @tc.desc Verify string array every with length check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('test', 'abc', 'xyz');
      const result = arr.every((x: string): boolean => x.length > 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_6000
     * @tc.name testArrayEvery060
     * @tc.desc Verify short array every with numeric comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<short>(10, 20, 30);
      const result = arr.every((x: short): boolean => x > 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_6100
     * @tc.name testArrayEvery061
     * @tc.desc Verify long array every with boundary comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<long>(100, 9223372036854775807);
      const result = arr.every((x: long): boolean => x > 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_6200
     * @tc.name testArrayEvery062
     * @tc.desc Verify float array every with comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<float>(1.5f, 2.7f, 3.14f);
      const result = arr.every((x: float): boolean => x > 0.0f);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_6300
     * @tc.name testArrayEvery063
     * @tc.desc Verify char array every with equality check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<char>(c'a', c'b', c'c');
      const result = arr.every((x: char): boolean => x >= c'a');
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_6400
     * @tc.name testArrayEvery064
     * @tc.desc Verify bigint array every with comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<bigint>(10n, 20n, 30n);
      const result = arr.every((x: bigint): boolean => x > 0n);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_6500
     * @tc.name testArrayEvery065
     * @tc.desc Verify Date array every with year comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Date(2026, 0, 1);
      const arr = new Array<Date>(d, d);
      const result = arr.every((x: Date): boolean => x.getFullYear() === 2026);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_6600
     * @tc.name testArrayEvery066
     * @tc.desc Verify Map element array every with key check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>(new Array<[string, int]>(['k', 1]));
      const arr = new Array<Map<string, int>>(m, m);
      const result = arr.every((x: Map<string, int>): boolean => x.get('k') === 1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_6700
     * @tc.name testArrayEvery067
     * @tc.desc Verify Set element array every with membership check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<int>(new Array<int>(1, 2, 3));
      const arr = new Array<Set<int>>(s, s);
      const result = arr.every((x: Set<int>): boolean => x.has(2));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_6800
     * @tc.name testArrayEvery068
     * @tc.desc Verify nullable int|null array every with null check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<int | null> = new Array<int | null>(1, 2, 3);
      const result = arr.every((x: int | null): boolean => x !== null);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_6900
     * @tc.name testArrayEvery069
     * @tc.desc Verify Unicode Chinese string array every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('\u4e2d\u6587', '\u6d4b\u8bd5', '\u7f16\u7801');
      const result = arr.every((x: string): boolean => x.length > 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_7000
     * @tc.name testArrayEvery070
     * @tc.desc Verify empty and whitespace string array every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('', ' ', '\t');
      const result = arr.every((x: string): boolean => x.length <= 1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_7100
     * @tc.name testArrayEvery071
     * @tc.desc Verify special character string array every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('!@#$', '<script>', '0x123');
      const result = arr.every((x: string): boolean => x.length > 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_7200
     * @tc.name testArrayEvery072
     * @tc.desc Verify every works on array containing null elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<int | null> = new Array<int | null>(null, 2, null, 4);
      const result = arr.every((v: int | null): boolean => v === null || v % 2 === 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_7300
     * @tc.name testArrayEvery073
     * @tc.desc Verify every works on array containing undefined elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<int | undefined> = new Array<int | undefined>(undefined, 2, undefined);
      const result = arr.every((v: int | undefined): boolean => v === undefined || v > 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_7400
     * @tc.name testArrayEvery074
     * @tc.desc Verify every checks nested null property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: NodeWithNext = { val: 1, next: null };
      const obj2: NodeWithNext = { val: 2, next: { val: 3, next: null } };
      const arr = new Array<NodeWithNext>(obj1, obj2);
      const allHaveNextNull = arr.every((v: NodeWithNext): boolean => v.next === null);
      expect(allHaveNextNull).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_7500
     * @tc.name testArrayEvery075
     * @tc.desc Verify every handles nullable nested objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<NodeWithNext | null> = new Array<NodeWithNext | null>(null, { val: 2, next: null });
      const result = arr.every((v: NodeWithNext | null): boolean => v === null || v.val > 0);
      expect(result).assertTrue();
    });

  });
}
