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

class FlatMapPerson008 {
  name: string = '';
  children: Array<FlatMapPerson008> = new Array<FlatMapPerson008>();
}

class FlatMapItem012 {
  id: int = 0;
  tags: Array<string> = new Array<string>();
}

export default function ArrayFlatMapTest(): void {
  describe('ArrayFlatMapTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_0100
     * @tc.name testArrayFlatMap001
     * @tc.desc Verify flatMap expands each value into multiple numeric values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlatMap001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      const result = arr.flatMap<number>((v: number): Array<number> => new Array<number>(v, v * 2));
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(2);
      expect(result[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_0200
     * @tc.name testArrayFlatMap002
     * @tc.desc Verify flatMap callback receives value index and array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlatMap002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      const result = arr.flatMap<number>((v: number, i: int, a: Array<number>): Array<number> => {
        expect(a.length).assertEqual(3);
        return new Array<number>(i, v);
      });
      expect(result.length).assertEqual(6);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(10);
      expect(result[2]).assertEqual(1);
      expect(result[3]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_0300
     * @tc.name testArrayFlatMap003
     * @tc.desc Verify flatMap can filter by returning empty arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlatMap003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const result = arr.flatMap<number>((v: number): Array<number> => {
        return v % 2 == 0 ? Array.create<number>(1, v) : new Array<number>();
      });
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_0400
     * @tc.name testArrayFlatMap004
     * @tc.desc Verify flatMap works with empty arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlatMap004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      const result = arr.flatMap<number>((v: number): Array<number> => Array.create<number>(1, v));
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_0500
     * @tc.name testArrayFlatMap005
     * @tc.desc Verify flatMap can change the output element type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlatMap005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      const result = arr.flatMap<string>((v: number): Array<string> => Array.create<string>(1, v.toString()));
      const valueType = Class.of(result[0]).getName().split('.');
      expect(result.length).assertEqual(2);
      expect(valueType[valueType.length - 1]).assertEqual('String');
      expect(result[0]).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_0600
     * @tc.name testArrayFlatMap006
     * @tc.desc Verify flatMap matches map followed by flat with depth one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlatMap006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result1 = arr.flatMap<number>((v: number): Array<number> => new Array<number>(v, v * 2));
      const mapped = arr.map((v: number): Array<number> => new Array<number>(v, v * 2));
      const result2 = mapped.flat<number>(1);
      expect(result1.length).assertEqual(result2.length);
      expect(result1.toString()).assertEqual(result2.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_0700
     * @tc.name testArrayFlatMap007
     * @tc.desc Verify flatMap can flatten nested child arrays from objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlatMap007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new FlatMapPerson008();
      parent.name = 'parent';
      const child1 = new FlatMapPerson008();
      child1.name = 'child1';
      const child2 = new FlatMapPerson008();
      child2.name = 'child2';
      parent.children.pushOne(child1);
      parent.children.pushOne(child2);
      const arr = Array.create<FlatMapPerson008>(1, parent);
      const result = arr.flatMap<FlatMapPerson008>(
        (person: FlatMapPerson008): Array<FlatMapPerson008> => person.children
      );
      expect(result.length).assertEqual(2);
      expect(result[0].name).assertEqual('child1');
      expect(result[1].name).assertEqual('child2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_0800
     * @tc.name testArrayFlatMap008
     * @tc.desc Verify flatMap can include undefined in returned arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlatMap008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      const result = arr.flatMap<number | undefined>((v: number): Array<number | undefined> => {
        return new Array<number | undefined>(v, undefined);
      });
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertUndefined();
      expect(result[2]).assertEqual(2);
      expect(result[3]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_0900
     * @tc.name testArrayFlatMap009
     * @tc.desc Verify flatMap results can be followed by filter and map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlatMap009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const expanded = arr.flatMap<number>(
        (v: number): Array<number> => new Array<number>(v, v * 2)
      );
      const filtered = expanded.filter((v: number): boolean => v > 2);
      const result = filtered.map((v: number): number => v + 1);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(5);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_1000
     * @tc.name testArrayFlatMap010
     * @tc.desc Verify flatMap can use the element index in output calculations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlatMap010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      const result = arr.flatMap<number>((v: number, i: int): Array<number> => Array.create<number>(1, v + i));
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(21);
      expect(result[2]).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_1100
     * @tc.name testArrayFlatMap011
     * @tc.desc Verify flatMap can be applied in multiple steps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlatMap011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      const first = arr.flatMap<number>(
        (v: number): Array<number> => new Array<number>(v, v * 2)
      );
      const second = first.flatMap<number>(
        (v: number): Array<number> => new Array<number>(v, v + 1)
      );
      expect(second.length).assertEqual(8);
      expect(second[0]).assertEqual(1);
      expect(second[1]).assertEqual(2);
      expect(second[7]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_1200
     * @tc.name testArrayFlatMap012
     * @tc.desc Verify flatMap can extract nested tag arrays from objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlatMap012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const item = new FlatMapItem012();
      item.id = 1;
      item.tags.pushOne('tag1');
      item.tags.pushOne('tag2');
      const arr = Array.create<FlatMapItem012>(1, item);
      const result = arr.flatMap<string>(
        (entry: FlatMapItem012): Array<string> => entry.tags
      );
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual('tag1');
      expect(result[1]).assertEqual('tag2');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_1300
     * @tc.name testArrayFlatMap013
     * @tc.desc Verify documented scenario 与map+flat等价
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlatMap013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [1, 2, 3];
      const result1: Array<number> = arr.flatMap<number>((v: number): Array<number> => [v, v * 2]);
      const mapped: Array<Array<number>> = arr.map((v: number): Array<number> => [v, v * 2]);
      const result2: Array<number> = mapped.flat<number>(1);
      expect(result1.length).assertEqual(result2.length);
      expect(result1.toString()).assertEqual(result2.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_1400
     * @tc.name testArrayFlatMap014
     * @tc.desc Verify documented scenario 空数组flatMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlatMap014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [];
      const result: Array<number> = arr.flatMap<number>((v: number): Array<number> => [v]);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_1500
     * @tc.name testArrayFlatMap015
     * @tc.desc Verify documented scenario 3.2 单元素数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlatMap015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [5];
      const result: Array<number> = arr.flatMap<number>((v: number): Array<number> => [v, v * 2]);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(5);
      expect(result[1]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_1600
     * @tc.name testArrayFlatMap016
     * @tc.desc Verify documented scenario 3.3 大数组flatMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlatMap016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [];
      for (let i: int = 0; i < 100; i++) {
        arr.pushOne(i);
      }
      const result: Array<number> = arr.flatMap<number>((v: number): Array<number> => [v, v + 1]);
      expect(result.length).assertEqual(200);
      expect(result[0]).assertEqual(0);
      expect(result[199]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_1700
     * @tc.name testArrayFlatMap017
     * @tc.desc Verify documented scenario flatMap不修改原数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlatMap017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [1, 2, 3];
      const originalLength: int = arr.length;
      const originalFirst: number = arr[0];
      const result: Array<number> = arr.flatMap<number>((v: number): Array<number> => [v * 2]);
      expect(arr.length).assertEqual(originalLength);
      expect(arr[0]).assertEqual(originalFirst);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_1800
     * @tc.name testArrayFlatMap018
     * @tc.desc Verify documented scenario 回调函数中修改原数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlatMap018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [1, 2, 3];
      const result: Array<number> = arr.flatMap<number>((v: number, i: int, a: Array<number>): Array<number> => {
        if (i == 0) {
          a[0] = 99;
        }
        return [v];
      });
      expect(arr[0]).assertEqual(99);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_1900
     * @tc.name testArrayFlatMap019
     * @tc.desc Verify documented scenario 5.1 number数组flatMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlatMap019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [1, 2, 3];
      const result: Array<number> = arr.flatMap<number>((v: number): Array<number> => [v, v * 2]);
      const valueType = Class.of(result[0]).getName().split('.');
      expect(result.length).assertEqual(6);
      expect(valueType[valueType.length - 1]).assertEqual('Double');
      expect(result[5]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_2000
     * @tc.name testArrayFlatMap020
     * @tc.desc Verify documented scenario 5.2 string数组flatMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlatMap020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<string> = ['a', 'b'];
      const result: Array<string> = arr.flatMap<string>((s: string): Array<string> => [s, s.toUpperCase()]);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual('a');
      expect(result[1]).assertEqual('A');
      expect(result[3]).assertEqual('B');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_2100
     * @tc.name testArrayFlatMap021
     * @tc.desc Verify documented scenario 5.3 对象数组flatMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlatMap021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new FlatMapPerson008();
      parent.name = 'Parent';
      const child1 = new FlatMapPerson008();
      child1.name = 'Child1';
      const child2 = new FlatMapPerson008();
      child2.name = 'Child2';
      parent.children = [child1, child2];
      const arr: Array<FlatMapPerson008> = [parent];
      const result: Array<FlatMapPerson008> =
        arr.flatMap<FlatMapPerson008>((person: FlatMapPerson008): Array<FlatMapPerson008> => person.children);
      expect(result.length).assertEqual(2);
      expect(result[0].name).assertEqual('Child1');
      expect(result[1].name).assertEqual('Child2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_2200
     * @tc.name testArrayFlatMap022
     * @tc.desc Verify documented scenario 6.1 返回包含null的数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlatMap022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [1, 2, 3];
      const result: Array<number | null> = arr.flatMap<number | null>((v: number): Array<number | null> => [v, null]);
      expect(result.length).assertEqual(6);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertNull();
      expect(result[5]).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_2300
     * @tc.name testArrayFlatMap023
     * @tc.desc Verify documented scenario 6.2 返回包含undefined的数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlatMap023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [1, 2];
      const result: Array<number | undefined> =
        arr.flatMap<number | undefined>((v: number): Array<number | undefined> => [v, undefined]);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertUndefined();
      expect(result[3]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_2400
     * @tc.name testArrayFlatMap024
     * @tc.desc Verify documented scenario 7.1 flatMap后filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlatMap024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [1, 2, 3];
      const result: Array<number> =
        arr.flatMap<number>((v: number): Array<number> => [v, v * 2]).filter((v: number): boolean => v > 2);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(4);
      expect(result[1]).assertEqual(3);
      expect(result[2]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_2500
     * @tc.name testArrayFlatMap025
     * @tc.desc Verify documented scenario 7.2 flatMap后map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlatMap025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [1, 2];
      const result: Array<number> =
        arr.flatMap<number>((v: number): Array<number> => [v, v * 2]).map((v: number): number => v + 1);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(3);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_2600
     * @tc.name testArrayFlatMap026
     * @tc.desc Verify documented scenario 7.3 flatMap后reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlatMap026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [1, 2, 3];
      const sum: number =
        arr.flatMap<number>((v: number): Array<number> => [v, v * 2]).reduce((a: number, b: number): number => a + b,
          0);
      expect(sum).assertEqual(18);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_2700
     * @tc.name testArrayFlatMap027
     * @tc.desc Verify documented scenario 8.1 flatMap vs map+flat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlatMap027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [2, 4, 6];
      const result1: Array<number> = arr.flatMap<number>((v: number): Array<number> => [v, v / 2]);
      const result2: Array<number> = arr.map((v: number): Array<number> => [v, v / 2]).flat<number>(1);
      expect(result1.length).assertEqual(result2.length);
      expect(result1.toString()).assertEqual(result2.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_2800
     * @tc.name testArrayFlatMap028
     * @tc.desc Verify documented scenario 8.2 flatMap vs filter+map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlatMap028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [1, 2, 3, 4, 5, 6];
      const result1: Array<number> = arr.flatMap<number>((v: number): Array<number> => {
        return v % 2 == 0 ? Array.create<number>(1, v * 2) : new Array<number>();
      });
      const result2: Array<number> = arr.filter((v: number): boolean => v % 2 == 0).map((v: number): number => v * 2);
      expect(result1.toString()).assertEqual(result2.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_2900
     * @tc.name testArrayFlatMap029
     * @tc.desc Verify documented scenario 8.3 flatMap vs flat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlatMap029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [1, 2, 3];
      const result1: Array<number> = arr.flatMap<number>((v: number): Array<number> => [v * 2]);
      const result2: Array<number> = arr.flat<number>(1);
      expect(result1[0]).assertEqual(2);
      expect(result2[0]).assertEqual(1);
      expect(result1.length).assertEqual(3);
      expect(result2.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_3000
     * @tc.name testArrayFlatMap030
     * @tc.desc Verify documented scenario 9.1 一对多映射
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlatMap030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [1, 2, 3];
      const result: Array<number> = arr.flatMap<number>((v: number): Array<number> => [v, v + 1]);
      expect(result.length).assertEqual(6);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(2);
      expect(result[3]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_3100
     * @tc.name testArrayFlatMap031
     * @tc.desc Verify documented scenario 9.2 条件过滤+映射
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlatMap031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result: Array<number> = arr.flatMap<number>((v: number): Array<number> => {
        return v > 2 ? Array.create<number>(1, v * 2) : new Array<number>();
      });
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(6);
      expect(result[1]).assertEqual(8);
      expect(result[2]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_3200
     * @tc.name testArrayFlatMap032
     * @tc.desc Verify documented scenario 9.3 展开嵌套结构
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlatMap032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent1 = new FlatMapPerson008();
      parent1.name = 'Parent1';
      const child1 = new FlatMapPerson008();
      child1.name = 'Alice';
      const child2 = new FlatMapPerson008();
      child2.name = 'Bob';
      parent1.children = [child1, child2];
      const parent2 = new FlatMapPerson008();
      parent2.name = 'Parent2';
      const child3 = new FlatMapPerson008();
      child3.name = 'Carol';
      parent2.children = [child3];
      const parents: Array<FlatMapPerson008> = [parent1, parent2];
      const result: Array<FlatMapPerson008> =
        parents.flatMap<FlatMapPerson008>((person: FlatMapPerson008): Array<FlatMapPerson008> => person.children);
      expect(result.length).assertEqual(3);
      expect(result[0].name).assertEqual('Alice');
      expect(result[2].name).assertEqual('Carol');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_3300
     * @tc.name testArrayFlatMap033
     * @tc.desc Verify documented scenario 9.4 分组数据展开
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlatMap033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const groups: Array<Array<number>> = [[1, 2], [3, 4]];
      const result: Array<number> = groups.flatMap<number>((group: Array<number>): Array<number> => group);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_3400
     * @tc.name testArrayFlatMap034
     * @tc.desc Verify documented scenario 10.1 时间复杂度
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlatMap034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [];
      for (let i: int = 0; i < 100; i++) {
        arr.pushOne(i);
      }
      const result: Array<number> = arr.flatMap<number>((v: number): Array<number> => [v, v + 1]);
      expect(result.length).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_3500
     * @tc.name testArrayFlatMap035
     * @tc.desc Verify documented scenario 10.2 flatMap matches map followed by flat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlatMap035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [];
      for (let i: int = 0; i < 100; i++) {
        arr.pushOne(i);
      }
      const result1: Array<number> = arr.flatMap<number>((v: number): Array<number> => [v, v * 2]);
      const result2: Array<number> = arr.map((v: number): Array<number> => [v, v * 2]).flat<number>(1);
      expect(result1.length).assertEqual(result2.length);
      expect(result1.toString()).assertEqual(result2.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_3600
     * @tc.name testArrayFlatMap036
     * @tc.desc Verify documented scenario 11.1 使用索引进行计算
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlatMap036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [10, 20, 30];
      const result: Array<number> = arr.flatMap<number>((v: number, i: int): Array<number> => [v + i]);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(21);
      expect(result[2]).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_3700
     * @tc.name testArrayFlatMap037
     * @tc.desc Verify documented scenario 11.2 使用数组参数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlatMap037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [1, 2, 3];
      const result: Array<number> = arr.flatMap<number>((v: number, i: int, a: Array<number>): Array<number> => {
        expect(Array.isArray(a)).assertTrue();
        expect(a.length).assertEqual(3);
        return [v + i];
      });
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(3);
      expect(result[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_3800
     * @tc.name testArrayFlatMap038
     * @tc.desc Verify documented scenario 12.1 泛型类型推断
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlatMap038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [1, 2, 3];
      const result: Array<number> = arr.flatMap<number>((v: number): Array<number> => Array.create<number>(1, v * 2));
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(2);
      expect(result[2]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_3900
     * @tc.name testArrayFlatMap039
     * @tc.desc Verify documented scenario 12.2 不同类型转换
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlatMap039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [1, 2, 3];
      const result: Array<string> = arr.flatMap<string>((v: number): Array<string> => [v.toString()]);
      const valueType = Class.of(result[0]).getName().split('.');
      expect(result.length).assertEqual(3);
      expect(valueType[valueType.length - 1]).assertEqual('String');
      expect(result[0]).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_4000
     * @tc.name testArrayFlatMap040
     * @tc.desc Verify documented scenario 13.1 空数组返回
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlatMap040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [1, 2, 3, 4];
      const result: Array<number> = arr.flatMap<number>((v: number): Array<number> => []);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_4100
     * @tc.name testArrayFlatMap041
     * @tc.desc Verify documented scenario 13.2 不规则返回长度
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlatMap041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [1, 2, 3];
      const result: Array<number> = arr.flatMap<number>((v: number): Array<number> => {
        if (v == 1) {
          return [v];
        }
        if (v == 2) {
          return [v, v * 2];
        }
        return [v, v * 2, v * 3];
      });
      expect(result.length).assertEqual(6);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(4);
      expect(result[3]).assertEqual(3);
      expect(result[4]).assertEqual(6);
      expect(result[5]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_4200
     * @tc.name testArrayFlatMap042
     * @tc.desc Verify documented scenario 返回新数组实例
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlatMap042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [1, 2, 3];
      const result: Array<number> = arr.flatMap<number>((v: number): Array<number> => [v, v * 2]);
      expect(result === arr).assertFalse();
      expect(result.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_4300
     * @tc.name testArrayFlatMap043
     * @tc.desc Verify documented scenario 15.1 简洁箭头函数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlatMap043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [1, 2, 3];
      const result: Array<number> = arr.flatMap<number>((v: number): Array<number> => [v]);
      expect(result.length).assertEqual(3);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_4400
     * @tc.name testArrayFlatMap044
     * @tc.desc Verify documented scenario 15.2 块状箭头函数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlatMap044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [1, 2, 3];
      const result: Array<number> = arr.flatMap<number>((v: number): Array<number> => {
        const doubled = v * 2;
        return [v, doubled];
      });
      expect(result.length).assertEqual(6);
      expect(result[1]).assertEqual(2);
      expect(result[5]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_4500
     * @tc.name testArrayFlatMap045
     * @tc.desc Verify documented scenario 16.1 嵌套flatMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlatMap045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [1, 2];
      const result: Array<number> =
        arr.flatMap<number>((v: number): Array<number> => [v, v * 2]).flatMap<number>((v: number): Array<number> => [v,
          v + 1]);
      expect(result.length).assertEqual(8);
      expect(result[0]).assertEqual(1);
      expect(result[7]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_4600
     * @tc.name testArrayFlatMap046
     * @tc.desc Verify documented scenario 16.2 多步骤处理
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlatMap046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<string> = ['a,b', 'c,d'];
      const result: Array<string> =
        arr.flatMap<string>((s: string): Array<string> => s.split(',').map((part: string): string => part.trim()));
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual('a');
      expect(result[1]).assertEqual('b');
      expect(result[2]).assertEqual('c');
      expect(result[3]).assertEqual('d');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_4700
     * @tc.name testArrayFlatMap047
     * @tc.desc Verify documented scenario 布尔值标签展开
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlatMap047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const flags: Array<boolean> = [true, false];
      const result: Array<string> =
        flags.flatMap<string>((flag: boolean): Array<string> => [flag ? 'yes' : 'no', flag ? '1' : '0']);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual('yes');
      expect(result[3]).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_4800
     * @tc.name testArrayFlatMap048
     * @tc.desc Verify documented scenario 18.1 返回null或undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlatMap048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [1, 2];
      const result: Array<number | null | undefined> =
        arr.flatMap<number | null | undefined>((v: number): Array<number | null | undefined> => [v, null, undefined]);
      expect(result.length).assertEqual(6);
      expect(result[1]).assertNull();
      expect(result[2]).assertUndefined();
      expect(result[5]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_4900
     * @tc.name testArrayFlatMap049
     * @tc.desc Verify documented scenario 仅扁平化一层
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlatMap049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [1, 2];
      const result: Array<number | Array<number>> =
        arr.flatMap<number | Array<number>>((v: number): Array<number | Array<number>> => [v, [v * 2]]);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(Array.isArray(result[1])).assertTrue();
      expect(Array.isArray(result[3])).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_5000
     * @tc.name testArrayFlatMap050
     * @tc.desc Verify documented scenario 19.1 number转string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlatMap050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [1, 2, 3];
      const result: Array<string> =
        arr.flatMap<string>((v: number): Array<string> => [v.toString(), 'value:' + v.toString()]);
      expect(result.length).assertEqual(6);
      expect(result[0]).assertEqual('1');
      expect(result[1]).assertEqual('value:1');
      expect(result[5]).assertEqual('value:3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_5100
     * @tc.name testArrayFlatMap051
     * @tc.desc Verify documented scenario 19.2 对象转属性值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlatMap051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const item1 = new FlatMapItem012();
      item1.id = 1;
      item1.tags = ['tag1', 'tag2'];
      const item2 = new FlatMapItem012();
      item2.id = 2;
      item2.tags = ['tag3'];
      const arr: Array<FlatMapItem012> = [item1, item2];
      const result: Array<string> = arr.flatMap<string>((entry: FlatMapItem012): Array<string> => entry.tags);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual('tag1');
      expect(result[2]).assertEqual('tag3');
    });

  });
}

