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

class Person002 {
  name: string = 'a';
  age: int = 1;
}
class Person003 {
  name: string = 'a';
  age: int = 1;
}
class Pk2Person004 {
  name: string = 'a';
}
class Pk2Point001 {
  x: number = 3;
  y: number = 4;
}

export default function ObjectPropertyKey2Test(): void {
  describe("ObjectPropertyKey2Test", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part02_0100
     * @tc.name objectPropertyKeyPart02Case001
     * @tc.desc Verify $_hashCode of a plain Object is non-negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart02Case001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const hash: int = obj.$_hashCode();
      expect(hash).assertLargerOrEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part02_0200
     * @tc.name objectPropertyKeyPart02Case002
     * @tc.desc Verify Object.keys of a Record with keys name and year returns 2 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart02Case002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "name": "ArkTS", "year": 2026 };
      const names: string[] = Object.keys(record);
      let rResult1: int = names.length;
      let eExpected1: int = 2;
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part02_0300
     * @tc.name objectPropertyKeyPart02Case003
     * @tc.desc Verify Object.hasOwn is false for numeric key 0 on a Record keyed by string 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart02Case003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { '0': "zero" };
      let rResult1: boolean = Object.hasOwn(record, 0);
      expect(rResult1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part02_0400
     * @tc.name objectPropertyKeyPart02Case004
     * @tc.desc Verify Object.fromEntries builds a Record mapping one string pair name to ArkTS
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart02Case004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: Array<[string, string]> = [["name", "ArkTS"]];
      const rec: Record<string, string> = Object.fromEntries<string>(pairs);
      let rResult1: string = rec["name"]!;
      let eExpected1: string = "ArkTS";
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part02_0500
     * @tc.name objectPropertyKeyPart02Case005
     * @tc.desc Verify assign with two sources returns target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart02Case005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      const sourceA: Record<string, Any> = { 'a': 1 };
      const sourceB: Record<string, Any> = { 'b': 2 };
      const result: Record<string, Any> = Object.assign(target, sourceA, sourceB);
      expect(result).assertEqual(target);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part02_0600
     * @tc.name objectPropertyKeyPart02Case006
     * @tc.desc Verify toLocaleString with locale ar-EG on a plain Object returns [object Object]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart02Case006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const result: String = obj.toLocaleString("ar-EG");
      expect(result).assertEqual("[object Object]");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part02_0700
     * @tc.name objectPropertyKeyPart02Case007
     * @tc.desc Verify toLocaleString with locale en and an empty options object returns [object Object]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart02Case007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const result: String = obj.toLocaleString("en", {});
      expect(result).assertEqual("[object Object]");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part02_0800
     * @tc.name objectPropertyKeyPart02Case008
     * @tc.desc Verify Record.hasOwnProperty returns false for an absent long string key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart02Case008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "name": "ArkTS" };
      const longKey: string = "key_abcdefghijklmnopqrstuvwxyz0123456789_key_abcdefghijklmnopqrstuvwxyz0123456789";
      let rResult1: boolean = record.hasOwnProperty(longKey);
      expect(rResult1).assertFalse();
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part02_0900
     * @tc.name objectPropertyKeyPart02Case009
     * @tc.desc Verify Object.keys of a Record keyed 0 and 1 yields key 0 first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart02Case009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { '0': "zero", '1': "one" };
      const names: string[] = Object.keys(record);
      let rResult1: string = names[0];
      let eExpected1: string = '0';
      expect(rResult1).assertEqual(eExpected1);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part02_1000
     * @tc.name objectPropertyKeyPart02Case010
     * @tc.desc Verify Object.values length is 2 for a Record with name and year
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart02Case010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "name": "ArkTS", "year": 2026 };
      const vals: Any[] = Object.values(record);
      let rResult1: int = vals.length;
      let eExpected1: int = 2;
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part02_1100
     * @tc.name objectPropertyKeyPart02Case011
     * @tc.desc Verify Object.values second entry of a name/year Record is the number 2026
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart02Case011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "name": "ArkTS", "year": 2026 };
      const vals: Any[] = Object.values(record);
      let rResult1: Any = vals[1];
      let eExpected1: int = 2026;
      expect(rResult1 as int).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part02_1200
     * @tc.name objectPropertyKeyPart02Case012
     * @tc.desc Verify Object.values second value of a Record keyed 0 and 1 is one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart02Case012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { '0': "zero", '1': "one" };
      const vals: Any[] = Object.values(record);
      let rResult1: Any = vals[1];
      let eExpected1: string = "one";
      expect(rResult1 as string).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part02_1300
     * @tc.name objectPropertyKeyPart02Case013
     * @tc.desc Verify Object.values on a class instance with name and age returns 2 values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart02Case013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p: Person002 = new Person002();
      const vals: Any[] = Object.values(p);
      let rResult1: int = vals.length;
      let eExpected1: int = 2;
      expect(rResult1).assertEqual(eExpected1);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part02_1400
     * @tc.name objectPropertyKeyPart02Case014
     * @tc.desc Verify Object.getOwnPropertyNames of a class instance lists its two fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart02Case014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p: Person003 = new Person003();
      const names: string[] = Object.getOwnPropertyNames(p);
      let rResult1: int = names.length;
      let eExpected1: int = 2;
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part02_1500
     * @tc.name objectPropertyKeyPart02Case015
     * @tc.desc Verify Object.hasOwn returns false for key name on an empty Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart02Case015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      let rResult1: boolean = Object.hasOwn(target, "name");
      expect(rResult1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part02_1600
     * @tc.name objectPropertyKeyPart02Case016
     * @tc.desc Verify Object.hasOwn with string key 0 is true on a two-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart02Case016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: int[] = [10, 20];
      let rResult1: boolean = Object.hasOwn(target, '0');
      expect(rResult1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part02_1700
     * @tc.name objectPropertyKeyPart02Case017
     * @tc.desc Verify Object.hasOwn returns true for field name on a one-field class instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart02Case017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Pk2Person004 = new Pk2Person004();
      let rResult1: boolean = Object.hasOwn(target, "name");
      expect(rResult1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part02_1800
     * @tc.name objectPropertyKeyPart02Case018
     * @tc.desc Verify Object.hasOwn with numeric key 0 is true on a two-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart02Case018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: int[] = [10, 20];
      let rResult1: boolean = Object.hasOwn(target, 0);
      expect(rResult1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part02_1900
     * @tc.name objectPropertyKeyPart02Case019
     * @tc.desc Verify Object.hasOwn returns false for empty-string key on a non-empty Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart02Case019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "name": "ArkTS" };
      let rResult1: boolean = Object.hasOwn(record, '');
      expect(rResult1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part02_2000
     * @tc.name objectPropertyKeyPart02Case020
     * @tc.desc Verify Object.hasOwn returns true for a CJK key present on a Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart02Case020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "中文键": 1 };
      let rResult1: boolean = Object.hasOwn(record, "中文键");
      expect(rResult1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part02_2100
     * @tc.name objectPropertyKeyPart02Case021
     * @tc.desc Verify Object.hasOwn returns false for an absent long mixed-case key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart02Case021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "name": "ArkTS" };
      const longKey: string = "k_0123456789_abcdefghijklmnopqrstuvwxyz_0123456789_ABCDEFGHIJKLMNOPQRSTUVWXYZ";
      let rResult1: boolean = Object.hasOwn(record, longKey);
      expect(rResult1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part02_2200
     * @tc.name objectPropertyKeyPart02Case022
     * @tc.desc Verify Object.hasOwn returns false for NaN as key on an int array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart02Case022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [10, 20];
      let rResult1: boolean = Object.hasOwn(arr, Number.NaN);
      expect(rResult1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part02_2300
     * @tc.name objectPropertyKeyPart02Case023
     * @tc.desc Verify Object.hasOwn returns false for negative key -1 on an int array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart02Case023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [10, 20];
      let rResult1: boolean = Object.hasOwn(arr, -1);
      expect(rResult1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part02_2400
     * @tc.name objectPropertyKeyPart02Case024
     * @tc.desc Verify Object.hasOwn returns false for fractional key 1.5 on an int array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart02Case024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [10, 20];
      let rResult1: boolean = Object.hasOwn(arr, 1.5);
      expect(rResult1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part02_2500
     * @tc.name objectPropertyKeyPart02Case025
     * @tc.desc Verify fromEntries of an empty pair array produces a Record with no keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart02Case025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: Array<[string, int]> = [];
      const rec: Record<string, Any> = Object.fromEntries<int>(pairs) as Record<string, Any>;
      let rResult1: int = Object.keys(rec).length;
      let eExpected1: int = 0;
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part02_2600
     * @tc.name objectPropertyKeyPart02Case026
     * @tc.desc Verify Object.fromEntries of the single pair year/2026 maps year to 2026
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart02Case026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: Array<[string, int]> = [["year", 2026]];
      const rec: Record<string, Any> = Object.fromEntries<int>(pairs) as Record<string, Any>;
      let rResult1: string = (rec["year"]! as Object).toString();
      let eExpected1: string = "2026";
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part02_2700
     * @tc.name objectPropertyKeyPart02Case027
     * @tc.desc Verify Object.fromEntries maps key b to 2 in a two-pair Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart02Case027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: Array<[string, int]> = [
        ['a', 1],
        ['b', 2],
      ];
      const rec: Record<string, Any> = Object.fromEntries<int>(pairs) as Record<string, Any>;
      let rResult1: Any = rec['b']!;
      let eExpected1: int = 2;
      expect(rResult1 as int).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part02_2800
     * @tc.name objectPropertyKeyPart02Case028
     * @tc.desc Verify Object.fromEntries stores double value 3.14 under key pi
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart02Case028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: Array<[string, double]> = [["pi", 3.14]];
      const rec: Record<string, double> = Object.fromEntries<double>(pairs);
      let rResult1: Any = rec["pi"]!;
      let eExpected1: number = 3.14;
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part02_2900
     * @tc.name objectPropertyKeyPart02Case029
     * @tc.desc Verify Object.assign from a one-key source leaves the target with 1 key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart02Case029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      const source: Record<string, Any> = { "year": 2026 };
      const result: Record<string, Any> = Object.assign(target, source);
      let rResult1: int = Object.keys(result).length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part02_3000
     * @tc.name objectPropertyKeyPart02Case030
     * @tc.desc Verify Object.assign overwrites existing key name with the value New
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart02Case030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { "name": "Old" };
      const source: Record<string, Any> = { "name": "New" };
      const result: Record<string, Any> = Object.assign(target, source);
      let rResult1: Any = result["name"];
      let eExpected1: string = "New";
      expect(rResult1 as string).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part02_3100
     * @tc.name objectPropertyKeyPart02Case031
     * @tc.desc Verify Object.assign with an empty plain Object source returns target with 1 key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart02Case031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { "name": "ArkTS" };
      const source: Object = new Object();
      const result: Record<string, Any> = Object.assign(target, source);
      let rResult1: int = Object.keys(result).length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part02_3200
     * @tc.name objectPropertyKeyPart02Case032
     * @tc.desc Verify Object.assign copies a CJK key with value 1 into an empty Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart02Case032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      const source: Record<string, Any> = { "中文键": 1 };
      const result: Record<string, Any> = Object.assign(target, source);
      let rResult1: Any = result["中文键"];
      let eExpected1: int = 1;
      expect(rResult1 as int).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part02_3300
     * @tc.name objectPropertyKeyPart02Case033
     * @tc.desc Verify Object.assign lets the later source override key v from 1 to 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart02Case033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      const sourceA: Record<string, Any> = { 'v': 1 };
      const sourceB: Record<string, Any> = { 'v': 2 };
      const result: Record<string, Any> = Object.assign(target, sourceA, sourceB);
      let rResult1: Any = result['v'];
      let eExpected1: int = 2;
      expect(rResult1 as int).assertEqual(eExpected1);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part02_3400
     * @tc.name objectPropertyKeyPart02Case034
     * @tc.desc Verify fromEntries of two string-int pairs a 1 and b 2 yields a Record with 2 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart02Case034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: Array<[string, int]> = [
        ['a', 1],
        ['b', 2],
      ];
      const rec: Record<string, Any> = Object.fromEntries<int>(pairs) as Record<string, Any>;
      let rResult1: int = Object.keys(rec).length;
      let eExpected1: int = 2;
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part02_3500
     * @tc.name objectPropertyKeyPart02Case035
     * @tc.desc Verify getOwnPropertyNames length equals Object.keys length for a two-key Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart02Case035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "name": "ArkTS", "year": 2026 };
      const ownNames: string[] = Object.getOwnPropertyNames(record);
      const keyNames: string[] = Object.keys(record);
      let rResult1: int = ownNames.length;
      let eExpected1: number = keyNames.length;
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part02_3600
     * @tc.name objectPropertyKeyPart02Case036
     * @tc.desc Verify Array.hasOwnProperty returns false for key -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart02Case036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [10, 20];
      const result: boolean = arr.hasOwnProperty(-1);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part02_3700
     * @tc.name objectPropertyKeyPart02Case037
     * @tc.desc Verify Array.hasOwnProperty returns false for NaN key on a two-element int array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart02Case037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [10, 20];
      const result: boolean = arr.hasOwnProperty(Number.NaN);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part02_3800
     * @tc.name objectPropertyKeyPart02Case038
     * @tc.desc Verify Array.hasOwnProperty returns false for max safe integer key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart02Case038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [10, 20];
      const result: boolean = arr.hasOwnProperty(9007199254740991);
      expect(result).assertFalse();
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part02_3900
     * @tc.name objectPropertyKeyPart02Case039
     * @tc.desc Verify Object.hasOwn returns false for absent key missing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart02Case039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "name": "ArkTS" };
      const result: boolean = Object.hasOwn(record, "missing");
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part02_4000
     * @tc.name objectPropertyKeyPart02Case040
     * @tc.desc Verify Object.assign with no source keeps the single key name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart02Case040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { "name": "ArkTS" };
      const result: Record<string, Any> = Object.assign(target);
      let rResult1: int = Object.keys(result).length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part02_4100
     * @tc.name objectPropertyKeyPart02Case041
     * @tc.desc Verify Object.keys of a one-key Record has length 1 and key name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart02Case041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "name": "ArkTS" };
      const keys: string[] = Object.keys(record);
      let rResult1: int = keys.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = keys[0];
      let eExpected2: string = "name";
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part02_4200
     * @tc.name objectPropertyKeyPart02Case042
     * @tc.desc Verify Object.keys on a one-entry Record gives untyped key array of name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart02Case042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "name": "ArkTS" };
      const keys = Object.keys(record);
      let rResult1: int = keys.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = keys[0]!;
      let eExpected2: string = "name";
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part02_4300
     * @tc.name objectPropertyKeyPart02Case043
     * @tc.desc Verify Object.keys keeps insertion order a, b, c for a three-key Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart02Case043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2, 'c': 3 };
      const keys = Object.keys(record);
      let rResult1: string = keys[0]!;
      let eExpected1: string = 'a';
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = keys[1]!;
      let eExpected2: string = 'b';
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: string = keys[2]!;
      let eExpected3: string = 'c';
      expect(rResult3).assertEqual(eExpected3);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part02_4400
     * @tc.name objectPropertyKeyPart02Case044
     * @tc.desc Verify Object.keys of a Record keyed 0 and 1 yields 0 then 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart02Case044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { '0': "zero", '1': "one" };
      const keys = Object.keys(record);
      let rResult1: string = keys[0]!;
      let eExpected1: string = '0';
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = keys[1]!;
      let eExpected2: string = '1';
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part02_4500
     * @tc.name objectPropertyKeyPart02Case045
     * @tc.desc Verify Object.keys of a Record with empty-string key yields that key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart02Case045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { '': 1 };
      const keys = Object.keys(record);
      let rResult1: string = keys[0]!;
      let eExpected1: string = '';
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part02_4600
     * @tc.name objectPropertyKeyPart02Case046
     * @tc.desc Verify Object.keys call does not alter Record property value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart02Case046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "name": "ArkTS", "year": 2024 };
      const before: string = (record["name"]! as Object).toString();
      Object.keys(record);
      const after: string = (record["name"]! as Object).toString();
      expect(after).assertEqual(before);
      let rResult1: string = (record["year"]! as Object).toString();
      let eExpected1: string = "2024";
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part02_4700
     * @tc.name objectPropertyKeyPart02Case047
     * @tc.desc Verify Object.keys of a two-key Record returns x then y with length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart02Case047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'x': 1, 'y': 2 };
      const keys: string[] = Object.keys(record);
      let rResult1: int = keys.length;
      let eExpected1: int = 2;
      expect(rResult1).assertEqual(eExpected1);
      expect(keys).assertDeepEquals(['x', 'y']);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part02_4800
     * @tc.name objectPropertyKeyPart02Case048
     * @tc.desc Verify Object.keys of a Pk2Point001 instance returns x then y
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart02Case048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const keys = Object.keys(new Pk2Point001());
      let rResult1: int = keys.length;
      let eExpected1: int = 2;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = keys[0]!;
      let eExpected2: string = 'x';
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: string = keys[1]!;
      let eExpected3: string = 'y';
      expect(rResult3).assertEqual(eExpected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part02_4900
     * @tc.name objectPropertyKeyPart02Case049
     * @tc.desc Verify Object.keys of int array 10,20,30 is three index keys, first 0 and last 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart02Case049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [10, 20, 30];
      const keys = Object.keys(arr);
      let rResult1: int = keys.length;
      let eExpected1: int = 3;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = keys[0]!;
      let eExpected2: string = '0';
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: string = keys[2]!;
      let eExpected3: string = '2';
      expect(rResult3).assertEqual(eExpected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part02_5000
     * @tc.name objectPropertyKeyPart02Case050
     * @tc.desc Verify Object.values keeps insertion order returning p then q
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart02Case050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'x': 'p', 'y': 'q' };
      const values = Object.values(record);
      let rResult1: Any = values[0]!;
      let eExpected1: string = 'p';
      expect(rResult1 as string).assertEqual(eExpected1);
      let rResult2: Any = values[1]!;
      let eExpected2: string = 'q';
      expect(rResult2 as string).assertEqual(eExpected2);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part02_5100
     * @tc.name objectPropertyKeyPart02Case051
     * @tc.desc Verify Object.values of Record with key a yields the number 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart02Case051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 42 };
      const values = Object.values(record);
      let rResult1: Any = values[0];
      let eExpected1: int = 42;
      expect(rResult1 as int).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part02_5200
     * @tc.name objectPropertyKeyPart02Case052
     * @tc.desc Verify Object.values of a Record with string, int and boolean returns str, 42 and true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart02Case052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 's': "str", 'n': 42, 'b': true };
      const vals: Any[] = Object.values(record);
      let rResult1: Any = vals[0];
      let eExpected1: string = "str";
      expect(rResult1 as string).assertEqual(eExpected1);
      let rResult2: Any = vals[1];
      let eExpected2: int = 42;
      expect(rResult2 as int).assertEqual(eExpected2);
      let rResult3: Any = vals[2];
      expect(rResult3 as boolean).assertTrue();
    });
  });
}
