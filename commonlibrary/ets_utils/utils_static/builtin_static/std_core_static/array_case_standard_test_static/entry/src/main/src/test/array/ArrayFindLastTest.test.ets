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
} from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../Util.test';

class FindLastItem006 {
  value: int = 0;
}

export default function ArrayFindLastTest(): void {
  describe('ArrayFindLastTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_0100
     * @tc.name testArrayFindLast001
     * @tc.desc Verify findLast accepts a predicate function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFindLast001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 40, 50);
      const result = arr.findLast((v: number): boolean => v < 40);
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_0200
     * @tc.name testArrayFindLast002
     * @tc.desc Verify findLast searches from the tail of the array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFindLast002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 20, 10);
      const result = arr.findLast((v: number): boolean => v == 20);
      expect(result).assertEqual(20);
      if (result != undefined) {
        expect(arr.lastIndexOf(result)).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_0300
     * @tc.name testArrayFindLast003
     * @tc.desc Verify findLast returns undefined when nothing matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFindLast003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      expect(arr.findLast((v: number): boolean => v > 100)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_0400
     * @tc.name testArrayFindLast004
     * @tc.desc Verify empty arrays return undefined for findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFindLast004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      expect(arr.findLast((v: number): boolean => true)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_0500
     * @tc.name testArrayFindLast005
     * @tc.desc Verify single-element arrays support findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFindLast005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      arr.pushOne(100);
      expect(arr.findLast((v: int): boolean => v > 50)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_0600
     * @tc.name testArrayFindLast006
     * @tc.desc Verify findLast works with object arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFindLast006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const i1 = new FindLastItem006();
      i1.value = 10;
      const i2 = new FindLastItem006();
      i2.value = 20;
      const i3 = new FindLastItem006();
      i3.value = 10;
      const arr = new Array<FindLastItem006>(i1, i2, i3);
      const result = arr.findLast((item: FindLastItem006): boolean => item.value == 10);
      expect(result != undefined).assertTrue();
      if (result != undefined) {
        expect(result === i3).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_0700
     * @tc.name testArrayFindLast007
     * @tc.desc Verify findLast can locate the last matching modulo result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFindLast007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 40, 50);
      const result = arr.findLast((v: number): boolean => v % 3 == 0);
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_0800
     * @tc.name testArrayFindLast008
     * @tc.desc Verify find and findLast differ when matches appear more than once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFindLast008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 20, 10);
      const first = arr.find((v: number): boolean => v == 20);
      const last = arr.findLast((v: number): boolean => v == 20);
      expect(first != undefined).assertTrue();
      expect(last != undefined).assertTrue();
      if (first != undefined && last != undefined) {
        expect(arr.indexOf(first)).assertEqual(1);
        expect(arr.lastIndexOf(last)).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_0900
     * @tc.name testArrayFindLast009
     * @tc.desc Verify findLast can return a later even value than find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFindLast009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const firstEven = arr.find((v: number): boolean => v % 2 == 0);
      const lastEven = arr.findLast((v: number): boolean => v % 2 == 0);
      expect(firstEven).assertEqual(2);
      expect(lastEven).assertEqual(4);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_LAST_1000
     * @tc.name testArrayFindLast010
     * @tc.desc Verify documented scenario 6.1 find vs findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFindLast010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<number>(10, 20, 30, 20).findLast((v: number): boolean => v == 20);
      expect(result).assertEqual(20);
    });

  });
}
