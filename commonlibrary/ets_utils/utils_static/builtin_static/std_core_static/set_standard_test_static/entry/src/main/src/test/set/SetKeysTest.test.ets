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
} from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from './../Util.test';

class Item013 {
  id: int = 0;

  constructor(id: int) {
    this.id = id;
  }
}

export default function SetKeysTest(): void {
  describe('SetKeysTest', (): void => {
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
     * @tc.name testSetKeys001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_0100
     * @tc.desc Verify keys() with no parameters returns iterator normally
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetKeys001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>();
      set.add("a");
      set.add("b");
      let iter = set.keys();
      expect(iter.next().value).assertEqual("a");
    });

    /**
     * @tc.name testSetKeys002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_0200
     * @tc.desc Verify keys() returns iterator with correct element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetKeys002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>();
      set.add("a");
      let iter = set.keys();
      expect(iter.next().value).assertEqual("a");
    });

    /**
     * @tc.name testSetKeys003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_0300
     * @tc.desc Verify keys() returns iterator, for-of traversal gets all keys
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetKeys003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>();
      set.add("a");
      set.add("b");
      let keys: string[] = [];
      for (const k of set.keys()) {
        keys.push(k);
      }
      expect(keys.length).assertEqual(2);
      expect(keys[0]).assertEqual("a");
      expect(keys[1]).assertEqual("b");
    });

    /**
     * @tc.name testSetKeys004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_0400
     * @tc.desc Verify using iterator next() to get keys one by one
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetKeys004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>();
      set.add(1);
      set.add(2);
      set.add(3);
      let iter = set.keys();
      let r1 = iter.next();
      expect(r1.value).assertEqual(1);
      expect(r1.done).assertFalse();
      let r2 = iter.next();
      expect(r2.value).assertEqual(2);
      let r3 = iter.next();
      expect(r3.value).assertEqual(3);
      let r4 = iter.next();
      expect(r4.done).assertTrue();
    });

    /**
     * @tc.name testSetKeys005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_0500
     * @tc.desc Verify iterator returns keys in insertion order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetKeys005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>();
      set.add("x");
      set.add("y");
      set.add("z");
      let keys: string[] = [];
      for (const k of set.keys()) {
        keys.push(k);
      }
      expect(keys[0]).assertEqual("x");
      expect(keys[1]).assertEqual("y");
      expect(keys[2]).assertEqual("z");
    });

    /**
     * @tc.name testSetKeys006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_0600
     * @tc.desc Verify empty Set keys() returns empty iterator, first next() is done
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetKeys006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>();
      let iter = set.keys();
      let result = iter.next();
      expect(result.done).assertTrue();
      expect(result.value).assertUndefined();
    });

    /**
     * @tc.name testSetKeys007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_0700
     * @tc.desc Verify empty Set keys() for-of iteration does not execute loop body
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetKeys007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>();
      let count = 0;
      for (const k of set.keys()) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.name testSetKeys008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_0800
     * @tc.desc Verify single-element Set keys iterator has only one element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetKeys008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>();
      set.add("only");
      let keys: string[] = [];
      for (const k of set.keys()) {
        keys.push(k);
      }
      expect(keys.length).assertEqual(1);
      expect(keys[0]).assertEqual("only");
    });

    /**
     * @tc.name testSetKeys009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_0900
     * @tc.desc Verify keys() return value has IterableIterator interface
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetKeys009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>();
      set.add("a");
      let iter = set.keys();
      let typeNext: string = typeof iter.next;
      expect(typeNext).assertEqual("function");
      expect(iter.next().value).assertEqual("a");
    });

    /**
     * @tc.name testSetKeys010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_1000
     * @tc.desc Verify Set<long> keys() returns iterator with long type values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetKeys010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<long>();
      set.add(42);
      let iter = set.keys();
      let result = iter.next();
      expect(result.value).assertEqual(42);
      let type: string = typeof result.value;
      expect(type).assertEqual("long");
    });

    /**
     * @tc.name testSetKeys011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_1100
     * @tc.desc Verify Set<string> keys() returns iterator with string type values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetKeys011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>();
      set.add("hello");
      let iter = set.keys();
      let result = iter.next();
      expect(result.value).assertEqual("hello");
      let type: string = typeof result.value;
      expect(type).assertEqual("string");
    });

    /**
     * @tc.name testSetKeys012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_1200
     * @tc.desc Verify Set<boolean> keys() returns iterator with boolean type values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetKeys012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<boolean>();
      set.add(true);
      set.add(false);
      let keys: boolean[] = [];
      for (const k of set.keys()) {
        keys.push(k);
      }
      expect(keys.length).assertEqual(2);
      expect(keys[0]).assertTrue();
      expect(keys[1]).assertFalse();
    });

    /**
     * @tc.name testSetKeys013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_1300
     * @tc.desc Verify Set<Object> keys() returns object references
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetKeys013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<Object>();
      let obj = new Item013(1);
      set.add(obj);
      let iter = set.keys();
      let result = iter.next();
      expect(result.value === obj).assertTrue();
    });

    /**
     * @tc.name testSetKeys014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_1400
     * @tc.desc Verify large Set keys() traverses all elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetKeys014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>();
      for (let i = 0; i < 1000; i++) {
        set.add(i);
      }
      let keys: int[] = [];
      for (const k of set.keys()) {
        keys.push(k);
      }
      expect(keys.length).assertEqual(1000);
      expect(keys[0]).assertEqual(0);
      expect(keys[999]).assertEqual(999);
    });

    /**
     * @tc.name testSetKeys015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_1500
     * @tc.desc Verify Set<string> keys with empty string, Unicode and special strings
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetKeys015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>();
      set.add("");
      set.add("你好");
      set.add("\t\n");
      let keys: string[] = [];
      for (const k of set.keys()) {
        keys.push(k);
      }
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual("");
      expect(keys[1]).assertEqual("你好");
      expect(keys[2]).assertEqual("\t\n");
    });

    /**
     * @tc.name testSetKeys016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_1600
     * @tc.desc Verify Set<number> keys with 0, negative, NaN special values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetKeys016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>();
      set.add(0);
      set.add(-1);
      set.add(Number.NaN);
      let keys: number[] = [];
      for (const k of set.keys()) {
        keys.push(k);
      }
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual(0);
      expect(keys[1]).assertEqual(-1);
      expect(Number.isNaN(keys[2])).assertTrue();
    });

    /**
     * @tc.name testSetKeys017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_1700
     * @tc.desc Verify Set<int> keys with int max and min boundary values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetKeys017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>();
      set.add(2147483647);
      set.add(-2147483648);
      let keys: int[] = [];
      for (const k of set.keys()) {
        keys.push(k);
      }
      expect(keys.length).assertEqual(2);
      expect(keys[0]).assertEqual(2147483647);
      expect(keys[1]).assertEqual(-2147483648);
    });

    /**
     * @tc.name testSetKeys018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_1800
     * @tc.desc Verify each call to keys() returns a new iterator instance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetKeys018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>();
      set.add("a");
      set.add("b");
      let iter1 = set.keys();
      let iter2 = set.keys();
      expect(iter1 !== iter2).assertTrue();
    });

    /**
     * @tc.name testSetKeys019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_1900
     * @tc.desc Verify new iterator restarts from the beginning
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetKeys019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>();
      set.add("x");
      set.add("y");
      let iter1 = set.keys();
      iter1.next();
      iter1.next();
      let iter2 = set.keys();
      let result = iter2.next();
      expect(result.value).assertEqual("x");
      expect(result.done).assertFalse();
    });

    /**
     * @tc.name testSetKeys020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_2000
     * @tc.desc Verify $_iterator() on keys() iterator returns different object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetKeys020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>();
      set.add("a");
      let iter = set.keys();
      let inner = iter.$_iterator();
      expect(inner !== iter).assertTrue();
      expect(inner.next().value).assertEqual("a");
    });

    /**
     * @tc.name testSetKeys021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_2100
     * @tc.desc Verify keys() and values() return identical content for Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetKeys021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>();
      set.add("a");
      set.add("b");
      let keysArr: string[] = [];
      let valsArr: string[] = [];
      for (const k of set.keys()) {
        keysArr.push(k);
      }
      for (const v of set.values()) {
        valsArr.push(v);
      }
      expect(keysArr.length).assertEqual(valsArr.length);
      for (let i = 0; i < keysArr.length; i++) {
        expect(keysArr[i]).assertEqual(valsArr[i]);
      }
    });

    /**
     * @tc.name testSetKeys022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_2200
     * @tc.desc Verify keys() and values() return different iterator instances
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetKeys022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>();
      set.add("a");
      let keysIter = set.keys();
      let valsIter = set.values();
      expect(keysIter !== valsIter).assertTrue();
    });

    /**
     * @tc.name testSetKeys023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_2300
     * @tc.desc Verify calling next() after iteration complete returns done=true without exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetKeys023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>();
      set.add("a");
      let iter = set.keys();
      iter.next();
      let r = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.name testSetKeys024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_2400
     * @tc.desc Verify calling add during for-of iteration over keys()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetKeys024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>();
      set.add("a");
      set.add("b");
      for (const k of set.keys()) {
        if (k === "a") {
          set.add("c");
        }
      }
      expect(set.size).assertEqual(3);
      expect(set.has("c")).assertTrue();
    });

    /**
     * @tc.name testSetKeys025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_2500
     * @tc.desc Verify calling delete during for-of iteration over keys()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetKeys025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>();
      set.add("a");
      set.add("b");
      for (const k of set.keys()) {
        if (k === "a") {
          set.delete("b");
        }
      }
      expect(set.size).assertEqual(1);
      expect(set.has("b")).assertFalse();
      expect(set.has("a")).assertTrue();
    });

    /**
     * @tc.name testSetKeys026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_2600
     * @tc.desc Verify calling clear during for-of iteration over keys()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetKeys026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>();
      set.add("a");
      set.add("b");
      for (const k of set.keys()) {
        if (k === "a") {
          set.clear();
        }
      }
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testSetKeys027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_2700
     * @tc.desc Verify Error thrown inside for-of loop body can be caught externally
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetKeys027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>();
      set.add("a");
      set.add("b");
      try {
        for (const k of set.keys()) {
          if (k === "a") {
            throw new Error("iter error");
          }
        }
        expect().assertFail();
      } catch (error) {
        expect(error.message).assertEqual("iter error");
      }
    });

    /**
     * @tc.name testSetKeys028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_2800
     * @tc.desc Verify inner try-catch in loop body catches exception and continues traversal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetKeys028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>();
      set.add("a");
      set.add("b");
      set.add("c");
      let keys: string[] = [];
      for (const k of set.keys()) {
        try {
          if (k === "b") {
            throw new Error("skip b");
          }
          keys.push(k);
        } catch (error) {
          expect(error.message).assertEqual("skip b");
          keys.push("recovered");
        }
      }
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual("a");
      expect(keys[1]).assertEqual("recovered");
      expect(keys[2]).assertEqual("c");
    });

    /**
     * @tc.name testSetKeys029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_2900
     * @tc.desc Verify Set<string | number> keys() iterates union type elements of both types
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetKeys029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string | number>();
      set.add("a");
      set.add(1);
      set.add("b");
      let numCount: int = 0;
      let strCount: int = 0;
      for (const k of set.keys()) {
        let t: string = typeof k;
        if (t === "number") {
          numCount++;
        }
        if (t === "string") {
          strCount++;
        }
      }
      expect(numCount).assertEqual(1);
      expect(strCount).assertEqual(2);
    });

    /**
     * @tc.name testSetKeys030
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_3000
     * @tc.desc Verify keys() returns iterator of Item013 type for Set of Item013
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetKeys030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new Item013(1);
      let set = new Set<Item013>([obj]);
      let iter = set.keys();
      let result = iter.next();
      expect(result.value === obj).assertTrue();
      let item = result.value as Item013;
      expect(item.id).assertEqual(1);
    });
  });
}
