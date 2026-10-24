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
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function int8ArrayOverviewPart04Test(): void {
  describe('Int8ArrayOverviewPart04Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OVERVIEW_PART04_TEST_0100
     * @tc.name int8ArrayOverviewPart04Test001
     * @tc.desc Verify find returns the first matching element, undefined when nothing matches, and passes value, index and array to the callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOverviewPart04Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int8Array = new Int8Array([1, 2, 3]);
      const found: number | undefined = arr.find((value: number): boolean => {
        return value > 1;
      });
      expect(found).assertEqual(2);
      const missing: number | undefined = arr.find((value: number): boolean => {
        return value > 100;
      });
      expect(missing).assertUndefined();
      let seenIndex: int = -1;
      let seenLength: int = -1;
      arr.find((value: number, index: int, array: Int8Array): boolean => {
        seenIndex = index;
        seenLength = array.length;
        return value === 3;
      });
      expect(seenIndex).assertEqual(2);
      expect(seenLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OVERVIEW_PART04_TEST_0200
     * @tc.name int8ArrayOverviewPart04Test002
     * @tc.desc Verify findIndex returns the index of the first match and negative one when the predicate never matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOverviewPart04Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int8Array = new Int8Array([1, 2, 3]);
      const hit: number = arr.findIndex((value: number): boolean => {
        return value > 1;
      });
      expect(hit).assertEqual(1);
      const miss: number = arr.findIndex((value: number): boolean => {
        return value > 100;
      });
      expect(miss).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OVERVIEW_PART04_TEST_0300
     * @tc.name int8ArrayOverviewPart04Test003
     * @tc.desc Verify findLast and findLastIndex scan backwards and report the last matching element or its index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOverviewPart04Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int8Array = new Int8Array([-3, 1, -1, 4]);
      const last: number | undefined = arr.findLast((value: number): boolean => {
        return value < 0;
      });
      expect(last).assertEqual(-1);
      const lastIndex: number = arr.findLastIndex((value: number): boolean => {
        return value < 0;
      });
      expect(lastIndex).assertEqual(2);
      const missingIndex: number = arr.findLastIndex((value: number): boolean => {
        return value > 100;
      });
      expect(missingIndex).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OVERVIEW_PART04_TEST_0400
     * @tc.name int8ArrayOverviewPart04Test004
     * @tc.desc Verify forEach visits every element exactly once in ascending index order and returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOverviewPart04Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int8Array = new Int8Array([1, 2, 3]);
      let calls: int = 0;
      let sum: int = 0;
      arr.forEach((value: number): void => {
        calls += 1;
        sum += value;
      });
      expect(calls).assertEqual(3);
      expect(sum).assertEqual(6);
      expect(arr.length).assertEqual(3);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OVERVIEW_PART04_TEST_0500
     * @tc.name int8ArrayOverviewPart04Test005
     * @tc.desc Verify every returns true only when the predicate holds for all elements and stops calling the callback at the first failure
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOverviewPart04Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int8Array = new Int8Array([1, 2, 3]);
      const allPositive: boolean = arr.every((value: number): boolean => {
        return value > 0;
      });
      expect(allPositive).assertTrue();
      let calls: int = 0;
      const allSmall: boolean = arr.every((value: number): boolean => {
        calls += 1;
        return value < 2;
      });
      expect(allSmall).assertFalse();
      expect(calls).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OVERVIEW_PART04_TEST_0600
     * @tc.name int8ArrayOverviewPart04Test006
     * @tc.desc Verify filter keeps matching elements in order in a new array, yields an empty array when nothing matches, and leaves the source alone
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOverviewPart04Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      const kept: Int8Array = arr.filter((value: number): boolean => {
        return value % 2 === 0;
      });
      expect(kept.length).assertEqual(2);
      expect(kept.$_get(0)).assertEqual(2);
      expect(kept.$_get(1)).assertEqual(4);
      const none: Int8Array = arr.filter((value: number): boolean => {
        return value > 100;
      });
      expect(none.length).assertEqual(0);
      const distinctBuffer: boolean = kept.buffer !== arr.buffer;
      expect(distinctBuffer).assertTrue();
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OVERVIEW_PART04_TEST_0700
     * @tc.name int8ArrayOverviewPart04Test007
     * @tc.desc Verify the callback-taking methods skip the callback on an empty array and return their empty-array results, with every vacuously true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOverviewPart04Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty: Int8Array = new Int8Array(0);
      let calls: int = 0;
      const found: number | undefined = empty.find((value: number): boolean => {
        calls += 1;
        return true;
      });
      expect(found).assertUndefined();
      const foundIndex: number = empty.findIndex((value: number): boolean => {
        calls += 1;
        return true;
      });
      expect(foundIndex).assertEqual(-1);
      const foundLastIndex: number = empty.findLastIndex((value: number): boolean => {
        calls += 1;
        return true;
      });
      expect(foundLastIndex).assertEqual(-1);
      const filtered: Int8Array = empty.filter((value: number): boolean => {
        calls += 1;
        return true;
      });
      expect(filtered.length).assertEqual(0);
      const everyResult: boolean = empty.every((value: number): boolean => {
        calls += 1;
        return false;
      });
      expect(everyResult).assertTrue();
      expect(calls).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OVERVIEW_PART04_TEST_0800
     * @tc.name int8ArrayOverviewPart04Test008
     * @tc.desc Verify an error thrown inside a callback escapes every callback-taking method instead of being swallowed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOverviewPart04Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int8Array = new Int8Array([10, 20, 30]);
      let findThrew: boolean = false;
      try {
        arr.find((value: number): boolean => {
          throw new Error('boom');
        });
      } catch (e) {
        findThrew = true;
        expect(e.name).assertEqual('Error');
      }
      expect(findThrew).assertTrue();
      let findIndexThrew: boolean = false;
      try {
        arr.findIndex((value: number): boolean => {
          throw new Error('boom');
        });
      } catch (e) {
        findIndexThrew = true;
        expect(e.name).assertEqual('Error');
      }
      expect(findIndexThrew).assertTrue();
      let forEachThrew: boolean = false;
      try {
        arr.forEach((value: number): void => {
          throw new Error('boom');
        });
      } catch (e) {
        forEachThrew = true;
        expect(e.name).assertEqual('Error');
      }
      expect(forEachThrew).assertTrue();
      let filterThrew: boolean = false;
      try {
        arr.filter((value: number): boolean => {
          throw new Error('boom');
        });
      } catch (e) {
        filterThrew = true;
        expect(e.name).assertEqual('Error');
      }
      expect(filterThrew).assertTrue();
      let everyThrew: boolean = false;
      try {
        arr.every((value: number): boolean => {
          throw new Error('boom');
        });
      } catch (e) {
        everyThrew = true;
        expect(e.name).assertEqual('Error');
      }
      expect(everyThrew).assertTrue();
    });
  });
}
