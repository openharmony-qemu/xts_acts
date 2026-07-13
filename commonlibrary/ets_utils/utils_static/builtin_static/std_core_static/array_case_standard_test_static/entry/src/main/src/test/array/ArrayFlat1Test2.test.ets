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
  afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level,
  Size, TestType
} from '../../../../hypium/index';
import Utils from '../Util.test';

class FlatOnePerson {
  id: string = '';
  name: string = '';
}

class FlatOneAnimal {
  type: string = 'animal';
  sound: string = '';
}

class FlatOneDog extends FlatOneAnimal {
  type: string = 'dog';
  sound: string = 'bark';
}

class FlatOneCat extends FlatOneAnimal {
  type: string = 'cat';
  sound: string = 'meow';
}

class FlatOneInstanceField {
  data: Array<Array<number>> = new Array<Array<number>>(new Array<number>(1, 2), new Array<number>(3, 4));
}

class FlatOneStaticField {
  static grid: Array<Array<number>> = new Array<Array<number>>(new Array<number>(5, 6), new Array<number>(7, 8));
}

class FlatOneReadonlyField {
  readonly nested: Array<Array<number>> = new Array<Array<number>>(new Array<number>(10, 20), new Array<number>(30, 40));
}

class FlatOnePrivateField {
  matrix: Array<Array<number>> = new Array<Array<number>>(new Array<number>(100, 200), new Array<number>(300, 400));
}

class FlatOneGenericHolder<T> {
  data: Array<Array<T>> = new Array<Array<T>>();
}

class FlatOneCustomMethod {
  arr: Array<Array<number>> = new Array<Array<number>>(new Array<number>(1, 2), new Array<number>(3, 4));
  flat(depth: number): number {
    return -1;
  }
}

class FlatOneSubArray extends Array<Array<number>> {
}

export default function ArrayFlat1Test2(): void {
  describe('ArrayFlat1Test2', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_0100
     * @tc.name testArrayFlat1001
     * @tc.desc Verify flat with depth 1 on nested string arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlat1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner1 = new Array<string>('a', 'b');
      const inner2 = new Array<string>('c', 'd');
      const arr = new Array<Array<string>>(inner1, inner2);
      const result: Array<string> = arr.flat<string>(1);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual('a');
      expect(result[3]).assertEqual('d');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_0200
     * @tc.name testArrayFlat1002
     * @tc.desc Verify flat with depth 1 on nested boolean arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlat1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner1 = new Array<boolean>(true, false);
      const inner2 = new Array<boolean>(false, true);
      const arr = new Array<Array<boolean>>(inner1, inner2);
      const result: Array<boolean> = arr.flat<boolean>(1);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertTrue();
      expect(result[3]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_0300
     * @tc.name testArrayFlat1003
     * @tc.desc Verify flat with depth 2 on Array<Array<int>>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlat1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner1 = new Array<int>(1, 2);
      const inner2 = new Array<int>(3, 4);
      const arr = new Array<Array<int>>(inner1, inner2);
      const result: Array<int> = arr.flat<int>(2);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_0400
     * @tc.name testArrayFlat1004
     * @tc.desc Verify flat with depth 0 on string nested array returns same nesting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlat1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner1 = new Array<string>('x', 'y');
      const inner2 = new Array<string>('z');
      const arr = new Array<Array<string>>(inner1, inner2);
      const result: Array<Array<string>> = arr.flat(0) as Array<Array<string>>;
      expect(result.length).assertEqual(2);
      expect(result[0].length).assertEqual(2);
      expect(result[1].length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_0500
     * @tc.name testArrayFlat1005
     * @tc.desc Verify flat with depth Infinity flattens string nested arrays completely
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlat1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner1 = new Array<string>('a', 'b');
      const inner2 = new Array<string>('c', 'd');
      const arr = new Array<Array<string>>(inner1, inner2);
      const result: Array<string> = arr.flat<string>(2147483647);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual('a');
      expect(result[3]).assertEqual('d');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_0600
     * @tc.name testArrayFlat1006
     * @tc.desc Verify flat with depth 1 does not modify source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlat1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner1 = new Array<int>(1, 2);
      const inner2 = new Array<int>(3, 4);
      const arr = new Array<Array<int>>(inner1, inner2);
      const originalStr = arr.toString();
      const result: Array<int> = arr.flat<int>(1);
      expect(arr.toString()).assertEqual(originalStr);
      expect(result.length).assertEqual(4);
      expect(result === arr).assertFalse();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_0700
     * @tc.name testArrayFlat1007
     * @tc.desc Verify flat(1) on instance field nested array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlat1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FlatOneInstanceField();
      const result: Array<number> = obj.data.flat<number>(1);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_0800
     * @tc.name testArrayFlat1008
     * @tc.desc Verify flat(1) on static field nested array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlat1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Array<number> = FlatOneStaticField.grid.flat<number>(1);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(5);
      expect(result[3]).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_0900
     * @tc.name testArrayFlat1009
     * @tc.desc Verify static field modified before flat uses latest data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlat1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      FlatOneStaticField.grid = new Array<Array<number>>(new Array<number>(9, 10));
      const result: Array<number> = FlatOneStaticField.grid.flat<number>(1);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(9);
      expect(result[1]).assertEqual(10);
      FlatOneStaticField.grid = new Array<Array<number>>(new Array<number>(5, 6), new Array<number>(7, 8));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_1000
     * @tc.name testArrayFlat1010
     * @tc.desc Verify flat(1) on readonly nested array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlat1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FlatOneReadonlyField();
      const result: Array<number> = obj.nested.flat<number>(1);
      expect(result.length).assertEqual(4);
      expect(result[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_1100
     * @tc.name testArrayFlat1011
     * @tc.desc Verify flat(1) on public field via Class reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlat1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FlatOnePrivateField();
      const clazz = Class.of(obj);
      const field = clazz.getInstanceField('matrix');
      if (field !== undefined) {
        const arr = field.getValue(obj) as Array<Array<number>>;
        const result: Array<number> = arr.flat<number>(1);
        expect(result.length).assertEqual(4);
        expect(result[3]).assertEqual(400);
      }else {
        expect().assertFail();
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_1200
     * @tc.name testArrayFlat1012
     * @tc.desc Verify flat(0) returns shallow copy, no flattening
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlat1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested = new Array<Array<number>>(new Array<number>(1, 2), new Array<number>(3, 4));
      const result = nested.flat<Array<number>>(0);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_1300
     * @tc.name testArrayFlat1013
     * @tc.desc Verify flat(100) on 2-deep array fully flattens
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlat1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Array<Array<number>>(new Array<number>(1, 2));
      const arr = new Array<Array<Array<number>>>(inner);
      const result: Array<number> = arr.flat<number>(100);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_1400
     * @tc.name testArrayFlat1014
     * @tc.desc Verify flat(1) returns new array, not source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlat1014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Array<number>(1, 2);
      const arr = new Array<Array<number>>(inner);
      const result: Array<number> = arr.flat<number>(1);
      expect(result === arr).assertFalse();
      expect(result === inner).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_1500
     * @tc.name testArrayFlat1015
     * @tc.desc Verify object references are shallow copied in flat(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlat1015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p = new FlatOnePerson();
      p.id = 'ref';
      const arr = new Array<Array<FlatOnePerson>>(new Array<FlatOnePerson>(p));
      const result: Array<FlatOnePerson> = arr.flat<FlatOnePerson>(1);
      expect(result[0]).assertEqual(p);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_1600
     * @tc.name testArrayFlat1016
     * @tc.desc Verify flat(1) on nested polymorphic array flatten
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlat1016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dog = new FlatOneDog();
      const cat = new FlatOneCat();
      const arr = new Array<Array<FlatOneAnimal>>(new Array<FlatOneAnimal>(dog), new Array<FlatOneAnimal>(cat));
      const result: Array<FlatOneAnimal> = arr.flat<FlatOneAnimal>(1);
      expect(result.length).assertEqual(2);
      expect(result[0].sound).assertEqual('bark');
      expect(result[1].sound).assertEqual('meow');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_1700
     * @tc.name testArrayFlat1017
     * @tc.desc Verify flat(1) on generic nested field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlat1017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const holder = new FlatOneGenericHolder<number>();
      holder.data = new Array<Array<number>>(new Array<number>(10, 20), new Array<number>(30));
      const result: Array<number> = holder.data.flat<number>(1);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(10);
      expect(result[2]).assertEqual(30);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_1800
     * @tc.name testArrayFlat1018
     * @tc.desc Verify custom flat() does not conflict with Array.flat(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlat1018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FlatOneCustomMethod();
      const custom = obj.flat(2);
      expect(custom).assertEqual(-1);
      const real: Array<number> = obj.arr.flat<number>(1);
      expect(real.length).assertEqual(4);
      expect(real[3]).assertEqual(4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_1900
     * @tc.name testArrayFlat1019
     * @tc.desc Verify flat(1) on subclass of Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlat1019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new FlatOneSubArray();
      arr.pushOne(new Array<number>(1, 2));
      arr.pushOne(new Array<number>(3, 4));
      const result: Array<number> = arr.flat<number>(1);
      expect(result.length).assertEqual(4);
      expect(result[3]).assertEqual(4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_2000
     * @tc.name testArrayFlat1020
     * @tc.desc Verify flat(1).at(-1) returns last flattened element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlat1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Array<number>>(new Array<number>(1, 2), new Array<number>(3, 4));
      const result: number | undefined = arr.flat<number>(1).at(-1);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_2100
     * @tc.name testArrayFlat1021
     * @tc.desc Verify flat(1).filter() works
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlat1021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Array<number>>(new Array<number>(1, 2), new Array<number>(3, 4));
      const filtered = arr.flat<number>(1).filter((v: number): boolean => v > 2);
      expect(filtered.length).assertEqual(2);
      expect(filtered[0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_2200
     * @tc.name testArrayFlat1022
     * @tc.desc Verify flat(1).map() works
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlat1022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Array<number>>(new Array<number>(1, 2), new Array<number>(3, 4));
      const mapped = arr.flat<number>(1).map((v: number): number => v * 10);
      expect(mapped.length).assertEqual(4);
      expect(mapped[3]).assertEqual(40);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_2300
     * @tc.name testArrayFlat1023
     * @tc.desc Verify flat(1) preserves null in nested
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlat1023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Array<number | null>>(new Array<number | null>(1, null));
      const result = arr.flat<number | null>(1);
      expect(result.length).assertEqual(2);
      expect(result[1]).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_2400
     * @tc.name testArrayFlat1024
     * @tc.desc Verify flat(1) preserves undefined in nested
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlat1024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Array<number | undefined>>(new Array<number | undefined>(1, undefined));
      const result = arr.flat<number | undefined>(1);
      expect(result.length).assertEqual(2);
      expect(result[1]).assertUndefined();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_2500
     * @tc.name testArrayFlat1025
     * @tc.desc Verify flat(1) on pushOne-built nested array flattens correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlat1025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Array<number>>();
      const inner = new Array<number>(1, 2, 3);
      arr.pushOne(inner);
      const result: Array<number> = arr.flat<number>(1);
      expect(result.length).assertEqual(3);
      expect(result[2]).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_2600
     * @tc.name testArrayFlat1026
     * @tc.desc Verify flat(1) preserves bigint in nested
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlat1026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Array<bigint>>(new Array<bigint>(10n, 20n));
      const result: Array<bigint> = arr.flat<bigint>(1);
      expect(result.length).assertEqual(2);
      expect(result[1]).assertEqual(20n);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_2700
     * @tc.name testArrayFlat1027
     * @tc.desc Verify flat(1) preserves NaN and Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlat1027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Array<number>>(new Array<number>(Double.NaN, Double.POSITIVE_INFINITY));
      const result: Array<number> = arr.flat<number>(1);
      expect(result.length).assertEqual(2);
      expect(isNaN(result[0])).assertTrue();
      expect(result[1]).assertEqual(Double.POSITIVE_INFINITY);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_2800
     * @tc.name testArrayFlat1028
     * @tc.desc Verify flat(1) on nested array works
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlat1028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Array<number>(1, 2, 3);
      const arr = new Array<Array<number>>(inner);
      const result: Array<number> = arr.flat<number>(1);
      expect(result.length).assertEqual(3);
      expect(result[2]).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_2900
     * @tc.name testArrayFlat1029
     * @tc.desc Verify flat(1) on nested array: [[1,2],[3,4]] → [1,2,3,4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlat1029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner1 = new Array<number>(1, 2);
      const inner2 = new Array<number>(3, 4);
      const arr = new Array<Array<number>>(inner1, inner2);
      const result: Array<number> = arr.flat<number>(1);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[3]).assertEqual(4);
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_3000
     * @tc.name testArrayFlat1030
     * @tc.desc Verify consistent flat across multiple Field reflections
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlat1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FlatOneInstanceField();
      const clazz = Class.of(obj);
      const f1 = clazz.getInstanceField('data');
      const f2 = clazz.getInstanceField('data');
      if (f1 !== undefined && f2 !== undefined) {
        const a1 = f1.getValue(obj) as Array<Array<number>>;
        const a2 = f2.getValue(obj) as Array<Array<number>>;
        const r1 = a1.flat<number>(1);
        const r2 = a2.flat<number>(1);
        expect(r1.length).assertEqual(r2.length);
        expect(r1.toString()).assertEqual(r2.toString());
      }else {
        expect().assertFail();
      }
    });
  });
}