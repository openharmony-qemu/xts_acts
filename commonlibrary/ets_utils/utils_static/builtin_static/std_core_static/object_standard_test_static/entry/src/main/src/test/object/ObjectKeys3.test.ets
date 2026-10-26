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
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from "../../../../hypium/index";
import Utils from "../Util.test";

class Keys3Point005 {
  x: number = 1;
  y: number = 2;
}
class Box002 {
  name: string = "box";
  size: number = 3;
}

class KeyBaseA001 {
  fieldA: string = 'a';
}
class KeyMidB001 extends KeyBaseA001 {
  fieldB: string = 'b';
}
class KeyLeafC001 extends KeyMidB001 {
  fieldC: string = 'c';
}

class Keys3A {
  a: number = 1;
}
class Keys3B extends Keys3A {
  b: number = 2;
}
class Keys3C extends Keys3B {
  c: number = 3;
}
class KeysStaticMethod {
  static stat: number = 9;
  inst: number = 1;
  m(): void {}
}
class KeysBaseM {
  f: number = 1;
  m(): void {}
}
class KeysDerM extends KeysBaseM {
  g: number = 2;
}
class InnerInst {
  x: number = 1;
}
class KeysBF {
  base: number = 1;
}
class KeysDF extends KeysBF {
  d: number = 2;
}
class WrapInner {
  inner: number = 7;
}

export default function ObjectKeys3Test(): void {
  describe("ObjectKeys3Test", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part03_0100
     * @tc.name objectKeysPart03Case001
     * @tc.desc Verify Object.keys, entries and values of an empty Record all have length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart03Case001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = {};
      const keys: string[] = Object.keys(record);
      const entries = Object.entries(record);
      const values = Object.values(record);
      let rResult1: int = keys.length;
      let eExpected1: int = 0;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: int = entries.length;
      let eExpected2: int = 0;
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: int = values.length;
      let eExpected3: int = 0;
      expect(rResult3).assertEqual(eExpected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part03_0200
     * @tc.name objectKeysPart03Case002
     * @tc.desc Verify a Record keyed by zero-width space and non-joiner gives two keys in that order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart03Case002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "\u200B": 'a', "\u200C": 'b' };
      const names: string[] = Object.keys(record);
      let rResult1: int = names.length;
      let eExpected1: int = 2;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = names[0];
      let eExpected2: string = "\u200B";
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: string = names[1];
      let eExpected3: string = "\u200C";
      expect(rResult3).assertEqual(eExpected3);
      let rResult4: int = names.indexOf("\u200D");
      let eExpected4: int = -1;
      expect(rResult4).assertEqual(eExpected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part03_0300
     * @tc.name objectKeysPart03Case003
     * @tc.desc Verify a Record with a zero-width space key set to null still reports that one key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart03Case003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = {};
      record["\u200B"] = null;
      const names: string[] = Object.keys(record);
      let rResult1: int = names.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = names[0];
      let eExpected2: string = "\u200B";
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part03_0400
     * @tc.name objectKeysPart03Case004
     * @tc.desc Verify keys preserves insertion order for CJK, emoji and 1000-char keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart03Case004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const longKey: string = 'k'.repeat(1000);
      const record: Record<string, Any> = {};
      record["中文"] = 1;
      record['😀'] = 2;
      record["\u200B"] = 3;
      record['0'] = 4;
      record[longKey] = 5;
      const names: string[] = Object.keys(record);
      let rResult1: int = names.length;
      let eExpected1: int = 5;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = names[0];
      let eExpected2: string = "中文";
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: string = names[1];
      let eExpected3: string = '😀';
      expect(rResult3).assertEqual(eExpected3);
      let rResult4: string = names[2];
      let eExpected4: string = "\u200B";
      expect(rResult4).assertEqual(eExpected4);
      let rResult5: string = names[3];
      let eExpected5: string = '0';
      expect(rResult5).assertEqual(eExpected5);
      let rResult6: string = names[4];
      let eExpected6: string = longKey;
      expect(rResult6).assertEqual(eExpected6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part03_0500
     * @tc.name objectKeysPart03Case005
     * @tc.desc Verify reassigning CJK and 0 keys on a two-key Record keeps length 2 and key order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart03Case005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "中文": 1, '0': 2 };
      record["中文"] = 100;
      record['0'] = 200;
      const names: string[] = Object.keys(record);
      let rResult1: int = names.length;
      let eExpected1: int = 2;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = names[0];
      let eExpected2: string = "中文";
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: string = names[1];
      let eExpected3: string = '0';
      expect(rResult3).assertEqual(eExpected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part03_0600
     * @tc.name objectKeysPart03Case006
     * @tc.desc Verify keys preserves insertion order with numeric string key first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart03Case006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { '0': 999, "中文": 1, '😀': [1, 2] };
      const names: string[] = Object.keys(record);
      let rResult1: string = names[0];
      let eExpected1: string = '0';
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = names[1];
      let eExpected2: string = "中文";
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: string = names[2];
      let eExpected3: string = '😀';
      expect(rResult3).assertEqual(eExpected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part03_0700
     * @tc.name objectKeysPart03Case007
     * @tc.desc Verify keys preserves insertion order for interleaved CJK and numeric keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart03Case007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "姓名": 1, '5': 2, "年龄": 3, '1': 4 };
      const names: string[] = Object.keys(record);
      let rResult1: string = names[0];
      let eExpected1: string = "姓名";
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = names[1];
      let eExpected2: string = '5';
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: string = names[2];
      let eExpected3: string = "年龄";
      expect(rResult3).assertEqual(eExpected3);
      let rResult4: string = names[3];
      let eExpected4: string = '1';
      expect(rResult4).assertEqual(eExpected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part03_0800
     * @tc.name objectKeysPart03Case008
     * @tc.desc Verify keys preserves insertion order for zero-width and emoji keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart03Case008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = {};
      record["\u200B"] = 1;
      record["中文"] = 2;
      record['x'] = 3;
      record['🎉'] = 4;
      record['0'] = 5;
      const names: string[] = Object.keys(record);
      let rResult1: int = names.length;
      let eExpected1: int = 5;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = names[0];
      let eExpected2: string = "\u200B";
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: string = names[1];
      let eExpected3: string = "中文";
      expect(rResult3).assertEqual(eExpected3);
      let rResult4: string = names[2];
      let eExpected4: string = 'x';
      expect(rResult4).assertEqual(eExpected4);
      let rResult5: string = names[3];
      let eExpected5: string = '🎉';
      expect(rResult5).assertEqual(eExpected5);
      let rResult6: string = names[4];
      let eExpected6: string = '0';
      expect(rResult6).assertEqual(eExpected6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part03_0900
     * @tc.name objectKeysPart03Case009
     * @tc.desc Verify $_hashCode of a class instance is non-negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart03Case009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p: Keys3Point005 = new Keys3Point005();
      const keys: string[] = Object.keys(p);
      const hash: int = p.$_hashCode();
      let rResult1: int = keys.length;
      let eExpected1: int = 2;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = keys[0];
      let eExpected2: string = 'x';
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: string = keys[1];
      let eExpected3: string = 'y';
      expect(rResult3).assertEqual(eExpected3);
      expect(hash).assertLargerOrEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part03_1000
     * @tc.name objectKeysPart03Case010
     * @tc.desc Verify a box instance hash code stays stable and keys are name then size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart03Case010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box: Box002 = new Box002();
      const h1: int = box.$_hashCode();
      const keys: string[] = Object.keys(box);
      const h2: int = box.$_hashCode();
      expect(h1).assertEqual(h2);
      let rResult1: string = keys[0];
      let eExpected1: string = "name";
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = keys[1];
      let eExpected2: string = "size";
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part03_1100
     * @tc.name objectKeysPart03Case011
     * @tc.desc Verify $_hashCode of a plain Object is non-negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart03Case011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const keys: string[] = Object.keys(obj);
      const names: string[] = Object.getOwnPropertyNames(obj);
      const hash: int = obj.$_hashCode();
      let rResult1: int = keys.length;
      let eExpected1: int = 0;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: int = names.length;
      let eExpected2: int = 0;
      expect(rResult2).assertEqual(eExpected2);
      expect(hash).assertLargerOrEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part03_1200
     * @tc.name objectKeysPart03Case012
     * @tc.desc Verify keys stable across repeated calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart03Case012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "中文": 1, '😀': 2, '0': 3 };
      const first: string[] = Object.keys(record);
      const second: string[] = Object.keys(record);
      const third: string[] = Object.keys(record);
      let rResult1: int = first.length;
      let eExpected1: int = 3;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = second[0];
      let eExpected2: string = first[0];
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: string = third[0];
      let eExpected3: string = first[0];
      expect(rResult3).assertEqual(eExpected3);
      let rResult4: string = second[1];
      let eExpected4: string = first[1];
      expect(rResult4).assertEqual(eExpected4);
      let rResult5: string = third[2];
      let eExpected5: string = first[2];
      expect(rResult5).assertEqual(eExpected5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part03_1300
     * @tc.name objectKeysPart03Case013
     * @tc.desc Verify Object.keys and getOwnPropertyNames both return length 2 for Record a plus CJK key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart03Case013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, "中文": 2 };
      const keys: string[] = Object.keys(record);
      const names: string[] = Object.getOwnPropertyNames(record);
      let rResult1: int = keys.length;
      let eExpected1: int = 2;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: int = names.length;
      let eExpected2: int = 2;
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part03_1400
     * @tc.name objectKeysPart03Case014
     * @tc.desc Verify Object.keys returns full-width symbol keys correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart03Case014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = {
        "name": "value1",
        "\uFF20": "atSign",
        "\uFF06": "ampersand",
      };
      const keys: string[] = Object.keys(record);
      expect(keys.length).assertEqual(3);
      expect(keys.includes("\uFF20")).assertTrue();
      expect(keys.includes("\uFF06")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part03_1500
     * @tc.name objectKeysPart03Case015
     * @tc.desc Verify Object.keys returns full-width space key as-is
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart03Case015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = {
        "key1": 1,
        "\u3000": 2,
      };
      const keys: string[] = Object.keys(record);
      expect(keys.length).assertEqual(2);
      expect(keys.includes("\u3000")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part03_1600
     * @tc.name objectKeysPart03Case016
     * @tc.desc Verify Object.keys on dense array returns in-bounds index keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart03Case016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [10, 20];
      const keys: string[] = Object.keys(arr);
      expect(keys.includes('0')).assertTrue();
      expect(keys.includes('1')).assertTrue();
      expect(keys.includes('2')).assertFalse();
      expect(keys.includes('4')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part03_1700
     * @tc.name objectKeysPart03Case017
     * @tc.desc Verify Object.keys on multi-level inheritance instance returns all fields from inheritance chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart03Case017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: KeyLeafC001 = new KeyLeafC001();
      const keys: string[] = Object.keys(obj);
      expect(keys.length).assertEqual(3);
      expect(keys.includes("fieldA")).assertTrue();
      expect(keys.includes("fieldB")).assertTrue();
      expect(keys.includes("fieldC")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part03_1800
     * @tc.name objectKeysPart03Case018
     * @tc.desc Verify key a for a Record, keys 0 and 1 for an int array and no keys for a new Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart03Case018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1 };
      const rResult1: string[] = Object.keys(record);
      let len1: int = rResult1.length;
      let exp1: int = 1;
      expect(len1).assertEqual(exp1);
      let key1: string = rResult1[0];
      let expKey1: string = 'a';
      expect(key1).assertEqual(expKey1);

      const arr: int[] = [10, 20];
      const rResult2: string[] = Object.keys(arr);
      let len2: int = rResult2.length;
      let exp2: int = 2;
      expect(len2).assertEqual(exp2);
      let key2: string = rResult2[0];
      let expKey2: string = '0';
      expect(key2).assertEqual(expKey2);
      let key3: string = rResult2[1];
      let expKey3: string = '1';
      expect(key3).assertEqual(expKey3);

      const emptyObj: Object = new Object();
      const rResult3: string[] = Object.keys(emptyObj);
      let len3: int = rResult3.length;
      let exp3: int = 0;
      expect(len3).assertEqual(exp3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part03_1900
     * @tc.name objectKeysPart03Case019
     * @tc.desc Verify Object.keys on empty object literal returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart03Case019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const rResult1: string[] = Object.keys({});
      expect(rResult1.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part03_2000
     * @tc.name objectKeysPart03Case020
     * @tc.desc Verify Object.keys excludes inherited prototype member names
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart03Case020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "ownA": 1, "ownB": 2 };
      const keys: string[] = Object.keys(record);
      let rResult1: int = keys.length;
      let eExpected1: int = 2;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: int = keys.indexOf("toString");
      let eExpected2: int = -1;
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: int = keys.indexOf("valueOf");
      let eExpected3: int = -1;
      expect(rResult3).assertEqual(eExpected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part03_2100
     * @tc.name objectKeysPart03Case021
     * @tc.desc Verify Object.keys returns Map property key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart03Case021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('k', 1);
      const record: Record<string, Any> = { "map": m };
      const keys: string[] = Object.keys(record);
      let rResult1: int = keys.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = keys[0];
      let eExpected2: string = "map";
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part03_2200
     * @tc.name objectKeysPart03Case022
     * @tc.desc Verify Object.keys returns Set Promise and RegExp property keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart03Case022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const s: Set<number> = new Set<number>([1, 2]);
      const p: Promise<int> = new Promise<int>((resolve, reject) => {
        resolve(1);
      });
      const re: RegExp = new RegExp("abc", 'g');
      const record: Record<string, Any> = { "set": s, "promise": p, "regex": re };
      const keys: string[] = Object.keys(record);
      let rResult1: int = keys.length;
      let eExpected1: int = 3;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = keys[0];
      let eExpected2: string = "set";
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: string = keys[1];
      let eExpected3: string = "promise";
      expect(rResult3).assertEqual(eExpected3);
      let rResult4: string = keys[2];
      let eExpected4: string = "regex";
      expect(rResult4).assertEqual(eExpected4);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part03_2300
     * @tc.name objectKeysPart03Case023
     * @tc.desc Verify Object.keys returns Uint8Array ArrayBuffer and DataView property keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart03Case023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ta: Uint8Array = new Uint8Array([72, 101]);
      const buf: ArrayBuffer = new Uint8Array([72, 101]).buffer;
      const view: DataView = new DataView(new Uint8Array([72]).buffer);
      const record: Record<string, Any> = { "bytes": ta, "buffer": buf, "view": view };
      const keys: string[] = Object.keys(record);
      let rResult1: int = keys.length;
      let eExpected1: int = 3;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = keys[0];
      let eExpected2: string = "bytes";
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: string = keys[1];
      let eExpected3: string = "buffer";
      expect(rResult3).assertEqual(eExpected3);
      let rResult4: string = keys[2];
      let eExpected4: string = "view";
      expect(rResult4).assertEqual(eExpected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part03_2400
     * @tc.name objectKeysPart03Case024
     * @tc.desc Verify Object.keys on 10000 key object returns all keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart03Case024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const big: Record<string, Any> = {};
      for (let i: int = 0; i < 10000; i++) {
        big['k' + i] = i;
      }
      const keys: string[] = Object.keys(big);
      let rResult1: int = keys.length;
      let eExpected1: int = 10000;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = keys[0];
      let eExpected2: string = "k0";
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: string = keys[9999];
      let eExpected3: string = "k9999";
      expect(rResult3).assertEqual(eExpected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part03_2500
     * @tc.name objectKeysPart03Case025
     * @tc.desc Verify Object.keys unaffected by NaN and Infinity property values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart03Case025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "nan": Number.NaN, "inf": Number.POSITIVE_INFINITY, 'a': 1 };
      const keys: string[] = Object.keys(record);
      let rResult1: int = keys.length;
      let eExpected1: int = 3;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = keys[0];
      let eExpected2: string = "nan";
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: string = keys[1];
      let eExpected3: string = "inf";
      expect(rResult3).assertEqual(eExpected3);
      let rResult4: string = keys[2];
      let eExpected4: string = 'a';
      expect(rResult4).assertEqual(eExpected4);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part03_2600
     * @tc.name objectKeysPart03Case026
     * @tc.desc Verify keys of record with 5-level nested object value returns only top keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart03Case026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const level4: Record<string, int> = { 'e': 1 };
      const level3: Record<string, Any> = { 'd': level4 };
      const level2: Record<string, Any> = { 'c': level3 };
      const level1: Record<string, Any> = { 'b': level2 };
      const deep: Record<string, Any> = { 'a': level1 };
      const keys: string[] = Object.keys(deep);
      let rResult1: int = keys.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = keys[0];
      let eExpected2: string = 'a';
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part03_2700
     * @tc.name objectKeysPart03Case027
     * @tc.desc Verify keys of record with 10-level nested object value returns only top key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart03Case027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const level9: Record<string, int> = { 'j': 1 };
      const level8: Record<string, Any> = { 'i': level9 };
      const level7: Record<string, Any> = { 'h': level8 };
      const level6: Record<string, Any> = { 'g': level7 };
      const level5: Record<string, Any> = { 'f': level6 };
      const level4: Record<string, Any> = { 'e': level5 };
      const level3: Record<string, Any> = { 'd': level4 };
      const level2: Record<string, Any> = { 'c': level3 };
      const level1: Record<string, Any> = { 'b': level2 };
      const deep: Record<string, Any> = { 'a': level1 };
      const keys: string[] = Object.keys(deep);
      let rResult1: int = keys.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part03_2800
     * @tc.name objectKeysPart03Case028
     * @tc.desc Verify keys preserves surrogate-pair emoji key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart03Case028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { '😀': 1 };
      const keys: string[] = Object.keys(record);
      let rResult1: int = keys.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = keys[0];
      let eExpected2: string = '😀';
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part03_2900
     * @tc.name objectKeysPart03Case029
     * @tc.desc Verify keys preserves combining-character key built at runtime
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart03Case029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const key: string = 'e' + String.fromCharCode(0x301);
      const record: Record<string, Any> = {};
      record[key] = 1;
      const keys: string[] = Object.keys(record);
      let rResult1: int = keys.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = keys[0];
      let eExpected2: string = key;
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part03_3000
     * @tc.name objectKeysPart03Case030
     * @tc.desc Verify keys preserves RTL Arabic key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart03Case030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "\u0645\u0631\u062D\u0628\u0627": 1 };
      const keys: string[] = Object.keys(record);
      let rResult1: int = keys.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = keys[0];
      let eExpected2: string = "\u0645\u0631\u062D\u0628\u0627";
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part03_3100
     * @tc.name objectKeysPart03Case031
     * @tc.desc Verify keys preserves zero-width space key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart03Case031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "\u200B": 1 };
      const keys: string[] = Object.keys(record);
      let rResult1: int = keys.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = keys[0];
      let eExpected2: string = "\u200B";
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part03_3200
     * @tc.name objectKeysPart03Case032
     * @tc.desc Verify keys preserves several Unicode whitespace keys as distinct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart03Case032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "\u00A0": 1, "\u2003": 2, "\u3000": 3, "\u2028": 4 };
      const keys: string[] = Object.keys(record);
      let rResult1: int = keys.length;
      let eExpected1: int = 4;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = keys[0];
      let eExpected2: string = "\u00A0";
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part03_3300
     * @tc.name objectKeysPart03Case033
     * @tc.desc Verify keys preserves insertion order for leading-zero numeric strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart03Case033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "02": 1, "01": 2, "10": 3, '1': 4 };
      const keys: string[] = Object.keys(record);
      let rResult1: int = keys.length;
      let eExpected1: int = 4;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = keys[0];
      let eExpected2: string = "02";
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part03_3400
     * @tc.name objectKeysPart03Case034
     * @tc.desc Verify keys preserves insertion order for negative numeric-like keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart03Case034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "-1": 1, '0': 2, '1': 3 };
      const keys: string[] = Object.keys(record);
      let rResult1: string = keys[0];
      let eExpected1: string = "-1";
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = keys[2];
      let eExpected2: string = '1';
      expect(rResult2).assertEqual(eExpected2);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part03_3500
     * @tc.name objectKeysPart03Case035
     * @tc.desc Verify keys handles large integer-like key beyond 32-bit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart03Case035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "4294967295": 1, '0': 2 };
      const keys: string[] = Object.keys(record);
      let rResult1: int = keys.length;
      let eExpected1: int = 2;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = keys[0];
      let eExpected2: string = "4294967295";
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part03_3600
     * @tc.name objectKeysPart03Case036
     * @tc.desc Verify 0 to 99 integer keys inserted in reverse give 99 first and 0 last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart03Case036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = {};
      for (let i: int = 99; i >= 0; i--) {
        record['' + i] = i;
      }
      const keys: string[] = Object.keys(record);
      let rResult1: int = keys.length;
      let eExpected1: int = 100;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = keys[0];
      let eExpected2: string = "99";
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: string = keys[99];
      let eExpected3: string = '0';
      expect(rResult3).assertEqual(eExpected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part03_3700
     * @tc.name objectKeysPart03Case037
     * @tc.desc Verify keys includes instance fields from 3-level inheritance chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart03Case037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Keys3C = new Keys3C();
      const keys: string[] = Object.keys(obj);
      let rResult1: int = keys.length;
      let eExpected1: int = 3;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = keys[0];
      let eExpected2: string = 'a';
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part03_3800
     * @tc.name objectKeysPart03Case038
     * @tc.desc Verify keys includes own key shadowing inherited toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart03Case038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = {};
      record["toString"] = "own";
      record['x'] = 1;
      const keys: string[] = Object.keys(record);
      let rResult1: int = keys.length;
      let eExpected1: int = 2;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = keys[0];
      let eExpected2: string = "toString";
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part03_3900
     * @tc.name objectKeysPart03Case039
     * @tc.desc Verify keys includes own hasOwnProperty key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart03Case039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "hasOwnProperty": 1, 'v': 1 };
      const keys: string[] = Object.keys(record);
      let rResult1: int = keys.length;
      let eExpected1: int = 2;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = keys[0];
      let eExpected2: string = "hasOwnProperty";
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part03_4000
     * @tc.name objectKeysPart03Case040
     * @tc.desc Verify keys excludes static and method members of class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart03Case040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: KeysStaticMethod = new KeysStaticMethod();
      const keys: string[] = Object.keys(obj);
      let rResult1: int = keys.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = keys[0];
      let eExpected2: string = "inst";
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part03_4100
     * @tc.name objectKeysPart03Case041
     * @tc.desc Verify keys ignores Date value type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart03Case041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'd': new Date() };
      const keys: string[] = Object.keys(record);
      let rResult1: int = keys.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part03_4200
     * @tc.name objectKeysPart03Case042
     * @tc.desc Verify keys ignores boolean literal value type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart03Case042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'b': true, 'x': 1 };
      const keys: string[] = Object.keys(record);
      let rResult1: int = keys.length;
      let eExpected1: int = 2;
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part03_4300
     * @tc.name objectKeysPart03Case043
     * @tc.desc Verify keys with 1000-char key value round-trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart03Case043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr: string = '';
      for (let i: int = 0; i < 1000; i++) {
        longStr = longStr + 'a';
      }
      const record: Record<string, Any> = {};
      record[longStr] = 1;
      const keys: string[] = Object.keys(record);
      let rResult1: int = keys.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = keys[0];
      let eExpected2: string = longStr;
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part03_4400
     * @tc.name objectKeysPart03Case044
     * @tc.desc Verify a Record with an empty key and key x returns the empty key first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart03Case044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { '': 1, 'x': 2 };
      const keys: string[] = Object.keys(record);
      let rResult1: int = keys.length;
      let eExpected1: int = 2;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = keys[0];
      let eExpected2: string = '';
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part03_4500
     * @tc.name objectKeysPart03Case045
     * @tc.desc Verify keys containing a backslash and a single quote are returned in insertion order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart03Case045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "a\\b": 1, "c\'d": 2 };
      const keys: string[] = Object.keys(record);
      let rResult1: int = keys.length;
      let eExpected1: int = 2;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = keys[0];
      let eExpected2: string = "a\\b";
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: string = keys[1];
      let eExpected3: string = "c\'d";
      expect(rResult3).assertEqual(eExpected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part03_4600
     * @tc.name objectKeysPart03Case046
     * @tc.desc Verify keys returns fresh array each call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart03Case046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2 };
      const k1: string[] = Object.keys(record);
      const k2: string[] = Object.keys(record);
      expect(k1).not().assertEqual(k2);
      let rResult1: int = k1.length;
      let eExpected1: int = 2;
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part03_4700
     * @tc.name objectKeysPart03Case047
     * @tc.desc Verify mutating returned keys array does not affect source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart03Case047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2 };
      const keys: string[] = Object.keys(record);
      keys[0] = "zzz";
      const again: string[] = Object.keys(record);
      let rResult1: string = again[0];
      let eExpected1: string = 'a';
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part03_4800
     * @tc.name objectKeysPart03Case048
     * @tc.desc Verify mutating source after keys does not change earlier result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart03Case048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1 };
      const keys: string[] = Object.keys(record);
      record['b'] = 2;
      let rResult1: int = keys.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part03_4900
     * @tc.name objectKeysPart03Case049
     * @tc.desc Verify keys length equals getOwnPropertyNames length on own enumerable object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart03Case049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2, 'c': 3 };
      const keys: string[] = Object.keys(record);
      const names: string[] = Object.getOwnPropertyNames(record);
      let rResult1: int = keys.length;
      let eExpected1: int = names.length;
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part03_5000
     * @tc.name objectKeysPart03Case050
     * @tc.desc Verify keys corresponds to entries first element for each entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart03Case050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'x': 10, 'y': 20 };
      const keys: string[] = Object.keys(record);
      const entries = Object.entries(record);
      let rResult1: string = keys[0];
      let eExpected1: string = entries[0]![0];
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = keys[1];
      let eExpected2: string = entries[1]![0];
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part03_5100
     * @tc.name objectKeysPart03Case051
     * @tc.desc Verify keys length equals values length on same record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart03Case051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2, 'c': 3 };
      const keys: string[] = Object.keys(record);
      const vals: Any[] = Object.values(record);
      let rResult1: int = keys.length;
      let eExpected1: int = 3;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = keys[0];
      let eExpected2: string = 'a';
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: string = keys[1];
      let eExpected3: string = 'b';
      expect(rResult3).assertEqual(eExpected3);
      let rResult4: string = keys[2];
      let eExpected4: string = 'c';
      expect(rResult4).assertEqual(eExpected4);
      let rResult5: int = vals.length;
      let eExpected5: int = 3;
      expect(rResult5).assertEqual(eExpected5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part03_5200
     * @tc.name objectKeysPart03Case052
     * @tc.desc Verify a newline key and a tab key are both returned in insertion order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart03Case052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "a\nb": 1, "c\td": 2 };
      const keys: string[] = Object.keys(record);
      let rResult1: int = keys.length;
      let eExpected1: int = 2;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = keys[0];
      let eExpected2: string = "a\nb";
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: string = keys[1];
      let eExpected3: string = "c\td";
      expect(rResult3).assertEqual(eExpected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part03_5300
     * @tc.name objectKeysPart03Case053
     * @tc.desc Verify keys with all 26 lowercase letter keys in insertion order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart03Case053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = {};
      for (let i: int = 0; i < 26; i++) {
        record[String.fromCharCode(97 + i)] = i;
      }
      const keys: string[] = Object.keys(record);
      let rResult1: int = keys.length;
      let eExpected1: int = 26;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = keys[25];
      let eExpected2: string = 'z';
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part03_5400
     * @tc.name objectKeysPart03Case054
     * @tc.desc Verify keys with duplicate assignment collapses to one key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart03Case054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = {};
      record['k'] = 1;
      record['k'] = 2;
      const keys: string[] = Object.keys(record);
      let rResult1: int = keys.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part03_5500
     * @tc.name objectKeysPart03Case055
     * @tc.desc Verify a Record with Number.MAX_VALUE and MIN_VALUE values still has two keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart03Case055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "max": Number.MAX_VALUE, "min": Number.MIN_VALUE };
      const keys: string[] = Object.keys(record);
      let rResult1: int = keys.length;
      let eExpected1: int = 2;
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part03_5600
     * @tc.name objectKeysPart03Case056
     * @tc.desc Verify keys with nested array value does not flatten into keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart03Case056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "arr": [1, 2, 3] };
      const keys: string[] = Object.keys(record);
      let rResult1: int = keys.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = keys[0];
      let eExpected2: string = "arr";
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part03_5700
     * @tc.name objectKeysPart03Case057
     * @tc.desc Verify keys of single-key Record returns key 'a'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart03Case057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1 };
      const keys: string[] = Object.keys(record);
      let rResult2: string = keys[0];
      let eExpected2: string = 'a';
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part03_5800
     * @tc.name objectKeysPart03Case058
     * @tc.desc Verify a plain Record with key length assigned returns one key named length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart03Case058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = {};
      record["length"] = 42;
      const keys: string[] = Object.keys(record);
      let rResult1: int = keys.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = keys[0];
      let eExpected2: string = "length";
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part03_5900
     * @tc.name objectKeysPart03Case059
     * @tc.desc Verify a Record b, 0, a, 1 returns those four keys in insertion order with b first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart03Case059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'b': 1, '0': 2, 'a': 3, '1': 4 };
      const keys: string[] = Object.keys(record);
      let rResult1: string = keys[0];
      let eExpected1: string = 'b';
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = keys[3];
      let eExpected2: string = '1';
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part03_6000
     * @tc.name objectKeysPart03Case060
     * @tc.desc Verify keys with nested Record value where inner has integer keys returns only outer key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart03Case060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const outer: Record<string, int> = { '0': 1, '1': 2 };
      const record: Record<string, Any> = { "outer": outer };
      const keys: string[] = Object.keys(record);
      let rResult1: int = keys.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part03_6100
     * @tc.name objectKeysPart03Case061
     * @tc.desc Verify keys excludes inherited method in derived class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart03Case061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: KeysDerM = new KeysDerM();
      const keys: string[] = Object.keys(obj);
      let rResult1: int = keys.length;
      let eExpected1: int = 2;
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part03_6200
     * @tc.name objectKeysPart03Case062
     * @tc.desc Verify keys with class instance value does not expose inner fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart03Case062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "obj": new InnerInst() };
      const keys: string[] = Object.keys(record);
      let rResult1: int = keys.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = keys[0];
      let eExpected2: string = "obj";
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part03_6300
     * @tc.name objectKeysPart03Case063
     * @tc.desc Verify keys order stable across repeated calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart03Case063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'x': 1, 'y': 2, 'z': 3 };
      const k1: string[] = Object.keys(record);
      const k2: string[] = Object.keys(record);
      expect(k1).assertDeepEquals(k2);
      let rResult2: int = k1.length;
      let eExpected2: int = 3;
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part03_6400
     * @tc.name objectKeysPart03Case064
     * @tc.desc Verify a Record with one smart-quoted key returns that single key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart03Case064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "\u2018left\u2019": 1 };
      const keys: string[] = Object.keys(record);
      let rResult1: int = keys.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part03_6500
     * @tc.name objectKeysPart03Case065
     * @tc.desc Verify keys preserves insertion order for 3-digit integer-like keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart03Case065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "300": 3, "100": 1, "200": 2 };
      const keys: string[] = Object.keys(record);
      let rResult1: string = keys[0];
      let eExpected1: string = "300";
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = keys[2];
      let eExpected2: string = "200";
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part03_6600
     * @tc.name objectKeysPart03Case066
     * @tc.desc Verify keys of derived class field order base first then derived
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart03Case066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: KeysDF = new KeysDF();
      const keys: string[] = Object.keys(obj);
      let rResult1: string = keys[0];
      let eExpected1: string = "base";
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = keys[1];
      let eExpected2: string = 'd';
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part03_6700
     * @tc.name objectKeysPart03Case067
     * @tc.desc Verify a combining-accent key, an emoji key and a zero-width key give three keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart03Case067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "a\u0301": 1, '😀': 2, "\u200B": 3 };
      const keys: string[] = Object.keys(record);
      let rResult1: int = keys.length;
      let eExpected1: int = 3;
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part03_6800
     * @tc.name objectKeysPart03Case068
     * @tc.desc Verify keys with key built by concatenation matches literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart03Case068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = {};
      record["con" + "cat"] = 1;
      const keys: string[] = Object.keys(record);
      let rResult1: string = keys[0];
      let eExpected1: string = "concat";
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part03_6900
     * @tc.name objectKeysPart03Case069
     * @tc.desc Verify keys returns key when value is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart03Case069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': undefined };
      const keys: string[] = Object.keys(record);
      let rResult1: int = keys.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = keys[0];
      let eExpected2: string = 'a';
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part03_7000
     * @tc.name objectKeysPart03Case070
     * @tc.desc Verify keys returns key when value is null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart03Case070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': null };
      const keys: string[] = Object.keys(record);
      let rResult1: int = keys.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = keys[0];
      let eExpected2: string = 'a';
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part03_7100
     * @tc.name objectKeysPart03Case071
     * @tc.desc Verify keys ignores RegExp value type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart03Case071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "re": new RegExp('a') };
      const keys: string[] = Object.keys(record);
      let rResult1: int = keys.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part03_7200
     * @tc.name objectKeysPart03Case072
     * @tc.desc Verify a Record with boolean true and false values still has two keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart03Case072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 't': true, 'f': false };
      const keys: string[] = Object.keys(record);
      let rResult1: int = keys.length;
      let eExpected1: int = 2;
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part03_7300
     * @tc.name objectKeysPart03Case073
     * @tc.desc Verify keys with float string key not integer ordered
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart03Case073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "1.5": 1, '0': 2 };
      const keys: string[] = Object.keys(record);
      let rResult1: string = keys[0];
      let eExpected1: string = "1.5";
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = keys[1];
      let eExpected2: string = '0';
      expect(rResult2).assertEqual(eExpected2);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part03_7400
     * @tc.name objectKeysPart03Case074
     * @tc.desc Verify keys with 50 keys insertion order for non-integer keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart03Case074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = {};
      for (let i: int = 0; i < 50; i++) {
        record['n' + i] = i;
      }
      const keys: string[] = Object.keys(record);
      let rResult1: string = keys[0];
      let eExpected1: string = "n0";
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = keys[49];
      let eExpected2: string = "n49";
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part03_7500
     * @tc.name objectKeysPart03Case075
     * @tc.desc Verify keys with nested class value does not enumerate inner fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart03Case075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'w': new WrapInner() };
      const keys: string[] = Object.keys(record);
      let rResult1: int = keys.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part03_7600
     * @tc.name objectKeysPart03Case076
     * @tc.desc Verify keys full ordering of mixed numeric and alpha keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart03Case076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'z': 1, '1': 2, 'a': 3, '2': 4 };
      const keys: string[] = Object.keys(record);
      let rResult1: string = keys[0];
      let eExpected1: string = 'z';
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = keys[1];
      let eExpected2: string = '1';
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: string = keys[2];
      let eExpected3: string = 'a';
      expect(rResult3).assertEqual(eExpected3);
      let rResult4: string = keys[3];
      let eExpected4: string = '2';
      expect(rResult4).assertEqual(eExpected4);
      let rResult5: int = keys.length;
      let eExpected5: int = 4;
      expect(rResult5).assertEqual(eExpected5);
    });
  });
}
