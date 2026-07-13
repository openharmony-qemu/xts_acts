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

class FlatMapPerson2 {
  name: string = '';
  scores: Array<int> | null = null;
}

class FlatMapItem2 {
  id: int = 0;
  values: Array<number> | null = null;
}

class FlatMap2Instance {
  numbers: Array<number> = new Array<number>(1, 2, 3, 4, 5);
  strings: Array<string> = new Array<string>('a', 'bc', 'def');
  booleans: Array<boolean> = new Array<boolean>(true, false, true);
  uninitArr: Array<number> = new Array<number>();
  users: Array<FlatMap2User> = new Array<FlatMap2User>();
  mixed: Array<number | string> = new Array<number | string>();
}

class FlatMap2User {
  name: string = '';
  roles: Array<string> = new Array<string>();
}

class FlatMap2Static {
  static items: Array<number> = new Array<number>(10, 20, 30, 40);
  static readonly roItems: Array<number> = new Array<number>(1, 2, 3);
}

class FlatMap2Readonly {
  readonly data: Array<number> = new Array<number>(5, 10, 15, 20);
}

class FlatMap2Public {
  public values: Array<number> = new Array<number>(1, 2, 3, 4);
}

class FlatMap2Private {
  secret: Array<number> = new Array<number>(100, 200, 300);
}

class FlatMap2Parent {
  public parentArr: Array<number> = new Array<number>(10, 20, 30);
  public protectedArr: Array<number> = new Array<number>(1, 2, 3);
}

class FlatMap2Child extends FlatMap2Parent {
  public childArr: Array<number> = new Array<number>(100, 200);
  public parentArr: Array<number> = new Array<number>(10, 20, 30);
}

interface FlatMap2IFace {
  ifaceArr: Array<number>;
}

class FlatMap2Impl implements FlatMap2IFace {
  ifaceArr: Array<number> = new Array<number>(7, 8, 9);
}

class FlatMap2Animal {
  type: string = 'animal';
  skills: Array<string> = new Array<string>();
}

class FlatMap2Dog extends FlatMap2Animal {
  type: string = 'dog';
  skills: Array<string> = new Array<string>('bark', 'fetch');
}

class FlatMap2Cat extends FlatMap2Animal {
  type: string = 'cat';
  skills: Array<string> = new Array<string>('meow', 'climb');
}

class FlatMap2Generic<T> {
  data: Array<T> = new Array<T>();
}

class FlatMap2Box {
  value: number = 0;
}

class FlatMap2NumBox extends FlatMap2Box {
  value: number = 42;
}


class FlatMap2Closure {
  factor: number = 2;
  counter: int = 0;
}

class FlatMap2Scope {
  multiplier: number = 10;
}

class FlatMap2Custom {
  items: Array<number> = new Array<number>(1, 2, 3);
  ownFlatMap(cb: (v: number) => Array<number>): Array<number> {
    return new Array<number>();
  }
}

class FlatMap2MyArray extends Array<number> {
}

class FlatMap2Counter {
  count: int = 0;
  arr: Array<number> = new Array<number>(1, 2, 3, 4, 5);
}

class FlatMap2ByteHolder {
  bytes: Array<byte> = new Array<byte>(0 as byte, 12 as byte, 99 as byte);
}

class FlatMap2ShortHolder {
  shorts: Array<short> = new Array<short>(100 as short, 2048 as short, 32760 as short);
}

class FlatMap2LongHolder {
  longs: Array<long> = new Array<long>(100 as long, 9223372036854775806 as long);
}

class FlatMap2FloatHolder {
  floats: Array<float> = new Array<float>(0.0 as float, 3.14 as float, -99.99 as float);
}

class FlatMap2CharHolder {
  chars: Array<char> = new Array<char>(c'a', c'8', c'_');
}

class FlatMap2StringExt {
  unicodeStrs: Array<string> = new Array<string>('中文', '测试');
  emojiStrs: Array<string> = new Array<string>('😀', '🔥');
  specialStrs: Array<string> = new Array<string>('!@#测试', 'hello world');
  phoneStrs: Array<string> = new Array<string>('13800138000', '13900139000');
}

class FlatMap2NestedArr {
  grid: Array<Array<number>> = new Array<Array<number>>();
}

class FlatMap2Binding {
  items: Array<number> = new Array<number>(1, 2, 3);
  factor: int = 10;
}

export default function ArrayFlatMapTest2(): void {
  describe('ArrayFlatMapTest2', (): void => {
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
     * @tc.desc Verify flatMap expands Array<boolean> into descriptive strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlatMap001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true, false);
      const result = arr.flatMap<string>((v: boolean): Array<string> => {
        if (v) {
          return new Array<string>('yes');
        }
        return new Array<string>('no');
      });
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual('yes');
      expect(result[1]).assertEqual('no');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_0200
     * @tc.name testArrayFlatMap002
     * @tc.desc Verify flatMap on Array<double> returns transformed values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlatMap002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<double>(0.5, 1.5, 2.5);
      const result = arr.flatMap<int>((v: double): Array<int> => {
        const rounded = v.toInt();
        return new Array<int>(rounded);
      });
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(0);
      expect(result[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_0300
     * @tc.name testArrayFlatMap003
     * @tc.desc Verify flatMap extracts property from nested object array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlatMap003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p1 = new FlatMapPerson2();
      p1.name = 'Alice';
      p1.scores = new Array<int>(85, 90, 95);
      const p2 = new FlatMapPerson2();
      p2.name = 'Bob';
      p2.scores = new Array<int>(70, 80);
      const arr = new Array<FlatMapPerson2>(p1, p2);
      const result: Array<int> = arr.flatMap<int>((p: FlatMapPerson2): Array<int> => {
        const scores = p.scores;
        if (scores != null) {
          return scores;
        }
        return new Array<int>();
      });
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual(85);
      expect(result[4]).assertEqual(80);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_0400
     * @tc.name testArrayFlatMap004
     * @tc.desc Verify flatMap with inline triple-expansion on each element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlatMap004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const result = arr.flatMap<int>((v: int): Array<int> => {
        return new Array<int>(v - 1, v, v + 1);
      });
      expect(result.length).assertEqual(9);
      expect(result[0]).assertEqual(0);
      expect(result[4]).assertEqual(2);
      expect(result[8]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_0500
     * @tc.name testArrayFlatMap005
     * @tc.desc Verify flatMap with null values in output array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlatMap005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const result = arr.flatMap<int | null>((v: int): Array<int | null> => {
        if (v % 2 === 0) {
          return new Array<int | null>(v);
        }
        return new Array<int | null>(null);
      });
      expect(result.length).assertEqual(3);
      expect(result[0]).assertNull();
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_0600
     * @tc.name testArrayFlatMap006
     * @tc.desc Verify flatMap on union typed array expands each element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlatMap006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int | string>(1, 'two', 3);
      const result = arr.flatMap<string>((v: int | string): Array<string> => {
        const valueType = Class.of(v).getName().split('.');
        if (valueType[valueType.length - 1] === 'String') {
          return new Array<string>(v as string);
        }
        return new Array<string>((v as int).toString());
      });
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual('1');
      expect(result[1]).assertEqual('two');
      expect(result[2]).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_0700
     * @tc.name testArrayFlatMap007
     * @tc.desc Verify flatMap produces new array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlatMap007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2);
      const result = arr.flatMap<int>((v: int): Array<int> => new Array<int>(v, v));
      expect(result === arr).assertFalse();
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_0800
     * @tc.name testArrayFlatMap008
     * @tc.desc Verify flatMap on instance number array via Field maps each to [val, val*2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlatMap008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FlatMap2Instance();
      const clazz = Class.of(obj);
      const field = clazz.getInstanceField('numbers');
      if (field !== undefined) {
        const arr = field.getValue(obj) as Array<number>;
        const result = arr.flatMap<number>((v: number): Array<number> => new Array<number>(v, v * 2));
        expect(result.length).assertEqual(10);
        expect(result[0]).assertEqual(1);
        expect(result[9]).assertEqual(10);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_0900
     * @tc.name testArrayFlatMap009
     * @tc.desc Verify flatMap on string array via Field splits strings into chars
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlatMap009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FlatMap2Instance();
      const clazz = Class.of(obj);
      const field = clazz.getInstanceField('strings');
      if (field !== undefined) {
        const arr = field.getValue(obj) as Array<string>;
        const result = arr.flatMap<string>((s: string): Array<string> => {
          const chars = new Array<string>();
          for (let i = 0; i < s.length; i++) {
            chars.pushOne(s[i]);
          }
          return chars;
        });
        expect(result.length).assertEqual(6);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_1000
     * @tc.name testArrayFlatMap010
     * @tc.desc Verify flatMap on boolean array via Field maps to [val, !val]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlatMap010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FlatMap2Instance();
      const clazz = Class.of(obj);
      const field = clazz.getInstanceField('booleans');
      if (field !== undefined) {
        const arr = field.getValue(obj) as Array<boolean>;
        const result = arr.flatMap<boolean>((v: boolean): Array<boolean> => new Array<boolean>(v, !v));
        expect(result.length).assertEqual(6);
        expect(result[0]).assertTrue();
        expect(result[1]).assertFalse();
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_1100
     * @tc.name testArrayFlatMap011
     * @tc.desc Verify flatMap on uninitialized empty array field returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlatMap011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FlatMap2Instance();
      const clazz = Class.of(obj);
      const field = clazz.getInstanceField('uninitArr');
      if (field !== undefined) {
        const arr = field.getValue(obj) as Array<number>;
        const result = arr.flatMap<number>((v: number): Array<number> => new Array<number>(v));
        expect(result.length).assertEqual(0);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_1200
     * @tc.name testArrayFlatMap012
     * @tc.desc Verify flatMap on static array field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlatMap012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = FlatMap2Static.items;
      const result = arr.flatMap<number>((v: number): Array<number> => new Array<number>(v, v + 1));
      expect(result.length).assertEqual(8);
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_1300
     * @tc.name testArrayFlatMap013
     * @tc.desc Verify flatMap on static array after dynamic modification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlatMap013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      FlatMap2Static.items = new Array<number>(100, 200, 300);
      const arr = FlatMap2Static.items;
      const result = arr.flatMap<number>((v: number): Array<number> => new Array<number>(v));
      expect(result.length).assertEqual(3);
      FlatMap2Static.items = new Array<number>(10, 20, 30, 40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_1400
     * @tc.name testArrayFlatMap014
     * @tc.desc Verify flatMap on static readonly array field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlatMap014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = FlatMap2Static.roItems;
      const result = arr.flatMap<number>((v: number): Array<number> => new Array<number>(v));
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_1500
     * @tc.name testArrayFlatMap015
     * @tc.desc Verify flatMap on readonly instance field via Field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlatMap015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FlatMap2Readonly();
      const clazz = Class.of(obj);
      const field = clazz.getInstanceField('data');
      if (field !== undefined) {
        const arr = field.getValue(obj) as Array<number>;
        const result = arr.flatMap<number>((v: number): Array<number> => new Array<number>(v));
        expect(result.length).assertEqual(4);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_1600
     * @tc.name testArrayFlatMap016
     * @tc.desc Verify flatMap on public field via Field cross-module
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlatMap016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FlatMap2Public();
      const clazz = Class.of(obj);
      const field = clazz.getInstanceField('values');
      if (field !== undefined) {
        const arr = field.getValue(obj) as Array<number>;
        const result = arr.flatMap<number>((v: number): Array<number> => new Array<number>(v));
        expect(result.length).assertEqual(4);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_1700
     * @tc.name testArrayFlatMap017
     * @tc.desc Verify flatMap on public field accessed via Field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlatMap017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FlatMap2Private();
      const clazz = Class.of(obj);
      const field = clazz.getInstanceField('secret');
      if (field !== undefined) {
        const arr = field.getValue(obj) as Array<number>;
        const result = arr.flatMap<number>((v: number): Array<number> => new Array<number>(v, v));
        expect(result.length).assertEqual(6);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_1800
     * @tc.name testArrayFlatMap018
     * @tc.desc Verify flatMap on public parent field via Field: FlatMap2Parent.protectedArr=[1,2,3] → flatMap returns [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlatMap018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FlatMap2Parent();
      const clazz = Class.of(obj);
      const field = clazz.getInstanceField('protectedArr');
      if (field !== undefined) {
        const arr = field.getValue(obj) as Array<number>;
        const result = arr.flatMap<number>((v: number): Array<number> => new Array<number>(v));
        expect(result.length).assertEqual(3);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_1900
     * @tc.name testArrayFlatMap019
     * @tc.desc Verify flatMap on interface array field via Field on implementation instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlatMap019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FlatMap2Impl();
      const clazz = Class.of(obj);
      const field = clazz.getInstanceField('ifaceArr');
      if (field !== undefined) {
        const arr = field.getValue(obj) as Array<number>;
        const result = arr.flatMap<number>((v: number): Array<number> => new Array<number>(v, v * 10));
        expect(result.length).assertEqual(6);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_2000
     * @tc.name testArrayFlatMap020
     * @tc.desc Verify Field getName and getType unchanged after flatMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlatMap020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FlatMap2Instance();
      const clazz = Class.of(obj);
      const field = clazz.getInstanceField('numbers');
      if (field !== undefined) {
        const nameBefore = field.getName();
        const typeBefore = field.getType();
        const arr = field.getValue(obj) as Array<number>;
        arr.flatMap<number>((v: number): Array<number> => new Array<number>(v));
        expect(field.getName()).assertEqual(nameBefore);
        expect(field.getType()).assertEqual(typeBefore);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_2100
     * @tc.name testArrayFlatMap021
     * @tc.desc Verify flatMap callback receives value index and array params
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlatMap021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      const result = arr.flatMap<number>((v: number, idx: int, src: Array<number>): Array<number> => {
        return new Array<number>(v, Int.toDouble(idx), Int.toDouble(src.length));
      });
      expect(result.length).assertEqual(9);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_2200
     * @tc.name testArrayFlatMap022
     * @tc.desc Verify flatMap uses only index param to generate [idx, idx+1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlatMap022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c');
      const result = arr.flatMap<number>((_v: string, idx: int): Array<number> => new Array<number>(Int.toDouble(idx), Int.toDouble(idx + 1)));
      expect(result.length).assertEqual(6);
      expect(result[0]).assertEqual(0);
      expect(result[5]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_2300
     * @tc.name testArrayFlatMap023
     * @tc.desc Verify flatMap reads source array length in callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlatMap023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      const result = arr.flatMap<number>((v: number, _idx: int, src: Array<number>): Array<number> => {
        return new Array<number>(v * src.length);
      });
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_2400
     * @tc.name testArrayFlatMap024
     * @tc.desc Verify flatMap thisArg binds callback this via closure context
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlatMap024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ctx = new FlatMap2Closure();
      ctx.factor = 3;
      const arr = new Array<number>(1, 2, 3);
      const result = arr.flatMap<number>((v: number): Array<number> => new Array<number>(v * ctx.factor));
      expect(result[0]).assertEqual(3);
      expect(result[1]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_2500
     * @tc.name testArrayFlatMap025
     * @tc.desc Verify flatMap with Field owner instance fields used in callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlatMap025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const scope = new FlatMap2Scope();
      scope.multiplier = 5;
      const arr = new Array<number>(2, 4);
      const result = arr.flatMap<number>((v: number): Array<number> => new Array<number>(v * scope.multiplier));
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_2600
     * @tc.name testArrayFlatMap026
     * @tc.desc Verify flatMap with arrow callback uses lexical this ignoring thisArg
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlatMap026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const outer = 4;
      const arr = new Array<number>(1, 2);
      const result = arr.flatMap<number>((v: number): Array<number> => new Array<number>(v * outer));
      expect(result[0]).assertEqual(4);
      expect(result[1]).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_2700
     * @tc.name testArrayFlatMap027
     * @tc.desc Verify flatMap returning single values degenerates to map behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlatMap027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.flatMap<number>((v: number): Array<number> => new Array<number>(v * 2));
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_2800
     * @tc.name testArrayFlatMap028
     * @tc.desc Verify flatMap flattens exactly one level of returned arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlatMap028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      const result = arr.flatMap<number>((v: number): Array<number> => new Array<number>(v, v * 10));
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_2900
     * @tc.name testArrayFlatMap029
     * @tc.desc Verify flatMap only flattens one level for nested array returns
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlatMap029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      const result = arr.flatMap<Array<number>>((v: number): Array<Array<number>> => {
        const inner = new Array<number>(v);
        return new Array<Array<number>>(inner);
      });
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_3000
     * @tc.name testArrayFlatMap030
     * @tc.desc Verify flatMap filters elements by returning empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlatMap030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5, 6);
      const result = arr.flatMap<number>((v: number): Array<number> => {
        if (v % 2 === 0) {
          return new Array<number>(v);
        }
        return new Array<number>();
      });
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(2);
      expect(result[2]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_3100
     * @tc.name testArrayFlatMap031
     * @tc.desc Verify flatMap empty array callback not invoked
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlatMap031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      let invoked = false;
      const result = arr.flatMap<number>((_v: number): Array<number> => {
        invoked = true;
        return new Array<number>(1);
      });
      expect(result.length).assertEqual(0);
      expect(invoked).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_3200
     * @tc.name testArrayFlatMap032
     * @tc.desc Verify flatMap shallow copy preserves object references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlatMap032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new FlatMap2Box();
      box.value = 42;
      const arr = new Array<FlatMap2Box>(box);
      const result = arr.flatMap<FlatMap2Box>((v: FlatMap2Box): Array<FlatMap2Box> => new Array<FlatMap2Box>(v));
      expect(result[0]).assertEqual(box);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_3300
     * @tc.name testArrayFlatMap033
     * @tc.desc Verify flatMap extracts nested role arrays from User objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlatMap033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u1 = new FlatMap2User();
      u1.roles = new Array<string>('admin', 'editor');
      const u2 = new FlatMap2User();
      u2.roles = new Array<string>('viewer');
      const arr = new Array<FlatMap2User>(u1, u2);
      const result = arr.flatMap<string>((u: FlatMap2User): Array<string> => u.roles);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual('admin');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_3400
     * @tc.name testArrayFlatMap034
     * @tc.desc Verify flatMap on union type array routes by type check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlatMap034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FlatMap2Instance();
      const clazz = Class.of(obj);
      const field = clazz.getInstanceField('mixed');
      if (field !== undefined) {
        const arr = field.getValue(obj) as Array<number | string>;
        arr.pushOne(1);
        arr.pushOne('two' as string);
        arr.pushOne(3);
        const result = arr.flatMap<string>((v: number | string): Array<string> => {
          if (typeof v === 'string') {
            return new Array<string>(v as string);
          }
          return new Array<string>();
        });
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual('two');
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_3500
     * @tc.name testArrayFlatMap035
     * @tc.desc Verify flatMap on 2D array flattens inner arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlatMap035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner1 = new Array<number>(1, 2);
      const inner2 = new Array<number>(3, 4);
      const arr = new Array<Array<number>>(inner1, inner2);
      const result = arr.flatMap<number>((a: Array<number>): Array<number> => a);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_3600
     * @tc.name testArrayFlatMap036
     * @tc.desc Verify flatMap on generic class array field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlatMap036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new FlatMap2Generic<number>();
      box.data = new Array<number>(10, 20, 30);
      const result = box.data.flatMap<number>((v: number): Array<number> => new Array<number>(v, v + 1));
      expect(result.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_3700
     * @tc.name testArrayFlatMap037
     * @tc.desc Verify flatMap on public parentArr field from parent instance via Field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlatMap037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FlatMap2Parent();
      const clazz = Class.of(obj);
      const field = clazz.getInstanceField('parentArr');
      if (field !== undefined) {
        const arr = field.getValue(obj) as Array<number>;
        const result = arr.flatMap<number>((v: number): Array<number> => new Array<number>(v));
        expect(result.length).assertEqual(3);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_3800
     * @tc.name testArrayFlatMap038
     * @tc.desc Verify flatMap on child overridden field uses child data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlatMap038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FlatMap2Child();
      const clazz = Class.of(obj);
      const field = clazz.getInstanceField('childArr');
      if (field !== undefined) {
        const arr = field.getValue(obj) as Array<number>;
        const result = arr.flatMap<number>((v: number): Array<number> => new Array<number>(v));
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(100);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_3900
     * @tc.name testArrayFlatMap039
     * @tc.desc Verify flatMap on polymorphic Animal array extracts subclass skills
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlatMap039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dog = new FlatMap2Dog();
      const cat = new FlatMap2Cat();
      const animals = new Array<FlatMap2Animal>(dog, cat);
      const result = animals.flatMap<string>((a: FlatMap2Animal): Array<string> => a.skills);
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_4000
     * @tc.name testArrayFlatMap040
     * @tc.desc Verify flatMap filters null elements by returning empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlatMap040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | null>(1, null, 3, null, 5);
      const result = arr.flatMap<number>((v: number | null): Array<number> => {
        if (v != null) {
          return new Array<number>(v);
        }
        return new Array<number>();
      });
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_4100
     * @tc.name testArrayFlatMap041
     * @tc.desc Verify flatMap on bigint array maps to [item*2n]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlatMap041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<bigint>(1n, 2n, 3n);
      const result = arr.flatMap<bigint>((v: bigint): Array<bigint> => new Array<bigint>(v * 2n));
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(2n);
      expect(result[2]).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_4200
     * @tc.name testArrayFlatMap042
     * @tc.desc Verify flatMap preserves NaN values through mapping
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlatMap042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(Double.NaN, 1, Double.NaN);
      const result = arr.flatMap<number>((v: number): Array<number> => new Array<number>(v));
      expect(result.length).assertEqual(3);
      expect(isNaN(result[0])).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_4300
     * @tc.name testArrayFlatMap043
     * @tc.desc Verify flatMap preserves Infinity sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlatMap043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(Double.POSITIVE_INFINITY, 1, Double.NEGATIVE_INFINITY);
      const result = arr.flatMap<number>((v: number): Array<number> => new Array<number>(v));
      expect(result[0]).assertEqual(Double.POSITIVE_INFINITY);
      expect(result[2]).assertEqual(Double.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_4400
     * @tc.name testArrayFlatMap044
     * @tc.desc Verify flatMap preserves 0 vs -0 distinction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlatMap044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negZero: number = -0.0;
      const arr = new Array<number>(0.0, negZero);
      const result = arr.flatMap<number>((v: number): Array<number> => new Array<number>(v));
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(0.0);
      expect(result[1]).assertEqual(-0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_4500
     * @tc.name testArrayFlatMap045
     * @tc.desc Verify flatMap propagates exception thrown in callback: predicate throw new Error on v===3, caught as Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlatMap045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      try {
        arr.flatMap<number>((v: number): Array<number> => {
          if (v === 3) {
            throw new Error('test error');
          }
          return new Array<number>(v);
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_4600
     * @tc.name testArrayFlatMap046
     * @tc.desc Verify flatMap re-entrancy: first call throws Error, catch it, second call succeeds with [1,1,2,2,3,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlatMap046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      try {
        arr.flatMap<number>((v: number): Array<number> => {
          if (v === 2) {
            throw new Error('interrupt');
          }
          return new Array<number>(v);
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      const result = arr.flatMap<number>((v: number): Array<number> => new Array<number>(v, v));
      expect(result.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_4700
     * @tc.name testArrayFlatMap047
     * @tc.desc Verify flatMap chained with at(-1) gets last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlatMap047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.flatMap<number>((v: number): Array<number> => new Array<number>(v, v * 10)).at(-1);
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_4800
     * @tc.name testArrayFlatMap048
     * @tc.desc Verify flatMap chained with filter removes unwanted from flattened result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlatMap048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const result = arr.flatMap<number>((v: number): Array<number> => {
        if (v % 2 === 0) {
          return new Array<number>(v);
        }
        return new Array<number>();
      }).filter((v: number): boolean => v > 2);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_4900
     * @tc.name testArrayFlatMap049
     * @tc.desc Verify flatMap chained with map transforms flattened result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlatMap049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      const result = arr.flatMap<number>((v: number): Array<number> => new Array<number>(v, v)).map<number>((v: number): number => v * 10);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_5000
     * @tc.name testArrayFlatMap050
     * @tc.desc Verify flatMap with impure callback increments counter exactly n times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlatMap050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FlatMap2Counter();
      const result = obj.arr.flatMap<number>((v: number): Array<number> => {
        obj.count = obj.count + 1;
        return new Array<number>(v);
      });
      expect(obj.count).assertEqual(5);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_5100
     * @tc.name testArrayFlatMap051
     * @tc.desc Verify flatMap on 1000 identical object references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlatMap051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box = new FlatMap2Box();
      box.value = 99;
      const arr = new Array<FlatMap2Box>();
      for (let i = 0; i < 1000; i++) {
        arr.pushOne(box);
      }
      const result = arr.flatMap<FlatMap2Box>((v: FlatMap2Box): Array<FlatMap2Box> => new Array<FlatMap2Box>(v));
      expect(result.length).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_5200
     * @tc.name testArrayFlatMap052
     * @tc.desc Verify flatMap on Array subclass inherits behavior correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlatMap052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new FlatMap2MyArray();
      arr.pushOne(1);
      arr.pushOne(2);
      arr.pushOne(3);
      const result = arr.flatMap<number>((v: number): Array<number> => new Array<number>(v, v * 10));
      expect(result.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_5300
     * @tc.name testArrayFlatMap053
     * @tc.desc Verify flatMap on custom class distinguishes own method from Array API
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlatMap053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FlatMap2Custom();
      const result = obj.items.flatMap<number>((v: number): Array<number> => new Array<number>(v, v));
      expect(result.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_5400
     * @tc.name testArrayFlatMap054
     * @tc.desc Verify flatMap on large array 10000 elements each mapping to 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlatMap054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      for (let i = 0; i < 10000; i++) {
        arr.pushOne(i);
      }
      const result = arr.flatMap<number>((v: number): Array<number> => new Array<number>(v, v + 1));
      expect(result.length).assertEqual(20000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_5500
     * @tc.name testArrayFlatMap055
     * @tc.desc Verify flatMap traversal picks up pushOne mutation during callback, result length is 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlatMap055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.flatMap<number>((v: number): Array<number> => {
        if (v === 1) {
          arr.pushOne(99);
        }
        return new Array<number>(v);
      });
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_5600
     * @tc.name testArrayFlatMap056
     * @tc.desc Verify flatMap writes back to current element during callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlatMap056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.flatMap<number>((v: number, idx: int): Array<number> => {
        arr[idx] = v * 10.0;
        return new Array<number>(arr[idx]);
      });
      expect(result[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_5700
     * @tc.name testArrayFlatMap057
     * @tc.desc Verify flatMap closes over external variable reflecting latest value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlatMap057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ctx = new FlatMap2Closure();
      ctx.factor = 3;
      const arr = new Array<number>(1, 2);
      let result = arr.flatMap<number>((v: number): Array<number> => new Array<number>(v * ctx.factor));
      expect(result[0]).assertEqual(3);
      ctx.factor = 5;
      result = arr.flatMap<number>((v: number): Array<number> => new Array<number>(v * ctx.factor));
      expect(result[0]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_5800
     * @tc.name testArrayFlatMap058
     * @tc.desc Verify flatMap length alignment newLength equals sum of inner array lengths
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlatMap058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.flatMap<number>((v: number): Array<number> => new Array<number>(v, v, v));
      expect(result.length).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_5900
     * @tc.name testArrayFlatMap059
     * @tc.desc Verify flatMap all-empty-callback returns empty result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlatMap059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result = arr.flatMap<number>((_v: number): Array<number> => new Array<number>());
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_6000
     * @tc.name testArrayFlatMap060
     * @tc.desc Verify flatMap with pop in callback: [1,2,3,4,5]+pop at v=2 → [1,2,3,4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlatMap060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result = arr.flatMap<number>((v: number): Array<number> => {
        if (v === 2) {
          arr.pop();
        }
        return new Array<number>(v);
      });
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_6100
     * @tc.name testArrayFlatMap061
     * @tc.desc Verify flatMap with non-array object in returned array treated as single value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlatMap061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      const boxes = arr.flatMap<FlatMap2Box>((v: number): Array<FlatMap2Box> => {
        const b = new FlatMap2Box();
        b.value = v;
        return new Array<FlatMap2Box>(b);
      });
      expect(boxes.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_6200
     * @tc.name testArrayFlatMap062
     * @tc.desc Verify flatMap on byte array via Field with boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlatMap062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FlatMap2ByteHolder();
      const clazz = Class.of(obj);
      const field = clazz.getInstanceField('bytes');
      if (field !== undefined) {
        const arr = field.getValue(obj) as Array<byte>;
        const result = arr.flatMap<byte>((v: byte): Array<byte> => new Array<byte>(v, v));
        expect(result.length).assertEqual(6);
        expect(result[0]).assertEqual(0 as byte);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_6300
     * @tc.name testArrayFlatMap063
     * @tc.desc Verify flatMap on short array via Field maps each to [val, val+1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlatMap063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FlatMap2ShortHolder();
      const clazz = Class.of(obj);
      const field = clazz.getInstanceField('shorts');
      if (field !== undefined) {
        const arr = field.getValue(obj) as Array<short>;
        const result = arr.flatMap<short>((v: short): Array<short> => {
          const next: short = Int.toShort(Short.toInt(v) + 1);
          return new Array<short>(v, next);
        });
        expect(result.length).assertEqual(6);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_6400
     * @tc.name testArrayFlatMap064
     * @tc.desc Verify flatMap on long array via Field maps each to [val]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlatMap064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FlatMap2LongHolder();
      const clazz = Class.of(obj);
      const field = clazz.getInstanceField('longs');
      if (field !== undefined) {
        const arr = field.getValue(obj) as Array<long>;
        const result = arr.flatMap<long>((v: long): Array<long> => new Array<long>(v));
        expect(result.length).assertEqual(2);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_6500
     * @tc.name testArrayFlatMap065
     * @tc.desc Verify flatMap on float array via Field preserves special values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlatMap065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FlatMap2FloatHolder();
      const clazz = Class.of(obj);
      const field = clazz.getInstanceField('floats');
      if (field !== undefined) {
        const arr = field.getValue(obj) as Array<float>;
        const result = arr.flatMap<float>((v: float): Array<float> => new Array<float>(v));
        expect(result.length).assertEqual(3);
        expect(result[1]).assertEqual(3.14 as float);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_6600
     * @tc.name testArrayFlatMap066
     * @tc.desc Verify flatMap on char array via Field with Unicode mapping
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlatMap066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FlatMap2CharHolder();
      const clazz = Class.of(obj);
      const field = clazz.getInstanceField('chars');
      if (field !== undefined) {
        const arr = field.getValue(obj) as Array<char>;
        const result = arr.flatMap<char>((c: char): Array<char> => new Array<char>(c));
        expect(result.length).assertEqual(3);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_6700
     * @tc.name testArrayFlatMap067
     * @tc.desc Verify flatMap on Unicode Chinese string array via Field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlatMap067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FlatMap2StringExt();
      const clazz = Class.of(obj);
      const field = clazz.getInstanceField('unicodeStrs');
      if (field !== undefined) {
        const arr = field.getValue(obj) as Array<string>;
        const result = arr.flatMap<string>((s: string): Array<string> => new Array<string>(s));
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual('中文');
        expect(result[1]).assertEqual('测试');
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_6800
     * @tc.name testArrayFlatMap068
     * @tc.desc Verify flatMap on emoji string array via Field preserves emoji chars
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlatMap068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FlatMap2StringExt();
      const clazz = Class.of(obj);
      const field = clazz.getInstanceField('emojiStrs');
      if (field !== undefined) {
        const arr = field.getValue(obj) as Array<string>;
        const result = arr.flatMap<string>((s: string): Array<string> => new Array<string>(s, s + s));
        expect(result.length).assertEqual(4);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_6900
     * @tc.name testArrayFlatMap069
     * @tc.desc Verify flatMap on special character string array via Field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlatMap069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FlatMap2StringExt();
      const clazz = Class.of(obj);
      const field = clazz.getInstanceField('specialStrs');
      if (field !== undefined) {
        const arr = field.getValue(obj) as Array<string>;
        const result = arr.flatMap<string>((s: string): Array<string> => s.split(' '));
        expect(result.length).assertEqual(3);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_7000
     * @tc.name testArrayFlatMap070
     * @tc.desc Verify flatMap on phone number format string array via Field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlatMap070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FlatMap2StringExt();
      const clazz = Class.of(obj);
      const field = clazz.getInstanceField('phoneStrs');
      if (field !== undefined) {
        const arr = field.getValue(obj) as Array<string>;
        const result = arr.flatMap<string>((s: string): Array<string> => new Array<string>(s));
        expect(result.length).assertEqual(2);
        expect(result[0].length).assertEqual(11);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_7100
     * @tc.name testArrayFlatMap071
     * @tc.desc Verify flatMap on multidimensional array via Field flattens inner arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlatMap071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner1 = new Array<number>(1, 2);
      const inner2 = new Array<number>(3, 4, 5);
      const inner3 = new Array<number>(6);
      const obj = new FlatMap2NestedArr();
      obj.grid = new Array<Array<number>>(inner1, inner2, inner3);
      const clazz = Class.of(obj);
      const field = clazz.getInstanceField('grid');
      if (field !== undefined) {
        const arr = field.getValue(obj) as Array<Array<number>>;
        const result = arr.flatMap<number>((a: Array<number>): Array<number> => a);
        expect(result.length).assertEqual(6);
        expect(result[0]).assertEqual(1);
        expect(result[5]).assertEqual(6);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_7200
     * @tc.name testArrayFlatMap072
     * @tc.desc Verify flatMap with Field owner instance bound in callback closure
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlatMap072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FlatMap2Binding();
      const result = obj.items.flatMap<number>((v: number): Array<number> => {
        return new Array<number>(v * obj.factor);
      });
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(10);
      expect(result[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_7300
     * @tc.name testArrayFlatMap073
     * @tc.desc Verify flatMap with Field after dynamically replacing array via reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlatMap073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FlatMap2Instance();
      const clazz = Class.of(obj);
      const field = clazz.getInstanceField('numbers');
      if (field !== undefined) {
        let arr = field.getValue(obj) as Array<number>;
        let result = arr.flatMap<number>((v: number): Array<number> => new Array<number>(v));
        expect(result.length).assertEqual(5);
        obj.numbers = new Array<number>(100, 200);
        arr = field.getValue(obj) as Array<number>;
        result = arr.flatMap<number>((v: number): Array<number> => new Array<number>(v));
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(100);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_7400
     * @tc.name testArrayFlatMap074
     * @tc.desc Verify flatMap on array containing empty strings via Field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlatMap074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('', 'a', '', 'b', '');
      const result = arr.flatMap<string>((s: string): Array<string> => {
        if (s.length > 0) {
          return new Array<string>(s);
        }
        return new Array<string>();
      });
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual('a');
      expect(result[1]).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_7500
     * @tc.name testArrayFlatMap075
     * @tc.desc Verify flatMap with shift in callback via Field: [1,2,3,4,5]+shift at v=1 → [1,3,4,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlatMap075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new FlatMap2Instance();
      const clazz = Class.of(obj);
      const field = clazz.getInstanceField('numbers');
      if (field !== undefined) {
        const arr = field.getValue(obj) as Array<number>;
        const result = arr.flatMap<number>((v: number): Array<number> => {
          if (v === 1) {
            arr.shift();
          }
          return new Array<number>(v);
        });
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(1);
        expect(result[1]).assertEqual(3);
        expect(result[2]).assertEqual(4);
        expect(result[3]).assertEqual(5);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_MAP_7600
     * @tc.name testArrayFlatMap076
     * @tc.desc Verify flatMap on array with nullish elements filtered via Field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayFlatMap076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string | null>('keep', null, 'also', null);
      const result = arr.flatMap<string>((v: string | null): Array<string> => {
        if (v != null) {
          return new Array<string>(v);
        }
        return new Array<string>();
      });
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual('keep');
      expect(result[1]).assertEqual('also');
    });
  });
}