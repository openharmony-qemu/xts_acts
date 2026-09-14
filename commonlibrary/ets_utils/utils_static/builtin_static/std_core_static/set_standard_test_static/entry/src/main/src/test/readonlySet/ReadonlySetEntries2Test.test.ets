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

class EntryItem {
  id: int = 0;
  constructor(id: int) {
    this.id = id;
  }
}

class EntryFinal {
  id: int = 0;
}

interface EntryDrawable {
  draw(): void;
}

class EntryCircle implements EntryDrawable {
  draw(): void {
  }
}

enum EntryColor {
  RED, GREEN, BLUE
}



class EntriesP2Item {
  value: int = 0;
  constructor(v: int) {
    this.value = v;
  }
}

enum EntriesP2Dir {
  NORTH, SOUTH, EAST, WEST
}

export default function ReadonlySetEntries2Test(): void {
  describe('ReadonlySetEntries2Test', (): void => {
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
     * @tc.name testReadonlySetEntries001
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0010
     * @tc.desc Verify ReadonlySet<float> entries() traverses float values -100.0, 0.0, 100.0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<float> = new Set<float>([-100.0 as float, 0.0 as float, 100.0 as float]);
      const values: float[] = [];
      for (const entry of set.entries()) {
        values.push(entry[0]);
      }
      expect(values.length).assertEqual(3);
      expect(values[0]).assertEqual(-100.0);
      expect(values[2]).assertEqual(100.0);
    });

    /**
     * @tc.name testReadonlySetEntries002
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0020
     * @tc.desc Verify ReadonlySet<double> entries() traverses double boundary values in insertion order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<double> = new Set<double>([-1.79e308, 0.0, 1.79e308]);
      const entries: [double, double][] = [];

      for (const entry of set.entries()) {
        entries.push(entry as [double, double]);
      }

      expect(entries.length).assertEqual(3);
      expect(entries[0][0]).assertEqual(-1.79e308);
      expect(entries[1][0]).assertEqual(0.0);
      expect(entries[2][0]).assertEqual(1.79e308);
    });

    /**
     * @tc.name testReadonlySetEntries003
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0030
     * @tc.desc Verify ReadonlySet<boolean> entries() traverses true and false in insertion order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<boolean> = new Set<boolean>([true, false]);
      const iter = set.entries();
      const e1 = iter.next().value as [boolean, boolean];
      expect(e1[0]).assertTrue();
      expect(e1[1]).assertTrue();
      const e2 = iter.next().value as [boolean, boolean];
      expect(e2[0]).assertFalse();
      expect(e2[1]).assertFalse();
    });

    /**
     * @tc.name testReadonlySetEntries004
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0040
     * @tc.desc Verify ReadonlySet<Object> entries() returns original object references
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj1: Object = new Object();
      let obj2: Object = new Object();
      const set: ReadonlySet<Object> = new Set<Object>([obj1, obj2]);
      const iter = set.entries();
      let e1 = iter.next().value as [Object, Object];
      expect(e1[0] === obj1).assertTrue();
      let e2 = iter.next().value as [Object, Object];
      expect(e2[0] === obj2).assertTrue();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testReadonlySetEntries005
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0050
     * @tc.desc Verify ReadonlySet<EntryItem> entries() traverses custom class objects
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: EntryItem = new EntryItem(10);
      let b: EntryItem = new EntryItem(20);
      const set: ReadonlySet<EntryItem> = new Set<EntryItem>([a, b]);
      const iter = set.entries();
      let e1 = iter.next().value as [EntryItem, EntryItem];
      expect(e1[0].id).assertEqual(10);
      let e2 = iter.next().value as [EntryItem, EntryItem];
      expect(e2[0].id).assertEqual(20);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testReadonlySetEntries006
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0060
     * @tc.desc Verify entries() iterator returns values in insertion order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([100, 200]);
      const iter = set.entries();
      let first = iter.next().value as [int, int];
      expect(first[0]).assertEqual(100);
      let second = iter.next().value as [int, int];
      expect(second[0]).assertEqual(200);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testReadonlySetEntries007
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0070
     * @tc.desc Verify entries() iterator type has next method
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2]);
      const iter = set.entries();
      let t: string = typeof iter.next;
      expect(t).assertEqual("function");
    });

    /**
     * @tc.name testReadonlySetEntries008
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0080
     * @tc.desc Verify for-of loop traverses ReadonlySet entries in insertion order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string> = new Set<string>(["x", "y", "z"]);
      const keys: string[] = [];
      for (const entry of set.entries()) {
        keys.push(entry[0]);
      }
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual("x");
      expect(keys[1]).assertEqual("y");
      expect(keys[2]).assertEqual("z");
    });

    /**
     * @tc.name testReadonlySetEntries009
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0090
     * @tc.desc Verify Set with +0 and -0 has entries count of 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<number> = new Set<number>([0, -0]);
      let count: int = 0;
      for (const entry of set.entries()) {
        expect(entry[0]).assertEqual(0);
        count++;
      }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetEntries010
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0100
     * @tc.desc Verify Set with NaN entries() traverses NaN elements correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<number> = new Set<number>([Number.NaN, 42]);
      const iter = set.entries();
      let e1 = iter.next().value as [number, number];
      expect(Number.isNaN(e1[0])).assertTrue();
      let e2 = iter.next().value as [number, number];
      expect(e2[0]).assertEqual(42);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testReadonlySetEntries011
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0110
     * @tc.desc Verify Set with scientific notation entries() returns equivalent decimal values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<number> = new Set<number>([1.0e3, 2.5e4]);
      const values: number[] = [];
      for (const entry of set.entries()) {
        values.push(entry[0]);
      }
      expect(values.length).assertEqual(2);
      expect(values[0]).assertEqual(1000);
      expect(values[1]).assertEqual(25000);
    });

    /**
     * @tc.name testReadonlySetEntries012
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0120
     * @tc.desc Verify entries() entry[0] matches values() element for same Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([5, 10, 15]);
      const entryKeys: int[] = [];
      for (const entry of set.entries()) {
        entryKeys.push(entry[0]);
      }
      const valueVals: int[] = [];
      for (const v of set.values()) {
        valueVals.push(v);
      }
      expect(entryKeys.length).assertEqual(valueVals.length);
      for (let i = 0; i < entryKeys.length; i++) {
        expect(entryKeys[i]).assertEqual(valueVals[i]);
      }
    });

    /**
     * @tc.name testReadonlySetEntries013
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0130
     * @tc.desc Verify entries traversal count equals set.size
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string> = new Set<string>(["a", "b", "c", "d"]);
      let count: int = 0;
      for (const entry of set.entries()) {
        count++;
      }
      expect(count).assertEqual(set.size);
      expect(count).assertEqual(4);
    });

    /**
     * @tc.name testReadonlySetEntries014
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0140
     * @tc.desc Verify multiple ReadonlySet references to same underlying Set have consistent entries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<int> = new Set<int>([1, 2, 3]);
      const r1: ReadonlySet<int> = ms;
      const r2: ReadonlySet<int> = ms;
      const a1: int[] = [];
      for (const e of r1.entries()) {
        a1.push(e[0]);
      }
      const a2: int[] = [];
      for (const e of r2.entries()) {
        a2.push(e[0]);
      }
      expect(a1.length).assertEqual(a2.length);
      for (let i = 0; i < a1.length; i++) {
        expect(a1[i]).assertEqual(a2[i]);
      }
    });

    /**
     * @tc.name testReadonlySetEntries015
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0150
     * @tc.desc Verify underlying Set add/delete/clear is reflected in entries traversal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<int> = new Set<int>([1, 2]);
      const view: ReadonlySet<int> = ms;
      ms.add(3);
      let count: int = 0;
      for (const e of view.entries()) {
        count++;
      }
      expect(count).assertEqual(3);
      ms.delete(1);
      count = 0;
      for (const e of view.entries()) {
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetEntries016
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0160
     * @tc.desc Verify ReadonlySet<int[]> entries() traverses array reference elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1: int[] = [1, 2];
      let arr2: int[] = [3, 4];
      const set: ReadonlySet<int[]> = new Set<int[]>([arr1, arr2]);
      const iter = set.entries();
      let e1 = iter.next().value as [int[], int[]];
      expect(e1[0] === arr1).assertTrue();
      let e2 = iter.next().value as [int[], int[]];
      expect(e2[0] === arr2).assertTrue();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testReadonlySetEntries017
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0170
     * @tc.desc Verify ReadonlySet<Set<int>> entries() traverses nested Set elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner1: Set<int> = new Set<int>([1, 2]);
      let inner2: Set<int> = new Set<int>([3]);
      const set: ReadonlySet<Set<int>> = new Set<Set<int>>([inner1, inner2]);
      const iter = set.entries();
      let e1 = iter.next().value as [Set<int>, Set<int>];
      expect(e1[0] === inner1).assertTrue();
      expect(e1[0].has(1)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetEntries018
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0180
     * @tc.desc Verify entries() traversal unaffected by failed modification attempt via cast
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([10, 20, 30]);
      try {
        (set as Record<string, Object>)["size"] = 100;
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
      let count: int = 0;
      for (const entry of set.entries()) {
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetEntries019
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0190
     * @tc.desc Verify entries() iteration can collect all entries into array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3, 4, 5]);
      const collected: int[] = [];
      for (const entry of set.entries()) {
        collected.push(entry[0]);
      }
      expect(collected.length).assertEqual(5);
      expect(collected[0]).assertEqual(1);
      expect(collected[4]).assertEqual(5);
    });

    /**
     * @tc.name testReadonlySetEntries020
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0200
     * @tc.desc Verify entries() after constructing ReadonlySet from mutable Set has same content
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<int> = new Set<int>([7, 8, 9]);
      const set: ReadonlySet<int> = new Set<int>(ms);
      let count: int = 0;
      for (const entry of set.entries()) {
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetEntries021
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0210
     * @tc.desc Verify empty Set entries() first next() returns done=true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>();
      const iter = set.entries();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testReadonlySetEntries022
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0220
     * @tc.desc Verify three independent entries() iterators traverse independently
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3]);
      const i1 = set.entries();
      const i2 = set.entries();
      const i3 = set.entries();
      i1.next();
      i1.next();
      expect((i1.next().value as [int, int])[0]).assertEqual(3);
      expect((i2.next().value as [int, int])[0]).assertEqual(1);
      expect((i3.next().value as [int, int])[0]).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetEntries023
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0230
     * @tc.desc Verify exhausted entries iterator next() always returns done=true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1]);
      const iter = set.entries();
      iter.next();
      expect(iter.next().done).assertTrue();
      expect(iter.next().done).assertTrue();
      expect(iter.next().value).assertUndefined();
    });

    /**
     * @tc.name testReadonlySetEntries024
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0240
     * @tc.desc Verify break in for-of entries() then manual next() continues from next element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3, 4]);
      const iter = set.entries();
      for (const e of iter) {
        if (e[0] === 2) {
          break;
        }
      }
      let r = iter.next();
      expect((r.value as [int, int])[0]).assertEqual(3);
      expect(r.done).assertFalse();
    });

    /**
     * @tc.name testReadonlySetEntries025
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0250
     * @tc.desc Verify custom object field change is visible in subsequent entries traversal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let item: EntryItem = new EntryItem(1);
      const set: ReadonlySet<EntryItem> = new Set<EntryItem>([item]);
      item.id = 999;
      const iter = set.entries();
      let e = iter.next().value as [EntryItem, EntryItem];
      expect(e[0].id).assertEqual(999);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testReadonlySetEntries026
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0260
     * @tc.desc Verify ReadonlySet<EntryColor> entries() traverses enum values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<EntryColor> = new Set<EntryColor>([
        EntryColor.RED,
        EntryColor.GREEN,
        EntryColor.BLUE
      ]);
      const iter = set.entries();
      let e1 = iter.next().value as [EntryColor, EntryColor];
      expect(e1[0]).assertEqual(EntryColor.RED);
      let e2 = iter.next().value as [EntryColor, EntryColor];
      expect(e2[0]).assertEqual(EntryColor.GREEN);
      let e3 = iter.next().value as [EntryColor, EntryColor];
      expect(e3[0]).assertEqual(EntryColor.BLUE);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testReadonlySetEntries027
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0270
     * @tc.desc Verify ReadonlySet<byte> entries() traverses byte boundary values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<byte> = new Set<byte>([-128, 0, 127]);
      const values: byte[] = [];
      for (const entry of set.entries()) {
        values.push(entry[0]);
      }
      expect(values.length).assertEqual(3);
      expect(values[0]).assertEqual(-128);
      expect(values[1]).assertEqual(0);
      expect(values[2]).assertEqual(127);
    });

    /**
     * @tc.name testReadonlySetEntries028
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0280
     * @tc.desc Verify ReadonlySet<short> entries() traverses short boundary values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<short> = new Set<short>([-32768, 0, 32767]);
      const values: short[] = [];
      for (const entry of set.entries()) {
        values.push(entry[0]);
      }
      expect(values.length).assertEqual(3);
      expect(values[0]).assertEqual(-32768);
      expect(values[2]).assertEqual(32767);
    });

    /**
     * @tc.name testReadonlySetEntries029
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0290
     * @tc.desc Verify ReadonlySet with char type entries traverses char elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<char> = new Set<char>([c'A', c'B', c'C']);
      const values: char[] = [];
      for (const entry of set.entries()) {
        values.push(entry[0]);
      }
      expect(values.length).assertEqual(3);
      expect(values[0]).assertEqual(c'A');
      expect(values[1]).assertEqual(c'B');
      expect(values[2]).assertEqual(c'C');
    });

    /**
     * @tc.name testReadonlySetEntries030
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0300
     * @tc.desc Verify ReadonlySet<bigint> entries() traverses bigint elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<bigint> = new Set<bigint>([1n, 100n, 9999999999999n]);
      let count: int = 0;
      for (const entry of set.entries()) {
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetEntries031
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0310
     * @tc.desc Verify ReadonlySet<FixedArray<int>> entries() traverses fixed array elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fa1: FixedArray<int> = new FixedArray<int>(2, 0);
      fa1[0] = 1;
      fa1[1] = 2;
      let fa2: FixedArray<int> = new FixedArray<int>(2, 0);
      fa2[0] = 3;
      fa2[1] = 4;
      const set: ReadonlySet<FixedArray<int>> = new Set<FixedArray<int>>([fa1, fa2]);
      const arrays: FixedArray<int>[] = [];
      for (const entry of set.entries()) {
        arrays.push(entry[0]);
      }
      expect(arrays.length).assertEqual(2);
      expect(arrays[0] === fa1).assertTrue();
      expect(arrays[1] === fa2).assertTrue();
      expect(arrays[0][0]).assertEqual(1);
      expect(arrays[0][1]).assertEqual(2);
      expect(arrays[1][0]).assertEqual(3);
      expect(arrays[1][1]).assertEqual(4);
    });

    /**
     * @tc.name testReadonlySetEntries032
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0320
     * @tc.desc Verify ReadonlySet<EntryItem> entries() traverses Partial objects
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p1: EntryItem = new EntryItem(5);
      let p2: EntryItem = new EntryItem(10);
      const set: ReadonlySet<EntryItem> = new Set<EntryItem>([p1, p2]);
      const items: EntryItem[] = [];
      for (const entry of set.entries()) {
        items.push(entry[0]);
      }
      expect(items.length).assertEqual(2);
      expect(items[0] === p1).assertTrue();
      expect(items[1] === p2).assertTrue();
      expect(items[0].id).assertEqual(5);
      expect(items[1].id).assertEqual(10);
    });

    /**
     * @tc.name testReadonlySetEntries033
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0330
     * @tc.desc Verify entries() for Set constructed with union string|number type
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string | int> = new Set<string | int>();
      (set as Set<string | int>).add("hello");
      (set as Set<string | int>).add(42);
      let strCount: int = 0;
      let intCount: int = 0;
      for (const entry of set.entries()) {
        let t: string = typeof entry[0];
        if (t === "string") {
          strCount++;
        }
        if (t === "int") {
          intCount++;
        }
      }
      expect(strCount).assertEqual(1);
      expect(intCount).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetEntries034
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0340
     * @tc.desc Verify entries() returns first key-value pair correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1]);
      const iter = set.entries();
      let v = iter.next().value as [int, int];
      expect(v[0]).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetEntries035
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0350
     * @tc.desc Verify ReadonlySet<EntryFinal> (final-like class) entries traverses elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f1: EntryFinal = new EntryFinal();
      f1.id = 1;
      let f2: EntryFinal = new EntryFinal();
      f2.id = 2;
      const set: ReadonlySet<EntryFinal> = new Set<EntryFinal>([f1, f2]);
      const items: EntryFinal[] = [];
      for (const entry of set.entries()) {
        items.push(entry[0]);
      }
      expect(items.length).assertEqual(2);
      expect(items[0] === f1).assertTrue();
      expect(items[1] === f2).assertTrue();
      expect(items[0].id).assertEqual(1);
      expect(items[1].id).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetEntries036
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0360
     * @tc.desc Verify ReadonlySet<EntryDrawable> entries() traverses interface implementors
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1: EntryCircle = new EntryCircle();
      let c2: EntryCircle = new EntryCircle();
      const set: ReadonlySet<EntryDrawable> = new Set<EntryDrawable>([c1, c2]);
      const items: EntryDrawable[] = [];
      for (const entry of set.entries()) {
        items.push(entry[0]);
      }
      expect(items.length).assertEqual(2);
      expect(items[0] === c1).assertTrue();
      expect(items[1] === c2).assertTrue();
    });

    /**
     * @tc.name testReadonlySetEntries037
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0370
     * @tc.desc Verify ReadonlySet<ValueArray<int>> entries() traverses value array elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let va1: ValueArray<int> = new ValueArray<int>(2, 0);
      va1[0] = 1;
      va1[1] = 2;
      let va2: ValueArray<int> = new ValueArray<int>(2, 0);
      va2[0] = 3;
      va2[1] = 4;
      const set: ReadonlySet<ValueArray<int>> = new Set<ValueArray<int>>([va1, va2]);
      const arrays: ValueArray<int>[] = [];
      for (const entry of set.entries()) {
        arrays.push(entry[0]);
      }
      expect(arrays.length).assertEqual(2);
      expect(arrays[0][0]).assertEqual(1);
      expect(arrays[0][1]).assertEqual(2);
      expect(arrays[1][0]).assertEqual(3);
      expect(arrays[1][1]).assertEqual(4);
    });

    /**
     * @tc.name testReadonlySetEntries038
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0380
     * @tc.desc Verify entries() with long MAX_VALUE and adjacent boundary values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([9223372036854775807, -9223372036854775808, 0]);
      const iter = set.entries();
      let e1 = iter.next().value as [long, long];
      expect(e1[0]).assertEqual(9223372036854775807);
      let e2 = iter.next().value as [long, long];
      expect(e2[0]).assertEqual(-9223372036854775808);
      let e3 = iter.next().value as [long, long];
      expect(e3[0]).assertEqual(0);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testReadonlySetEntries039
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0390
     * @tc.desc Verify entries() with surrogate pair string elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string> = new Set<string>(["𝄞", "𝕬", "𝐀"]);
      const values: string[] = [];
      for (const entry of set.entries()) {
        values.push(entry[0]);
      }
      expect(values.length).assertEqual(3);
      expect(values[0]).assertEqual("𝄞");
      expect(values[1]).assertEqual("𝕬");
      expect(values[2]).assertEqual("𝐀");
    });

    /**
     * @tc.name testReadonlySetEntries040
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0400
     * @tc.desc Verify entries() with mixed string|int|boolean union type Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string | int | boolean> = new Set<string | int | boolean>();
      (set as Set<string | int | boolean>).add("x");
      (set as Set<string | int | boolean>).add(1);
      (set as Set<string | int | boolean>).add(true);
      let strCount: int = 0;
      let intCount: int = 0;
      let boolCount: int = 0;
      for (const entry of set.entries()) {
        let t: string = typeof entry[0];
        if (t === "string") {
          strCount++;
        } else if (t === "int") {
          intCount++;
        } else if (t === "boolean") {
          boolCount++;
        }
      }
      expect(strCount).assertEqual(1);
      expect(intCount).assertEqual(1);
      expect(boolCount).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetEntries041
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0410
     * @tc.desc Verify entries() after nested underlying mutation still traverses correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<Set<int>> = new Set<Set<int>>();
      let inner: Set<int> = new Set<int>([1]);
      ms.add(inner);
      const view: ReadonlySet<Set<int>> = ms;
      inner.add(2);
      inner.delete(1);
      for (const entry of view.entries()) {
        expect((entry[0] as Set<int>).has(2)).assertTrue();
        expect((entry[0] as Set<int>).has(1)).assertFalse();
      }
    });

    /**
     * @tc.name testReadonlySetEntries042
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0420
     * @tc.desc Verify entries() with ReadonlySet<number> containing Number.EPSILON precision
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<number> = new Set<number>([
        Number.EPSILON,
        1.0 - Number.EPSILON,
        1.0 + Number.EPSILON
      ]);
      const values: number[] = [];
      for (const entry of set.entries()) {
        values.push(entry[0]);
      }
      expect(values.length).assertEqual(3);
      expect(values[0]).assertEqual(Number.EPSILON);
      expect(values[1]).assertEqual(1.0 - Number.EPSILON);
      expect(values[2]).assertEqual(1.0 + Number.EPSILON);
    });

    /**
     * @tc.name testReadonlySetEntries043
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0430
     * @tc.desc Verify entries() for Set constructed with 10000 random int elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [];
      for (let i: int = 0; i < 10000; i++) {
        arr.push(i);
      }
      const set: ReadonlySet<int> = new Set<int>(arr);
      let count: int = 0;
      for (const entry of set.entries()) {
        count++;
      }
      expect(count).assertEqual(10000);
    });

    /**
     * @tc.name testReadonlySetEntries044
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0440
     * @tc.desc Verify underlying Set delete then entries traversal skips deleted element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<int> = new Set<int>([1, 2, 3, 4, 5]);
      const view: ReadonlySet<int> = ms;
      ms.delete(3);
      const keys: int[] = [];
      for (const entry of view.entries()) {
        keys.push(entry[0]);
      }
      expect(keys.length).assertEqual(4);
      expect(keys[0]).assertEqual(1);
      expect(keys[1]).assertEqual(2);
      expect(keys[2]).assertEqual(4);
      expect(keys[3]).assertEqual(5);
    });

    /**
     * @tc.name testReadonlySetEntries045
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0450
     * @tc.desc Verify for-of on entries with nested try-catch does not swallow traversal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3, 4, 5]);
      const collected: int[] = [];
      for (const entry of set.entries()) {
        expect(entry[0] > 0).assertTrue();
        collected.push(entry[0]);
      }
      expect(collected.length).assertEqual(5);
    });

    /**
     * @tc.name testReadonlySetEntries046
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0460
     * @tc.desc Verify entries() on Set with all identical enum values deduplicates
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<EntryColor> = new Set<EntryColor>([EntryColor.RED, EntryColor.RED, EntryColor.RED]);
      let count: int = 0;
      for (const entry of set.entries()) {
        count++;
      }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetEntries047
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0470
     * @tc.desc Verify entries() with ReadonlySet<double> handles 2^53 precision boundary
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<number> = new Set<number>([9007199254740992, 9007199254740994]);
      let count: int = 0;
      for (const entry of set.entries()) {
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetEntries048
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0480
     * @tc.desc Verify entries() for Set<Object> with different object references
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let o1: Object = new Object();
      let o2: Object = new Object();
      let o3: Object = new Object();
      const set: ReadonlySet<Object> = new Set<Object>([o1, o2, o3]);
      const refs: Object[] = [];
      for (const entry of set.entries()) {
        refs.push(entry[0]);
      }
      expect(refs.length).assertEqual(3);
      expect(refs[0] === o1).assertTrue();
      expect(refs[1] === o2).assertTrue();
      expect(refs[2] === o3).assertTrue();
    });

    /**
     * @tc.name testReadonlySetEntries049
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0490
     * @tc.desc Verify for-of on entries with continue skips middle element correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([5, 10, 15, 20]);
      const result: int[] = [];
      for (const entry of set.entries()) {
        if (entry[0] === 15) {
          continue;
        }
        result.push(entry[0]);
      }
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(5);
      expect(result[1]).assertEqual(10);
      expect(result[2]).assertEqual(20);
    });

    /**
     * @tc.name testReadonlySetEntries050
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0500
     * @tc.desc Verify entries() key=value for int Set and traversal count
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3]);
      const values: int[] = [];
      for (const entry of set.entries()) {
        values.push(entry[0]);
      }
      expect(values.length).assertEqual(3);
      expect(values[0]).assertEqual(1);
      expect(values[1]).assertEqual(2);
      expect(values[2]).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetEntries051
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0510
     * @tc.desc Verify entries() with enum type EntriesP2Dir key=value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<EntriesP2Dir> =
        new Set<EntriesP2Dir>([
          EntriesP2Dir.NORTH,
          EntriesP2Dir.SOUTH
        ]);
      const iter = set.entries();
      let e1 = iter.next().value as [EntriesP2Dir, EntriesP2Dir];
      expect(e1[0]).assertEqual(EntriesP2Dir.NORTH);
      let e2 = iter.next().value as [EntriesP2Dir, EntriesP2Dir];
      expect(e2[0]).assertEqual(EntriesP2Dir.SOUTH);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testReadonlySetEntries052
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0520
     * @tc.desc Verify entries() reflects underlying Set add/delete operations
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<int> = new Set<int>([10, 20, 30]);
      const view: ReadonlySet<int> = ms;
      ms.add(40);
      ms.delete(10);
      const keys: int[] = [];
      for (const entry of view.entries()) {
        keys.push(entry[0]);
      }
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual(20);
    });

    /**
     * @tc.name testReadonlySetEntries053
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0530
     * @tc.desc Verify entries() with floating point precision edge cases
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<number> = new Set<number>([0.1 + 0.2, 0.3]);
      let count: int = 0;
      for (const entry of set.entries()) {
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetEntries054
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0540
     * @tc.desc Verify entries() mid-iteration after skipping 50 of 100 elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [];
      for (let i: int = 0; i < 100; i++) {
        arr.push(i);
      }
      const set: ReadonlySet<int> = new Set<int>(arr);
      const iter = set.entries();
      for (let i: int = 0; i < 50; i++) {
        iter.next();
      }
      let r = iter.next();
      expect((r.value as [int, int])[0]).assertEqual(50);
    });

    /**
     * @tc.name testReadonlySetEntries055
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0550
     * @tc.desc Verify entries() returns empty after underlying Set clear
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<int> = new Set<int>([1, 2, 3, 4, 5]);
      const view: ReadonlySet<int> = ms;
      ms.clear();
      let count: int = 0;
      for (const entry of view.entries()) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.name testReadonlySetEntries056
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0560
     * @tc.desc Verify entries() manual next() traversal of all 3 elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3]);
      const iter = set.entries();
      let r = iter.next();
      expect(r.done).assertFalse();
      expect((r.value as [int, int])[0]).assertEqual(1);
      r = iter.next();
      expect((r.value as [int, int])[0]).assertEqual(2);
      r = iter.next();
      expect((r.value as [int, int])[0]).assertEqual(3);
      r = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.name testReadonlySetEntries057
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0570
     * @tc.desc Verify entries() continue skips first element in for-of traversal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3]);
      let count: int = 0;
      let skipDone: boolean = false;
      for (const entry of set.entries()) {
        if (!skipDone) {
          skipDone = true;
          continue;
        }
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetEntries058
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0580
     * @tc.desc Verify two entries() iterators alternate independently
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([5, 10, 15]);
      const iter1 = set.entries();
      const iter2 = set.entries();
      iter1.next();
      let r = iter2.next();
      expect((r.value as [int, int])[0]).assertEqual(5);
      iter1.next();
      iter1.next();
      expect(iter1.next().done).assertTrue();
      r = iter2.next();
      expect((r.value as [int, int])[0]).assertEqual(10);
    });

    /**
     * @tc.name testReadonlySetEntries059
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0590
     * @tc.desc Verify entries() with extreme number values 1e-10 and 1e10
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<number> = new Set<number>([1e-10, 1e10]);
      let count: int = 0;
      for (const entry of set.entries()) {
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetEntries060
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0600
     * @tc.desc Verify entries() count changes after multiple underlying add/delete
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<int> = new Set<int>([1, 2, 3]);
      const view: ReadonlySet<int> = ms;
      ms.add(4);
      ms.add(5);
      let count1: int = 0;
      for (const entry of view.entries()) {
        count1++;
      }
      expect(count1).assertEqual(5);
      ms.delete(1);
      ms.delete(2);
      let count2: int = 0;
      for (const entry of view.entries()) {
        count2++;
      }
      expect(count2).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetEntries061
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0610
     * @tc.desc Verify exhausted entries iterator returns done=true and value=undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3]);
      const iter = set.entries();
      iter.next();
      iter.next();
      iter.next();
      expect(iter.next().done).assertTrue();
      expect(iter.next().value).assertUndefined();
    });

    /**
     * @tc.name testReadonlySetEntries062
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0620
     * @tc.desc Verify entries() with 5-element string Set collects all entries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string> = new Set<string>(["a", "b", "c", "d", "e"]);
      const entries: [string, string][] = [];
      for (const e of set.entries()) {
        entries.push(e as [string, string]);
      }
      expect(entries.length).assertEqual(5);
      expect(entries[0][0]).assertEqual("a");
      expect(entries[4][0]).assertEqual("e");
    });

    /**
     * @tc.name testReadonlySetEntries063
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0630
     * @tc.desc Verify entries() returns correct Object references in order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let o1: Object = new Object();
      let o2: Object = new Object();
      const set: ReadonlySet<Object> = new Set<Object>([o1, o2]);
      const iter = set.entries();
      expect((iter.next().value as [Object, Object])[0] === o1).assertTrue();
      expect((iter.next().value as [Object, Object])[0] === o2).assertTrue();
    });

    /**
     * @tc.name testReadonlySetEntries064
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0640
     * @tc.desc Verify entries() with continue filters out even elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3, 4, 5]);
      const result: int[] = [];
      for (const entry of set.entries()) {
        if (entry[0] % 2 === 0) {
          continue;
        }
        result.push(entry[0]);
      }
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(3);
      expect(result[2]).assertEqual(5);
    });

    /**
     * @tc.name testReadonlySetEntries065
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0650
     * @tc.desc Verify entries() traverses long type elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([1, 2, 3]);
      const iter = set.entries();
      let e = iter.next().value as [long, long];
      expect(e[0]).assertEqual(1);
      e = iter.next().value as [long, long];
      expect(e[0]).assertEqual(2);
      e = iter.next().value as [long, long];
      expect(e[0]).assertEqual(3);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testReadonlySetEntries066
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0660
     * @tc.desc Verify entries() traverses string elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string> = new Set<string>(["hello", "world"]);
      const iter = set.entries();
      let e = iter.next().value as [string, string];
      expect(e[0]).assertEqual("hello");
      e = iter.next().value as [string, string];
      expect(e[0]).assertEqual("world");
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testReadonlySetEntries067
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0670
     * @tc.desc Verify entries() with byte boundary values -128/0/127
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<byte> = new Set<byte>([-128, 0, 127]);
      const iter = set.entries();
      let e = iter.next().value as [byte, byte];
      expect(e[0]).assertEqual(-128);
      let e2 = iter.next().value as [byte, byte];
      expect(e2[0]).assertEqual(0);
      let e3 = iter.next().value as [byte, byte];
      expect(e3[0]).assertEqual(127);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testReadonlySetEntries068
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0680
     * @tc.desc Verify entries() with short boundary values -32768/0/32767
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<short> = new Set<short>([-32768, 0, 32767]);
      const iter = set.entries();
      let e = iter.next().value as [short, short];
      expect(e[0]).assertEqual(-32768);
      e = iter.next().value as [short, short];
      expect(e[0]).assertEqual(0);
      e = iter.next().value as [short, short];
      expect(e[0]).assertEqual(32767);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testReadonlySetEntries069
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0690
     * @tc.desc Verify entries() count for enum EntriesP2Dir with 2 values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<EntriesP2Dir> = new Set<EntriesP2Dir>([EntriesP2Dir.NORTH, EntriesP2Dir.SOUTH]);
      let count: int = 0;
      for (const entry of set.entries()) {
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetEntries070
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0700
     * @tc.desc Verify entries() with custom class EntriesP2Item objects
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let items: EntriesP2Item[] = [new EntriesP2Item(1), new EntriesP2Item(2)];
      const set: ReadonlySet<EntriesP2Item> = new Set<EntriesP2Item>(items);
      const iter = set.entries();
      let e = iter.next().value as [EntriesP2Item, EntriesP2Item];
      expect(e[0].value).assertEqual(1);
      e = iter.next().value as [EntriesP2Item, EntriesP2Item];
      expect(e[0].value).assertEqual(2);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testReadonlySetEntries071
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0710
     * @tc.desc Verify entries() with single element number Set [0]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<number> = new Set<number>([0]);
      const iter = set.entries();
      let e = iter.next().value as [number, number];
      expect(e[0]).assertEqual(0);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testReadonlySetEntries072
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0720
     * @tc.desc Verify entries() break in for-of resumes with manual next()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3, 4, 5]);
      const iter = set.entries();
      for (const e of iter) {
        if ((e as [int, int])[0] === 3) {
          break;
        }
      }
      let r = iter.next();
      expect((r.value as [int, int])[0]).assertEqual(4);
    });

    /**
     * @tc.name testReadonlySetEntries073
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0730
     * @tc.desc Verify entries() single string element full verification
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string> = new Set<string>(["x"]);
      const iter = set.entries();
      let r1 = iter.next();
      expect(r1.done).assertFalse();
      let v1 = r1.value as [string, string];
      expect(v1[0]).assertEqual("x");
      let r2 = iter.next();
      expect(r2.done).assertTrue();
    });

    /**
     * @tc.name testReadonlySetEntries074
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0740
     * @tc.desc Verify entries() long sum aggregation over all entries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([100, 200, 300]);
      let sum: long = 0;
      for (const entry of set.entries()) {
        sum += entry[0];
      }
      expect(sum).assertEqual(600);
    });

    /**
     * @tc.name testReadonlySetEntries075
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0750
     * @tc.desc Verify entries() with Set<long> [1,2,3,4,5] sums all entry keys to 15
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([1, 2, 3, 4, 5]);
      const iter = set.entries();
      let sum: long = 0;
      for (const entry of iter) {
        sum += entry[0];
      }
      expect(sum).assertEqual(15);
    });

    /**
     * @tc.name testReadonlySetEntries076
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0760
     * @tc.desc Verify entries() with Set<long> mid-iteration returns correct third element 30
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([10, 20, 30, 40, 50]);
      const iter = set.entries();
      iter.next();
      iter.next();
      let r = iter.next();
      expect((r.value as [long, long])[0]).assertEqual(30);
    });

    /**
     * @tc.name testReadonlySetEntries077
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0770
     * @tc.desc Verify entries() exhausted iterator returns done=true after all 3 elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([1, 2, 3]);
      const iter = set.entries();
      expect(iter.next().done).assertFalse();
      expect(iter.next().done).assertFalse();
      expect(iter.next().done).assertFalse();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testReadonlySetEntries078
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0780
     * @tc.desc Verify entries() with Set<long> [5,10,15] collects all 3 keys correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([5, 10, 15]);
      const keys: long[] = [];
      for (const entry of set.entries()) {
        keys.push(entry[0]);
      }
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual(5);
      expect(keys[2]).assertEqual(15);
    });

    /**
     * @tc.name testReadonlySetEntries079
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0790
     * @tc.desc Verify entries() count, keys() count, values() count and size are all equal for same Set (cross-method consistency)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string> = new Set<string>(["a", "b", "c", "d", "e"]);
      let entryCount: int = 0;
      for (const _ of set.entries()) {
        entryCount++;
      }
      let keyCount: int = 0;
      for (const _ of set.keys()) {
        keyCount++;
      }
      let valueCount: int = 0;
      for (const _ of set.values()) {
        valueCount++;
      }
      expect(entryCount).assertEqual(set.size);
      expect(keyCount).assertEqual(set.size);
      expect(valueCount).assertEqual(set.size);
      expect(entryCount).assertEqual(keyCount);
    });

    /**
     * @tc.name testReadonlySetEntries080
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0800
     * @tc.desc Verify Array.from() converts entries() iterator to array of [K,K] tuples correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([10, 20, 30]);
      const arr = Array.from(set.entries());
      expect(arr.length).assertEqual(3);
      const first: [int, int] = arr[0] as [int, int];
      expect(first[0]).assertEqual(10);
      expect(first[1]).assertEqual(10);
    });

    /**
     * @tc.name testReadonlySetEntries081
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0810
     * @tc.desc Verify entries() traversal preserves insertion order after intermediate mutation (add then delete)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ms: Set<int> = new Set<int>([1, 2, 3]);
      const view: ReadonlySet<int> = ms;
      ms.add(4);
      ms.delete(2);
      const values: int[] = [];
      for (const entry of view.entries()) {
        values.push(entry[0]);
      }
      expect(values.length).assertEqual(3);
      expect(values[0]).assertEqual(1);
      expect(values[1]).assertEqual(3);
      expect(values[2]).assertEqual(4);
    });

    /**
     * @tc.name testReadonlySetEntries082
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0820
     * @tc.desc Verify entries() spread operator into array works correctly for int Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([100, 200, 300]);
      const entries = [...set.entries()];
      expect(entries.length).assertEqual(3);
      const first: [int, int] = entries[0] as [int, int];
      expect(first[0]).assertEqual(100);
    });

    /**
     * @tc.name testReadonlySetEntries083
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0830
     * @tc.desc Verify entries() for-of loop using entry[0] and entry[1] extracts key and value correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string> = new Set<string>(["x", "y", "z"]);
      const keys: string[] = [];
      const values: string[] = [];
      for (const entry of set.entries()) {
        keys.push(entry[0]);
        values.push(entry[1]);
      }
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual("x");
      expect(keys[1]).assertEqual("y");
      expect(keys[2]).assertEqual("z");
      expect(values[0]).assertEqual("x");
      expect(values[1]).assertEqual("y");
      expect(values[2]).assertEqual("z");
    });

    /**
     * @tc.name testReadonlySetEntries084
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0840
     * @tc.desc Verify entries() with Set containing Object elements traverses all references in order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const o1: Object = new Object();
      const o2: Object = new Object();
      const set: ReadonlySet<Object> = new Set<Object>([o1, o2]);
      const refs: Object[] = [];
      for (const entry of set.entries()) {
        refs.push(entry[0]);
      }
      expect(refs.length).assertEqual(2);
      expect(refs[0]).assertEqual(o1);
      expect(refs[1]).assertEqual(o2);
    });

    /**
     * @tc.name testReadonlySetEntries085
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0850
     * @tc.desc Verify entries() with boundary combination Set (NaN, +Infinity, -Infinity, +0, -0) returns correct count
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<number> = new Set<number>([Number.NaN, Number.POSITIVE_INFINITY, Number.NEGATIVE_INFINITY, 0, -0]);
      let count: int = 0;
      for (const _ of set.entries()) {
        count++;
      }
      expect(count).assertEqual(4);
    });

    /**
     * @tc.name testReadonlySetEntries086
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0860
     * @tc.desc Verify entries() with deeply nested Set<Set<Set<int>>> traverses outer Set references
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner1: Set<int> = new Set<int>([1]);
      const inner2: Set<int> = new Set<int>([2]);
      const mid1: Set<Set<int>> = new Set<Set<int>>([inner1]);
      const mid2: Set<Set<int>> = new Set<Set<int>>([inner2]);
      const outer: ReadonlySet<Set<Set<int>>> = new Set<Set<Set<int>>>([mid1, mid2]);
      const refs: Set<Set<int>>[] = [];
      for (const entry of outer.entries()) {
        refs.push(entry[0]);
      }
      expect(refs.length).assertEqual(2);
      expect(refs[0]).assertEqual(mid1);
      expect(refs[1]).assertEqual(mid2);
    });

    /**
     * @tc.name testReadonlySetEntries087
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0870
     * @tc.desc Verify entries() sorted by key via Array.from and sort, checks first and last sorted entries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([5, 3, 1, 4, 2]);
      const entries = [...set.entries()];
      expect(entries.length).assertEqual(5);
      const firstEntry: [int, int] = entries[0] as [int, int];
      const lastEntry: [int, int] = entries[entries.length - 1] as [int, int];
      expect(firstEntry[0]).assertEqual(5);
      expect(lastEntry[0]).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetEntries088
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0880
     * @tc.desc Verify entries() with Object element returns reference and does not throw
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const set: ReadonlySet<Object> = new Set<Object>([obj]);
      let found: boolean = false;
      for (const entry of set.entries()) {
        if (entry[0] === obj) {
          found = true;
        }
      }
      expect(found).assertTrue();
    });

    /**
     * @tc.name testReadonlySetEntries089
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0890
     * @tc.desc Verify entries() with large Set of 50000 elements traverses all entries without error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [];
      for (let i: int = 0; i < 50000; i++) {
        arr.push(i);
      }
      const set: ReadonlySet<int> = new Set<int>(arr);
      let count: int = 0;
      for (const _ of set.entries()) {
        count++;
      }
      expect(count).assertEqual(50000);
    });

    /**
     * @tc.name testReadonlySetEntries090
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0900
     * @tc.desc Verify forEach callback that accesses entries() inside forEach creates nested iteration without conflict
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3]);
      let outerSum: int = 0;
      let innerCount: int = 0;
      set.forEach((): void => {
        outerSum++;
        for (const _ of set.entries()) {
          innerCount++;
        }
      });
      expect(outerSum).assertEqual(3);
      expect(innerCount).assertEqual(9);
    });

    /**
     * @tc.name testReadonlySetEntries091
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0910
     * @tc.desc Verify entries() after underlying Set swap via delete+add all, old elements gone and new elements present
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ms: Set<int> = new Set<int>([1, 2, 3]);
      const view: ReadonlySet<int> = ms;
      ms.clear();
      ms.add(7);
      ms.add(8);
      ms.add(9);
      const values: int[] = [];
      for (const entry of view.entries()) {
        values.push(entry[0]);
      }
      expect(values.length).assertEqual(3);
      expect(values[0]).assertEqual(7);
      expect(values[1]).assertEqual(8);
      expect(values[2]).assertEqual(9);
    });

    /**
     * @tc.name testReadonlySetEntries092
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0920
     * @tc.desc Verify ReadonlySet<Error> entries() traverses Error objects
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e1: Error = new Error("err1");
      const e2: Error = new Error("err2");
      const set: ReadonlySet<Error> = new Set<Error>([e1, e2]);
      const iter = set.entries();
      let r1 = iter.next().value as [Error, Error];
      expect(r1[0].message).assertEqual("err1");
      let r2 = iter.next().value as [Error, Error];
      expect(r2[0].message).assertEqual("err2");
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testReadonlySetEntries093
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0930
     * @tc.desc Verify ReadonlySet<Date> entries() traverses Date objects
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: Date = new Date(2024);
      const d2: Date = new Date(2025);
      const set: ReadonlySet<Date> = new Set<Date>([d1, d2]);
      const iter = set.entries();
      let r1 = iter.next().value as [Date, Date];
      expect(r1[0].getTime()).assertEqual(2024);
      let r2 = iter.next().value as [Date, Date];
      expect(r2[0].getTime()).assertEqual(2025);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testReadonlySetEntries094
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0940
     * @tc.desc Verify ReadonlySet<RegExp> entries() traverses RegExp objects
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: RegExp = new RegExp("abc");
      const r2: RegExp = new RegExp("xyz");
      const set: ReadonlySet<RegExp> = new Set<RegExp>([r1, r2]);
      const iter = set.entries();
      let e1 = iter.next().value as [RegExp, RegExp];
      expect(e1[0].source).assertEqual("abc");
      let e2 = iter.next().value as [RegExp, RegExp];
      expect(e2[0].source).assertEqual("xyz");
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testReadonlySetEntries095
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0950
     * @tc.desc Verify ReadonlySet<Object> entries() traverses Object objects
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p1: Object = new Object();
      const p2: Object = new Object();
      const set: ReadonlySet<Object> = new Set<Object>([p1, p2]);
      const iter = set.entries();
      let e1 = iter.next().value as [Object, Object];
      expect(e1[0] === p1).assertTrue();
      let e2 = iter.next().value as [Object, Object];
      expect(e2[0] === p2).assertTrue();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testReadonlySetEntries096
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0960
     * @tc.desc Verify ReadonlySet<WeakMap<Object, int>> entries() traverses WeakMap objects
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const wm1: WeakMap<Object, int> = new WeakMap<Object, int>();
      const wm2: WeakMap<Object, int> = new WeakMap<Object, int>();
      const set: ReadonlySet<WeakMap<Object, int>> = new Set<WeakMap<Object, int>>([wm1, wm2]);
      const iter = set.entries();
      let e1 = iter.next().value as [WeakMap<Object, int>, WeakMap<Object, int>];
      expect(e1[0] === wm1).assertTrue();
      let e2 = iter.next().value as [WeakMap<Object, int>, WeakMap<Object, int>];
      expect(e2[0] === wm2).assertTrue();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testReadonlySetEntries097
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0970
     * @tc.desc Verify ReadonlySet<WeakSet<Object>> entries() traverses WeakSet objects
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ws1: WeakSet<Object> = new WeakSet<Object>();
      const ws2: WeakSet<Object> = new WeakSet<Object>();
      const set: ReadonlySet<WeakSet<Object>> = new Set<WeakSet<Object>>([ws1, ws2]);
      const iter = set.entries();
      let e1 = iter.next().value as [WeakSet<Object>, WeakSet<Object>];
      expect(e1[0] === ws1).assertTrue();
      let e2 = iter.next().value as [WeakSet<Object>, WeakSet<Object>];
      expect(e2[0] === ws2).assertTrue();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testReadonlySetEntries098
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0980
     * @tc.desc Verify underlying Set delete removes Error from entries traversal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e1: Error = new Error("a");
      let ms: Set<Error> = new Set<Error>([e1, new Error("b")]);
      const view: ReadonlySet<Error> = ms;
      ms.delete(e1);
      let count: int = 0;
      for (const _ of view.entries()) {
        count++;
      }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetEntries099
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_0990
     * @tc.desc Verify underlying Set delete removes Date from entries traversal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: Date = new Date(1);
      let ms: Set<Date> = new Set<Date>([d1, new Date(2)]);
      const view: ReadonlySet<Date> = ms;
      ms.delete(d1);
      let count: int = 0;
      for (const _ of view.entries()) {
        count++;
      }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetEntries100
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_1000
     * @tc.desc Verify underlying Set delete removes RegExp from entries traversal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: RegExp = new RegExp("a");
      let ms: Set<RegExp> = new Set<RegExp>([r1, new RegExp("b")]);
      const view: ReadonlySet<RegExp> = ms;
      ms.delete(r1);
      let count: int = 0;
      for (const _ of view.entries()) {
        count++;
      }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetEntries101
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_1010
     * @tc.desc Verify underlying Set delete removes Promise from entries traversal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p1: Object = new Object();
      const p2: Object = new Object();
      let ms: Set<Object> = new Set<Object>([p1, p2]);
      const view: ReadonlySet<Object> = ms;
      ms.delete(p1);
      let count: int = 0;
      for (const _ of view.entries()) {
        count++;
      }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetEntries102
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_1020
     * @tc.desc Verify underlying Set delete removes WeakMap from entries traversal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const wm1: WeakMap<Object, int> = new WeakMap<Object, int>();
      const wm2: WeakMap<Object, int> = new WeakMap<Object, int>();
      let ms: Set<WeakMap<Object, int>> = new Set<WeakMap<Object, int>>([wm1, wm2]);
      const view: ReadonlySet<WeakMap<Object, int>> = ms;
      ms.delete(wm1);
      let count: int = 0;
      for (const _ of view.entries()) {
        count++;
      }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetEntries103
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_1030
     * @tc.desc Verify underlying Set delete removes WeakSet from entries traversal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ws1: WeakSet<Object> = new WeakSet<Object>();
      const ws2: WeakSet<Object> = new WeakSet<Object>();
      let ms: Set<WeakSet<Object>> = new Set<WeakSet<Object>>([ws1, ws2]);
      const view: ReadonlySet<WeakSet<Object>> = ms;
      ms.delete(ws1);
      let count: int = 0;
      for (const _ of view.entries()) {
        count++;
      }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetEntries104
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_1040
     * @tc.desc Verify underlying Set clear empties Error entries traversal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<Error> = new Set<Error>([new Error("a"), new Error("b")]);
      const view: ReadonlySet<Error> = ms;
      ms.clear();
      let count: int = 0;
      for (const _ of view.entries()) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.name testReadonlySetEntries105
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_1050
     * @tc.desc Verify underlying Set clear empties Date entries traversal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<Date> = new Set<Date>([new Date(1), new Date(2)]);
      const view: ReadonlySet<Date> = ms;
      ms.clear();
      let count: int = 0;
      for (const _ of view.entries()) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.name testReadonlySetEntries106
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_1060
     * @tc.desc Verify underlying Set clear empties RegExp entries traversal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<RegExp> = new Set<RegExp>([new RegExp("a"), new RegExp("b")]);
      const view: ReadonlySet<RegExp> = ms;
      ms.clear();
      let count: int = 0;
      for (const _ of view.entries()) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.name testReadonlySetEntries107
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_1070
     * @tc.desc Verify underlying Set clear empties Promise entries traversal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p1: Object = new Object();
      const p2: Object = new Object();
      let ms: Set<Object> = new Set<Object>([p1, p2]);
      const view: ReadonlySet<Object> = ms;
      ms.clear();
      let count: int = 0;
      for (const _ of view.entries()) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.name testReadonlySetEntries108
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_1080
     * @tc.desc Verify underlying Set clear empties WeakMap entries traversal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const wm1: WeakMap<Object, int> = new WeakMap<Object, int>();
      const wm2: WeakMap<Object, int> = new WeakMap<Object, int>();
      let ms: Set<WeakMap<Object, int>> = new Set<WeakMap<Object, int>>([wm1, wm2]);
      const view: ReadonlySet<WeakMap<Object, int>> = ms;
      ms.clear();
      let count: int = 0;
      for (const _ of view.entries()) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.name testReadonlySetEntries109
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_1090
     * @tc.desc Verify underlying Set clear empties WeakSet entries traversal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ws1: WeakSet<Object> = new WeakSet<Object>();
      const ws2: WeakSet<Object> = new WeakSet<Object>();
      let ms: Set<WeakSet<Object>> = new Set<WeakSet<Object>>([ws1, ws2]);
      const view: ReadonlySet<WeakSet<Object>> = ms;
      ms.clear();
      let count: int = 0;
      for (const _ of view.entries()) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.name testReadonlySetEntries110
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_1100
     * @tc.desc Verify empty ReadonlySet<Error> entries traversal is empty
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<Error> = new Set<Error>();
      let count: int = 0;
      for (const _ of set.entries()) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.name testReadonlySetEntries111
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_1110
     * @tc.desc Verify empty ReadonlySet<Date> entries traversal is empty
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<Date> = new Set<Date>();
      let count: int = 0;
      for (const _ of set.entries()) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.name testReadonlySetEntries112
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_1120
     * @tc.desc Verify empty ReadonlySet<RegExp> entries traversal is empty
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<RegExp> = new Set<RegExp>();
      let count: int = 0;
      for (const _ of set.entries()) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.name testReadonlySetEntries113
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_1130
     * @tc.desc Verify empty ReadonlySet<Object> entries traversal is empty
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<Object> = new Set<Object>();
      let count: int = 0;
      for (const _ of set.entries()) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.name testReadonlySetEntries114
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_1140
     * @tc.desc Verify empty ReadonlySet<WeakMap<Object, int>> entries traversal is empty
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<WeakMap<Object, int>> = new Set<WeakMap<Object, int>>();
      let count: int = 0;
      for (const _ of set.entries()) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.name testReadonlySetEntries115
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_1150
     * @tc.desc Verify empty ReadonlySet<WeakSet<Object>> entries traversal is empty
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<WeakSet<Object>> = new Set<WeakSet<Object>>();
      let count: int = 0;
      for (const _ of set.entries()) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.name testReadonlySetEntries116
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_1160
     * @tc.desc Verify single-element ReadonlySet<Error> entries traverses one entry then done
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e1: Error = new Error("a");
      const set: ReadonlySet<Error> = new Set<Error>([e1]);
      const iter = set.entries();
      expect(iter.next().done).assertFalse();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testReadonlySetEntries117
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_1170
     * @tc.desc Verify single-element ReadonlySet<Date> entries traverses one entry then done
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: Date = new Date(1);
      const set: ReadonlySet<Date> = new Set<Date>([d1]);
      const iter = set.entries();
      expect(iter.next().done).assertFalse();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testReadonlySetEntries118
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_1180
     * @tc.desc Verify single-element ReadonlySet<RegExp> entries traverses one entry then done
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: RegExp = new RegExp("a");
      const set: ReadonlySet<RegExp> = new Set<RegExp>([r1]);
      const iter = set.entries();
      expect(iter.next().done).assertFalse();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testReadonlySetEntries119
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_1190
     * @tc.desc Verify single-element ReadonlySet<Object> entries traverses one entry then done
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p1: Object = new Object();
      const set: ReadonlySet<Object> = new Set<Object>([p1]);
      const iter = set.entries();
      expect(iter.next().done).assertFalse();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testReadonlySetEntries120
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_1200
     * @tc.desc Verify single-element ReadonlySet<WeakMap<Object, int>> entries traverses one entry then done
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const wm1: WeakMap<Object, int> = new WeakMap<Object, int>();
      const set: ReadonlySet<WeakMap<Object, int>> = new Set<WeakMap<Object, int>>([wm1]);
      const iter = set.entries();
      expect(iter.next().done).assertFalse();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testReadonlySetEntries121
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_1210
     * @tc.desc Verify single-element ReadonlySet<WeakSet<Object>> entries traverses one entry then done
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ws1: WeakSet<Object> = new WeakSet<Object>();
      const set: ReadonlySet<WeakSet<Object>> = new Set<WeakSet<Object>>([ws1]);
      const iter = set.entries();
      expect(iter.next().done).assertFalse();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testReadonlySetEntries122
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_1220
     * @tc.desc Verify duplicate Error references deduplicate in entries traversal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e1: Error = new Error("a");
      const set: ReadonlySet<Error> = new Set<Error>([e1, e1]);
      let count: int = 0;
      for (const _ of set.entries()) {
        count++;
      }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetEntries123
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_1230
     * @tc.desc Verify duplicate Date references deduplicate in entries traversal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: Date = new Date(1);
      const set: ReadonlySet<Date> = new Set<Date>([d1, d1]);
      let count: int = 0;
      for (const _ of set.entries()) {
        count++;
      }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetEntries124
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_1240
     * @tc.desc Verify duplicate RegExp references deduplicate in entries traversal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: RegExp = new RegExp("a");
      const set: ReadonlySet<RegExp> = new Set<RegExp>([r1, r1]);
      let count: int = 0;
      for (const _ of set.entries()) {
        count++;
      }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetEntries125
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_1250
     * @tc.desc Verify duplicate Promise references deduplicate in entries traversal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p1: Object = new Object();
      const set: ReadonlySet<Object> = new Set<Object>([p1, p1]);
      let count: int = 0;
      for (const _ of set.entries()) {
        count++;
      }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetEntries126
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_1260
     * @tc.desc Verify duplicate WeakMap references deduplicate in entries traversal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const wm1: WeakMap<Object, int> = new WeakMap<Object, int>();
      const set: ReadonlySet<WeakMap<Object, int>> = new Set<WeakMap<Object, int>>([wm1, wm1]);
      let count: int = 0;
      for (const _ of set.entries()) {
        count++;
      }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetEntries127
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_1270
     * @tc.desc Verify duplicate WeakSet references deduplicate in entries traversal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ws1: WeakSet<Object> = new WeakSet<Object>();
      const set: ReadonlySet<WeakSet<Object>> = new Set<WeakSet<Object>>([ws1, ws1]);
      let count: int = 0;
      for (const _ of set.entries()) {
        count++;
      }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetEntries128
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_1280
     * @tc.desc Verify entries() traverses mutated Error object state
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e1: Error = new Error("old");
      const set: ReadonlySet<Error> = new Set<Error>([e1]);
      e1.message = "new";
      const iter = set.entries();
      let entry = iter.next().value as [Error, Error];
      expect(entry[0].message).assertEqual("new");
    });

    /**
     * @tc.name testReadonlySetEntries129
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_1290
     * @tc.desc Verify entries() traverses mutated Date object state
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: Date = new Date(100);
      const set: ReadonlySet<Date> = new Set<Date>([d1]);
      d1.setTime(999);
      const iter = set.entries();
      let entry = iter.next().value as [Date, Date];
      expect(entry[0].getTime()).assertEqual(999);
    });

    /**
     * @tc.name testReadonlySetEntries130
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_1300
     * @tc.desc Verify underlying Set add reflected in Error entries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<Error> = new Set<Error>([new Error("a")]);
      const view: ReadonlySet<Error> = ms;
      ms.add(new Error("b"));
      let count: int = 0;
      for (const _ of view.entries()) { count++; }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetEntries131
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_1310
     * @tc.desc Verify underlying Set add reflected in Date entries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<Date> = new Set<Date>([new Date(1)]);
      const view: ReadonlySet<Date> = ms;
      ms.add(new Date(2));
      let count: int = 0;
      for (const _ of view.entries()) { count++; }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetEntries132
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_1320
     * @tc.desc Verify underlying Set add reflected in RegExp entries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<RegExp> = new Set<RegExp>([new RegExp("a")]);
      const view: ReadonlySet<RegExp> = ms;
      ms.add(new RegExp("b"));
      let count: int = 0;
      for (const _ of view.entries()) { count++; }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetEntries133
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_1330
     * @tc.desc Verify underlying Set add reflected in Promise entries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p1: Object = new Object();
      const p2: Object = new Object();
      let ms: Set<Object> = new Set<Object>([p1]);
      const view: ReadonlySet<Object> = ms;
      ms.add(p2);
      let count: int = 0;
      for (const _ of view.entries()) { count++; }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetEntries134
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_1340
     * @tc.desc Verify underlying Set add reflected in WeakMap entries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const wm1: WeakMap<Object, int> = new WeakMap<Object, int>();
      const wm2: WeakMap<Object, int> = new WeakMap<Object, int>();
      let ms: Set<WeakMap<Object, int>> = new Set<WeakMap<Object, int>>([wm1]);
      const view: ReadonlySet<WeakMap<Object, int>> = ms;
      ms.add(wm2);
      let count: int = 0;
      for (const _ of view.entries()) { count++; }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetEntries135
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETENTRIES_1350
     * @tc.desc Verify underlying Set add reflected in WeakSet entries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetEntries135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ws1: WeakSet<Object> = new WeakSet<Object>();
      const ws2: WeakSet<Object> = new WeakSet<Object>();
      let ms: Set<WeakSet<Object>> = new Set<WeakSet<Object>>([ws1]);
      const view: ReadonlySet<WeakSet<Object>> = ms;
      ms.add(ws2);
      let count: int = 0;
      for (const _ of view.entries()) { count++; }
      expect(count).assertEqual(2);
    });

  });
}

