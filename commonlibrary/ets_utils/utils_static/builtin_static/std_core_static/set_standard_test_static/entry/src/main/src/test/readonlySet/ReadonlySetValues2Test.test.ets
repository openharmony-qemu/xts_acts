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
} from '../../../../hypium/index';
import Utils from './../Util.test';

class ValuesPerson {
  name: string = "";
  age: int = 0;
}

class ValuesFinal {
  id: int = 0;
}

interface ValuesDrawable {
  show(): void;
}

class ValuesRect implements ValuesDrawable {
  show(): void {
  }
}

enum ValuesColor {
  RED, GREEN, BLUE
}



class Vp2Label {
  tag: string = "";
  constructor(tag: string) {
    this.tag = tag;
  }
}

enum Vp2Flag {
  YES, NO
}

export default function ReadonlySetValues2Test(): void {
  describe('ReadonlySetValues2Test', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {
    });
    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });

/**
     * @tc.name testReadonlySetValues001
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0010
     * @tc.desc Verify ReadonlySet<float> values() traverses float values -100.0, 0.0, 100.0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<float> = new Set<float>([-100.0 as float, 0.0 as float, 100.0 as float]);
      const values: float[] = [];
      for (const v of set.values()) {
        values.push(v);
      }
      expect(values.length).assertEqual(3);
      expect(values[0]).assertEqual(-100.0);
      expect(values[2]).assertEqual(100.0);
    });

    /**
     * @tc.name testReadonlySetValues002
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0020
     * @tc.desc Verify ReadonlySet<double> values() traverses double boundary values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<double> = new Set<double>([-1.79e308, 0.0, 1.79e308]);
      let count: int = 0;
      for (const v of set.values()) {
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetValues003
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0030
     * @tc.desc Verify ReadonlySet<boolean> values() traverses true and false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<boolean> = new Set<boolean>([true, false]);
      const values: boolean[] = [];
      for (const v of set.values()) {
        values.push(v);
      }
      expect(values.length).assertEqual(2);
      expect(values[0]).assertTrue();
      expect(values[1]).assertFalse();
    });

    /**
     * @tc.name testReadonlySetValues004
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0040
     * @tc.desc Verify ReadonlySet<Object> values() returns object references
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj1: Object = new Object();
      let obj2: Object = new Object();
      const set: ReadonlySet<Object> = new Set<Object>([obj1, obj2]);
      const iter = set.values();
      expect(iter.next().value === obj1).assertTrue();
      expect(iter.next().value === obj2).assertTrue();
    });

    /**
     * @tc.name testReadonlySetValues005
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0050
     * @tc.desc Verify values() chain call set.values().next().value returns first value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([7, 14]);
      let v: int = set.values().next().value as int;
      expect(v).assertEqual(7);
    });

    /**
     * @tc.name testReadonlySetValues006
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0060
     * @tc.desc Verify values() iterator next().done returns true when exhausted
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1]);
      const iter = set.values();
      expect(iter.next().done).assertFalse();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testReadonlySetValues007
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0070
     * @tc.desc Verify values() traverses NaN element in Set<number>
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<number> = new Set<number>([Number.NaN, 42.0]);
      const values: number[] = [];
      for (const v of set.values()) {
        values.push(v);
      }
      expect(values.length).assertEqual(2);
      expect(Number.isNaN(values[0])).assertTrue();
      expect(values[1]).assertEqual(42.0);
    });

    /**
     * @tc.name testReadonlySetValues008
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0080
     * @tc.desc Verify Set with +0 and -0 has only one value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<number> = new Set<number>([0, -0]);
      let count: int = 0;
      for (const v of set.values()) {
        expect(v).assertEqual(0);
        count++;
      }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetValues009
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0090
     * @tc.desc Verify values() traversal order matches keys() traversal order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([10, 20, 30]);
      const valArr: int[] = [];
      const keyArr: int[] = [];
      for (const v of set.values()) {
        valArr.push(v);
      }
      for (const k of set.keys()) {
        keyArr.push(k);
      }
      for (let i = 0; i < valArr.length; i++) {
        expect(valArr[i]).assertEqual(keyArr[i]);
      }
    });

    /**
     * @tc.name testReadonlySetValues010
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0100
     * @tc.desc Verify values() traversal count equals set.size
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string> = new Set<string>(["a", "b", "c", "d", "e"]);
      let count: int = 0;
      for (const v of set.values()) {
        count++;
      }
      expect(count).assertEqual(set.size);
    });

    /**
     * @tc.name testReadonlySetValues011
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0110
     * @tc.desc Verify two ReadonlySet references have same values traversal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<int> = new Set<int>([5, 10, 15]);
      const r1: ReadonlySet<int> = ms;
      const r2: ReadonlySet<int> = ms;
      const a1: int[] = [];
      const a2: int[] = [];
      for (const v of r1.values()) {
        a1.push(v);
      }
      for (const v of r2.values()) {
        a2.push(v);
      }
      expect(a1.length).assertEqual(a2.length);
      for (let i = 0; i < a1.length; i++) {
        expect(a1[i]).assertEqual(a2[i]);
      }
    });

    /**
     * @tc.name testReadonlySetValues012
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0120
     * @tc.desc Verify underlying Set add is reflected in values() traversal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<int> = new Set<int>([1, 2]);
      const view: ReadonlySet<int> = ms;
      ms.add(3);
      let count: int = 0;
      for (const v of view.values()) {
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetValues013
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0130
     * @tc.desc Verify underlying Set clear is reflected in values() traversal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<int> = new Set<int>([1, 2, 3]);
      const view: ReadonlySet<int> = ms;
      ms.clear();
      let count: int = 0;
      for (const v of view.values()) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.name testReadonlySetValues014
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0140
     * @tc.desc Verify ReadonlySet<int[]> values() traverses array references
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: int[] = [1, 2];
      let a2: int[] = [3, 4];
      const set: ReadonlySet<int[]> = new Set<int[]>([a1, a2]);
      const iter = set.values();
      expect(iter.next().value === a1).assertTrue();
      expect(iter.next().value === a2).assertTrue();
    });

    /**
     * @tc.name testReadonlySetValues015
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0150
     * @tc.desc Verify ReadonlySet<ValuesPerson> values() traverses custom objects
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p1: ValuesPerson = new ValuesPerson();
      p1.name = "Alice";
      let p2: ValuesPerson = new ValuesPerson();
      p2.name = "Bob";
      const set: ReadonlySet<ValuesPerson> = new Set<ValuesPerson>([p1, p2]);
      const values: ValuesPerson[] = [];
      for (const v of set.values()) {
        values.push(v);
      }
      expect(values.length).assertEqual(2);
      expect(values[0].name).assertEqual("Alice");
      expect(values[1].name).assertEqual("Bob");
    });

    /**
     * @tc.name testReadonlySetValues016
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0160
     * @tc.desc Verify three independent values() iterators traverse independently
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3]);
      const i1 = set.values();
      const i2 = set.values();
      const i3 = set.values();
      i1.next();
      i1.next();
      expect(i1.next().value).assertEqual(3);
      expect(i2.next().value).assertEqual(1);
      expect(i3.next().value).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetValues017
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0170
     * @tc.desc Verify exhausted values iterator next() returns done=true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1]);
      const iter = set.values();
      iter.next();
      expect(iter.next().done).assertTrue();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testReadonlySetValues018
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0180
     * @tc.desc Verify break in for-of values() then manual next() resumes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3, 4]);
      const iter = set.values();
      for (const v of iter) {
        if (v === 2) {
          break;
        }
      }
      let r = iter.next();
      expect(r.value as int).assertEqual(3);
      expect(r.done).assertFalse();
    });

    /**
     * @tc.name testReadonlySetValues019
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0190
     * @tc.desc Verify object field mutation visible in values() traversal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: ValuesPerson = new ValuesPerson();
      p.name = "old";
      p.age = 10;
      const set: ReadonlySet<ValuesPerson> = new Set<ValuesPerson>([p]);
      p.name = "new";
      p.age = 99;
      const iter = set.values();
      let v = iter.next().value as ValuesPerson;
      expect(v.name).assertEqual("new");
      expect(v.age).assertEqual(99);
    });

    /**
     * @tc.name testReadonlySetValues020
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0200
     * @tc.desc Verify ReadonlySet<ValuesColor> values() traverses enum values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<ValuesColor> = new Set<ValuesColor>([ValuesColor.RED, ValuesColor.BLUE]);
      const values: ValuesColor[] = [];
      for (const v of set.values()) {
        values.push(v);
      }
      expect(values.length).assertEqual(2);
      expect(values[0]).assertEqual(ValuesColor.RED);
    });

    /**
     * @tc.name testReadonlySetValues021
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0210
     * @tc.desc Verify ReadonlySet<byte> values() traverses byte boundary values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<byte> = new Set<byte>([-128, 0, 127]);
      const values: byte[] = [];
      for (const v of set.values()) {
        values.push(v);
      }
      expect(values.length).assertEqual(3);
      expect(values[0]).assertEqual(-128);
      expect(values[2]).assertEqual(127);
    });

    /**
     * @tc.name testReadonlySetValues022
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0220
     * @tc.desc Verify ReadonlySet<short> values() traverses short boundary values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<short> = new Set<short>([-32768, 0, 32767]);
      const values: short[] = [];
      for (const v of set.values()) {
        values.push(v);
      }
      expect(values.length).assertEqual(3);
      expect(values[0]).assertEqual(-32768);
      expect(values[2]).assertEqual(32767);
    });

    /**
     * @tc.name testReadonlySetValues023
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0230
     * @tc.desc Verify ReadonlySet<char> values() traverses char elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<char> = new Set<char>([c'A', c'B']);
      let count: int = 0;
      for (const v of set.values()) {
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetValues024
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0240
     * @tc.desc Verify ReadonlySet<bigint> values() traverses bigint elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<bigint> = new Set<bigint>([1n, 2n, 3n]);
      let count: int = 0;
      for (const v of set.values()) {
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetValues025
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0250
     * @tc.desc Verify ReadonlySet<FixedArray<int>> values() traverses elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fa: FixedArray<int> = new FixedArray<int>(3);
      fa[0] = 1;
      fa[1] = 2;
      fa[2] = 3;
      const set: ReadonlySet<FixedArray<int>> = new Set<FixedArray<int>>([fa]);
      let count: int = 0;
      for (const v of set.values()) {
        count++;
      }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetValues026
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0260
     * @tc.desc Verify values() traversal unaffected by failed size modification
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3]);
      try {
        (set as Record<string, Object>)["size"] = 100;
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
      let count: int = 0;
      for (const v of set.values()) {
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetValues027
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0270
     * @tc.desc Verify ReadonlySet with scientific notation values() returns decimal values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<number> = new Set<number>([2.5e3, 1.2e6]);
      const values: number[] = [];
      for (const v of set.values()) {
        values.push(v);
      }
      expect(values.length).assertEqual(2);
      expect(values[0]).assertEqual(2500);
      expect(values[1]).assertEqual(1200000);
    });

    /**
     * @tc.name testReadonlySetValues028
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0280
     * @tc.desc Verify ReadonlySet<ValuesFinal> values() traverses final class objects
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f1: ValuesFinal = new ValuesFinal();
      f1.id = 10;
      let f2: ValuesFinal = new ValuesFinal();
      f2.id = 20;
      const set: ReadonlySet<ValuesFinal> = new Set<ValuesFinal>([f1, f2]);
      let count: int = 0;
      for (const v of set.values()) {
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetValues029
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0290
     * @tc.desc Verify ReadonlySet<ValuesDrawable> values() traverses interface implementors
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: ValuesRect = new ValuesRect();
      let r2: ValuesRect = new ValuesRect();
      const set: ReadonlySet<ValuesDrawable> = new Set<ValuesDrawable>([r1, r2]);
      let count: int = 0;
      for (const v of set.values()) {
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetValues030
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0300
     * @tc.desc Verify union type Set values() traverses string and int elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ms: Set<string | int> = new Set<string | int>();
      ms.add("text");
      ms.add(99);
      const set: ReadonlySet<string | int> = ms;
      let strCount: int = 0;
      let intCount: int = 0;
      for (const v of set.values()) {
        if (v === "text") {
          strCount++;
        } else if (v === 99) {
          intCount++;
        }
      }
      expect(strCount).assertEqual(1);
      expect(intCount).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetValues031
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0310
     * @tc.desc Verify ReadonlySet<long> values() traverses long boundary values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([9223372036854775807, -9223372036854775808, 0]);
      const values: long[] = [];
      for (const v of set.values()) {
        values.push(v);
      }
      expect(values.length).assertEqual(3);
      expect(values[0]).assertEqual(9223372036854775807);
      expect(values[1]).assertEqual(-9223372036854775808);
    });

    /**
     * @tc.name testReadonlySetValues032
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0320
     * @tc.desc Verify ReadonlySet<ValueArray<int>> values() traverses value array references
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let va1: ValueArray<int> = new ValueArray<int>(2);
      va1[0] = 1;
      va1[1] = 2;
      let va2: ValueArray<int> = new ValueArray<int>(2);
      va2[0] = 3;
      va2[1] = 4;
      const set: ReadonlySet<ValueArray<int>> = new Set<ValueArray<int>>([va1, va2]);
      const iter = set.values();
      expect(iter.next().value === va1).assertTrue();
      expect(iter.next().value === va2).assertTrue();
    });

    /**
     * @tc.name testReadonlySetValues033
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0330
     * @tc.desc Verify values() with surrogate pair string traverses correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string> = new Set<string>(["𝄞", "𝕬"]);
      const values: string[] = [];
      for (const v of set.values()) {
        values.push(v);
      }
      expect(values.length).assertEqual(2);
      expect(values[0]).assertEqual("𝄞");
      expect(values[1]).assertEqual("𝕬");
    });

    /**
     * @tc.name testReadonlySetValues034
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0340
     * @tc.desc Verify values() keys() consistency for all elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3, 4]);
      const valArr: int[] = [];
      const keyArr: int[] = [];
      for (const v of set.values()) {
        valArr.push(v);
      }
      for (const k of set.keys()) {
        keyArr.push(k);
      }
      for (let i = 0; i < valArr.length; i++) {
        expect(valArr[i]).assertEqual(keyArr[i]);
      }
    });

    /**
     * @tc.name testReadonlySetValues035
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0350
     * @tc.desc Verify values() with large Set of 1000 elements counts correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [];
      for (let i = 0; i < 1000; i++) {
        arr.push(i);
      }
      const set: ReadonlySet<int> = new Set<int>(arr);
      let count: int = 0;
      for (const v of set.values()) {
        count++;
      }
      expect(count).assertEqual(1000);
    });

    /**
     * @tc.name testReadonlySetValues036
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0360
     * @tc.desc Verify values() with enum ValuesColor traverses all enum constants
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<ValuesColor> = new Set<ValuesColor>([ValuesColor.RED, ValuesColor.GREEN, ValuesColor.BLUE]);
      let count: int = 0;
      for (const v of set.values()) {
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetValues037
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0370
     * @tc.desc Verify values() with double precision boundary
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<number> = new Set<number>([9007199254740992, 9007199254740994]);
      let count: int = 0;
      for (const v of set.values()) {
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetValues038
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0380
     * @tc.desc Verify values() for-of with continue skips middle element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3, 4, 5]);
      const result: int[] = [];
      for (const v of set.values()) {
        if (v === 3) {
          continue;
        }
        result.push(v);
      }
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[3]).assertEqual(5);
    });

    /**
     * @tc.name testReadonlySetValues039
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0390
     * @tc.desc Verify values() with 2D int[][] array references
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m1: int[][] = [[1, 2]];
      let m2: int[][] = [[3, 4]];
      const set: ReadonlySet<int[][]> = new Set<int[][]>([m1, m2]);
      const iter = set.values();
      expect(iter.next().value === m1).assertTrue();
      expect(iter.next().value === m2).assertTrue();
    });

    /**
     * @tc.name testReadonlySetValues040
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0400
     * @tc.desc Verify values() iterator can be reused in multiple for-of loops
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3]);
      let count1: int = 0;
      for (const v of set.values()) {
        count1++;
      }
      let count2: int = 0;
      for (const v of set.values()) {
        count2++;
      }
      expect(count1).assertEqual(3);
      expect(count2).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetValues041
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0410
     * @tc.desc Verify values() traverses duplicate constructor elements deduplicated
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 1, 2, 2, 3]);
      let count: int = 0;
      for (const v of set.values()) {
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetValues042
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0420
     * @tc.desc Verify values() with underlying delete skips deleted element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<int> = new Set<int>([1, 2, 3, 4]);
      const view: ReadonlySet<int> = ms;
      ms.delete(2);
      const values: int[] = [];
      for (const v of view.values()) {
        values.push(v);
      }
      expect(values.length).assertEqual(3);
      expect(values[0]).assertEqual(1);
      expect(values[1]).assertEqual(3);
      expect(values[2]).assertEqual(4);
    });

    /**
     * @tc.name testReadonlySetValues043
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0430
     * @tc.desc Verify values() for Set with long type negative values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([-1, -999, 0, 1]);
      const values: long[] = [];
      for (const v of set.values()) {
        values.push(v);
      }
      expect(values.length).assertEqual(4);
      expect(values[0]).assertEqual(-1);
      expect(values[1]).assertEqual(-999);
      expect(values[2]).assertEqual(0);
      expect(values[3]).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetValues044
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0440
     * @tc.desc Verify values() traversal unaffected by failed cast modification
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3]);
      try {
        (set as Record<string, Object>)["delete"] = "invalid";
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
      let count: int = 0;
      for (const v of set.values()) {
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetValues045
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0450
     * @tc.desc Verify values() with ReadonlySet<number> containing Infinity and NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<number> = new Set<number>([Number.POSITIVE_INFINITY, Number.NEGATIVE_INFINITY, Number.NaN]);
      let count: int = 0;
      let hasNaN: boolean = false;
      for (const v of set.values()) {
        if (Number.isNaN(v)) {
          hasNaN = true;
        }
        count++;
      }
      expect(count).assertEqual(3);
      expect(hasNaN).assertTrue();
    });

    /**
     * @tc.name testReadonlySetValues046
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0460
     * @tc.desc Verify values() with char type traverses correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<char> = new Set<char>([c'X', c'Y', c'Z']);
      let count: int = 0;
      for (const v of set.values()) {
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetValues047
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0470
     * @tc.desc Verify values() with bigint type traverses all elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<bigint> = new Set<bigint>([100n, 200n]);
      let count: int = 0;
      for (const v of set.values()) {
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**

    /**
     * @tc.name testReadonlySetValues048
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0480
     * @tc.desc Verify values() with for-of continue and has combined check
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3, 4, 5]);
      for (const v of set.values()) {
        expect(set.has(v)).assertTrue();
        if (v === 3) {
          continue;
        }
      }
    });

/**
     * @tc.name testReadonlySetValues049
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0490
     * @tc.desc Verify values() collects int elements [1,2,3]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3]);
      const values: int[] = [];
      for (const v of set.values()) {
        values.push(v);
      }
      expect(values.length).assertEqual(3);
      expect(values[0]).assertEqual(1);
      expect(values[2]).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetValues050
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0500
     * @tc.desc Verify values() counts long elements [1,2,3]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([1, 2, 3]);
      const values: long[] = [];
      for (const v of set.values()) {
        values.push(v);
      }
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetValues051
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0510
     * @tc.desc Verify values() counts string elements [a,b]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string> = new Set<string>(["a", "b"]);
      let count: int = 0;
      for (const v of set.values()) {
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetValues052
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0520
     * @tc.desc Verify values() with boolean true/false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<boolean> = new Set<boolean>([true, false]);
      const values: boolean[] = [];
      for (const v of set.values()) {
        values.push(v);
      }
      expect(values.length).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetValues053
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0530
     * @tc.desc Verify values() sums number elements [1.1,2.2,3.3]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<number> = new Set<number>([1.1, 2.2, 3.3]);
      let sum: number = 0;
      for (const v of set.values()) {
        sum += v;
      }
      expect(Math.abs(sum - 6.6) < 0.0001).assertTrue();
    });

    /**
     * @tc.name testReadonlySetValues054
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0540
     * @tc.desc Verify values() dedup count [10,20,30,20,10]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([10, 20, 30, 20, 10]);
      let count: int = 0;
      for (const v of set.values()) {
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetValues055
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0550
     * @tc.desc Verify values() reflects underlying Set add
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<int> = new Set<int>([1, 2, 3]);
      const view: ReadonlySet<int> = ms;
      ms.add(4);
      let count: int = 0;
      for (const v of view.values()) {
        count++;
      }
      expect(count).assertEqual(4);
    });

    /**
     * @tc.name testReadonlySetValues056
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0560
     * @tc.desc Verify values() reflects underlying Set delete
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<int> = new Set<int>([1, 2, 3]);
      const view: ReadonlySet<int> = ms;
      ms.delete(2);
      const values: int[] = [];
      for (const v of view.values()) {
        values.push(v);
      }
      expect(values.length).assertEqual(2);
      expect(values[0]).assertEqual(1);
      expect(values[1]).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetValues057
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0570
     * @tc.desc Verify values() with byte boundary elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<byte> = new Set<byte>([-128, 0, 127]);
      const values: byte[] = [];
      for (const v of set.values()) {
        values.push(v);
      }
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetValues058
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0580
     * @tc.desc Verify values() with short boundary elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<short> = new Set<short>([-32768, 0, 32767]);
      const values: short[] = [];
      for (const v of set.values()) {
        values.push(v);
      }
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetValues059
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0590
     * @tc.desc Verify values() with enum Vp2Flag YES/NO
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<Vp2Flag> = new Set<Vp2Flag>([Vp2Flag.YES, Vp2Flag.NO]);
      const values: Vp2Flag[] = [];
      for (const v of set.values()) {
        values.push(v);
      }
      expect(values.length).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetValues060
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0600
     * @tc.desc Verify values() filters odd numbers from int Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3, 4, 5]);
      const values: int[] = [];
      for (const v of set.values()) {
        if (v % 2 !== 0) {
          values.push(v);
        }
      }
      expect(values.length).assertEqual(3);
      expect(values[0]).assertEqual(1);
      expect(values[1]).assertEqual(3);
      expect(values[2]).assertEqual(5);
    });

    /**

    /**
     * @tc.name testReadonlySetValues061
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0610
     * @tc.desc Verify values() with custom Vp2Label class
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<Vp2Label> = new Set<Vp2Label>([new Vp2Label("x"), new Vp2Label("y")]);
      let count: int = 0;
      for (const v of set.values()) {
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetValues062
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0620
     * @tc.desc Verify values() manual next() returns [5,10,15]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([5, 10, 15]);
      const iter = set.values();
      expect(iter.next().value).assertEqual(5);
      expect(iter.next().value).assertEqual(10);
      expect(iter.next().value).assertEqual(15);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testReadonlySetValues063
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0630
     * @tc.desc Verify values() sums long elements [-1,0,1]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([-1, 0, 1]);
      let sum: long = 0;
      for (const v of set.values()) {
        sum += v;
      }
      expect(sum).assertEqual(0);
    });

    /**
     * @tc.name testReadonlySetValues064
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0640
     * @tc.desc Verify values() single element done transition
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([100]);
      const iter = set.values();
      expect(iter.next().done).assertFalse();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testReadonlySetValues065
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0650
     * @tc.desc Verify two values() traversals produce identical results
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([1, 2, 3]);
      const values1: long[] = [];
      const values2: long[] = [];
      for (const v of set.values()) {
        values1.push(v);
      }
      for (const v of set.values()) {
        values2.push(v);
      }
      expect(values1.length).assertEqual(values2.length);
      expect(values1[0]).assertEqual(values2[0]);
    });

    /**
     * @tc.name testReadonlySetValues066
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0660
     * @tc.desc Verify values() break at middle element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([10, 20, 30, 40, 50]);
      const iter = set.values();
      for (const v of iter) {
        if (v === 30) {
          break;
        }
      }
      const r = iter.next();
      expect(r.value as long).assertEqual(40);
      expect(r.done).assertFalse();
    });

    /**
     * @tc.name testReadonlySetValues067
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0670
     * @tc.desc Verify values() computes product [7,14,21]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([7, 14, 21]);
      let product: long = 1;
      for (const v of set.values()) {
        product *= v;
      }
      expect(product).assertEqual(2058);
    });

    /**
     * @tc.name testReadonlySetValues068
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0680
     * @tc.desc Verify values() with single zero element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([0]);
      const values: long[] = [];
      for (const v of set.values()) {
        values.push(v);
      }
      expect(values.length).assertEqual(1);
      expect(values[0]).assertEqual(0);
    });

    /**
     * @tc.name testReadonlySetValues069
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0690
     * @tc.desc Verify values() filters elements >= 100
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([50, 100, 150, 200]);
      const values: long[] = [];
      for (const v of set.values()) {
        if (v >= 100) {
          values.push(v);
        }
      }
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetValues070
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0700
     * @tc.desc Verify values() manual next() returns [2,4,6,8]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([2, 4, 6, 8]);
      const iter = set.values();
      let r = iter.next();
      expect(r.value).assertEqual(2);
      r = iter.next();
      expect(r.value).assertEqual(4);
      r = iter.next();
      expect(r.value).assertEqual(6);
      r = iter.next();
      expect(r.value).assertEqual(8);
      r = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.name testReadonlySetValues071
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0710
     * @tc.desc Verify values() counts negative long elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([-5, -3, -1]);
      let count: int = 0;
      for (const v of set.values()) {
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetValues072
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0720
     * @tc.desc Verify values() iterator has next() method
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([1, 2, 3]);
      const iter = set.values();
      expect(typeof iter.next).assertEqual("function");
    });

    /**

    /**
     * @tc.name testReadonlySetValues073
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0730
     * @tc.desc Verify values() first element is 10
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([10, 20, 30]);
      const a: long[] = [];
      for (const v of set.values()) {
        a.push(v);
      }
      expect(a[0]).assertEqual(10);
    });

    /**
     * @tc.name testReadonlySetValues074
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0740
     * @tc.desc Verify values() first and last elements are 1 and 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([1, 2, 3]);
      const a: long[] = [];
      for (const v of set.values()) {
        a.push(v);
      }
      expect(a[0]).assertEqual(1);
      expect(a[2]).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetValues075
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0750
     * @tc.desc Verify values() counts 5 elements [5,10,15,20,25]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([5, 10, 15, 20, 25]);
      let c: int = 0;
      for (const v of set.values()) {
        c++;
      }
      expect(c).assertEqual(5);
    });

    /**
     * @tc.name testReadonlySetValues076
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0760
     * @tc.desc Verify values() sums elements [2,4,6]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([2, 4, 6]);
      let s: long = 0;
      for (const v of set.values()) {
        s += v;
      }
      expect(s).assertEqual(12);
    });

    /**
     * @tc.name testReadonlySetValues077
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0770
     * @tc.desc Verify values() counts 5 elements [-3,-1,0,1,3]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([-3, -1, 0, 1, 3]);
      let c: int = 0;
      for (const v of set.values()) {
        c++;
      }
      expect(c).assertEqual(5);
    });

    /**
     * @tc.name testReadonlySetValues078
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0780
     * @tc.desc Verify values() dedup count [7,14,21,14,7]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([7, 14, 21, 14, 7]);
      let c: int = 0;
      for (const v of set.values()) {
        c++;
      }
      expect(c).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetValues079
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0790
     * @tc.desc Verify values() manual next() returns [1,2,3]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([1, 2, 3]);
      const i = set.values();
      expect(i.next().value).assertEqual(1);
      expect(i.next().value).assertEqual(2);
      expect(i.next().value).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetValues080
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0800
     * @tc.desc Verify values() mid-iteration returns 30
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([10, 20, 30]);
      const i = set.values();
      i.next();
      i.next();
      expect(i.next().value).assertEqual(30);
    });

    /**
     * @tc.name testReadonlySetValues081
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0810
     * @tc.desc Verify values() returns [5,10] then done
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([5, 10]);
      const i = set.values();
      expect(i.next().value).assertEqual(5);
      expect(i.next().value).assertEqual(10);
      expect(i.next().done).assertTrue();
    });

    /**
     * @tc.name testReadonlySetValues082
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0820
     * @tc.desc Verify values() iterator has next() method
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([1, 2, 3]);
      expect(typeof set.values().next).assertEqual("function");
    });

    /**
     * @tc.name testReadonlySetValues083
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0830
     * @tc.desc Verify values() filters values > 150
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([100, 200, 300]);
      const a: long[] = [];
      for (const v of set.values()) {
        if (v > 150) {
          a.push(v);
        }
      }
      expect(a.length).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetValues084
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0840
     * @tc.desc Verify values() sums elements [4,8,12,16]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([4, 8, 12, 16]);
      let s: long = 0;
      for (const v of set.values()) {
        s += v;
      }
      expect(s).assertEqual(40);
    });

    /**
     * @tc.name testReadonlySetValues085
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0850
     * @tc.desc Verify values() collects 3 elements [-10,0,10]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([-10, 0, 10]);
      const a: long[] = [];
      for (const v of set.values()) {
        a.push(v);
      }
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetValues086
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0860
     * @tc.desc Verify two values() traversals have equal count
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([1, 2, 3]);
      let c1: int = 0;
      for (const v of set.values()) {
        c1++;
      }
      let c2: int = 0;
      for (const v of set.values()) {
        c2++;
      }
      expect(c1).assertEqual(c2);
    });

    /**
     * @tc.name testReadonlySetValues087
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0870
     * @tc.desc Verify values() filters even elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([3, 6, 9, 12]);
      const a: long[] = [];
      for (const v of set.values()) {
        if (v % 2 === 0) {
          a.push(v);
        }
      }
      expect(a.length).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetValues088
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0880
     * @tc.desc Verify values() first and last are 2 and 6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([2, 4, 6]);
      const a: long[] = [];
      for (const v of set.values()) {
        a.push(v);
      }
      expect(a[0]).assertEqual(2);
      expect(a[2]).assertEqual(6);
    });

    /**
     * @tc.name testReadonlySetValues089
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0890
     * @tc.desc Verify values() sums odd elements [1,3,5]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([1, 3, 5]);
      let s: long = 0;
      for (const v of set.values()) {
        s += v;
      }
      expect(s).assertEqual(9);
    });

    /**
     * @tc.name testReadonlySetValues090
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0900
     * @tc.desc Verify values() filters positive elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([-5, 5, 10]);
      const a: long[] = [];
      for (const v of set.values()) {
        if (v > 0) {
          a.push(v);
        }
      }
      expect(a.length).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetValues091
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0910
     * @tc.desc Verify values() next() returns [15,30,45]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([15, 30, 45]);
      const i = set.values();
      expect(i.next().value).assertEqual(15);
      expect(i.next().value).assertEqual(30);
      expect(i.next().value).assertEqual(45);
    });

    /**
     * @tc.name testReadonlySetValues092
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0920
     * @tc.desc Verify values() finds max element [8,16,24]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([8, 16, 24]);
      let mx: long = -999;
      for (const v of set.values()) {
        if (v > mx) {
          mx = v;
        }
      }
      expect(mx).assertEqual(24);
    });

    /**
     * @tc.name testReadonlySetValues093
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0930
     * @tc.desc Verify values() finds min element [8,16,24]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([8, 16, 24]);
      let mn: long = 999;
      for (const v of set.values()) {
        if (v < mn) {
          mn = v;
        }
      }
      expect(mn).assertEqual(8);
    });

    /**
     * @tc.name testReadonlySetValues094
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0940
     * @tc.desc Verify two values() traversals start with same element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([1, 2, 3]);
      const v1: long[] = [];
      const v2: long[] = [];
      for (const v of set.values()) {
        v1.push(v);
      }
      for (const v of set.values()) {
        v2.push(v);
      }
      expect(v1[0]).assertEqual(v2[0]);
    });

    /**
     * @tc.name testReadonlySetValues095
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0950
     * @tc.desc Verify values() collects [2,4,6,8,10] in order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([2, 4, 6, 8, 10]);
      const a: long[] = [];
      for (const v of set.values()) {
        a.push(v);
      }
      expect(a.length).assertEqual(5);
      expect(a[0]).assertEqual(2);
      expect(a[4]).assertEqual(10);
    });

    /**
     * @tc.name testReadonlySetValues096
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0960
     * @tc.desc Verify two values() sums are equal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([1, 2, 3]);
      let s1: long = 0;
      for (const v of set.values()) {
        s1 += v;
      }
      let s2: long = 0;
      for (const v of set.values()) {
        s2 += v;
      }
      expect(s1).assertEqual(s2);
    });

    /**
     * @tc.name testReadonlySetValues097
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0970
     * @tc.desc Verify values() maps to *2 array [3,6,9]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([3, 6, 9]);
      const a: long[] = [];
      for (const v of set.values()) {
        a.push(v * 2);
      }
      expect(a[0]).assertEqual(6);
      expect(a[1]).assertEqual(12);
      expect(a[2]).assertEqual(18);
    });

    /**
     * @tc.name testReadonlySetValues098
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0980
     * @tc.desc Verify values() count equals set.size
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([1, 2, 3]);
      let c: int = 0;
      for (const v of set.values()) {
        c++;
      }
      expect(c).assertEqual(set.size);
    });

    /**
     * @tc.name testReadonlySetValues099
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_0990
     * @tc.desc Verify values() collects [7,14,21] in order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([7, 14, 21]);
      const a: long[] = [];
      for (const v of set.values()) {
        a.push(v);
      }
      expect(a[0]).assertEqual(7);
      expect(a[1]).assertEqual(14);
      expect(a[2]).assertEqual(21);
    });

    /**
     * @tc.name testReadonlySetValues100
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_1000
     * @tc.desc Verify values() next() returns first value 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([1, 2, 3]);
      expect(set.values().next().value as long).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetValues101
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_1010
     * @tc.desc Verify values() cross-method consistency: values count equals entries count and size
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3, 4, 5]);
      let valCount: int = 0;
      for (const _ of set.values()) {
        valCount++;
      }
      let entCount: int = 0;
      for (const _ of set.entries()) {
        entCount++;
      }
      expect(valCount).assertEqual(entCount);
      expect(valCount).assertEqual(set.size);
    });

    /**
     * @tc.name testReadonlySetValues102
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETVALUES_1020
     * @tc.desc Verify values() spread operator collects all values correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetValues102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string> = new Set<string>(["a", "b", "c"]);
      const values: string[] = [...set.values()];
      expect(values.length).assertEqual(3);
      expect(values[0]).assertEqual("a");
      expect(values[1]).assertEqual("b");
      expect(values[2]).assertEqual("c");
    });
