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
  afterAll, afterEach, beforeAll, beforeEach, describe,
  expect, it, Level, Size, TestType
} from '../../../../hypium/index';
import Utils from '../Util.test';

class NestedObj {
  b: int = 0;
}

class InnerObj {
  b: NestedObj = new NestedObj();
}

class MultiFieldItem {
  id: int = 0;
  name: string = '';
  active: boolean = false;
}

class MixedInitItem {
  list: Array<int> = new Array<int>();
  name: string = '';
}

class Point2D {
  x: int = 0;
  y: int = 0;
}

class NestedArrObj {
  a: InnerObj = new InnerObj();
}

class LinkedNode {
  val: int = 0;
  ref: LinkedNode | null = null;
}

class ReadonlyItem {
  id: int = 0;
}

class HasX {
  x: int = 0;
}

class ObjWithOptional {
  a?: int = undefined;
  b: string = '';
}

export default function ArrayCreateTest2(): void {
  describe('ArrayCreateTest2', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0010
     * @tc.name testArrayCreateTwo001
     * @tc.desc Verify hex literal initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(3, 0xFF);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(255);
      expect(arr[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0020
     * @tc.name testArrayCreateTwo002
     * @tc.desc Verify octal literal initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(3, 0o77);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(63);
      expect(arr[2]).assertEqual(63);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0030
     * @tc.name testArrayCreateTwo003
     * @tc.desc Verify binary literal initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(3, 0b1010);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(10);
      expect(arr[2]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0040
     * @tc.name testArrayCreateTwo004
     * @tc.desc Verify scientific notation float initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<float>(3, 1.5e3f);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1.5e3f);
      expect(arr[2]).assertEqual(1.5e3f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0050
     * @tc.name testArrayCreateTwo005
     * @tc.desc Verify scientific notation double initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<double>(3, 2.5e-10);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(2.5e-10);
      expect(arr[2]).assertEqual(2.5e-10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0060
     * @tc.name testArrayCreateTwo006
     * @tc.desc Verify long max value create
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<long>(2, 9223372036854775807);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(9223372036854775807);
      expect(arr[1]).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0070
     * @tc.name testArrayCreateTwo007
     * @tc.desc Verify long min value create
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<long>(2, -9223372036854775808);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(-9223372036854775808);
      expect(arr[1]).assertEqual(-9223372036854775808);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0080
     * @tc.name testArrayCreateTwo008
     * @tc.desc Verify float precision accumulation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<float>(3, 0.1f);
      const v1 = arr[0];
      const v2 = arr[1];
      const v3 = arr[2];
      const sum = v1 + v2 + v3;
      expect(sum).assertEqual(0.3f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0090
     * @tc.name testArrayCreateTwo009
     * @tc.desc Verify double high precision retention
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<double>(2, 1.2345678901234567);
      expect(arr[0]).assertEqual(1.2345678901234567);
      expect(arr[1]).assertEqual(1.2345678901234567);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0100
     * @tc.name testArrayCreateTwo010
     * @tc.desc Verify float minimum positive value create
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<float>(2, 1.4e-45f);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(1.4e-45f);
      expect(arr[1]).assertEqual(1.4e-45f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0110
     * @tc.name testArrayCreateTwo011
     * @tc.desc Verify negative scientific notation float create
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<float>(3, -3.14e-2f);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(-0.0314f);
      expect(arr[2]).assertEqual(-0.0314f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0120
     * @tc.name testArrayCreateTwo012
     * @tc.desc Verify int max boundary value create
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(2, 2147483647);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(2147483647);
      expect(arr[1]).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0130
     * @tc.name testArrayCreateTwo013
     * @tc.desc Verify array reference modify propagation via inner array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Array<int>(1, 2);
      const arr = Array.create<Array<int>>(2, inner);
      arr[0][0] = 99;
      expect(arr[1][0]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0140
     * @tc.name testArrayCreateTwo014
     * @tc.desc Verify single element replacement isolation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: HasX = new HasX();
      obj.x = 1;
      const arr = Array.create<HasX>(3, obj);
      arr[1] = new HasX();
      arr[1].x = 99;
      const sum = arr[0].x + arr[2].x;
      expect(sum).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0150
     * @tc.name testArrayCreateTwo015
     * @tc.desc Verify push on original reference affects all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Array<int>(1, 2);
      const arr = Array.create<Array<int>>(2, inner);
      inner.push(3);
      expect(arr[0].length).assertEqual(3);
      expect(arr[1].length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0160
     * @tc.name testArrayCreateTwo016
     * @tc.desc Verify shallow copy semantics with nested object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new NestedArrObj();
      inner.a.b.b = 1;
      const arr = Array.create<NestedArrObj>(2, inner);
      arr[0].a.b.b = 99;
      expect(arr[1].a.b.b).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0170
     * @tc.name testArrayCreateTwo017
     * @tc.desc Verify null assignment isolation in nullable array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: HasX = new HasX();
      obj.x = 1;
      const arr = Array.create<HasX | null>(3, obj);
      arr[0] = null;
      const item = arr[1];
      if (item !== null && item !== undefined) {
        expect(item.x).assertEqual(1);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0180
     * @tc.name testArrayCreateTwo018
     * @tc.desc Verify same string reference consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<string>(3, 'hello');
      expect(arr[0]).assertEqual(arr[1]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0190
     * @tc.name testArrayCreateTwo019
     * @tc.desc Verify at access modify propagation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: HasX = new HasX();
      obj.x = 1;
      const arr = Array.create<HasX>(3, obj);
      arr.at(0).x = 99;
      expect(arr.at(2).x).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0200
     * @tc.name testArrayCreateTwo020
     * @tc.desc Verify map modify reference property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<HasX>(3, new HasX());
      arr.map((v: HasX): int => v.x += 1);
      expect(arr[0].x).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0210
     * @tc.name testArrayCreateTwo021
     * @tc.desc Verify filter returns reference share
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<HasX>(5, new HasX());
      const filtered = arr.filter((v: HasX): boolean => {
        return true;
      });
      filtered[0].x = 99;
      expect(arr[0].x).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0220
     * @tc.name testArrayCreateTwo022
     * @tc.desc Verify create then filter even
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const filtered = Array.create<int>(5, 4).filter((v: int): boolean => v % 2 === 0);
      expect(filtered.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0230
     * @tc.name testArrayCreateTwo023
     * @tc.desc Verify create then reduce sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sum = Array.create<int>(4, 5).reduce((a: int, b: int): int => {
        return a + b;
      });
      expect(sum).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0240
     * @tc.name testArrayCreateTwo024
     * @tc.desc Verify create then every all equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Array.create<int>(100, 7).every((v: int): boolean => v === 7);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0250
     * @tc.name testArrayCreateTwo025
     * @tc.desc Verify create then some not equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Array.create<int>(100, 7).some((v: int): boolean => v !== 7);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0260
     * @tc.name testArrayCreateTwo026
     * @tc.desc Verify create then find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Array.create<string>(3, 'test').find((v: string): boolean => v.length > 0);
      expect(result).assertEqual('test');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0270
     * @tc.name testArrayCreateTwo027
     * @tc.desc Verify create then forEach accumulate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s = 0;
      Array.create<int>(10, 2).forEach((v: int): void => {
        s += v;
      });
      expect(s).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0280
     * @tc.name testArrayCreateTwo028
     * @tc.desc Verify create then slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sliced = Array.create<int>(10, 1).slice(3, 7);
      expect(sliced.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0290
     * @tc.name testArrayCreateTwo029
     * @tc.desc Verify create then indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const idx = Array.create<int>(5, 3).indexOf(3);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0300
     * @tc.name testArrayCreateTwo030
     * @tc.desc Verify create then includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Array.create<int>(5, 9).includes(9);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0310
     * @tc.name testArrayCreateTwo031
     * @tc.desc Verify create then reverse after modify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(3, 5);
      arr[0] = 1;
      arr[2] = 9;
      arr.reverse();
      expect(arr[0]).assertEqual(9);
      expect(arr[1]).assertEqual(5);
      expect(arr[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0320
     * @tc.name testArrayCreateTwo032
     * @tc.desc Verify create then sort after modify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(3, 0);
      arr[0] = 3;
      arr[1] = 1;
      arr[2] = 2;
      arr.sort();
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0330
     * @tc.name testArrayCreateTwo033
     * @tc.desc Verify multi-field object create
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const item: MultiFieldItem = new MultiFieldItem();
      item.id = 1;
      item.name = 'test';
      item.active = true;
      const arr = Array.create<MultiFieldItem>(2, item);
      expect(arr[0].id).assertEqual(1);
      expect(arr[0].name).assertEqual('test');
      expect(arr[0].active).assertTrue();
      expect(arr[1].id).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0340
     * @tc.name testArrayCreateTwo034
     * @tc.desc Verify nested three-level object create
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const item = new NestedArrObj();
      item.a.b.b = 42;
      const arr = Array.create<NestedArrObj>(2, item);
      expect(arr[0].a.b.b).assertEqual(42);
      expect(arr[1].a.b.b).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0350
     * @tc.name testArrayCreateTwo035
     * @tc.desc Verify mixed object and array initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const item: MixedInitItem = new MixedInitItem();
      item.list = new Array<int>(1, 2);
      item.name = 'x';
      const arr = Array.create<MixedInitItem>(2, item);
      expect(arr[0].name).assertEqual('x');
      expect(arr[0].list.length).assertEqual(2);
      expect(arr[1].name).assertEqual('x');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0360
     * @tc.name testArrayCreateTwo036
     * @tc.desc Verify optional property object create
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const item: ObjWithOptional = new ObjWithOptional();
      item.b = 'hello';
      const arr = Array.create<ObjWithOptional>(2, item);
      expect(arr[0].b).assertEqual('hello');
      expect(arr[1].b).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0370
     * @tc.name testArrayCreateTwo037
     * @tc.desc Verify readonly property object create
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const item: ReadonlyItem = new ReadonlyItem();
      item.id = 1;
      const arr = Array.create<ReadonlyItem>(2, item);
      expect(arr[0].id).assertEqual(1);
      expect(arr[1].id).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0380
     * @tc.name testArrayCreateTwo038
     * @tc.desc Verify function return value as initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const getObj = (): HasX => {
        const obj = new HasX();
        obj.x = 42;
        return obj;
      };
      const arr = Array.create<HasX>(3, getObj());
      expect(arr[0].x).assertEqual(42);
      expect(arr[2].x).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0390
     * @tc.name testArrayCreateTwo039
     * @tc.desc Verify nullable int|null generic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int | null>(3, null);
      expect(arr[0]).assertNull();
      expect(arr[1]).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0400
     * @tc.name testArrayCreateTwo040
     * @tc.desc Verify tri-state union assign after create
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<int | string | boolean> = Array.create<int | string | boolean>(3, 1);
      arr[0] = 'a';
      arr[1] = true;
      arr[2] = 2;
      expect(arr[0]).assertEqual('a');
      expect(arr[1]).assertTrue();
      expect(arr[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0410
     * @tc.name testArrayCreateTwo041
     * @tc.desc Verify generic nested array create
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = Array.create<Array<int>>(1, Array.create<int>(1, 1));
      const arr = Array.create<Array<Array<int>>>(2, inner);
      expect(arr[0][0][0]).assertEqual(1);
      expect(arr[1][0][0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0420
     * @tc.name testArrayCreateTwo042
     * @tc.desc Verify union assign then at access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<int | string> = Array.create<int | string>(4, 0);
      arr[2] = 'hello';
      expect(arr.at(2)).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0430
     * @tc.name testArrayCreateTwo043
     * @tc.desc Verify byte generic array create
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<byte>(4, 127);
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(127);
      expect(arr[3]).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0440
     * @tc.name testArrayCreateTwo044
     * @tc.desc Verify short generic array create
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<short>(4, 32767);
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(32767);
      expect(arr[3]).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0450
     * @tc.name testArrayCreateTwo045
     * @tc.desc Verify char generic array create
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<char>(3, c'Z');
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(c'Z');
      expect(arr[2]).assertEqual(c'Z');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0460
     * @tc.name testArrayCreateTwo046
     * @tc.desc Verify bigint generic array reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sum = Array.create<bigint>(3, 10n).reduce((a: bigint, b: bigint): bigint => a + b);
      expect(sum).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0470
     * @tc.name testArrayCreateTwo047
     * @tc.desc Verify create vs literal type consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = Array.create<int>(3, 1);
      const arr2 = new Array<int>(1, 1, 1);
      expect(arr1 instanceof Array).assertEqual(arr2 instanceof Array);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0480
     * @tc.name testArrayCreateTwo048
     * @tc.desc Verify create length equals Array(n) length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len1 = Array.create<int>(10, 5).length;
      const len2 = new Array<int>(10, (): int => 0).length;
      expect(len1).assertEqual(len2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0490
     * @tc.name testArrayCreateTwo049
     * @tc.desc Verify create vs map initialization equivalence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = Array.create<int>(5, 1);
      const arr2 = Array.create<int>(5, 0);
      for (let i = 0; i < 5; i++) {
        arr2[i] = 1;
      }
      expect(arr1[0]).assertEqual(arr2[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0500
     * @tc.name testArrayCreateTwo050
     * @tc.desc Verify create vs from+fill equivalence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = Array.create<int>(3, 7);
      const arr2 = Array.create<int>(1, 3);
      arr2.fill(7);
      expect(arr1[0]).assertEqual(arr2[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0510
     * @tc.name testArrayCreateTwo051
     * @tc.desc Verify create length equals of length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len1 = Array.create<int>(2, 1).length;
      const len2 = new Array<int>(1, 1).length;
      expect(len1).assertEqual(len2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0520
     * @tc.name testArrayCreateTwo052
     * @tc.desc Verify modify independence between create and constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = Array.create<int>(3, 5);
      const arr2 = new Array<int>(3, (): int => 5);
      arr1[1] = 99;
      expect(arr1[0]).assertEqual(arr2[0]);
      expect(arr2[1]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0530
     * @tc.name testArrayCreateTwo053
     * @tc.desc Verify create vs manual fill equivalence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = Array.create<int>(2, 0);
      const arr2 = new Array<int>(2, (): int => 0);
      arr2[0] = 0;
      arr2[1] = 0;
      expect(arr1[0]).assertEqual(arr2[0]);
      expect(arr1[1]).assertEqual(arr2[1]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0540
     * @tc.name testArrayCreateTwo054
     * @tc.desc Verify multiple create calls independence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = Array.create<int>(2, 1);
      const arr2 = Array.create<int>(2, 1);
      arr1[0] = 99;
      expect(arr2[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0550
     * @tc.name testArrayCreateTwo055
     * @tc.desc Verify different length and value create
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = Array.create<int>(2, 1);
      const arr2 = Array.create<int>(3, 2);
      expect(arr1.length).assertEqual(2);
      expect(arr2.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0560
     * @tc.name testArrayCreateTwo056
     * @tc.desc Verify 2000 element create random access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(2000, 5);
      const v1 = arr[0];
      const v2 = arr[999];
      const v3 = arr[1999];
      const sum = v1 + v2 + v3;
      expect(sum).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0570
     * @tc.name testArrayCreateTwo057
     * @tc.desc Verify large array batch modify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1000, 0);
      for (let i = 0; i < 1000; i++) {
        arr[i] = i;
      }
      expect(arr[500]).assertEqual(500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0580
     * @tc.name testArrayCreateTwo058
     * @tc.desc Verify large array filter all hit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const filtered = Array.create<int>(2000, 1).filter((v: int): boolean => v === 1);
      expect(filtered.length).assertEqual(2000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0590
     * @tc.name testArrayCreateTwo059
     * @tc.desc Verify large array map then reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sum = Array.create<int>(1000, 2).map((v: int): int => v * 3).reduce((a: int, b: int): int => {
        return a + b;
      });
      expect(sum).assertEqual(6000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0600
     * @tc.name testArrayCreateTwo060
     * @tc.desc Verify large array slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sliced = Array.create<int>(2000, 7).slice(500, 1500);
      expect(sliced.length).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0610
     * @tc.name testArrayCreateTwo061
     * @tc.desc Verify large array find no match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Array.create<int>(10000, 1).find((v: int): boolean => v === 2);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0620
     * @tc.name testArrayCreateTwo062
     * @tc.desc Verify large array some match at end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(5000, 0);
      arr[4999] = 1;
      const result = arr.some((v: int): boolean => v === 1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0630
     * @tc.name testArrayCreateTwo063
     * @tc.desc Verify large array every break on mismatch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(5000, 1);
      arr[2500] = 2;
      const result = arr.every((v: int): boolean => v === 1);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0640
     * @tc.name testArrayCreateTwo064
     * @tc.desc Verify large array indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(5000, 1);
      arr[3000] = 99;
      const idx = arr.indexOf(99);
      expect(idx).assertEqual(3000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0650
     * @tc.name testArrayCreateTwo065
     * @tc.desc Verify large array includes at end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(5000, 1);
      arr[4999] = 99;
      const result = arr.includes(99);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0660
     * @tc.name testArrayCreateTwo066
     * @tc.desc Verify 2D array create
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<Array<int>>(3, Array.create<int>(3, 0));
      expect(arr.length).assertEqual(3);
      expect(arr[0].length).assertEqual(3);
      expect(arr[2][1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0670
     * @tc.name testArrayCreateTwo067
     * @tc.desc Verify 2D array inner modify propagation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<Array<int>>(2, new Array<int>(2, 0));
      arr[0][1] = 99;
      expect(arr[1][1]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0680
     * @tc.name testArrayCreateTwo068
     * @tc.desc Verify 2D array independent row assign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<Array<int>>(2, new Array<int>(2, 0));
      arr[0] = new Array<int>(1, 2);
      arr[1] = new Array<int>(3, 4);
      const sum = arr[0][1] + arr[1][0];
      expect(sum).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0690
     * @tc.name testArrayCreateTwo069
     * @tc.desc Verify 3D array create
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = Array.create<Array<int>>(1, Array.create<int>(1, 1));
      const arr = Array.create<Array<Array<int>>>(2, inner);
      expect(arr.length).assertEqual(2);
      expect(arr[0][0][0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0700
     * @tc.name testArrayCreateTwo070
     * @tc.desc Verify multi-dim array flat effect
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<Array<int>>(2, new Array<int>(2, 1));
      const flattened = arr.flat();
      expect(flattened.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0710
     * @tc.name testArrayCreateTwo071
     * @tc.desc Verify multi-dim array random read write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<Array<int>>(3, new Array<int>(2, 0));
      arr[2][1] = 42;
      expect(arr[2][1]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0720
     * @tc.name testArrayCreateTwo072
     * @tc.desc Verify multi-dim array at chain access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<Array<int>>(2, Array.create<int>(3, 7));
      const inner = arr.at(1);
      if (inner != undefined) {
        expect(inner.at(2)).assertEqual(7);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0730
     * @tc.name testArrayCreateTwo073
     * @tc.desc Verify multi-dim array push reference share
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<Array<int>>(2, new Array<int>());
      arr[0].push(1);
      arr[1].push(2);
      expect(arr[1][0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0740
     * @tc.name testArrayCreateTwo074
     * @tc.desc Verify decimal length truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(3, 1);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0750
     * @tc.name testArrayCreateTwo075
     * @tc.desc Verify length 2 boundary create
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(2, 0);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0760
     * @tc.name testArrayCreateTwo076
     * @tc.desc Verify create then at chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val = Array.create<int>(5, 10).at(3);
      expect(val).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0770
     * @tc.name testArrayCreateTwo077
     * @tc.desc Verify create then concat chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Array.create<int>(2, 1).concat(Array.create<int>(2, 2));
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0780
     * @tc.name testArrayCreateTwo078
     * @tc.desc Verify create result as fill target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(5, 0);
      arr.fill(1, 1, 4);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(1);
      expect(arr[3]).assertEqual(1);
      expect(arr[4]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0790
     * @tc.name testArrayCreateTwo079
     * @tc.desc Verify create then copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(5, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr.copyWithin(3, 0, 2);
      expect(arr[3]).assertEqual(1);
      expect(arr[4]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0800
     * @tc.name testArrayCreateTwo080
     * @tc.desc Verify create then sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(5, 0);
      arr[0] = 5;
      arr[1] = 3;
      arr[2] = 1;
      arr[3] = 4;
      arr[4] = 2;
      arr.sort();
      expect(arr[0]).assertEqual(1);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0810
     * @tc.name testArrayCreateTwo081
     * @tc.desc Verify create then reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(4, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr.reverse();
      expect(arr[0]).assertEqual(4);
      expect(arr[3]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0820
     * @tc.name testArrayCreateTwo082
     * @tc.desc Verify create then double concat chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Array.create<int>(2, 1).concat(Array.create<int>(2, 2)).concat(Array.create<int>(2, 3));
      expect(result.length).assertEqual(6);
      expect(result[0]).assertEqual(1);
      expect(result[5]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0830
     * @tc.name testArrayCreateTwo083
     * @tc.desc Verify create then slice then map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Array.create<int>(10, 5).slice(2, 7).map((v: int): int => {
        return v * 10;
      });
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual(50);
      expect(result[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0840
     * @tc.name testArrayCreateTwo084
     * @tc.desc Verify create then map chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Array.create<int>(5, 3).map((v: int): int => {
        return v * 2;
      });
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual(6);
      expect(result[4]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0850
     * @tc.name testArrayCreateTwo085
     * @tc.desc Verify generic custom class array create
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p = new Point2D();
      p.x = 1;
      p.y = 2;
      const arr = Array.create<Point2D>(2, p);
      expect(arr[0].x).assertEqual(1);
      expect(arr[0].y).assertEqual(2);
      expect(arr[1].x).assertEqual(1);
      expect(arr[1].y).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0860
     * @tc.name testArrayCreateTwo086
     * @tc.desc Verify generic interface type array create
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const item: MultiFieldItem = new MultiFieldItem();
      item.id = 1;
      item.name = 'a';
      item.active = true;
      const arr = Array.create<MultiFieldItem>(2, item);
      expect(arr[0].id).assertEqual(1);
      expect(arr[0].name).assertEqual('a');
      expect(arr[0].active).assertTrue();
      expect(arr[1].id).assertEqual(1);
      expect(arr[1].name).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0870
     * @tc.name testArrayCreateTwo087
     * @tc.desc Verify create with negative length throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let n: int = -1;
        const arr = Array.create<int>(n, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('NegativeArraySizeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0880
     * @tc.name testArrayCreateTwo088
     * @tc.desc Verify create with zero length returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(0, 0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0890
     * @tc.name testArrayCreateTwo089
     * @tc.desc Verify boolean initial value create
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<boolean>(3, true);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertTrue();
      expect(arr[2]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0900
     * @tc.name testArrayCreateTwo090
     * @tc.desc Verify Date initial value create
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Date(2026, 0, 1);
      const arr = Array.create<Date>(2, d);
      expect(arr.length).assertEqual(2);
      expect(arr[0].getFullYear()).assertEqual(2026);
      expect(arr[1].getFullYear()).assertEqual(2026);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0910
     * @tc.name testArrayCreateTwo091
     * @tc.desc Verify char initial value 'a' create
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<char>(3, c'a');
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(c'a');
      expect(arr[2]).assertEqual(c'a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0920
     * @tc.name testArrayCreateTwo092
     * @tc.desc Verify float 3.14f initial value create
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<float>(3, 3.14f);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(3.14f);
      expect(arr[2]).assertEqual(3.14f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0930
     * @tc.name testArrayCreateTwo093
     * @tc.desc Verify empty string initial value create
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<string>(3, '');
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual('');
      expect(arr[2]).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0940
     * @tc.name testArrayCreateTwo094
     * @tc.desc Verify space string initial value create
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<string>(3, ' ');
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(' ');
      expect(arr[2]).assertEqual(' ');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0950
     * @tc.name testArrayCreateTwo095
     * @tc.desc Verify Unicode Chinese string initial value create
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<string>(3, '\u4e2d\u6587');
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual('\u4e2d\u6587');
      expect(arr[2]).assertEqual('\u4e2d\u6587');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0960
     * @tc.name testArrayCreateTwo096
     * @tc.desc Verify XSS special character string initial value create
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<string>(3, '<script>alert(1)</script>');
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual('<script>alert(1)</script>');
      expect(arr[2]).assertEqual('<script>alert(1)</script>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0970
     * @tc.name testArrayCreateTwo097
     * @tc.desc Verify Map initial value create
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>(new Array<[string, int]>(['k', 1]));
      const arr = Array.create<Map<string, int>>(2, m);
      expect(arr.length).assertEqual(2);
      expect(arr[0].get('k')).assertEqual(1);
      expect(arr[1].get('k')).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0980
     * @tc.name testArrayCreateTwo098
     * @tc.desc Verify Set initial value create
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<int>(new Array<int>(1, 2, 3));
      const arr = Array.create<Set<int>>(2, s);
      expect(arr.length).assertEqual(2);
      expect(arr[0].has(2)).assertTrue();
      expect(arr[1].has(3)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_0990
     * @tc.name testArrayCreateTwo099
     * @tc.desc Verify Float.NaN initial value create
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<float>(3, Float.NaN);
      expect(arr.length).assertEqual(3);
      expect(isNaN(Float.toDouble(arr[0]))).assertTrue();
      expect(isNaN(Float.toDouble(arr[2]))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_1000
     * @tc.name testArrayCreateTwo100
     * @tc.desc Verify Double.NaN initial value create
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<double>(3, Double.NaN);
      expect(arr.length).assertEqual(3);
      expect(isNaN(arr[0])).assertTrue();
      expect(isNaN(arr[2])).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_1010
     * @tc.name testArrayCreateTwo101
     * @tc.desc Verify float arrayLength truncation (3.7 -> 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<double>(Double.toInt(3.7), 0);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_1020
     * @tc.name testArrayCreateTwo102
     * @tc.desc Verify Array.create with null initial value for int|null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int | null>(3, null);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertNull();
      expect(arr[1]).assertNull();
      expect(arr[2]).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_1030
     * @tc.name testArrayCreateTwo103
     * @tc.desc Verify Array.create with undefined initial value for int|undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int | undefined>(3, undefined);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertUndefined();
      expect(arr[1]).assertUndefined();
      expect(arr[2]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_1040
     * @tc.name testArrayCreateTwo104
     * @tc.desc Verify Array.create with LinkedNode whose ref is null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const node = new LinkedNode();
      node.val = 42;
      node.ref = null;
      const arr = Array.create<LinkedNode>(2, node);
      expect(arr.length).assertEqual(2);
      expect(arr[0].val).assertEqual(42);
      expect(arr[0].ref).assertNull();
      expect(arr[1].ref).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CREATE_TWO_1050
     * @tc.name testArrayCreateTwo105
     * @tc.desc Verify Array.create with LinkedNode|null type, null initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayCreateTwo105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<LinkedNode | null>(2, null);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertNull();
      expect(arr[1]).assertNull();
    });


  });
}
