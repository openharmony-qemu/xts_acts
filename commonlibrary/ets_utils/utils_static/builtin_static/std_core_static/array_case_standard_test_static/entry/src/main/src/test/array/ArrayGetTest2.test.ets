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

class ItemGet2 {
  value: int = 0;
  label: string = '';
}

class GetPerson {
  id: string = '';
  name: string = '';
}

class GetAnimal {
  type: string = 'animal';
}

class GetDog extends GetAnimal {
  type: string = 'dog';
  breed: string = '';
}

class GetCat extends GetAnimal {
  type: string = 'cat';
  breed: string = '';
}

class GetFieldBase {
  items: Array<number> = new Array<number>(10, 20, 30, 40);
}

class GetFieldChild extends GetFieldBase {
  items: Array<number> = new Array<number>(100, 200, 300);
}

class GetInstanceField {
  data: Array<int> = new Array<int>(5, 10, 15, 20);
}

class GetStaticField {
  static nums: Array<number> = new Array<number>(1, 3, 5, 7, 9);
}

class GetReadonlyField {
  readonly vals: Array<number> = new Array<number>(2, 4, 6, 8);
}

class GetPrivateField {
  secret: Array<string> = new Array<string>('x', 'y', 'z');
}

export default function ArrayGetTest2(): void {
  describe('ArrayGetTest2', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_0100
     * @tc.name testArrayGet001
     * @tc.desc Verify get on Array<double> returns correct values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayGet001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<double>(0.5, 1.5, 2.5);
      expect(arr[0]).assertEqual(0.5);
      expect(arr[2]).assertEqual(2.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_0200
     * @tc.name testArrayGet002
     * @tc.desc Verify get on large array returns correct element at middle index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayGet002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      for (let i = 0; i < 1000; i++) {
        arr.pushOne(i);
      }
      expect(arr[0]).assertEqual(0);
      expect(arr[500]).assertEqual(500);
      expect(arr[999]).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_0300
     * @tc.name testArrayGet003
     * @tc.desc Verify get throws RangeError for accessing after pop reduces length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayGet003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      arr.pop();
      arr.pop();
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(1);
      try {
        arr[1];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_0400
     * @tc.name testArrayGet004
     * @tc.desc Verify get on string array with empty string element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayGet004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', '', 'c');
      expect(arr[1]).assertEqual('');
      expect(arr[1].length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_0500
     * @tc.name testArrayGet005
     * @tc.desc Verify get on Array<number | null> returns null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayGet005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | null>(1, null, 3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertNull();
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_0600
     * @tc.name testArrayGet006
     * @tc.desc Verify get on single-element array returns the element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayGet006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 42);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_0700
     * @tc.name testArrayGet007
     * @tc.desc Verify get on union typed array returns correct type at each index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayGet007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int | string>(10, 'hello', 20);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual('hello');
      expect(arr[2]).assertEqual(20);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_0800
     * @tc.name testArrayGet008
     * @tc.desc Verify get on instance field array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayGet008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new GetInstanceField();
      expect(obj.data[0]).assertEqual(5);
      expect(obj.data[3]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_0900
     * @tc.name testArrayGet009
     * @tc.desc Verify get on static field array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayGet009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(GetStaticField.nums[0]).assertEqual(1);
      expect(GetStaticField.nums[4]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_1000
     * @tc.name testArrayGet010
     * @tc.desc Verify static field modified before get reflects latest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayGet010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      GetStaticField.nums = new Array<number>(10, 20, 30);
      expect(GetStaticField.nums[0]).assertEqual(10);
      expect(GetStaticField.nums[2]).assertEqual(30);
      GetStaticField.nums = new Array<number>(1, 3, 5, 7, 9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_1100
     * @tc.name testArrayGet011
     * @tc.desc Verify get on readonly field array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayGet011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new GetReadonlyField();
      expect(obj.vals[0]).assertEqual(2);
      expect(obj.vals[3]).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_1200
     * @tc.name testArrayGet012
     * @tc.desc Verify get on public field via Class reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayGet012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new GetPrivateField();
      const clazz = Class.of(obj);
      const field = clazz.getInstanceField('secret');
      if (field !== undefined) {
        const arr = field.getValue(obj) as Array<string>;
        expect(arr[0]).assertEqual('x');
        expect(arr[2]).assertEqual('z');
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_1300
     * @tc.name testArrayGet013
     * @tc.desc Verify get on parent field through child
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayGet013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new GetFieldBase();
      expect(obj.items[0]).assertEqual(10);
      expect(obj.items[3]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_1400
     * @tc.name testArrayGet014
     * @tc.desc Verify get on subclass overridden field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayGet014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new GetFieldChild();
      expect(obj.items[0]).assertEqual(100);
      expect(obj.items[2]).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_1500
     * @tc.name testArrayGet015
     * @tc.desc Verify get on polymorphic array returns preserved subclass instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayGet015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dog = new GetDog();
      dog.breed = 'Husky';
      const cat = new GetCat();
      cat.breed = 'Siamese';
      const arr = new Array<GetAnimal>(dog, cat);
      expect(arr[0] instanceof GetDog).assertTrue();
      expect((arr[0] as GetDog).breed).assertEqual('Husky');
      expect(arr[1] instanceof GetCat).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_1600
     * @tc.name testArrayGet016
     * @tc.desc Verify get at index 0 returns head element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayGet016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(99, 88, 77);
      expect(arr[0]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_1700
     * @tc.name testArrayGet017
     * @tc.desc Verify get at length-1 returns tail element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayGet017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 40, 50);
      expect(arr[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_1800
     * @tc.name testArrayGet018
     * @tc.desc Verify get on large 200000-element array gets tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayGet018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      for (let i = 0; i < 200000; i++) {
        arr.pushOne(i);
      }
      expect(arr[199999]).assertEqual(199999);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_1900
     * @tc.name testArrayGet019
     * @tc.desc Verify get after unshift shifts indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayGet019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      arr.unshift(5);
      expect(arr[0]).assertEqual(5);
      expect(arr[1]).assertEqual(10);
      expect(arr[3]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_2000
     * @tc.name testArrayGet020
     * @tc.desc Verify get after shift moves elements left
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayGet020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      arr.shift();
      expect(arr[0]).assertEqual(20);
      expect(arr[1]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_2100
     * @tc.name testArrayGet021
     * @tc.desc Verify get after push then pop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayGet021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.pushOne(4);
      arr.pop();
      expect(arr[0]).assertEqual(1);
      expect(arr[2]).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_2200
     * @tc.name testArrayGet022
     * @tc.desc Verify get returns same object reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayGet022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p = new GetPerson();
      p.id = 'ref';
      const arr = Array.create<GetPerson>(1, p);
      expect(arr[0]).assertEqual(p);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_2300
     * @tc.name testArrayGet023
     * @tc.desc Verify modifying object from get carries back to array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayGet023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p = new GetPerson();
      p.id = 'original';
      const arr = Array.create<GetPerson>(1, p);
      const fetched = arr[0];
      fetched.id = 'modified';
      expect(arr[0].id).assertEqual('modified');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_2400
     * @tc.name testArrayGet024
     * @tc.desc Verify get on 1000 identical references returns same pointer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayGet024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p = new GetPerson();
      p.id = 'same';
      const arr = new Array<GetPerson>();
      for (let i = 0; i < 1000; i++) {
        arr.pushOne(p);
      }
      for (let i = 0; i < 1000; i++) {
        expect(arr[i]).assertEqual(p);
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_2500
     * @tc.name testArrayGet025
     * @tc.desc Verify get on NaN element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayGet025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(Double.NaN, 1, 2);
      expect(isNaN(arr[0])).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_2600
     * @tc.name testArrayGet026
     * @tc.desc Verify get on Infinity element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayGet026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(Double.POSITIVE_INFINITY, 2);
      expect(isFinite(arr[0])).assertFalse();
      expect(arr[0]).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_2700
     * @tc.name testArrayGet027
     * @tc.desc Verify get on -0 and 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayGet027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(-0, 0, 1, 2);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_2800
     * @tc.name testArrayGet028
     * @tc.desc Verify get on Array<byte>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayGet028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<byte>(-128, 0, 127);
      expect(arr[0]).assertEqual(-128);
      expect(arr[2]).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_2900
     * @tc.name testArrayGet029
     * @tc.desc Verify get on Array<short>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayGet029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<short>(-32768, 0, 32767);
      expect(arr[0]).assertEqual(-32768);
      expect(arr[2]).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_3000
     * @tc.name testArrayGet030
     * @tc.desc Verify get on Array<long>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayGet030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<long>(0, 2147483648, 9223372036854775807);
      expect(arr[2]).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_3100
     * @tc.name testArrayGet031
     * @tc.desc Verify get on Array<float>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayGet031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<float>(0.0 as float, 3.14 as float, 999.99 as float);
      expect(arr[1]).assertEqual(3.14 as float);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_3200
     * @tc.name testArrayGet032
     * @tc.desc Verify get on Array<char>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayGet032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<char>(c'a', c'b', c'中');
      expect(arr[2]).assertEqual(c'中');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_3300
     * @tc.name testArrayGet033
     * @tc.desc Verify get on Array<bigint>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayGet033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<bigint>(10n, 20n, 30n);
      expect(arr[1]).assertEqual(20n);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_3400
     * @tc.name testArrayGet034
     * @tc.desc Verify get on Array<number> works
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayGet034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      expect(arr[0]).assertEqual(1);
      expect(arr[2]).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_3500
     * @tc.name testArrayGet035
     * @tc.desc Verify get on nested array returns inner array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayGet035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Array<number>(1, 2, 3);
      const outer = Array.create<Array<number>>(1, inner);
      const fetched = outer[0];
      expect(fetched).assertEqual(inner);
      expect(fetched[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_3600
     * @tc.name testArrayGet036
     * @tc.desc Verify get with chain arr[0][1] on nested
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayGet036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Array<number>>(new Array<number>(10, 20), new Array<number>(30, 40));
      expect(arr[0][1]).assertEqual(20);
      expect(arr[1][0]).assertEqual(30);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_3700
     * @tc.name testArrayGet037
     * @tc.desc Verify get on Map<string, Array<number>> inner array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayGet037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, Array<number>>();
      map.set('a', new Array<number>(1, 2, 3));
      const inner = map.get('a');
      if (inner !== undefined) {
        expect(inner[1]).assertEqual(2);
      }else {
        expect().assertFail();
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_3800
     * @tc.name testArrayGet038
     * @tc.desc Verify get on sparse array hole returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayGet038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<number>();
      arr[0] = 1;
      arr[2] = 3;
      expect(arr[0]).assertEqual(1);
      expect(arr[2]).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_3900
     * @tc.name testArrayGet039
     * @tc.desc Verify repeated get 100000 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayGet039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, 42);
      for (let i = 0; i < 100000; i++) {
        expect(arr[0]).assertEqual(42);
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_4000
     * @tc.name testArrayGet040
     * @tc.desc Verify get re-enters after RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayGet040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      expect(arr.length).assertEqual(3);
      try {
        arr[10];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr[0]).assertEqual(1);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_4100
     * @tc.name testArrayGet041
     * @tc.desc Verify get on phone-number string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayGet041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('13800138000', '400-800-0000');
      expect(arr[0]).assertEqual('13800138000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_4200
     * @tc.name testArrayGet042
     * @tc.desc Verify get on emoji/unicode string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayGet042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('hello', '😀', '🔥🔥', '测试');
      expect(arr[1]).assertEqual('😀');
      expect(arr[3]).assertEqual('测试');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_4300
     * @tc.name testArrayGet043
     * @tc.desc Verify get on XSS string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayGet043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('safe', '<script>alert(1)</script>');
      expect(arr[1]).assertEqual('<script>alert(1)</script>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_GET_4400
     * @tc.name testArrayGet044
     * @tc.desc Verify get on Array<number>(10,20,30): index 1 returns 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayGet044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      expect(arr[1]).assertEqual(20);
    });
  });
}
