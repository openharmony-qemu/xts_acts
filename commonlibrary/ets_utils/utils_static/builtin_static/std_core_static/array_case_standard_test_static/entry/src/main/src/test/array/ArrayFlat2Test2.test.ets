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

class FlatTwoAnimal {
  type: string = 'animal';
}

class FlatTwoDog extends FlatTwoAnimal {
  type: string = 'dog';
}

class FlatTwoCat extends FlatTwoAnimal {
  type: string = 'cat';
}

class FlatTwoPerson {
  id: string = '';
}

class FlatTwoField {
  grid: Array<Array<int>> = new Array<Array<int>>(new Array<int>(1, 2), new Array<int>(3, 4));
}

class FlatTwoGenericHolder<T> {
  data: Array<Array<T>> = new Array<Array<T>>();
}

class FlatTwoCustom {
  arr: Array<Array<int>> = new Array<Array<int>>(new Array<int>(1, 2), new Array<int>(3, 4));
  flat(depth: int): int {
    return -1;
  }
}

export default function ArrayFlat2Test2(): void {
  describe('ArrayFlat2Test2', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_TWO_0100
     * @tc.name testArrayFlat2001
     * @tc.desc Verify flat with int depth flattens nested union typed arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlat2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner1 = new Array<int | string>(1, 'a');
      const inner2 = new Array<int | string>(2, 'b');
      const arr = new Array<Array<int | string>>(inner1, inner2);
      const result: Array<int | string> = arr.flat<int | string>(1);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[3]).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_TWO_0200
     * @tc.name testArrayFlat2002
     * @tc.desc Verify flat with int depth returns new array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlat2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Array<int>(1, 2);
      const arr = new Array<Array<int>>(inner);
      const result: Array<int> = arr.flat<int>(1);
      expect(result === arr).assertFalse();
      expect(result === inner).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_TWO_0300
     * @tc.name testArrayFlat2003
     * @tc.desc Verify flat with int depth 1 on deeply nested array retains deeper nesting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlat2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Array<Array<int>>(new Array<int>(1, 2));
      const arr = new Array<Array<Array<int>>>(inner);
      const result: Array<Array<int>> = arr.flat<Array<int>>(1);
      expect(result.length).assertEqual(1);
      const first = result[0];
      expect(first.length).assertEqual(2);
      expect(first[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_TWO_0400
     * @tc.name testArrayFlat2004
     * @tc.desc Verify flat with int depth on empty nested array returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlat2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Array<int>>();
      const result: Array<int> = arr.flat<int>(1);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_TWO_0500
     * @tc.name testArrayFlat2005
     * @tc.desc Verify flat with int depth 1 flattens single inner array correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlat2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Array<number>(10.5, 20.5, 30.5);
      const arr = new Array<Array<number>>(inner);
      const result: Array<number> = arr.flat<number>(1);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(10.5);
      expect(result[2]).assertEqual(30.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_TWO_0600
     * @tc.name testArrayFlat2006
     * @tc.desc Verify flat with int depth 1 on mixed-length inner arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlat2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner1 = new Array<int>(1);
      const inner2 = new Array<int>(2, 3, 4);
      const arr = new Array<Array<int>>(inner1, inner2);
      const result: Array<int> = arr.flat<int>(1);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_TWO_0700
     * @tc.name testArrayFlat2007
     * @tc.desc Verify flat with int depth 1 concatenates inner arrays: [[1,2],[3,4]] → [1,2,3,4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlat2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Array<int>>();
      const inner1 = new Array<int>(1, 2);
      arr.pushOne(inner1);
      const inner2 = new Array<int>(3, 4);
      arr.pushOne(inner2);
      const result: Array<int> = arr.flat<int>(1);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_TWO_0800
     * @tc.name testArrayFlat2008
     * @tc.desc Verify flat(depth:int) on instance field nested array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlat2008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FlatTwoField();
      const d: int = 1;
      const result = obj.grid.flat<int>(d);
      expect(result.length).assertEqual(4);
      expect(result[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_TWO_0900
     * @tc.name testArrayFlat2009
     * @tc.desc Verify flat(int depth=2) on nested Array<Array<Array<int>>>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlat2009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Array<Array<int>>(new Array<int>(1, 2));
      const arr = new Array<Array<Array<int>>>(inner);
      const d: int = 2;
      const result = arr.flat<int>(d);
      expect(result.length).assertEqual(2);
      expect(result[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_TWO_1000
     * @tc.name testArrayFlat2010
     * @tc.desc Verify flat(int depth=0) keeps nesting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlat2010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Array<int>>(new Array<int>(1, 2));
      const d: int = 0;
      const result = arr.flat<Array<int>>(d);
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_TWO_1100
     * @tc.name testArrayFlat2011
     * @tc.desc Verify flat(int depth=MAX) fully flattens shallow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlat2011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Array<int>>(new Array<int>(1, 2), new Array<int>(3, 4));
      const d: int = 2147483647;
      const result = arr.flat<int>(d);
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_TWO_1200
     * @tc.name testArrayFlat2012
     * @tc.desc Verify flat(int depth=1) shallow copy object references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlat2012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p = new FlatTwoPerson();
      p.id = 'shallow';
      const arr = new Array<Array<FlatTwoPerson>>(new Array<FlatTwoPerson>(p));
      const d: int = 1;
      const result = arr.flat<FlatTwoPerson>(d);
      expect(result[0]).assertEqual(p);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_TWO_1300
     * @tc.name testArrayFlat2013
     * @tc.desc Verify flat(int depth=1) on polymorphic nested array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlat2013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dog = new FlatTwoDog();
      const cat = new FlatTwoCat();
      const arr = new Array<Array<FlatTwoAnimal>>(new Array<FlatTwoAnimal>(dog), new Array<FlatTwoAnimal>(cat));
      const d: int = 1;
      const result = arr.flat<FlatTwoAnimal>(d);
      expect(result.length).assertEqual(2);
      expect(result[0].type).assertEqual('dog');
      expect(result[1].type).assertEqual('cat');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_TWO_1400
     * @tc.name testArrayFlat2014
     * @tc.desc Verify flat(int depth=1) on generic nested field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlat2014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const holder = new FlatTwoGenericHolder<number>();
      holder.data = new Array<Array<number>>(new Array<number>(100, 200));
      const d: int = 1;
      const result = holder.data.flat<number>(d);
      expect(result.length).assertEqual(2);
      expect(result[1]).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_TWO_1500
     * @tc.name testArrayFlat2015
     * @tc.desc Verify custom flat(int) does not conflict with Array.flat(int)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlat2015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FlatTwoCustom();
      const d: int = 2;
      const custom = obj.flat(d);
      expect(custom).assertEqual(-1);
      const real = obj.arr.flat<int>(d);
      expect(real.length).assertEqual(4);
      expect(real[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_TWO_1600
     * @tc.name testArrayFlat2016
     * @tc.desc Verify flat(int depth=1) on nested array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlat2016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Array<int>(1, 2, 3);
      const arr = new Array<Array<int>>(inner);
      const d: int = 1;
      const result = arr.flat<int>(d);
      expect(result.length).assertEqual(3);
      expect(result[2]).assertEqual(3);
    });
  });
}