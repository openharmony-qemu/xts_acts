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

class Wrapper001 {
  inner: Object = new Object();
}
class Keys2User001 {
  name: string = 'u';
}
class Bare001 {}
class Pair001 {
  a: number = 1;
  b: number = 2;
}
class Keys2Box001 {
  size: number = 1;
}
class Keys2Person004 {
  name: string = "ark";
  age: number = 18;
}
class Person005 {
  name: string = "ark";
}
class Keys2Point004 {
  x: number = 3;
  y: number = 4;
}
class Person006 {
  name: string = "ark";
}
class Dog003 {
  bark(): string {
    return "woof";
  }
}


export default function ObjectKeys2Test(): void {
  describe("ObjectKeys2Test", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part02_0100
     * @tc.name objectKeysPart02Case001
     * @tc.desc Verify Object.keys returns length 0 on two successive calls on the same empty Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart02Case001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = {};
      const names: string[] = Object.keys(record);
      const namesAgain: string[] = Object.keys(record);
      let rResult1: int = names.length;
      let eExpected1: int = 0;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: int = namesAgain.length;
      let eExpected2: int = 0;
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part02_0200
     * @tc.name objectKeysPart02Case002
     * @tc.desc Verify Object.keys is empty before and gains key added after the Record is mutated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart02Case002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = {};
      const names: string[] = Object.keys(record);
      let rResult1: int = names.length;
      let eExpected1: int = 0;
      expect(rResult1).assertEqual(eExpected1);
      record["added"] = 1;
      const names2: string[] = Object.keys(record);
      let rResult2: int = names2.length;
      let eExpected2: int = 1;
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: string = names2[0];
      let eExpected3: string = "added";
      expect(rResult3).assertEqual(eExpected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part02_0300
     * @tc.name objectKeysPart02Case003
     * @tc.desc Verify Object.keys length is 0 for an empty Record and 1 for a Record holding only key a
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart02Case003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emptyRecord: Record<string, Any> = {};
      const fullRecord: Record<string, Any> = { 'a': 1 };
      let rResult1: int = Object.keys(emptyRecord).length;
      let eExpected1: int = 0;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: int = Object.keys(fullRecord).length;
      let eExpected2: int = 1;
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part02_0400
     * @tc.name objectKeysPart02Case004
     * @tc.desc Verify Object.keys returns a then b for one Record and b then a for the other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart02Case004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record1: Record<string, Any> = { 'a': 1, 'b': 2 };
      const record2: Record<string, Any> = { 'b': 2, 'a': 1 };
      const names1: string[] = Object.keys(record1);
      const names2: string[] = Object.keys(record2);
      let rResult1: string = names1[0];
      let eExpected1: string = 'a';
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = names1[1];
      let eExpected2: string = 'b';
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: string = names2[0];
      let eExpected3: string = 'b';
      expect(rResult3).assertEqual(eExpected3);
      let rResult4: string = names2[1];
      let eExpected4: string = 'a';
      expect(rResult4).assertEqual(eExpected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part02_0500
     * @tc.name objectKeysPart02Case005
     * @tc.desc Verify Object.keys preserves declaration order with ASCII key name first and a CJK key second
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart02Case005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "name": 1, "中文": 2 };
      const names: string[] = Object.keys(record);
      let rResult1: string = names[0];
      let eExpected1: string = "name";
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = names[1];
      let eExpected2: string = "中文";
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part02_0600
     * @tc.name objectKeysPart02Case006
     * @tc.desc Verify Object.keys keeps insertion order "0", name, "1" for a Record mixing numeric and text keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart02Case006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { '0': 'z', "name": 'n', '1': 'o' };
      const names: string[] = Object.keys(record);
      let rResult1: int = names.length;
      let eExpected1: int = 3;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = names[0];
      let eExpected2: string = '0';
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: string = names[1];
      let eExpected3: string = "name";
      expect(rResult3).assertEqual(eExpected3);
      let rResult4: string = names[2];
      let eExpected4: string = '1';
      expect(rResult4).assertEqual(eExpected4);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part02_0700
     * @tc.name objectKeysPart02Case007
     * @tc.desc Verify Object.keys returns an array of length 1 for a Record with the single key k
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart02Case007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'k': 1 };
      const names: string[] = Object.keys(record);
      let rResult1: int = names.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part02_0800
     * @tc.name objectKeysPart02Case008
     * @tc.desc Verify Object.keys of a two-key Record x and y returns x at position 0 and y at position 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart02Case008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'x': 1, 'y': 2 };
      const names: string[] = Object.keys(record);
      let rResult1: int = names.indexOf('x');
      let eExpected1: int = 0;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: int = names.indexOf('y');
      let eExpected2: int = 1;
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part02_0900
     * @tc.name objectKeysPart02Case009
     * @tc.desc Verify Object.keys of a three-key Record a b c returns the array a b c in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart02Case009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2, 'c': 3 };
      const names: string[] = Object.keys(record);
      expect(names).assertDeepEquals(['a', 'b', 'c']);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part02_1000
     * @tc.name objectKeysPart02Case010
     * @tc.desc Verify Object.keys of an inline two-element int array returns index string "0" first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart02Case010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const names: string[] = Object.keys([10, 20]);
      let rResult1: int = names.length;
      let eExpected1: int = 2;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = names[0];
      let eExpected2: string = '0';
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part02_1100
     * @tc.name objectKeysPart02Case011
     * @tc.desc Verify Object.keys of int array [1,2,3,4] returns index strings 0 1 2 3 in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart02Case011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [1, 2, 3, 4];
      const names: string[] = Object.keys(arr);
      const expected: string[] = ['0', '1', '2', '3'];
      let rResult1: int = names.length;
      let eExpected1: int = 4;
      expect(rResult1).assertEqual(eExpected1);
      expect(names).assertDeepEquals(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part02_1200
     * @tc.name objectKeysPart02Case012
     * @tc.desc Verify looking up index key 0 and index key 1 in the keys of int array [10,20] gives 0 and 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart02Case012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [10, 20];
      const names: string[] = Object.keys(arr);
      let rResult1: int = names.indexOf('0');
      let eExpected1: int = 0;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: int = names.indexOf('1');
      let eExpected2: int = 1;
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part02_1300
     * @tc.name objectKeysPart02Case013
     * @tc.desc Verify Object.keys of a plain Object instance does not contain index key 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart02Case013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const names: string[] = Object.keys(obj);
      const hasZero: boolean = names.indexOf('0') >= 0;
      expect(hasZero).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part02_1400
     * @tc.name objectKeysPart02Case014
     * @tc.desc Verify Object.keys of the inner plain Object field of a wrapper instance is empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart02Case014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const w: Wrapper001 = new Wrapper001();
      const names: string[] = Object.keys(w.inner);
      let rResult1: int = names.length;
      let eExpected1: int = 0;
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part02_1500
     * @tc.name objectKeysPart02Case015
     * @tc.desc Verify Object.keys of a two-element int array returns index keys 0 and 1 with length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart02Case015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [10, 20];
      const names: string[] = Object.keys(arr);
      let rResult1: int = names.length;
      let eExpected1: int = 2;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = names[0];
      let eExpected2: string = '0';
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: string = names[1];
      let eExpected3: string = '1';
      expect(rResult3).assertEqual(eExpected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part02_1600
     * @tc.name objectKeysPart02Case016
     * @tc.desc Verify Object.keys of a class instance with a single field name returns one key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart02Case016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u: Keys2User001 = new Keys2User001();
      const names: string[] = Object.keys(u);
      expect(names.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part02_1700
     * @tc.name objectKeysPart02Case017
     * @tc.desc Verify Object.keys of int array [10,20] contains index key 0 but not index key 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart02Case017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [10, 20];
      const keys: string[] = Object.keys(arr);
      const hasZero: boolean = keys.indexOf('0') >= 0;
      const hasTwo: boolean = keys.indexOf('2') >= 0;
      expect(hasZero).assertTrue();
      expect(hasTwo).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part02_1800
     * @tc.name objectKeysPart02Case018
     * @tc.desc Verify Object.keys returns a zero-length array for an instance of a class with no fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart02Case018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: Bare001 = new Bare001();
      const keys: string[] = Object.keys(b);
      let rResult1: int = keys.length;
      let eExpected1: int = 0;
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part02_1900
     * @tc.name objectKeysPart02Case019
     * @tc.desc Verify reversing Object.keys of int array [10,20] yields index string 1 then index string 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart02Case019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [10, 20];
      const keys: string[] = Object.keys(arr);
      const reversed: string[] = keys.reverse();
      let rResult1: string = reversed[0];
      let eExpected1: string = '1';
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = reversed[1];
      let eExpected2: string = '0';
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part02_2000
     * @tc.name objectKeysPart02Case020
     * @tc.desc Verify Object.keys length 2 for a two-key Record, a two-field Pair instance and a two-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart02Case020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2 };
      const arr: Array<number> = [1, 2];
      const rKeys: string[] = Object.keys(record);
      const cKeys: string[] = Object.keys(new Pair001());
      const aKeys: string[] = Object.keys(arr);
      let rResult1: int = rKeys.length;
      let eExpected1: int = 2;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: int = cKeys.length;
      let eExpected2: int = 2;
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: int = aKeys.length;
      let eExpected3: int = 2;
      expect(rResult3).assertEqual(eExpected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part02_2100
     * @tc.name objectKeysPart02Case021
     * @tc.desc Verify a Record with keys 0, 1 and length returns all three in that order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart02Case021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arrayLike: Record<string, Any> = { '0': 'a', '1': 'b', "length": 2 };
      const keys: string[] = Object.keys(arrayLike);
      let rResult1: int = keys.length;
      let eExpected1: int = 3;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = keys[0];
      let eExpected2: string = '0';
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: string = keys[1];
      let eExpected3: string = '1';
      expect(rResult3).assertEqual(eExpected3);
      let rResult4: string = keys[2];
      let eExpected4: string = "length";
      expect(rResult4).assertEqual(eExpected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part02_2200
     * @tc.name objectKeysPart02Case022
     * @tc.desc Verify Object.keys returns length 0 after an array is emptied by setting its length to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart02Case022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<string> = ['a', 'b'];
      arr.length = 0;
      const keys: string[] = Object.keys(arr);
      let rResult1: int = keys.length;
      let eExpected1: int = 0;
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part02_2300
     * @tc.name objectKeysPart02Case023
     * @tc.desc Verify Object.keys of a box class instance with field size set to 100 returns the key size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart02Case023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box: Keys2Box001 = new Keys2Box001();
      box.size = 100;
      const keys: string[] = Object.keys(box);
      let rResult1: int = keys.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = keys[0];
      let eExpected2: string = "size";
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part02_2400
     * @tc.name objectKeysPart02Case024
     * @tc.desc Verify key 0 is name and value 0 is ArkTS for a Record with a single name to ArkTS pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart02Case024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "name": "ArkTS" };
      const keys: string[] = Object.keys(record);
      const values: Any[] = Object.values(record);
      let rResult1: string = keys[0];
      let eExpected1: string = "name";
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: Any = values[0]!;
      let eExpected2: string = "ArkTS";
      expect(rResult2 as string).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part02_2500
     * @tc.name objectKeysPart02Case025
     * @tc.desc Verify keys and values align for a Record: name maps to ark and year to 2026
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart02Case025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "name": "ark", "year": 2026 };
      const keys: string[] = Object.keys(record);
      const values: Any[] = Object.values(record);
      let rResult1: int = keys.length;
      let eExpected1: number = values.length;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = keys[0];
      let eExpected2: string = "name";
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: Any = values[0]!;
      let eExpected3: string = "ark";
      expect(rResult3 as string).assertEqual(eExpected3);
      let rResult4: string = keys[1];
      let eExpected4: string = "year";
      expect(rResult4).assertEqual(eExpected4);
      let rResult5: Any = values[1]!;
      let eExpected5: int = 2026;
      expect(rResult5 as int).assertEqual(eExpected5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part02_2600
     * @tc.name objectKeysPart02Case026
     * @tc.desc Verify array keys and values have equal length with index "0" paired to value a
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart02Case026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<string> = ['a', 'b'];
      const keys: string[] = Object.keys(arr);
      const values: Any[] = Object.values(arr);
      let rResult1: int = keys.length;
      let eExpected1: number = values.length;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = keys[0];
      let eExpected2: string = '0';
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: Any = values[0]!;
      let eExpected3: string = 'a';
      expect(rResult3 as string).assertEqual(eExpected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part02_2700
     * @tc.name objectKeysPart02Case027
     * @tc.desc Verify key-value pairs for a two-field class instance are name to ark then age to 18
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart02Case027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const person: Keys2Person004 = new Keys2Person004();
      const keys: string[] = Object.keys(person);
      const values: Any[] = Object.values(person);
      let rResult1: string = keys[0];
      let eExpected1: string = "name";
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: Any = values[0]!;
      let eExpected2: string = "ark";
      expect(rResult2 as string).assertEqual(eExpected2);
      let rResult3: string = keys[1];
      let eExpected3: string = "age";
      expect(rResult3).assertEqual(eExpected3);
      let rResult4: Any = values[1]!;
      let eExpected4: number = 18;
      expect(rResult4 as number).assertEqual(eExpected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part02_2800
     * @tc.name objectKeysPart02Case028
     * @tc.desc Verify re-assigning a key to 99 keeps a single key a and reports value 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart02Case028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1 };
      record['a'] = 99;
      const keys: string[] = Object.keys(record);
      const values: Any[] = Object.values(record);
      let rResult1: string = keys[0];
      let eExpected1: string = 'a';
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: Any = values[0]!;
      let eExpected2: int = 99;
      expect(rResult2 as int).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part02_2900
     * @tc.name objectKeysPart02Case029
     * @tc.desc Verify a Record whose only key empty holds null gives key empty and a null value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart02Case029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "empty": null };
      const keys: string[] = Object.keys(record);
      const values: Any[] = Object.values(record);
      let rResult1: string = keys[0];
      let eExpected1: string = "empty";
      expect(rResult1).assertEqual(eExpected1);
      let actualValue1: Any = values[0];
      let actualValue1IsNull: boolean = actualValue1 === null;
      expect(actualValue1IsNull).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part02_3000
     * @tc.name objectKeysPart02Case030
     * @tc.desc Verify values for keys a and b of a two-key Record sum to 30 during iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart02Case030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 10, 'b': 20 };
      const keys: string[] = Object.keys(record);
      const values: Any[] = Object.values(record);
      let sum: number = 0;
      for (let i: int = 0; i < keys.length; i++) {
        sum += values[i]! as int;
      }
      expect(sum).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part02_3100
     * @tc.name objectKeysPart02Case031
     * @tc.desc Verify numeric-string keys "0" and "1" pair with values zero and one in that order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart02Case031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { '0': "zero", '1': "one" };
      const keys: string[] = Object.keys(record);
      const values: Any[] = Object.values(record);
      let rResult1: string = keys[0];
      let eExpected1: string = '0';
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: Any = values[0]!;
      let eExpected2: string = "zero";
      expect(rResult2 as string).assertEqual(eExpected2);
      let rResult3: string = keys[1];
      let eExpected3: string = '1';
      expect(rResult3).assertEqual(eExpected3);
      let rResult4: Any = values[1]!;
      let eExpected4: string = "one";
      expect(rResult4 as string).assertEqual(eExpected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part02_3200
     * @tc.name objectKeysPart02Case032
     * @tc.desc Verify key order and value pairing for a Record with a CJK name key then score 95
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart02Case032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "姓名": "Alice", "score": 95 };
      const keys: string[] = Object.keys(record);
      const values: Any[] = Object.values(record);
      let rResult1: string = keys[0];
      let eExpected1: string = "姓名";
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: Any = values[0]!;
      let eExpected2: string = "Alice";
      expect(rResult2 as string).assertEqual(eExpected2);
      let rResult3: string = keys[1];
      let eExpected3: string = "score";
      expect(rResult3).assertEqual(eExpected3);
      let rResult4: Any = values[1]!;
      let eExpected4: int = 95;
      expect(rResult4 as int).assertEqual(eExpected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part02_3300
     * @tc.name objectKeysPart02Case033
     * @tc.desc Verify Object.keys and Object.entries agree on a two-key Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart02Case033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2 };
      const entries = Object.entries(record);
      let rResult1: int = entries.length;
      let eExpected1: int = 2;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = entries[0]![0];
      let eExpected2: string = 'a';
      expect(rResult2).assertEqual(eExpected2);
      const keys: string[] = Object.keys(record);
      let rResult3: int = keys.length;
      let eExpected3: int = 2;
      expect(rResult3).assertEqual(eExpected3);
      let rResult4: string = keys[0];
      let eExpected4: string = 'a';
      expect(rResult4).assertEqual(eExpected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part02_3400
     * @tc.name objectKeysPart02Case034
     * @tc.desc Verify the first entry key of a Record name to ArkTS equals the first Object.keys value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart02Case034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "name": "ArkTS" };
      const keys: string[] = Object.keys(record);
      const entries = Object.entries(record);
      let rResult1: string = entries[0]![0];
      let eExpected1: string = keys[0];
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part02_3500
     * @tc.name objectKeysPart02Case035
     * @tc.desc Verify entry keys of a three-key Record a, b, c match Object.keys at every index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart02Case035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2, 'c': 3 };
      const keys: string[] = Object.keys(record);
      const entries = Object.entries(record);
      let rResult1: string = entries[0]![0];
      let eExpected1: string = keys[0];
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = entries[1]![0];
      let eExpected2: string = keys[1];
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: string = entries[2]![0];
      let eExpected3: string = keys[2];
      expect(rResult3).assertEqual(eExpected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part02_3600
     * @tc.name objectKeysPart02Case036
     * @tc.desc Verify entry values of a Record a 10 b 20 match Object.values at each index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart02Case036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 10, 'b': 20 };
      const values: Any[] = Object.values(record);
      const entries = Object.entries(record);
      let rResult1: Any = entries[0]![1];
      let eExpected1: Any = values[0]!;
      expect(rResult1 as Object).assertEqual(eExpected1 as Object);
      let rResult2: Any = entries[1]![1];
      let eExpected2: Any = values[1]!;
      expect(rResult2 as Object).assertEqual(eExpected2 as Object);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part02_3700
     * @tc.name objectKeysPart02Case037
     * @tc.desc Verify Object.keys and Object.entries of an empty Record both have length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart02Case037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = {};
      const keys: string[] = Object.keys(record);
      const entries = Object.entries(record);
      let rResult1: int = keys.length;
      let eExpected1: int = 0;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: int = entries.length;
      let eExpected2: int = 0;
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part02_3800
     * @tc.name objectKeysPart02Case038
     * @tc.desc Verify array entries reuse the Object.keys index strings and pair index 0 with value a
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart02Case038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<string> = ['a', 'b'];
      const keys: string[] = Object.keys(arr);
      const entries = Object.entries(arr);
      let rResult1: string = keys[0];
      let eExpected1: string = '0';
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = entries[0]![0];
      let eExpected2: string = keys[0];
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: string = entries[1]![0];
      let eExpected3: string = keys[1];
      expect(rResult3).assertEqual(eExpected3);
      let rResult4: Any = entries[0]![1];
      let eExpected4: string = 'a';
      expect(rResult4 as string).assertEqual(eExpected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part02_3900
     * @tc.name objectKeysPart02Case039
     * @tc.desc Verify the first entry of a class with field name is key name value ark
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart02Case039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const person: Person005 = new Person005();
      const keys: string[] = Object.keys(person);
      const entries = Object.entries(person);
      let rResult1: string = keys[0];
      let eExpected1: string = "name";
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = entries[0]![0];
      let eExpected2: string = "name";
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: Any = entries[0]![1];
      let eExpected3: string = "ark";
      expect(rResult3 as string).assertEqual(eExpected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part02_4000
     * @tc.name objectKeysPart02Case040
     * @tc.desc Verify Object.entries reports the updated value 77 after the key a is reassigned
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart02Case040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1 };
      record['a'] = 77;
      const keys: string[] = Object.keys(record);
      const entries = Object.entries(record);
      let rResult1: string = keys[0];
      let eExpected1: string = 'a';
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: Any = entries[0]![1];
      let eExpected2: int = 77;
      expect(rResult2 as int).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part02_4100
     * @tc.name objectKeysPart02Case041
     * @tc.desc Verify entry keys of a three-key Record x y z collect as x, y, z in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart02Case041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'x': 1, 'y': 2, 'z': 3 };
      const entries = Object.entries(record);
      const collected: string[] = [];
      for (const item of entries) {
        collected.push(item![0]);
      }
      let rResult1: int = collected.length;
      let eExpected1: number = 3;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = collected[0];
      let eExpected2: string = 'x';
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: string = collected[2];
      let eExpected3: string = 'z';
      expect(rResult3).assertEqual(eExpected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part02_4200
     * @tc.name objectKeysPart02Case042
     * @tc.desc Verify a Record keyed 0 and 1 gives first entry key 0 and second entry value one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart02Case042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { '0': "zero", '1': "one" };
      const keys: string[] = Object.keys(record);
      const entries = Object.entries(record);
      let rResult1: string = keys[0];
      let eExpected1: string = '0';
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = entries[0]![0];
      let eExpected2: string = '0';
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: Any = entries[1]![1];
      let eExpected3: string = "one";
      expect(rResult3 as string).assertEqual(eExpected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part02_4300
     * @tc.name objectKeysPart02Case043
     * @tc.desc Verify the first entry of a Record with key empty set to null has key empty and null value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart02Case043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "empty": null };
      const keys: string[] = Object.keys(record);
      const entries = Object.entries(record);
      let rResult1: string = keys[0];
      let eExpected1: string = "empty";
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = entries[0]![0];
      let eExpected2: string = "empty";
      expect(rResult2).assertEqual(eExpected2);
      let actualValue1: Any = entries[0]![1];
      let actualValue1IsNull: boolean = actualValue1 === null;
      expect(actualValue1IsNull).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part02_4400
     * @tc.name objectKeysPart02Case044
     * @tc.desc Verify Object.keys and getOwnPropertyNames of a two-key Record both list a then b
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart02Case044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2 };
      const keys: string[] = Object.keys(record);
      const names: string[] = Object.getOwnPropertyNames(record);
      let rResult1: int = keys.length;
      let eExpected1: int = 2;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = keys[0];
      let eExpected2: string = 'a';
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: string = keys[1];
      let eExpected3: string = 'b';
      expect(rResult3).assertEqual(eExpected3);
      let rResult4: int = names.length;
      let eExpected4: int = 2;
      expect(rResult4).assertEqual(eExpected4);
      let rResult5: string = names[0];
      let eExpected5: string = 'a';
      expect(rResult5).assertEqual(eExpected5);
      let rResult6: string = names[1];
      let eExpected6: string = 'b';
      expect(rResult6).assertEqual(eExpected6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part02_4500
     * @tc.name objectKeysPart02Case045
     * @tc.desc Verify keys and getOwnPropertyNames agree on a two-property Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart02Case045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2 };
      const keys: string[] = Object.keys(record);
      const names: string[] = Object.getOwnPropertyNames(record);
      let rResult1: int = names.indexOf(keys[0]);
      let eExpected1: int = 0;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: int = names.indexOf(keys[1]);
      let eExpected2: int = 1;
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part02_4600
     * @tc.name objectKeysPart02Case046
     * @tc.desc Verify Object.keys of string array a b is 2 while its own property names is 3 with length last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart02Case046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<string> = ['a', 'b'];
      const keys: string[] = Object.keys(arr);
      const names: string[] = Object.getOwnPropertyNames(arr);
      let rResult1: int = keys.length;
      let eExpected1: int = 2;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: int = names.length;
      let eExpected2: int = 3;
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: string = names[2];
      let eExpected3: string = "length";
      expect(rResult3).assertEqual(eExpected3);
      let rResult4: int = keys.indexOf("length");
      let eExpected4: int = -1;
      expect(rResult4).assertEqual(eExpected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part02_4700
     * @tc.name objectKeysPart02Case047
     * @tc.desc Verify own property names of a string array outnumber Object.keys by 1 with length only in names
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart02Case047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<string> = ['a', 'b'];
      const keys: string[] = Object.keys(arr);
      const names: string[] = Object.getOwnPropertyNames(arr);
      let rResult1: int = names.length - keys.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: int = keys.indexOf("length");
      let eExpected2: int = -1;
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: int = names.indexOf("length");
      let eExpected3: int = 2;
      expect(rResult3).assertEqual(eExpected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part02_4800
     * @tc.name objectKeysPart02Case048
     * @tc.desc Verify Object.keys and getOwnPropertyNames of a point instance with x y both return two keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart02Case048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const point: Keys2Point004 = new Keys2Point004();
      const keys: string[] = Object.keys(point);
      const names: string[] = Object.getOwnPropertyNames(point);
      let rResult1: int = keys.length;
      let eExpected1: int = 2;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = keys[0];
      let eExpected2: string = 'x';
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: string = keys[1];
      let eExpected3: string = 'y';
      expect(rResult3).assertEqual(eExpected3);
      let rResult4: int = names.length;
      let eExpected4: int = 2;
      expect(rResult4).assertEqual(eExpected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part02_4900
     * @tc.name objectKeysPart02Case049
     * @tc.desc Verify a Record with key hidden added later gives one key and one property name hidden
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart02Case049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = {};
      record["hidden"] = 1;
      const keys: string[] = Object.keys(record);
      const names: string[] = Object.getOwnPropertyNames(record);
      let rResult1: int = keys.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: int = names.length;
      let eExpected2: int = 1;
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: string = names[0];
      let eExpected3: string = "hidden";
      expect(rResult3).assertEqual(eExpected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part02_5000
     * @tc.name objectKeysPart02Case050
     * @tc.desc Verify key visible added later appears in both Object.keys and Object.getOwnPropertyNames
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart02Case050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = {};
      record["visible"] = 5;
      const keys: string[] = Object.keys(record);
      const names: string[] = Object.getOwnPropertyNames(record);
      let rResult1: int = keys.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: int = names.length;
      let eExpected2: int = 1;
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: string = keys[0];
      let eExpected3: string = "visible";
      expect(rResult3).assertEqual(eExpected3);
      let rResult4: string = names[0];
      let eExpected4: string = "visible";
      expect(rResult4).assertEqual(eExpected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part02_5100
     * @tc.name objectKeysPart02Case051
     * @tc.desc Verify getOwnPropertyNames of a Record keyed 0 and 1 returns both index keys in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart02Case051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { '0': "zero", '1': "one" };
      const keys: string[] = Object.keys(record);
      const names: string[] = Object.getOwnPropertyNames(record);
      let rResult1: int = keys.length;
      let eExpected1: number = names.length;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = names[0];
      let eExpected2: string = '0';
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: string = names[1];
      let eExpected3: string = '1';
      expect(rResult3).assertEqual(eExpected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part02_5200
     * @tc.name objectKeysPart02Case052
     * @tc.desc Verify getOwnPropertyNames of a Record with a CJK key then key hello lists both in that order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart02Case052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "中文": 1, "hello": 2 };
      const keys: string[] = Object.keys(record);
      const names: string[] = Object.getOwnPropertyNames(record);
      let rResult1: int = keys.length;
      let eExpected1: number = names.length;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: int = names.indexOf("中文");
      let eExpected2: int = 0;
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: int = names.indexOf("hello");
      let eExpected3: int = 1;
      expect(rResult3).assertEqual(eExpected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part02_5300
     * @tc.name objectKeysPart02Case053
     * @tc.desc Verify hasOwnProperty is true for both key a and key b of a two-key Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart02Case053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2 };
      const keys: string[] = Object.keys(record);
      let rResult1: boolean = record.hasOwnProperty(keys[0]);
      expect(rResult1).assertTrue();
      let rResult2: boolean = record.hasOwnProperty(keys[1]);
      expect(rResult2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part02_5400
     * @tc.name objectKeysPart02Case054
     * @tc.desc Verify a Record name to ArkTS gives one key name that hasOwnProperty accepts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart02Case054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "name": "ArkTS" };
      const keys: string[] = Object.keys(record);
      let rResult1: int = keys.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: boolean = record.hasOwnProperty(keys[0]);
      expect(rResult2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part02_5500
     * @tc.name objectKeysPart02Case055
     * @tc.desc Verify a Record mutated with key fresh reports one key named fresh that hasOwnProperty accepts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart02Case055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = {};
      record["fresh"] = 1;
      const keys: string[] = Object.keys(record);
      let rResult1: int = keys.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = keys[0];
      let eExpected2: string = "fresh";
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: boolean = record.hasOwnProperty("fresh");
      expect(rResult3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part02_5600
     * @tc.name objectKeysPart02Case056
     * @tc.desc Verify keys a and b of a two-key Record start with a and hasOwnProperty a is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart02Case056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2 };
      const keys: string[] = Object.keys(record);
      let rResult1: int = keys.length;
      let eExpected1: int = 2;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = keys[0];
      let eExpected2: string = 'a';
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: boolean = record.hasOwnProperty('a');
      expect(rResult3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part02_5700
     * @tc.name objectKeysPart02Case057
     * @tc.desc Verify hasOwnProperty is false for key nope which Object.keys of Record a omits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart02Case057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1 };
      const keys: string[] = Object.keys(record);
      let rResult1: boolean = record.hasOwnProperty("nope");
      expect(rResult1).assertFalse();
      let rResult2: int = keys.indexOf("nope");
      let eExpected2: int = -1;
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part02_5800
     * @tc.name objectKeysPart02Case058
     * @tc.desc Verify hasOwnProperty is true for array index key 0 and for the last key 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart02Case058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<string> = ['a', 'b', 'c'];
      const keys: string[] = Object.keys(arr);
      let rResult1: string = keys[0];
      let eExpected1: string = '0';
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: boolean = arr.hasOwnProperty('0');
      expect(rResult2).assertTrue();
      let rResult3: boolean = arr.hasOwnProperty(keys[2]);
      expect(rResult3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part02_5900
     * @tc.name objectKeysPart02Case059
     * @tc.desc Verify a string array reports hasOwnProperty length true though Object.keys omits length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart02Case059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<string> = ['a', 'b'];
      const keys: string[] = Object.keys(arr);
      let rResult1: boolean = arr.hasOwnProperty("length");
      expect(rResult1).assertTrue();
      let rResult2: int = keys.indexOf("length");
      let eExpected2: int = -1;
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part02_6000
     * @tc.name objectKeysPart02Case060
     * @tc.desc Verify a class instance with field name gives key name with hasOwnProperty true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart02Case060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const person: Person006 = new Person006();
      const keys: string[] = Object.keys(person);
      let rResult1: string = keys[0];
      let eExpected1: string = "name";
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: boolean = person.hasOwnProperty("name");
      expect(rResult2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part02_6100
     * @tc.name objectKeysPart02Case061
     * @tc.desc Verify a class with only method bark has no keys and hasOwnProperty bark is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart02Case061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dog: Dog003 = new Dog003();
      const keys: string[] = Object.keys(dog);
      let rResult1: int = keys.length;
      let eExpected1: int = 0;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: boolean = dog.hasOwnProperty("bark");
      expect(rResult2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part02_6200
     * @tc.name objectKeysPart02Case062
     * @tc.desc Verify an empty Record has no keys and hasOwnProperty is false for x and y
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart02Case062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = {};
      const keys: string[] = Object.keys(record);
      let rResult1: int = keys.length;
      let eExpected1: int = 0;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: boolean = record.hasOwnProperty('x');
      expect(rResult2).assertFalse();
      let rResult3: boolean = record.hasOwnProperty('y');
      expect(rResult3).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part02_6300
     * @tc.name objectKeysPart02Case063
     * @tc.desc Verify hasOwnProperty is true for each of the three keys x, y, z and false for ghost
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart02Case063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'x': 1, 'y': 2, 'z': 3 };
      const keys: string[] = Object.keys(record);
      let hitCount: int = 0;
      for (const k of keys) {
        if (record.hasOwnProperty(k)) {
          hitCount++;
        }
      }
      let rResult1: int = hitCount;
      let eExpected1: int = 3;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: boolean = record.hasOwnProperty("ghost");
      expect(rResult2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part02_6400
     * @tc.name objectKeysPart02Case064
     * @tc.desc Verify record hasOwnProperty '0' true and '1' false keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart02Case064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { '0': "zero" };
      const keys: string[] = Object.keys(record);
      let rResult1: string = keys[0];
      let eExpected1: string = '0';
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: boolean = record.hasOwnProperty('0');
      expect(rResult2).assertTrue();
      let rResult3: boolean = record.hasOwnProperty('1');
      expect(rResult3).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part02_6500
     * @tc.name objectKeysPart02Case065
     * @tc.desc Verify reassigning key a to 100 keeps one key a with hasOwnProperty true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart02Case065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1 };
      record['a'] = 100;
      const keys: string[] = Object.keys(record);
      let rResult1: int = keys.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = keys[0];
      let eExpected2: string = 'a';
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: boolean = record.hasOwnProperty('a');
      expect(rResult3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part02_6600
     * @tc.name objectKeysPart02Case066
     * @tc.desc Verify a Record with a script-tag key returns that key while an empty Record returns none
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart02Case066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emptyRecord: Record<string, Any> = {};
      const xssRecord: Record<string, Any> = { "<script>alert(1)</script>": 1 };
      const emptyNames: string[] = Object.keys(emptyRecord);
      const xssNames: string[] = Object.keys(xssRecord);
      let rResult1: int = emptyNames.length;
      let eExpected1: int = 0;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: int = xssNames.length;
      let eExpected2: int = 1;
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: string = xssNames[0];
      let eExpected3: string = "<script>alert(1)</script>";
      expect(rResult3).assertEqual(eExpected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part02_6700
     * @tc.name objectKeysPart02Case067
     * @tc.desc Verify Object.keys yields the 1000-character key for a Record and nothing for an empty Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart02Case067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emptyRecord: Record<string, Any> = {};
      const longKey: string = 'k'.repeat(1000);
      const longRecord: Record<string, Any> = {};
      longRecord[longKey] = 1;
      let rResult1: int = Object.keys(emptyRecord).length;
      let eExpected1: int = 0;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: int = Object.keys(longRecord).length;
      let eExpected2: int = 1;
      expect(rResult2).assertEqual(eExpected2);
      expect(Object.keys(longRecord)[0]).assertEqual(longKey);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part02_6800
     * @tc.name objectKeysPart02Case068
     * @tc.desc Verify an empty Record gains CJK, emoji and 42 keys in insertion order giving length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart02Case068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = {};
      const before: string[] = Object.keys(record);
      let rResult1: int = before.length;
      let eExpected1: int = 0;
      expect(rResult1).assertEqual(eExpected1);
      record["中文"] = 1;
      record['🎉'] = 2;
      record["42"] = 3;
      const after: string[] = Object.keys(record);
      let rResult2: int = after.length;
      let eExpected2: int = 3;
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: string = after[0];
      let eExpected3: string = "中文";
      expect(rResult3).assertEqual(eExpected3);
      let rResult4: string = after[1];
      let eExpected4: string = '🎉';
      expect(rResult4).assertEqual(eExpected4);
      let rResult5: string = after[2];
      let eExpected5: string = "42";
      expect(rResult5).assertEqual(eExpected5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part02_6900
     * @tc.name objectKeysPart02Case069
     * @tc.desc Verify a Record with zero-width, markup and 1000-char keys returns three keys in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart02Case069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emptyRecord: Record<string, Any> = {};
      const longKey: string = 'k'.repeat(1000);
      const mixedRecord: Record<string, Any> = {};
      mixedRecord['​'] = 1;
      mixedRecord["<b>"] = 2;
      mixedRecord[longKey] = 3;
      const emptyNames: string[] = Object.keys(emptyRecord);
      const mixedNames: string[] = Object.keys(mixedRecord);
      let rResult1: int = emptyNames.length;
      let eExpected1: int = 0;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: int = mixedNames.length;
      let eExpected2: int = 3;
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: string = mixedNames[0];
      let eExpected3: string = '​';
      expect(rResult3).assertEqual(eExpected3);
      let rResult4: string = mixedNames[1];
      let eExpected4: string = "<b>";
      expect(rResult4).assertEqual(eExpected4);
      let rResult5: string = mixedNames[2];
      let eExpected5: string = longKey;
      expect(rResult5).assertEqual(eExpected5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTKEYS_Part02_7000
     * @tc.name objectKeysPart02Case070
     * @tc.desc Verify a Record holding a new Object value gives one key new while that Object has none
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectKeysPart02Case070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = {};
      const obj: Object = new Object();
      record["new"] = obj;
      const keys: string[] = Object.keys(record);
      let rResult1: int = keys.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = keys[0];
      let eExpected2: string = "new";
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: int = Object.keys(obj).length;
      let eExpected3: int = 0;
      expect(rResult3).assertEqual(eExpected3);
    });
  });
}
