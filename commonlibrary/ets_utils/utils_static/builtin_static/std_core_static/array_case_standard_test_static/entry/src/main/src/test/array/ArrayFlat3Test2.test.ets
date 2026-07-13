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

class FlatThreePerson {
  id: string = '';
  name: string = '';
}

class FlatThreeAnimal {
  type: string = 'animal';
}

class FlatThreeDog extends FlatThreeAnimal {
  type: string = 'dog';
}

class FlatThreeCat extends FlatThreeAnimal {
  type: string = 'cat';
}

class FlatThreeField {
  data: Array<Array<int>> = new Array<Array<int>>(new Array<int>(1, 2), new Array<int>(3, 4));
}

class FlatThreeStaticField {
  static grid: Array<Array<number>> = new Array<Array<number>>(new Array<number>(5.5, 6.5), new Array<number>(7.5, 8.5));
}

class FlatThreeReadonlyField {
  readonly nested: Array<Array<number>> = new Array<Array<number>>(new Array<number>(10, 20), new Array<number>(30, 40));
}

class FlatThreePrivateField {
  matrix: Array<Array<string>> = new Array<Array<string>>(new Array<string>('a', 'b'), new Array<string>('c', 'd'));
}

class FlatThreeGenericHolder<T> {
  data: Array<Array<T>> = new Array<Array<T>>();
}

class FlatThreeCustom {
  arr: Array<Array<number>> = new Array<Array<number>>(new Array<number>(1, 2), new Array<number>(3, 4));
  flat(): number {
    return -2;
  }
}

export default function ArrayFlat3Test2(): void {
  describe('ArrayFlat3Test2', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_0100
     * @tc.name testArrayFlat3001
     * @tc.desc Verify flat() on nested int matrix returns flattened result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlat3001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner1 = new Array<int>(1, 2, 3);
      const inner2 = new Array<int>(4, 5, 6);
      const arr = new Array<Array<int>>(inner1, inner2);
      const result: Array<int> = arr.flat<int>();
      expect(result.length).assertEqual(6);
      expect(result[0]).assertEqual(1);
      expect(result[5]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_0200
     * @tc.name testArrayFlat3002
     * @tc.desc Verify flat() on union typed nested arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlat3002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner1 = new Array<int | string>(1, 'two');
      const inner2 = new Array<int | string>(3, 'four');
      const arr = new Array<Array<int | string>>(inner1, inner2);
      const result: Array<int | string> = arr.flat<int | string>();
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual('two');
      expect(result[3]).assertEqual('four');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_0300
     * @tc.name testArrayFlat3003
     * @tc.desc Verify flat() on nested array with single inner element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlat3003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Array<number>(42.5);
      const arr = new Array<Array<number>>(inner);
      const result: Array<number> = arr.flat<number>();
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(42.5);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_0400
     * @tc.name testArrayFlat3004
     * @tc.desc Verify flat() chained with filter filters flattened result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlat3004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner1 = new Array<int>(1, 2, 3);
      const inner2 = new Array<int>(4, 5, 6);
      const arr = new Array<Array<int>>(inner1, inner2);
      const flatResult: Array<int> = arr.flat<int>();
      const result = flatResult.filter((v: int): boolean => v % 2 === 0);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(2);
      expect(result[2]).assertEqual(6);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_0500
     * @tc.name testArrayFlat3005
     * @tc.desc Verify flat() on instance field nested int array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlat3005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FlatThreeField();
      const result = obj.data.flat<int>();
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_0600
     * @tc.name testArrayFlat3006
     * @tc.desc Verify flat() on static field nested double array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlat3006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = FlatThreeStaticField.grid.flat<number>();
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(5.5);
      expect(result[3]).assertEqual(8.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_0700
     * @tc.name testArrayFlat3007
     * @tc.desc Verify flat() on readonly nested array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlat3007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FlatThreeReadonlyField();
      const result = obj.nested.flat<number>();
      expect(result.length).assertEqual(4);
      expect(result[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_0800
     * @tc.name testArrayFlat3008
     * @tc.desc Verify flat() on public field via Class reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlat3008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FlatThreePrivateField();
      const clazz = Class.of(obj);
      const field = clazz.getInstanceField('matrix');
      if (field !== undefined) {
        const arr = field.getValue(obj) as Array<Array<string>>;
        const result = arr.flat<string>();
        expect(result.length).assertEqual(4);
        expect(result[3]).assertEqual('d');
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_0900
     * @tc.name testArrayFlat3009
     * @tc.desc Verify flat() on generic nested array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlat3009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const holder = new FlatThreeGenericHolder<number>();
      holder.data = new Array<Array<number>>(new Array<number>(100, 200), new Array<number>(300));
      const result = holder.data.flat<number>();
      expect(result.length).assertEqual(3);
      expect(result[2]).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_1000
     * @tc.name testArrayFlat3010
     * @tc.desc Verify flat() shallow copy preserves object references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlat3010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p = new FlatThreePerson();
      p.id = 'ref';
      const arr = new Array<Array<FlatThreePerson>>(new Array<FlatThreePerson>(p));
      const result = arr.flat<FlatThreePerson>();
      expect(result[0]).assertEqual(p);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_1100
     * @tc.name testArrayFlat3011
     * @tc.desc Verify flat() on polymorphic nested
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlat3011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dog = new FlatThreeDog();
      const cat = new FlatThreeCat();
      const arr = new Array<Array<FlatThreeAnimal>>(new Array<FlatThreeAnimal>(dog), new Array<FlatThreeAnimal>(cat));
      const result = arr.flat<FlatThreeAnimal>();
      expect(result.length).assertEqual(2);
      expect(result[0].type).assertEqual('dog');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_1200
     * @tc.name testArrayFlat3012
     * @tc.desc Verify custom flat() does not conflict with Array.flat()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlat3012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FlatThreeCustom();
      const custom = obj.flat();
      expect(custom).assertEqual(-2);
      const real = obj.arr.flat<number>();
      expect(real.length).assertEqual(4);
      expect(real[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_1300
     * @tc.name testArrayFlat3013
     * @tc.desc Verify flat() on nested array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlat3013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Array<number>(1, 2, 3);
      const arr = new Array<Array<number>>(inner);
      const result = arr.flat<number>();
      expect(result.length).assertEqual(3);
      expect(result[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_1400
     * @tc.name testArrayFlat3014
     * @tc.desc Verify flat() on nested array: [[1,2],[3,4]] → [1,2,3,4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlat3014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner1 = new Array<number>(1, 2);
      const inner2 = new Array<number>(3, 4);
      const arr = new Array<Array<number>>(inner1, inner2);
      const result = arr.flat<number>();
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[3]).assertEqual(4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_1500
     * @tc.name testArrayFlat3015
     * @tc.desc Verify flat().at(-1) gets last flattened element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlat3015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Array<number>>(new Array<number>(1, 2), new Array<number>(3, 4));
      const last = arr.flat<number>().at(-1);
      expect(last).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_1600
     * @tc.name testArrayFlat3016
     * @tc.desc Verify flat().filter() works
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlat3016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Array<number>>(new Array<number>(1, 2), new Array<number>(3, 4));
      const filtered = arr.flat<number>().filter((v: number): boolean => v % 2 === 0);
      expect(filtered.length).assertEqual(2);
      expect(filtered[0]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_1700
     * @tc.name testArrayFlat3017
     * @tc.desc Verify flat() preserves bigint values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlat3017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Array<bigint>>(new Array<bigint>(10n, 20n));
      const result = arr.flat<bigint>();
      expect(result.length).assertEqual(2);
      expect(result[1]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_1800
     * @tc.name testArrayFlat3018
     * @tc.desc Verify flat() on char nested array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlat3018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Array<char>>(new Array<char>(c'a', c'b'), new Array<char>(c'c', c'd'));
      const result = arr.flat<char>();
      expect(result.length).assertEqual(4);
      expect(result[3]).assertEqual(c'd');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_1900
     * @tc.name testArrayFlat3019
     * @tc.desc Verify flat() on nested with null and undefined preserved: [1,null] + [undefined,2] → [1,null,undefined,2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlat3019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner1 = new Array<number | null | undefined>(1, null);
      const inner2 = new Array<number | null | undefined>(undefined, 2);
      const arr = new Array<Array<number | null | undefined>>(inner1, inner2);
      const result = arr.flat<number | null | undefined>();
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertNull();
      expect(result[2]).assertUndefined();
      expect(result[3]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_2000
     * @tc.name testArrayFlat3020
     * @tc.desc Verify flat() on nested with NaN/Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlat3020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Array<number>>(new Array<number>(Double.NaN, Double.POSITIVE_INFINITY));
      const result = arr.flat<number>();
      expect(result.length).assertEqual(2);
      expect(isNaN(result[0])).assertTrue();
      expect(result[1]).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_2100
     * @tc.name testArrayFlat3021
     * @tc.desc Verify multi-field flat() consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlat3021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FlatThreeField();
      const clazz = Class.of(obj);
      const f1 = clazz.getInstanceField('data');
      const f2 = clazz.getInstanceField('data');
      if (f1 !== undefined && f2 !== undefined) {
        const a1 = f1.getValue(obj) as Array<Array<int>>;
        const a2 = f2.getValue(obj) as Array<Array<int>>;
        expect(a1.flat<int>().toString()).assertEqual(a2.flat<int>().toString());
      }else {
        expect().assertFail();
      }
    });
  });
}