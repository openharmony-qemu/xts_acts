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

class FindItem006 {
  id: int = 0;
  name: string = '';
}

class Item {
  id: number = 0;
  name: string = "";
}

export default function ArrayFindTest(): void {
  describe('ArrayFindTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_0100
     * @tc.name testArrayFind001
     * @tc.desc Verify find returns the first matching numeric element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFind001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      const result = arr.find((v: number): boolean => v > 15);
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_0200
     * @tc.name testArrayFind002
     * @tc.desc Verify find predicate receives the source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFind002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      const result = arr.find((v: number, i: int, a: Array<number>): boolean => {
        expect(a.length).assertEqual(3);
        return i == 1;
      });
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_0300
     * @tc.name testArrayFind003
     * @tc.desc Verify find returns undefined when nothing matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFind003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      expect(arr.find((v: number): boolean => v > 100)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_0400
     * @tc.name testArrayFind004
     * @tc.desc Verify find returns the first match among repeated values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFind004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 20, 40);
      const result = arr.find((v: number): boolean => v == 20);
      expect(result).assertEqual(20);
      if (result != undefined) {
        expect(arr.indexOf(result)).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_0500
     * @tc.name testArrayFind005
     * @tc.desc Verify empty arrays and unmatched arrays return undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFind005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty = new Array<number>();
      const arr = new Array<number>(1, 2, 3);
      expect(empty.find((v: number): boolean => true)).assertUndefined();
      expect(arr.find((v: number): boolean => v > 10)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_0600
     * @tc.name testArrayFind006
     * @tc.desc Verify find works with object arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFind006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const item1 = new FindItem006();
      item1.id = 1;
      item1.name = 'first';
      const item2 = new FindItem006();
      item2.id = 2;
      item2.name = 'second';
      const arr = new Array<FindItem006>(item1, item2);
      const found = arr.find((item: FindItem006): boolean => item.id == 2);
      expect(found != undefined).assertTrue();
      if (found != undefined) {
        expect(found.name).assertEqual('second');
        expect(found === item2).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_0700
     * @tc.name testArrayFind007
     * @tc.desc Verify find can locate null values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFind007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | null>(1, null, 3, null);
      const result = arr.find((v: number | null): boolean => v == null);
      expect(result).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_0800
     * @tc.name testArrayFind008
     * @tc.desc Verify find can match an indexOf based lookup result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFind008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 40, 50);
      const result = arr.find(v => v > 25 && v < 35);
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_0900
     * @tc.name testArrayFind009
     * @tc.desc Verify find can match an object by property value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFind009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Item>();
      const item = new Item();
      item.id = 100;
      item.name = 'test';
      arr.push(item);

      const found = arr.find((value: Item): boolean => value.id == 100);
      expect(found != undefined).assertTrue();
      if (found != undefined) {
        expect(found.name).assertEqual('test');
        expect(found === item).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_1000
     * @tc.name testArrayFind010
     * @tc.desc Verify documented scenario 6.1 find vs filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFind010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 4, 6, 8);
      const found = arr.find(v => v > 3);
      const filtered = arr.filter(v => v > 3);
      expect(found).assertEqual(4);
      expect(filtered.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FIND_1100
     * @tc.name testArrayFind011
     * @tc.desc Verify documented scenario 6.2 find vs indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFind011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      const result1 = arr.find(v => v > 15);
      const result2 = arr[arr.indexOf(20)];
      expect(result1).assertEqual(result2);
    });

  });
}
