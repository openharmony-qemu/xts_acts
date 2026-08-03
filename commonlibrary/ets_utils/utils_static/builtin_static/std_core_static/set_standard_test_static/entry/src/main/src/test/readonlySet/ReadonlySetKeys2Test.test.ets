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

class KeysItem {
  label: string = "";
  constructor(label: string) {
    this.label = label;
  }
}

class KeysFinal {
  id: int = 0;
}

interface KeysDrawable {
  render(): void;
}

class KeysRect implements KeysDrawable {
  render(): void {
  }
}

enum KeysColor {
  RED, GREEN, BLUE
}



class Kp2Data {
  id: int = 0;
  constructor(id: int) {
    this.id = id;
  }
}

enum Kp2Dir {
  UP, DOWN, LEFT, RIGHT
}

export default function ReadonlySetKeys2Test(): void {
  describe('ReadonlySetKeys2Test', (): void => {
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
     * @tc.name testReadonlySetKeys001
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0010
     * @tc.desc Verify ReadonlySet<float> keys() traverses float values -100.0, 0.0, 100.0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<float> = new Set<float>([-100.0 as float, 0.0 as float, 100.0 as float]);
      const keys: float[] = [];
      for (const k of set.keys()) {
        keys.push(k);
      }
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual(-100.0);
      expect(keys[2]).assertEqual(100.0);
    });

    /**
     * @tc.name testReadonlySetKeys002
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0020
     * @tc.desc Verify ReadonlySet<double> keys() traverses double boundary values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<double> = new Set<double>([-1.79e308, 0.0, 1.79e308]);
      let count: int = 0;
      for (const k of set.keys()) {
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetKeys003
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0030
     * @tc.desc Verify ReadonlySet<boolean> keys() traverses true and false in order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<boolean> = new Set<boolean>([true, false]);
      const keys: boolean[] = [];
      for (const k of set.keys()) {
        keys.push(k);
      }
      expect(keys.length).assertEqual(2);
      expect(keys[0]).assertTrue();
      expect(keys[1]).assertFalse();
    });

    /**
     * @tc.name testReadonlySetKeys004
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0040
     * @tc.desc Verify ReadonlySet<Object> keys() returns object references
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj1: Object = new Object();
      let obj2: Object = new Object();
      const set: ReadonlySet<Object> = new Set<Object>([obj1, obj2]);
      const iter = set.keys();
      expect(iter.next().value === obj1).assertTrue();
      expect(iter.next().value === obj2).assertTrue();
    });

    /**
     * @tc.name testReadonlySetKeys005
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0050
     * @tc.desc Verify keys() chain call set.keys().next().value returns first element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([42, 84]);
      let v: int = set.keys().next().value as int;
      expect(v).assertEqual(42);
    });

    /**
     * @tc.name testReadonlySetKeys006
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0060
     * @tc.desc Verify keys() iterator has next method
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2]);
      const iter = set.keys();
      let t: string = typeof iter.next;
      expect(t).assertEqual("function");
    });

    /**
     * @tc.name testReadonlySetKeys007
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0070
     * @tc.desc Verify keys() traverses NaN element in Set<number>
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<number> = new Set<number>([Number.NaN, 1.0]);
      const keys: number[] = [];
      for (const k of set.keys()) {
        keys.push(k);
      }
      expect(keys.length).assertEqual(2);
      expect(Number.isNaN(keys[0])).assertTrue();
      expect(keys[1]).assertEqual(1.0);
    });

    /**
     * @tc.name testReadonlySetKeys008
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0080
     * @tc.desc Verify Set with +0 and -0 has only one key
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<number> = new Set<number>([0, -0]);
      let count: int = 0;
      for (const k of set.keys()) {
        expect(k).assertEqual(0);
        count++;
      }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetKeys009
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0090
     * @tc.desc Verify keys() traversal order matches values() traversal order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3, 4, 5]);
      const keyArr: int[] = [];
      const valArr: int[] = [];
      for (const k of set.keys()) {
        keyArr.push(k);
      }
      for (const v of set.values()) {
        valArr.push(v);
      }
      for (let i = 0; i < keyArr.length; i++) {
        expect(keyArr[i]).assertEqual(valArr[i]);
      }
    });

    /**
     * @tc.name testReadonlySetKeys010
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0100
     * @tc.desc Verify keys() traversal count equals set.size
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string> = new Set<string>(["a", "b", "c"]);
      let count: int = 0;
      for (const k of set.keys()) {
        count++;
      }
      expect(count).assertEqual(set.size);
    });

    /**
     * @tc.name testReadonlySetKeys011
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0110
     * @tc.desc Verify two ReadonlySet references have same keys traversal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<int> = new Set<int>([10, 20, 30]);
      const r1: ReadonlySet<int> = ms;
      const r2: ReadonlySet<int> = ms;
      const a1: int[] = [];
      const a2: int[] = [];
      for (const k of r1.keys()) {
        a1.push(k);
      }
      for (const k of r2.keys()) {
        a2.push(k);
      }
      expect(a1.length).assertEqual(a2.length);
      for (let i = 0; i < a1.length; i++) {
        expect(a1[i]).assertEqual(a2[i]);
      }
    });

    /**
     * @tc.name testReadonlySetKeys012
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0120
     * @tc.desc Verify underlying Set add is reflected in keys() traversal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<int> = new Set<int>([1, 2]);
      const view: ReadonlySet<int> = ms;
      ms.add(3);
      let count: int = 0;
      for (const k of view.keys()) {
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetKeys013
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0130
     * @tc.desc Verify underlying Set delete is reflected in keys() traversal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<int> = new Set<int>([1, 2, 3]);
      const view: ReadonlySet<int> = ms;
      ms.delete(2);
      const keys: int[] = [];
      for (const k of view.keys()) {
        keys.push(k);
      }
      expect(keys.length).assertEqual(2);
      expect(keys[0]).assertEqual(1);
      expect(keys[1]).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetKeys014
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0140
     * @tc.desc Verify ReadonlySet<int[]> keys() traverses array references
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1: int[] = [1, 2];
      let arr2: int[] = [3, 4];
      const set: ReadonlySet<int[]> = new Set<int[]>([arr1, arr2]);
      const iter = set.keys();
      expect(iter.next().value === arr1).assertTrue();
      expect(iter.next().value === arr2).assertTrue();
    });

    /**
     * @tc.name testReadonlySetKeys015
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0150
     * @tc.desc Verify ReadonlySet<KeysItem> keys() traverses custom class objects
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: KeysItem = new KeysItem("alpha");
      let b: KeysItem = new KeysItem("beta");
      const set: ReadonlySet<KeysItem> = new Set<KeysItem>([a, b]);
      const keys: KeysItem[] = [];
      for (const k of set.keys()) {
        keys.push(k);
      }
      expect(keys.length).assertEqual(2);
      expect(keys[0].label).assertEqual("alpha");
      expect(keys[1].label).assertEqual("beta");
    });

    /**
     * @tc.name testReadonlySetKeys016
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0160
     * @tc.desc Verify three independent keys() iterators traverse independently
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3]);
      const i1 = set.keys();
      const i2 = set.keys();
      const i3 = set.keys();
      i1.next();
      i1.next();
      expect(i1.next().value).assertEqual(3);
      expect(i2.next().value).assertEqual(1);
      expect(i3.next().value).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetKeys017
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0170
     * @tc.desc Verify exhausted keys iterator next() returns done=true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1]);
      const iter = set.keys();
      iter.next();
      expect(iter.next().done).assertTrue();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testReadonlySetKeys018
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0180
     * @tc.desc Verify break in for-of keys() then manual next() continues
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3, 4]);
      const iter = set.keys();
      for (const k of iter) {
        if (k === 2) {
          break;
        }
      }
      let r = iter.next();
      expect(r.value as int).assertEqual(3);
      expect(r.done).assertFalse();
    });

    /**
     * @tc.name testReadonlySetKeys019
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0190
     * @tc.desc Verify object field mutation visible in keys() traversal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let item: KeysItem = new KeysItem("old");
      const set: ReadonlySet<KeysItem> = new Set<KeysItem>([item]);
      item.label = "newLabel";
      const iter = set.keys();
      let k = iter.next().value as KeysItem;
      expect(k.label).assertEqual("newLabel");
    });

    /**
     * @tc.name testReadonlySetKeys020
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0200
     * @tc.desc Verify ReadonlySet<KeysColor> keys() traverses enum values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<KeysColor> = new Set<KeysColor>([KeysColor.RED, KeysColor.GREEN]);
      const keys: KeysColor[] = [];
      for (const k of set.keys()) {
        keys.push(k);
      }
      expect(keys.length).assertEqual(2);
      expect(keys[0]).assertEqual(KeysColor.RED);
    });

    /**
     * @tc.name testReadonlySetKeys021
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0210
     * @tc.desc Verify ReadonlySet<byte> keys() traverses byte boundary values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<byte> = new Set<byte>([-128, 0, 127]);
      const keys: byte[] = [];
      for (const k of set.keys()) {
        keys.push(k);
      }
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual(-128);
      expect(keys[2]).assertEqual(127);
    });

    /**
     * @tc.name testReadonlySetKeys022
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0220
     * @tc.desc Verify ReadonlySet<short> keys() traverses short boundary values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<short> = new Set<short>([-32768, 0, 32767]);
      const keys: short[] = [];
      for (const k of set.keys()) {
        keys.push(k);
      }
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual(-32768);
      expect(keys[2]).assertEqual(32767);
    });

    /**
     * @tc.name testReadonlySetKeys023
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0230
     * @tc.desc Verify ReadonlySet<char> keys() traverses char elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<char> = new Set<char>([c'X', c'Y']);
      let count: int = 0;
      for (const k of set.keys()) {
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetKeys024
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0240
     * @tc.desc Verify ReadonlySet<bigint> keys() traverses bigint elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<bigint> = new Set<bigint>([100n, 200n, 300n]);
      let count: int = 0;
      for (const k of set.keys()) {
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetKeys025
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0250
     * @tc.desc Verify ReadonlySet<FixedArray<int>> keys() traverses elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fa: FixedArray<int> = new FixedArray<int>(2);
      fa[0] = 1;
      fa[1] = 2;
      const set: ReadonlySet<FixedArray<int>> = new Set<FixedArray<int>>([fa]);
      let count: int = 0;
      for (const k of set.keys()) {
        count++;
      }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetKeys026
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0260
     * @tc.desc Verify keys() traversal unaffected by failed size modification
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3]);
      try {
        (set as Record<string, Object>)["size"] = 100;
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
      let count: int = 0;
      for (const k of set.keys()) {
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetKeys027
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0270
     * @tc.desc Verify ReadonlySet with scientific notation keys() returns decimal values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<number> = new Set<number>([1.0e4, 5.5e3]);
      const keys: number[] = [];
      for (const k of set.keys()) {
        keys.push(k);
      }
      expect(keys.length).assertEqual(2);
      expect(keys[0]).assertEqual(10000);
      expect(keys[1]).assertEqual(5500);
    });

    /**
     * @tc.name testReadonlySetKeys028
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0280
     * @tc.desc Verify ReadonlySet<KeysFinal> keys() traverses final class objects
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f1: KeysFinal = new KeysFinal();
      f1.id = 1;
      let f2: KeysFinal = new KeysFinal();
      f2.id = 2;
      const set: ReadonlySet<KeysFinal> = new Set<KeysFinal>([f1, f2]);
      let count: int = 0;
      for (const k of set.keys()) {
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetKeys029
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0290
     * @tc.desc Verify ReadonlySet<KeysDrawable> keys() traverses interface implementors
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: KeysRect = new KeysRect();
      let r2: KeysRect = new KeysRect();
      const set: ReadonlySet<KeysDrawable> = new Set<KeysDrawable>([r1, r2]);
      let count: int = 0;
      for (const k of set.keys()) {
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetKeys030
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0300
     * @tc.desc Verify union type Set keys() traverses both string and int elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string | int> = new Set<string | int>();
      (set as Set<string | int>).add("alpha");
      (set as Set<string | int>).add(42);
      let strCount: int = 0;
      let intCount: int = 0;
      for (const k of set.keys()) {
        let t: string = typeof k;
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
     * @tc.name testReadonlySetKeys031
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0310
     * @tc.desc Verify ReadonlySet<long> keys() traverses long boundary values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([9223372036854775807, -9223372036854775808, 0]);
      const keys: long[] = [];
      for (const k of set.keys()) {
        keys.push(k);
      }
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual(9223372036854775807);
      expect(keys[1]).assertEqual(-9223372036854775808);
    });

    /**
     * @tc.name testReadonlySetKeys032
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0320
     * @tc.desc Verify ReadonlySet<ValueArray<int>> keys() traverses value array references
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let va1: ValueArray<int> = new ValueArray<int>(2);
      va1[0] = 1;
      va1[1] = 2;
      let va2: ValueArray<int> = new ValueArray<int>(2);
      va2[0] = 3;
      va2[1] = 4;
      const set: ReadonlySet<ValueArray<int>> = new Set<ValueArray<int>>([va1, va2]);
      const iter = set.keys();
      expect(iter.next().value === va1).assertTrue();
      expect(iter.next().value === va2).assertTrue();
    });

    /**
     * @tc.name testReadonlySetKeys033
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0330
     * @tc.desc Verify keys() with surrogate pair string traverses correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string> = new Set<string>(["𝄞", "𝕬"]);
      let count: int = 0;
      for (const k of set.keys()) {
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetKeys034
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0340
     * @tc.desc Verify keys() entries() consistency for all elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([10, 20, 30]);
      const keys: int[] = [];
      const entKeys: int[] = [];
      for (const k of set.keys()) {
        keys.push(k);
      }
      for (const e of set.entries()) {
        entKeys.push(e[0]);
      }
      for (let i = 0; i < keys.length; i++) {
        expect(keys[i]).assertEqual(entKeys[i]);
      }
    });

    /**
     * @tc.name testReadonlySetKeys035
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0350
     * @tc.desc Verify keys() with large Set of 1000 elements counts correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [];
      for (let i = 0; i < 1000; i++) {
        arr.push(i);
      }
      const set: ReadonlySet<int> = new Set<int>(arr);
      let count: int = 0;
      for (const k of set.keys()) {
        count++;
      }
      expect(count).assertEqual(1000);
    });

    /**
     * @tc.name testReadonlySetKeys036
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0360
     * @tc.desc Verify keys() after underlying clear returns empty
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<int> = new Set<int>([1, 2, 3]);
      const view: ReadonlySet<int> = ms;
      ms.clear();
      let count: int = 0;
      for (const k of view.keys()) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.name testReadonlySetKeys037
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0370
     * @tc.desc Verify keys() with enum KeysColor traverses enum constants
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<KeysColor> = new Set<KeysColor>([KeysColor.RED, KeysColor.GREEN, KeysColor.BLUE]);
      let count: int = 0;
      for (const k of set.keys()) {
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetKeys038
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0380
     * @tc.desc Verify keys() with ReadonlySet<number> handles precision boundary
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<number> = new Set<number>([9007199254740992, 9007199254740994]);
      let count: int = 0;
      for (const k of set.keys()) {
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetKeys039
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0390
     * @tc.desc Verify keys() for of continues after skipping middle element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3, 4, 5]);
      const result: int[] = [];
      for (const k of set.keys()) {
        if (k === 3) {
          continue;
        }
        result.push(k);
      }
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[3]).assertEqual(5);
    });

    /**
     * @tc.name testReadonlySetKeys040
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0400
     * @tc.desc Verify keys() with 2D int[][] array references
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m1: int[][] = [[1]];
      let m2: int[][] = [[2]];
      const set: ReadonlySet<int[][]> = new Set<int[][]>([m1, m2]);
      const iter = set.keys();
      expect(iter.next().value === m1).assertTrue();
      expect(iter.next().value === m2).assertTrue();
    });

    /**
     * @tc.name testReadonlySetKeys041
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0410
     * @tc.desc Verify keys() iterator has Symbol.iterator protocol
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3]);
      let count1: int = 0;
      for (const k of set.keys()) {
        count1++;
      }
      let count2: int = 0;
      for (const k of set.keys()) {
        count2++;
      }
      expect(count1).assertEqual(3);
      expect(count2).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetKeys042
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0420
     * @tc.desc Verify keys() with ReadonlySet<KeysFinal> traverses final class instances
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f1: KeysFinal = new KeysFinal();
      let f2: KeysFinal = new KeysFinal();
      const set: ReadonlySet<KeysFinal> = new Set<KeysFinal>([f1, f2]);
      const keys: KeysFinal[] = [];
      for (const k of set.keys()) {
        keys.push(k);
      }
      expect(keys.length).assertEqual(2);
      expect(keys[0] === f1).assertTrue();
      expect(keys[1] === f2).assertTrue();
    });

    /**
     * @tc.name testReadonlySetKeys043
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0430
     * @tc.desc Verify keys() traversal unaffected by failed delete cast
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3]);
      try {
        (set as Record<string, Object>)["delete"] = "bad";
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
      let count: int = 0;
      for (const k of set.keys()) {
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetKeys044
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0440
     * @tc.desc Verify keys() with const ValueArray traverses correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fa: FixedArray<int> = new FixedArray<int>(4);
      fa[0] = 1;
      fa[1] = 2;
      fa[2] = 3;
      fa[3] = 4;
      const set: ReadonlySet<FixedArray<int>> = new Set<FixedArray<int>>([fa]);
      let count: int = 0;
      for (const k of set.keys()) {
        count++;
      }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetKeys045
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0450
     * @tc.desc Verify keys() with duplicate constructor elements iterates deduplicated
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 1, 2, 2, 3]);
      let count: int = 0;
      for (const k of set.keys()) {
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetKeys046
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0460
     * @tc.desc Verify keys() for long type with negative zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([0, -0 as long]);
      let count: int = 0;
      for (const k of set.keys()) {
        expect(k).assertEqual(0);
        count++;
      }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetKeys047
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0470
     * @tc.desc Verify keys() with map type Set<int[]> and size check
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: int[] = [1, 2, 3];
      let a2: int[] = [4, 5, 6];
      let a3: int[] = [1, 2, 3];
      const set: ReadonlySet<int[]> = new Set<int[]>([a1, a2, a3]);
      let count: int = 0;
      for (const k of set.keys()) {
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetKeys048
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0480
     * @tc.desc Verify keys() with ReadonlySet<number> containing Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<number> = new Set<number>([Number.POSITIVE_INFINITY, Number.NEGATIVE_INFINITY]);
      let count: int = 0;
      for (const k of set.keys()) {
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetKeys049
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0490
     * @tc.desc Verify keys() with ReadonlySet<char> traverses correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<char> = new Set<char>([c'A', c'B', c'C']);
      let count: int = 0;
      for (const k of set.keys()) {
        count++;
      }
      expect(count).assertEqual(3);
    });

/**
     * @tc.name testReadonlySetKeys050
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0500
     * @tc.desc Verify keys() collects int elements [10,20,30] in order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([10, 20, 30]);
      const keys: int[] = [];
      for (const k of set.keys()) {
        keys.push(k);
      }
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual(10);
      expect(keys[2]).assertEqual(30);
    });

    /**
     * @tc.name testReadonlySetKeys051
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0510
     * @tc.desc Verify keys() counts string elements [a,b,c]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string> = new Set<string>(["a", "b", "c"]);
      let count: int = 0;
      for (const k of set.keys()) {
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetKeys052
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0520
     * @tc.desc Verify keys() counts deduplicated elements [1,2,3,2,1]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([1, 2, 3, 2, 1]);
      let count: int = 0;
      for (const k of set.keys()) {
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetKeys053
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0530
     * @tc.desc Verify keys() reflects underlying Set add operation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<int> = new Set<int>([5, 10, 15]);
      const view: ReadonlySet<int> = ms;
      ms.add(20);
      let count: int = 0;
      for (const k of view.keys()) {
        count++;
      }
      expect(count).assertEqual(4);
    });

    /**
     * @tc.name testReadonlySetKeys054
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0540
     * @tc.desc Verify keys() with number elements [1.5,2.5,3.5]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<number> = new Set<number>([1.5, 2.5, 3.5]);
      const keys: number[] = [];
      for (const k of set.keys()) {
        keys.push(k);
      }
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual(1.5);
    });

    /**
     * @tc.name testReadonlySetKeys055
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0550
     * @tc.desc Verify keys() with boolean elements true and false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<boolean> = new Set<boolean>([true, false]);
      const keys: boolean[] = [];
      for (const k of set.keys()) {
        keys.push(k);
      }
      expect(keys.length).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetKeys056
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0560
     * @tc.desc Verify keys() manual next() returns [1,2,3] sequentially
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3]);
      const iter = set.keys();
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().value).assertEqual(2);
      expect(iter.next().value).assertEqual(3);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testReadonlySetKeys057
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0570
     * @tc.desc Verify keys() with short boundary values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<short> = new Set<short>([-32768, 0, 32767]);
      const keys: short[] = [];
      for (const k of set.keys()) {
        keys.push(k);
      }
      expect(keys.length).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetKeys058
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0580
     * @tc.desc Verify keys() with enum Kp2Dir UP/DOWN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<Kp2Dir> = new Set<Kp2Dir>([Kp2Dir.UP, Kp2Dir.DOWN]);
      const keys: Kp2Dir[] = [];
      for (const k of set.keys()) {
        keys.push(k);
      }
      expect(keys.length).assertEqual(2);
      expect(keys[0]).assertEqual(Kp2Dir.UP);
    });

    /**
     * @tc.name testReadonlySetKeys059
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0590
     * @tc.desc Verify keys() single element next() done transition
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1]);
      const iter = set.keys();
      expect(iter.next().done).assertFalse();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testReadonlySetKeys060
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0600
     * @tc.desc Verify keys() on empty Set returns 0 elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([]);
      let count: int = 0;
      for (const k of set.keys()) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.name testReadonlySetKeys061
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0610
     * @tc.desc Verify keys() filters multiples of 10 from long Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([5, 10, 15, 20, 25]);
      const keys: long[] = [];
      for (const k of set.keys()) {
        if (k % 10 === 0) {
          keys.push(k);
        }
      }
      expect(keys.length).assertEqual(2);
      expect(keys[0]).assertEqual(10);
      expect(keys[1]).assertEqual(20);
    });

    /**
     * @tc.name testReadonlySetKeys062
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0620
     * @tc.desc Verify keys() with custom Kp2Data class objects
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<Kp2Data> = new Set<Kp2Data>([new Kp2Data(1), new Kp2Data(2)]);
      let count: int = 0;
      for (const k of set.keys()) {
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetKeys063
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0630
     * @tc.desc Verify two keys() traversals produce identical order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([10, 20, 30]);
      const keys1: long[] = [];
      const keys2: long[] = [];
      for (const k of set.keys()) {
        keys1.push(k);
      }
      for (const k of set.keys()) {
        keys2.push(k);
      }
      expect(keys1.length).assertEqual(keys2.length);
      expect(keys1[0]).assertEqual(keys2[0]);
      expect(keys1[1]).assertEqual(keys2[1]);
    });

    /**
     * @tc.name testReadonlySetKeys064
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0640
     * @tc.desc Verify keys() treats +0 and -0 as one element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<number> = new Set<number>([0, -0]);
      let count: int = 0;
      for (const k of set.keys()) {
        count++;
      }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetKeys065
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0650
     * @tc.desc Verify keys() iterator has next() method
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([100, 200, 300]);
      const iter = set.keys();
      expect(typeof iter.next).assertEqual("function");
    });

    /**
     * @tc.name testReadonlySetKeys066
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0660
     * @tc.desc Verify keys() reflects multiple underlying delete operations
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<int> = new Set<int>([1, 2, 3, 4, 5]);
      const view: ReadonlySet<int> = ms;
      for (let i: int = 0; i < 3; i++) {
        ms.delete(i + 1);
      }
      const keys: int[] = [];
      for (const k of view.keys()) {
        keys.push(k);
      }
      expect(keys.length).assertEqual(2);
      expect(keys[0]).assertEqual(4);
      expect(keys[1]).assertEqual(5);
    });

    /**
     * @tc.name testReadonlySetKeys067
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0670
     * @tc.desc Verify keys() with long elements -5/0/5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([-5, 0, 5]);
      const keys: long[] = [];
      for (const k of set.keys()) {
        keys.push(k);
      }
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual(-5);
      expect(keys[2]).assertEqual(5);
    });

    /**
     * @tc.name testReadonlySetKeys068
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0680
     * @tc.desc Verify keys() manual next() for string [x,y]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string> = new Set<string>(["x", "y"]);
      const iter = set.keys();
      expect(iter.next().value).assertEqual("x");
      expect(iter.next().value).assertEqual("y");
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testReadonlySetKeys069
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0690
     * @tc.desc Verify keys() for-of collects [2,4,6] in order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([2, 4, 6]);
      const iter = set.keys();
      const result: int[] = [];
      for (const k of iter) {
        result.push(k);
      }
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(2);
      expect(result[2]).assertEqual(6);
    });

    /**
     * @tc.name testReadonlySetKeys070
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0700
     * @tc.desc Verify keys() sums long elements [1,2,3]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([1, 2, 3]);
      let sum: long = 0;
      for (const k of set.keys()) {
        sum += k;
      }
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.name testReadonlySetKeys071
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0710
     * @tc.desc Verify keys() next() returns long [50,100]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([50, 100]);
      const iter = set.keys();
      let v1: long = iter.next().value as long;
      let v2: long = iter.next().value as long;
      expect(v1).assertEqual(50);
      expect(v2).assertEqual(100);
    });

/**
     * @tc.name testReadonlySetKeys072
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0720
     * @tc.desc Verify keys() with Set<long> [1,2,3] collects all 3 keys
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([1, 2, 3]);
      const keys: long[] = [];
      for (const k of set.keys()) {
        keys.push(k);
      }
      expect(keys.length).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetKeys073
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0730
     * @tc.desc Verify keys() with Set<long> [10,20,30] first key is 10
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([10, 20, 30]);
      const keys: long[] = [];
      for (const k of set.keys()) {
        keys.push(k);
      }
      expect(keys[0]).assertEqual(10);
    });

    /**
     * @tc.name testReadonlySetKeys074
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0740
     * @tc.desc Verify keys() with Set<long> [5,10,15,20,25] counts 5 elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([5, 10, 15, 20, 25]);
      let count: int = 0;
      for (const k of set.keys()) {
        count++;
      }
      expect(count).assertEqual(5);
    });

    /**
     * @tc.name testReadonlySetKeys075
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0750
     * @tc.desc Verify keys() with Set<long> [1,2,3] returns keys in insertion order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([1, 2, 3]);
      const keys: long[] = [];
      for (const k of set.keys()) {
        keys.push(k);
      }
      expect(keys[0]).assertEqual(1);
      expect(keys[2]).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetKeys076
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0760
     * @tc.desc Verify keys() with Set<long> [2,4,6] sum is 12
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([2, 4, 6]);
      let sum: long = 0;
      for (const k of set.keys()) {
        sum += k;
      }
      expect(sum).assertEqual(12);
    });

    /**
     * @tc.name testReadonlySetKeys077
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0770
     * @tc.desc Verify keys() with Set<long> [-3,-1,0,1,3] counts 5 elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([-3, -1, 0, 1, 3]);
      let count: int = 0;
      for (const k of set.keys()) {
        count++;
      }
      expect(count).assertEqual(5);
    });

    /**
     * @tc.name testReadonlySetKeys078
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0780
     * @tc.desc Verify keys() on deduplicated Set<long> [7,14,21,14,7] counts 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([7, 14, 21, 14, 7]);
      let count: int = 0;
      for (const k of set.keys()) {
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetKeys079
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0790
     * @tc.desc Verify keys() next() returns [1,2,3] sequentially for Set<long>
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([1, 2, 3]);
      const iter = set.keys();
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().value).assertEqual(2);
      expect(iter.next().value).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetKeys080
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0800
     * @tc.desc Verify keys() mid-iteration advance returns 30 for Set<long> [10,20,30]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([10, 20, 30]);
      const iter = set.keys();
      iter.next(); iter.next();
      expect(iter.next().value).assertEqual(30);
    });

    /**
     * @tc.name testReadonlySetKeys081
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0810
     * @tc.desc Verify keys() exhausted iterator returns done=true for Set<long> [5,10]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([5, 10]);
      const iter = set.keys();
      expect(iter.next().value).assertEqual(5);
      expect(iter.next().value).assertEqual(10);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testReadonlySetKeys082
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0820
     * @tc.desc Verify keys() iterator has next method
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([1, 2, 3]);
      const iter = set.keys();
      expect(typeof iter.next).assertEqual("function");
    });

    /**
     * @tc.name testReadonlySetKeys083
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0830
     * @tc.desc Verify keys() filters values > 150 for Set<long> [100,200,300]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([100, 200, 300]);
      const keys: long[] = [];
      for (const k of set.keys()) {
        if (k > 150) {
          keys.push(k);
        }
      }
      expect(keys.length).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetKeys084
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0840
     * @tc.desc Verify keys() with Set<long> [4,8,12,16] sum is 40
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([4, 8, 12, 16]);
      let sum: long = 0;
      for (const k of set.keys()) {
        sum += k;
      }
      expect(sum).assertEqual(40);
    });

    /**
     * @tc.name testReadonlySetKeys085
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0850
     * @tc.desc Verify keys() with Set<long> [-10,0,10] collects 3 keys
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([-10, 0, 10]);
      const keys: long[] = [];
      for (const k of set.keys()) {
        keys.push(k);
      }
      expect(keys.length).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetKeys086
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0860
     * @tc.desc Verify two sequential keys() iterations return same count
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([1, 2, 3]);
      let c1: int = 0; for (const k of set.keys()) { c1++; }
      let c2: int = 0; for (const k of set.keys()) { c2++; }
      expect(c1).assertEqual(c2);
    });

    /**
     * @tc.name testReadonlySetKeys087
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0870
     * @tc.desc Verify keys() filters even values for Set<long> [3,6,9,12]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([3, 6, 9, 12]);
      const keys: long[] = [];
      for (const k of set.keys()) {
        if (k % 2 === 0) {
          keys.push(k);
        }
      }
      expect(keys.length).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetKeys088
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0880
     * @tc.desc Verify keys() with Set<long> [2,4,6] checks first and last
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([2, 4, 6]);
      const keys: long[] = [];
      for (const k of set.keys()) {
        keys.push(k);
      }
      expect(keys[0]).assertEqual(2);
      expect(keys[2]).assertEqual(6);
    });

    /**
     * @tc.name testReadonlySetKeys089
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0890
     * @tc.desc Verify keys() with Set<long> [1,3,5] sum is 9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([1, 3, 5]);
      let sum: long = 0;
      for (const k of set.keys()) {
        sum += k;
      }
      expect(sum).assertEqual(9);
    });

    /**
     * @tc.name testReadonlySetKeys090
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0900
     * @tc.desc Verify keys() filters positive values for Set<long> [-5,5,10]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([-5, 5, 10]);
      const keys: long[] = [];
      for (const k of set.keys()) {
        if (k > 0) {
          keys.push(k);
        }
      }
      expect(keys.length).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetKeys091
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0910
     * @tc.desc Verify keys() next() returns [15,30,45] sequentially
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([15, 30, 45]);
      const iter = set.keys();
      expect(iter.next().value).assertEqual(15);
      expect(iter.next().value).assertEqual(30);
      expect(iter.next().value).assertEqual(45);
    });

    /**
     * @tc.name testReadonlySetKeys092
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0920
     * @tc.desc Verify keys() finds max in Set<long> [8,16,24]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([8, 16, 24]);
      let max: long = -999;
      for (const k of set.keys()) { if (k > max) { max = k; } }
      expect(max).assertEqual(24);
    });

    /**
     * @tc.name testReadonlySetKeys093
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0930
     * @tc.desc Verify keys() finds min in Set<long> [8,16,24]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([8, 16, 24]);
      let min: long = 999;
      for (const k of set.keys()) { if (k < min) { min = k; } }
      expect(min).assertEqual(8);
    });

    /**
     * @tc.name testReadonlySetKeys094
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0940
     * @tc.desc Verify two keys() iterations return same first element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([1, 2, 3]);
      const k1: long[] = []; const k2: long[] = [];
      for (const k of set.keys()) { k1.push(k); }
      for (const k of set.keys()) { k2.push(k); }
      expect(k1[0]).assertEqual(k2[0]);
    });

    /**
     * @tc.name testReadonlySetKeys095
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0950
     * @tc.desc Verify keys() exhausted returns done=true after all 3 elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([1, 2, 3]);
      const iter = set.keys();
      expect(iter.next().done).assertFalse();
      expect(iter.next().done).assertFalse();
      expect(iter.next().done).assertFalse();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testReadonlySetKeys096
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0960
     * @tc.desc Verify keys() with Set<long> [2,4,6,8,10] collects 5 keys
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([2, 4, 6, 8, 10]);
      const keys: long[] = [];
      for (const k of set.keys()) { keys.push(k); }
      expect(keys.length).assertEqual(5);
      expect(keys[0]).assertEqual(2);
      expect(keys[4]).assertEqual(10);
    });

    /**
     * @tc.name testReadonlySetKeys097
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0970
     * @tc.desc Verify two sequential keys() iterations produce same sum
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([1, 2, 3]);
      let s1: long = 0; for (const k of set.keys()) { s1 += k; }
      let s2: long = 0; for (const k of set.keys()) { s2 += k; }
      expect(s1).assertEqual(s2);
    });

    /**
     * @tc.name testReadonlySetKeys098
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0980
     * @tc.desc Verify keys() maps to *2 array for Set<long> [3,6,9]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([3, 6, 9]);
      const keys: long[] = [];
      for (const k of set.keys()) { keys.push(k * 2); }
      expect(keys[0]).assertEqual(6); expect(keys[1]).assertEqual(12); expect(keys[2]).assertEqual(18);
    });

    /**
     * @tc.name testReadonlySetKeys099
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_0990
     * @tc.desc Verify keys() count equals set.size
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([1, 2, 3]);
      let count: int = 0;
      for (const k of set.keys()) { count++; }
      expect(count).assertEqual(set.size);
    });

    /**
     * @tc.name testReadonlySetKeys100
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_1000
     * @tc.desc Verify keys() with Set<long> [7,14,21] collects in order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([7, 14, 21]);
      const keys: long[] = [];
      for (const k of set.keys()) { keys.push(k); }
      expect(keys[0]).assertEqual(7); expect(keys[1]).assertEqual(14); expect(keys[2]).assertEqual(21);
    });

    /**
     * @tc.name testReadonlySetKeys101
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_1010
     * @tc.desc Verify keys() next() returns first value 1 for Set<long>
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([1, 2, 3]);
      const iter = set.keys();
      expect(iter.next().value as long).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetKeys102
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_1020
     * @tc.desc Verify keys() cross-method consistency: keys count equals entries count and size
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string> = new Set<string>(["a", "b", "c", "d"]);
      let keyCount: int = 0;
      for (const _ of set.keys()) {
        keyCount++;
      }
      let entryCount: int = 0;
      for (const _ of set.entries()) {
        entryCount++;
      }
      expect(keyCount).assertEqual(entryCount);
      expect(keyCount).assertEqual(set.size);
    });

    /**
     * @tc.name testReadonlySetKeys103
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_1030
     * @tc.desc Verify keys() with Object elements traverses all references in order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const o1: Object = new Object();
      const o2: Object = new Object();
      const set: ReadonlySet<Object> = new Set<Object>([o1, o2]);
      const refs: Object[] = [];
      for (const key of set.keys()) {
        refs.push(key);
      }
      expect(refs.length).assertEqual(2);
      expect(refs[0]).assertEqual(o1);
      expect(refs[1]).assertEqual(o2);
    });

    /**
     * @tc.name testReadonlySetKeys104
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_1040
     * @tc.desc Verify keys() with large Set of 40000 elements counts correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [];
      for (let i: int = 0; i < 40000; i++) {
        arr.push(i);
      }
      const set: ReadonlySet<int> = new Set<int>(arr);
      let count: int = 0;
      for (const _ of set.keys()) {
        count++;
      }
      expect(count).assertEqual(40000);
    });

    /**
     * @tc.name testReadonlySetKeys105
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_1050
     * @tc.desc Verify keys() spread operator into array collects all keys correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([5, 10, 15]);
      const keys: int[] = [...set.keys()];
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual(5);
      expect(keys[1]).assertEqual(10);
      expect(keys[2]).assertEqual(15);
    });

    /**
     * @tc.name testReadonlySetKeys106
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_1060
     * @tc.desc Verify keys() with boundary combination Set (NaN, Infinity, -Infinity, +0, -0) counts deduplicated keys
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<number> = new Set<number>([Number.NaN, Number.POSITIVE_INFINITY, Number.NEGATIVE_INFINITY, 0, -0]);
      let count: int = 0;
      for (const _ of set.keys()) {
        count++;
      }
      expect(count).assertEqual(4);
    });

    /**
     * @tc.name testReadonlySetKeys107
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_1070
     * @tc.desc Verify keys() with Object element traverses successfully
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const set: ReadonlySet<Object> = new Set<Object>([obj]);
      let found: boolean = false;
      for (const key of set.keys()) {
        if (key === obj) {
          found = true;
        }
      }
      expect(found).assertTrue();
    });

    /**
     * @tc.name testReadonlySetKeys108
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_1080
     * @tc.desc Verify ReadonlySet<Error> keys() traverses Error objects
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e1: Error = new Error("k1");
      const e2: Error = new Error("k2");
      const set: ReadonlySet<Error> = new Set<Error>([e1, e2]);
      const iter = set.keys();
      expect(iter.next().value === e1).assertTrue();
      expect(iter.next().value === e2).assertTrue();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testReadonlySetKeys109
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_1090
     * @tc.desc Verify ReadonlySet<Date> keys() traverses Date objects
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: Date = new Date(2024);
      const d2: Date = new Date(2025);
      const set: ReadonlySet<Date> = new Set<Date>([d1, d2]);
      const keys: Date[] = [];
      for (const k of set.keys()) {
        keys.push(k);
      }
      expect(keys.length).assertEqual(2);
      expect(keys[0] === d1).assertTrue();
      expect(keys[1] === d2).assertTrue();
    });

    /**
     * @tc.name testReadonlySetKeys110
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_1100
     * @tc.desc Verify ReadonlySet<RegExp> keys() traverses RegExp objects
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: RegExp = new RegExp("abc");
      const r2: RegExp = new RegExp("xyz");
      const set: ReadonlySet<RegExp> = new Set<RegExp>([r1, r2]);
      let count: int = 0;
      for (const k of set.keys()) {
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetKeys111
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_1110
     * @tc.desc Verify ReadonlySet<Object> keys() traverses Promise objects
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p1: Object = new Object();
      const p2: Object = new Object();
      const set: ReadonlySet<Object> = new Set<Object>([p1, p2]);
      const iter = set.keys();
      expect(iter.next().value === p1).assertTrue();
      expect(iter.next().value === p2).assertTrue();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testReadonlySetKeys112
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_1120
     * @tc.desc Verify ReadonlySet<WeakMap<Object, int>> keys() traverses WeakMap objects
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const wm1: WeakMap<Object, int> = new WeakMap<Object, int>();
      const wm2: WeakMap<Object, int> = new WeakMap<Object, int>();
      const set: ReadonlySet<WeakMap<Object, int>> = new Set<WeakMap<Object, int>>([wm1, wm2]);
      let count: int = 0;
      for (const k of set.keys()) {
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetKeys113
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_1130
     * @tc.desc Verify ReadonlySet<WeakSet<Object>> keys() traverses WeakSet objects
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ws1: WeakSet<Object> = new WeakSet<Object>();
      const ws2: WeakSet<Object> = new WeakSet<Object>();
      const set: ReadonlySet<WeakSet<Object>> = new Set<WeakSet<Object>>([ws1, ws2]);
      const iter = set.keys();
      expect(iter.next().value === ws1).assertTrue();
      expect(iter.next().value === ws2).assertTrue();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testReadonlySetKeys114
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_1140
     * @tc.desc Verify underlying Set delete removes Error from keys traversal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e1: Error = new Error("a");
      const e2: Error = new Error("b");
      let ms: Set<Error> = new Set<Error>([e1, e2]);
      const view: ReadonlySet<Error> = ms;
      ms.delete(e1);
      let count: int = 0;
      for (const _ of view.keys()) {
        count++;
      }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetKeys115
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_1150
     * @tc.desc Verify underlying Set delete removes Date from keys traversal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: Date = new Date(1);
      const d2: Date = new Date(2);
      let ms: Set<Date> = new Set<Date>([d1, d2]);
      const view: ReadonlySet<Date> = ms;
      ms.delete(d1);
      let count: int = 0;
      for (const _ of view.keys()) {
        count++;
      }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetKeys116
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_1160
     * @tc.desc Verify underlying Set delete removes RegExp from keys traversal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: RegExp = new RegExp("a");
      const r2: RegExp = new RegExp("b");
      let ms: Set<RegExp> = new Set<RegExp>([r1, r2]);
      const view: ReadonlySet<RegExp> = ms;
      ms.delete(r1);
      let count: int = 0;
      for (const _ of view.keys()) {
        count++;
      }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetKeys117
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_1170
     * @tc.desc Verify underlying Set delete removes Promise from keys traversal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p1: Object = new Object();
      const p2: Object = new Object();
      let ms: Set<Object> = new Set<Object>([p1, p2]);
      const view: ReadonlySet<Object> = ms;
      ms.delete(p1);
      let count: int = 0;
      for (const _ of view.keys()) {
        count++;
      }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetKeys118
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_1180
     * @tc.desc Verify underlying Set delete removes WeakMap from keys traversal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const wm1: WeakMap<Object, int> = new WeakMap<Object, int>();
      const wm2: WeakMap<Object, int> = new WeakMap<Object, int>();
      let ms: Set<WeakMap<Object, int>> = new Set<WeakMap<Object, int>>([wm1, wm2]);
      const view: ReadonlySet<WeakMap<Object, int>> = ms;
      ms.delete(wm1);
      let count: int = 0;
      for (const _ of view.keys()) {
        count++;
      }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetKeys119
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_1190
     * @tc.desc Verify underlying Set delete removes WeakSet from keys traversal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ws1: WeakSet<Object> = new WeakSet<Object>();
      const ws2: WeakSet<Object> = new WeakSet<Object>();
      let ms: Set<WeakSet<Object>> = new Set<WeakSet<Object>>([ws1, ws2]);
      const view: ReadonlySet<WeakSet<Object>> = ms;
      ms.delete(ws1);
      let count: int = 0;
      for (const _ of view.keys()) {
        count++;
      }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetKeys120
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_1200
     * @tc.desc Verify underlying Set clear empties Error keys traversal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<Error> = new Set<Error>([new Error("a"), new Error("b")]);
      const view: ReadonlySet<Error> = ms;
      ms.clear();
      let count: int = 0;
      for (const _ of view.keys()) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.name testReadonlySetKeys121
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_1210
     * @tc.desc Verify underlying Set clear empties Date keys traversal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<Date> = new Set<Date>([new Date(1), new Date(2)]);
      const view: ReadonlySet<Date> = ms;
      ms.clear();
      let count: int = 0;
      for (const _ of view.keys()) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.name testReadonlySetKeys122
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_1220
     * @tc.desc Verify underlying Set clear empties RegExp keys traversal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<RegExp> = new Set<RegExp>([new RegExp("a"), new RegExp("b")]);
      const view: ReadonlySet<RegExp> = ms;
      ms.clear();
      let count: int = 0;
      for (const _ of view.keys()) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.name testReadonlySetKeys123
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_1230
     * @tc.desc Verify underlying Set clear empties Promise keys traversal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p1: Object = new Object();
      const p2: Object = new Object();
      let ms: Set<Object> = new Set<Object>([p1, p2]);
      const view: ReadonlySet<Object> = ms;
      ms.clear();
      let count: int = 0;
      for (const _ of view.keys()) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.name testReadonlySetKeys124
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_1240
     * @tc.desc Verify underlying Set clear empties WeakMap keys traversal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const wm1: WeakMap<Object, int> = new WeakMap<Object, int>();
      const wm2: WeakMap<Object, int> = new WeakMap<Object, int>();
      let ms: Set<WeakMap<Object, int>> = new Set<WeakMap<Object, int>>([wm1, wm2]);
      const view: ReadonlySet<WeakMap<Object, int>> = ms;
      ms.clear();
      let count: int = 0;
      for (const _ of view.keys()) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.name testReadonlySetKeys125
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_1250
     * @tc.desc Verify underlying Set clear empties WeakSet keys traversal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ws1: WeakSet<Object> = new WeakSet<Object>();
      const ws2: WeakSet<Object> = new WeakSet<Object>();
      let ms: Set<WeakSet<Object>> = new Set<WeakSet<Object>>([ws1, ws2]);
      const view: ReadonlySet<WeakSet<Object>> = ms;
      ms.clear();
      let count: int = 0;
      for (const _ of view.keys()) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.name testReadonlySetKeys126
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_1260
     * @tc.desc Verify empty Error keys traversal is empty
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<Error> = new Set<Error>();
      let count: int = 0;
      for (const _ of set.keys()) { count++; }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.name testReadonlySetKeys127
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_1270
     * @tc.desc Verify empty Date keys traversal is empty
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<Date> = new Set<Date>();
      let count: int = 0;
      for (const _ of set.keys()) { count++; }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.name testReadonlySetKeys128
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_1280
     * @tc.desc Verify empty RegExp keys traversal is empty
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<RegExp> = new Set<RegExp>();
      let count: int = 0;
      for (const _ of set.keys()) { count++; }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.name testReadonlySetKeys129
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_1290
     * @tc.desc Verify empty Promise keys traversal is empty
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<Object> = new Set<Object>();
      let count: int = 0;
      for (const _ of set.keys()) { count++; }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.name testReadonlySetKeys130
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_1300
     * @tc.desc Verify empty WeakMap keys traversal is empty
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<WeakMap<Object, int>> = new Set<WeakMap<Object, int>>();
      let count: int = 0;
      for (const _ of set.keys()) { count++; }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.name testReadonlySetKeys131
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_1310
     * @tc.desc Verify empty WeakSet keys traversal is empty
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<WeakSet<Object>> = new Set<WeakSet<Object>>();
      let count: int = 0;
      for (const _ of set.keys()) { count++; }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.name testReadonlySetKeys132
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_1320
     * @tc.desc Verify single-element Error keys traverses once
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e1: Error = new Error("a");
      const set: ReadonlySet<Error> = new Set<Error>([e1]);
      const iter = set.keys();
      expect(iter.next().value === e1).assertTrue();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testReadonlySetKeys133
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_1330
     * @tc.desc Verify single-element Date keys traverses once
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: Date = new Date(1);
      const set: ReadonlySet<Date> = new Set<Date>([d1]);
      const iter = set.keys();
      expect(iter.next().value === d1).assertTrue();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testReadonlySetKeys134
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_1340
     * @tc.desc Verify single-element RegExp keys traverses once
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: RegExp = new RegExp("a");
      const set: ReadonlySet<RegExp> = new Set<RegExp>([r1]);
      const iter = set.keys();
      expect(iter.next().value === r1).assertTrue();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testReadonlySetKeys135
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_1350
     * @tc.desc Verify single-element Promise keys traverses once
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p1: Object = new Object();
      const set: ReadonlySet<Object> = new Set<Object>([p1]);
      const iter = set.keys();
      expect(iter.next().value === p1).assertTrue();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testReadonlySetKeys136
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_1360
     * @tc.desc Verify single-element WeakMap keys traverses once
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const wm1: WeakMap<Object, int> = new WeakMap<Object, int>();
      const set: ReadonlySet<WeakMap<Object, int>> = new Set<WeakMap<Object, int>>([wm1]);
      const iter = set.keys();
      expect(iter.next().value === wm1).assertTrue();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testReadonlySetKeys137
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_1370
     * @tc.desc Verify single-element WeakSet keys traverses once
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ws1: WeakSet<Object> = new WeakSet<Object>();
      const set: ReadonlySet<WeakSet<Object>> = new Set<WeakSet<Object>>([ws1]);
      const iter = set.keys();
      expect(iter.next().value === ws1).assertTrue();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.name testReadonlySetKeys138
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_1380
     * @tc.desc Verify duplicate Error refs deduplicate in keys
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e1: Error = new Error("a");
      const set: ReadonlySet<Error> = new Set<Error>([e1, e1]);
      let count: int = 0;
      for (const _ of set.keys()) { count++; }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetKeys139
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_1390
     * @tc.desc Verify duplicate Date refs deduplicate in keys
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: Date = new Date(1);
      const set: ReadonlySet<Date> = new Set<Date>([d1, d1]);
      let count: int = 0;
      for (const _ of set.keys()) { count++; }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetKeys140
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_1400
     * @tc.desc Verify duplicate RegExp refs deduplicate in keys
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: RegExp = new RegExp("a");
      const set: ReadonlySet<RegExp> = new Set<RegExp>([r1, r1]);
      let count: int = 0;
      for (const _ of set.keys()) { count++; }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetKeys141
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_1410
     * @tc.desc Verify duplicate Promise refs deduplicate in keys
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p1: Object = new Object();
      const set: ReadonlySet<Object> = new Set<Object>([p1, p1]);
      let count: int = 0;
      for (const _ of set.keys()) { count++; }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetKeys142
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_1420
     * @tc.desc Verify duplicate WeakMap refs deduplicate in keys
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const wm1: WeakMap<Object, int> = new WeakMap<Object, int>();
      const set: ReadonlySet<WeakMap<Object, int>> = new Set<WeakMap<Object, int>>([wm1, wm1]);
      let count: int = 0;
      for (const _ of set.keys()) { count++; }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetKeys143
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_1430
     * @tc.desc Verify duplicate WeakSet refs deduplicate in keys
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ws1: WeakSet<Object> = new WeakSet<Object>();
      const set: ReadonlySet<WeakSet<Object>> = new Set<WeakSet<Object>>([ws1, ws1]);
      let count: int = 0;
      for (const _ of set.keys()) { count++; }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetKeys144
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_1440
     * @tc.desc Verify underlying Set add reflected in Error keys
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<Error> = new Set<Error>([new Error("a")]);
      const view: ReadonlySet<Error> = ms;
      ms.add(new Error("b"));
      let count: int = 0;
      for (const _ of view.keys()) { count++; }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetKeys145
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_1450
     * @tc.desc Verify underlying Set add reflected in Date keys
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<Date> = new Set<Date>([new Date(1)]);
      const view: ReadonlySet<Date> = ms;
      ms.add(new Date(2));
      let count: int = 0;
      for (const _ of view.keys()) { count++; }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetKeys146
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_1460
     * @tc.desc Verify underlying Set add reflected in RegExp keys
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ms: Set<RegExp> = new Set<RegExp>([new RegExp("a")]);
      const view: ReadonlySet<RegExp> = ms;
      ms.add(new RegExp("b"));
      let count: int = 0;
      for (const _ of view.keys()) { count++; }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetKeys147
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_1470
     * @tc.desc Verify underlying Set add reflected in Promise keys
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p1: Object = new Object();
      const p2: Object = new Object();
      let ms: Set<Object> = new Set<Object>([p1]);
      const view: ReadonlySet<Object> = ms;
      ms.add(p2);
      let count: int = 0;
      for (const _ of view.keys()) { count++; }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetKeys148
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_1480
     * @tc.desc Verify underlying Set add reflected in WeakMap keys
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const wm1: WeakMap<Object, int> = new WeakMap<Object, int>();
      const wm2: WeakMap<Object, int> = new WeakMap<Object, int>();
      let ms: Set<WeakMap<Object, int>> = new Set<WeakMap<Object, int>>([wm1]);
      const view: ReadonlySet<WeakMap<Object, int>> = ms;
      ms.add(wm2);
      let count: int = 0;
      for (const _ of view.keys()) { count++; }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetKeys149
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSETKEYS_1490
     * @tc.desc Verify underlying Set add reflected in WeakSet keys
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetKeys149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ws1: WeakSet<Object> = new WeakSet<Object>();
      const ws2: WeakSet<Object> = new WeakSet<Object>();
      let ms: Set<WeakSet<Object>> = new Set<WeakSet<Object>>([ws1]);
      const view: ReadonlySet<WeakSet<Object>> = ms;
      ms.add(ws2);
      let count: int = 0;
      for (const _ of view.keys()) { count++; }
      expect(count).assertEqual(2);
    });

  });
}
