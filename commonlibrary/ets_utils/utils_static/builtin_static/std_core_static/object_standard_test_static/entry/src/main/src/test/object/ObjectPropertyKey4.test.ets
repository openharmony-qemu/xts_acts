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

class Pk4Box001 {
  value: string = 'x';
}
class Rect001 {
  width: number = 5;
  height: number = 3;
}
class Origin001 {
  originX: number = 0;
}

export default function ObjectPropertyKey4Test(): void {
  describe("ObjectPropertyKey4Test", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_0100
     * @tc.name objectPropertyKeyPart04Case001
     * @tc.desc Verify Object.keys after assign lists target key a then source key b
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'a': 1 };
      const source: Record<string, Any> = { 'b': 2 };
      Object.assign(target, source);
      const tk: string[] = Object.keys(target);
      let rResult1: string = tk[0];
      let eExpected1: string = 'a';
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = tk[1];
      let eExpected2: string = 'b';
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_0200
     * @tc.name objectPropertyKeyPart04Case002
     * @tc.desc Verify Object.assign with undefined target throws NullPointerError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bad: Record<string, Any> | undefined = undefined;
      const src: Record<string, Any> = { 'a': 1 };
      try {
        Object.assign(bad!, src);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("NullPointerError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_0300
     * @tc.name objectPropertyKeyPart04Case003
     * @tc.desc Verify Object.fromEntries on pair year and 2026 yields a Record with one key year
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: Array<[string, int]> = [["year", 2026]];
      const record: Record<string, Any> = Object.fromEntries<int>(pairs) as Record<string, Any>;
      const k: string[] = Object.keys(record);
      let rResult1: int = k.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = k[0];
      let eExpected2: string = "year";
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_0400
     * @tc.name objectPropertyKeyPart04Case004
     * @tc.desc Verify Object.fromEntries with an empty-string key yields one empty key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: Array<[string, int]> = [['', 1]];
      const record: Record<string, Any> = Object.fromEntries<int>(pairs) as Record<string, Any>;
      const k: string[] = Object.keys(record);
      let rResult1: string = k[0];
      let eExpected1: string = '';
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_0500
     * @tc.name objectPropertyKeyPart04Case005
     * @tc.desc Verify Object.fromEntries of pair u with undefined value yields one key with undefined value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: Array<[string, Any]> = [['u', undefined]];
      const record: Record<string, Any> = Object.fromEntries<Any>(pairs);
      const v: Any[] = Object.values(record);
      let rResult1: int = Object.keys(record).length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
      let actualValue1: Any = v[0];
      let actualValue1IsUndefined: boolean = actualValue1 === undefined;
      expect(actualValue1IsUndefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_0600
     * @tc.name objectPropertyKeyPart04Case006
     * @tc.desc Verify Object.fromEntries of pair n with null value yields one key holding null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: Array<[string, Any]> = [['n', null]];
      const record: Record<string, Any> = Object.fromEntries<Any>(pairs);
      const v: Any[] = Object.values(record);
      let rResult1: int = Object.keys(record).length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
      let actualValue1: Any = v[0];
      let actualValue1IsNull: boolean = actualValue1 === null;
      expect(actualValue1IsNull).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_0700
     * @tc.name objectPropertyKeyPart04Case007
     * @tc.desc Verify Object.fromEntries with a 301-char key yields that key as the only key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longKey: string = 'k';
      for (let i = 0; i < 300; i++) {
        longKey = longKey + 'x';
      }
      const pairs: Array<[string, int]> = [[longKey, 1]];
      const record: Record<string, Any> = Object.fromEntries<int>(pairs) as Record<string, Any>;
      const k: string[] = Object.keys(record);
      let rResult1: int = k.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = k[0];
      let eExpected2: string = longKey;
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_0800
     * @tc.name objectPropertyKeyPart04Case008
     * @tc.desc Verify Object.keys on Record with keys name and year leaves ArkTS and 2026 intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "name": "ArkTS", "year": 2026 };
      const keyBefore: string = (record["name"]! as Object).toString();
      const valBefore: string = (record["year"]! as Object).toString();
      Object.keys(record);
      let rResult1: string = (record["name"]! as Object).toString();
      let eExpected1: string = keyBefore;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = (record["year"]! as Object).toString();
      let eExpected2: string = valBefore;
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_0900
     * @tc.name objectPropertyKeyPart04Case009
     * @tc.desc Verify Object.values on Record x/a and y/7 leaves both values unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'x': 'a', 'y': 7 };
      const kBefore: string = (record['x']! as Object).toString();
      const vBefore: string = (record['y']! as Object).toString();
      Object.values(record);
      let rResult1: string = (record['x']! as Object).toString();
      let eExpected1: string = kBefore;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = (record['y']! as Object).toString();
      let eExpected2: string = vBefore;
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_1000
     * @tc.name objectPropertyKeyPart04Case010
     * @tc.desc Verify Object.getOwnPropertyNames on Record name/ArkTS returns the single key name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "name": "ArkTS" };
      const names: string[] = Object.getOwnPropertyNames(record);
      let rResult1: int = names.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = names[0];
      let eExpected2: string = "name";
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_1100
     * @tc.name objectPropertyKeyPart04Case011
     * @tc.desc Verify Object.hasOwn returns true for key score on a one-key Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "score": 88 };
      const vBefore: string = (record["score"]! as Object).toString();
      const found: boolean = Object.hasOwn(record, "score");
      expect(found).assertTrue();
      let rResult1: string = (record["score"]! as Object).toString();
      let eExpected1: string = vBefore;
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_1200
     * @tc.name objectPropertyKeyPart04Case012
     * @tc.desc Verify hasOwnProperty returns true for key flag on a Record holding boolean true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "flag": true };
      const found: boolean = record.hasOwnProperty("flag");
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_1300
     * @tc.name objectPropertyKeyPart04Case013
     * @tc.desc Verify a plain new Object has zero keys and toLocaleString gives [object Object]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      let rResult1: int = Object.keys(obj).length;
      let eExpected1: int = 0;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = obj.toLocaleString();
      let eExpected2: string = "[object Object]";
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_1400
     * @tc.name objectPropertyKeyPart04Case014
     * @tc.desc Verify toLocaleString with locale zh-CN on a new Object keeps hash and zero keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const hashBefore: int = obj.$_hashCode();
      const locZh: string = obj.toLocaleString("zh-CN");
      expect(locZh).assertEqual("[object Object]");
      let rResult1: number = obj.$_hashCode();
      let eExpected1: number = hashBefore;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: int = Object.keys(obj).length;
      let eExpected2: int = 0;
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_1500
     * @tc.name objectPropertyKeyPart04Case015
     * @tc.desc Verify Object.keys of a one-field Box instance returns one key and stable hash
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box: Pk4Box001 = new Pk4Box001();
      const h1: int = box.$_hashCode();
      let rResult1: int = Object.keys(box).length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: number = box.$_hashCode();
      let eExpected2: number = h1;
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_1600
     * @tc.name objectPropertyKeyPart04Case016
     * @tc.desc Verify Object.keys of Record name/ArkTS and year/2026 returns name then year
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "name": "ArkTS", "year": 2026 };
      expect(Object.keys(record)).assertDeepEquals(["name", "year"]);
      let rResult1: string = (record["name"]! as Object).toString();
      let eExpected1: string = "ArkTS";
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = (record["year"]! as Object).toString();
      let eExpected2: string = "2026";
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_1700
     * @tc.name objectPropertyKeyPart04Case017
     * @tc.desc Verify Object.assign adds source key year after existing target key name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { "name": "ArkTS" };
      const source: Record<string, Any> = { "year": 2026 };
      Object.assign(target, source);
      const keys: string[] = Object.keys(target);
      let rResult1: int = keys.length;
      let eExpected1: int = 2;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = keys[1];
      let eExpected2: string = "year";
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_1800
     * @tc.name objectPropertyKeyPart04Case018
     * @tc.desc Verify Object.assign of a two-key source into a two-key target yields four keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'a': 1, 'b': 2 };
      const source: Record<string, Any> = { 'c': 3, 'd': 4 };
      Object.assign(target, source);
      let rResult1: int = Object.keys(target).length;
      let eExpected1: int = 4;
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_1900
     * @tc.name objectPropertyKeyPart04Case019
     * @tc.desc Verify Object.values after assign returns source string value new at index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'a': 1 };
      const source: Record<string, Any> = { 'b': "new" };
      Object.assign(target, source);
      const vals: Any[] = Object.values(target);
      let rResult1: Any = vals[1];
      let eExpected1: string = "new";
      expect(rResult1 as string).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_2000
     * @tc.name objectPropertyKeyPart04Case020
     * @tc.desc Verify Object.entries after assign returns one pair with key k and value 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      const source: Record<string, Any> = { 'k': 9 };
      Object.assign(target, source);
      const entries = Object.entries(target);
      let rResult1: int = entries.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = entries[0]![0];
      let eExpected2: string = 'k';
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: Any = entries[0]![1];
      let eExpected3: int = 9;
      expect(rResult3 as int).assertEqual(eExpected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_2100
     * @tc.name objectPropertyKeyPart04Case021
     * @tc.desc Verify Object.assign of key year into an empty Record gives first own name year
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      const source: Record<string, Any> = { "year": 2026 };
      Object.assign(target, source);
      const names: string[] = Object.getOwnPropertyNames(target);
      let rResult1: string = names[0];
      let eExpected1: string = "year";
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_2200
     * @tc.name objectPropertyKeyPart04Case022
     * @tc.desc Verify Object.hasOwn is true for key name after assigning name/ArkTS into an empty target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      const source: Record<string, Any> = { "name": "ArkTS" };
      Object.assign(target, source);
      let rResult1: boolean = Object.hasOwn(target, "name");
      expect(rResult1).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_2300
     * @tc.name objectPropertyKeyPart04Case023
     * @tc.desc Verify Object.assign overwrites name keeping three keys ordered first, name, last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { "first": 1, "name": "Old", "last": 3 };
      const source: Record<string, Any> = { "name": "New" };
      Object.assign(target, source);
      const keys: string[] = Object.keys(target);
      let rResult1: int = keys.length;
      let eExpected1: int = 3;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = keys[0];
      let eExpected2: string = "first";
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: string = keys[1];
      let eExpected3: string = "name";
      expect(rResult3).assertEqual(eExpected3);
      let rResult4: string = keys[2];
      let eExpected4: string = "last";
      expect(rResult4).assertEqual(eExpected4);
      let rResult5: Any = target["name"];
      let eExpected5: string = "New";
      expect(rResult5 as string).assertEqual(eExpected5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_2400
     * @tc.name objectPropertyKeyPart04Case024
     * @tc.desc Verify Object.values shows overwritten value New after assign on key name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { "name": "Old" };
      const source: Record<string, Any> = { "name": "New" };
      Object.assign(target, source);
      const vals: Any[] = Object.values(target);
      let rResult1: Any = vals[0];
      let eExpected1: string = "New";
      expect(rResult1 as string).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_2500
     * @tc.name objectPropertyKeyPart04Case025
     * @tc.desc Verify Object.assign adds two source keys to a one-key target giving three keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'a': 1 };
      const beforeCount: number = Object.keys(target).length;
      const source: Record<string, Any> = { 'b': 2, 'c': 3 };
      Object.assign(target, source);
      let rResult1: int = Object.keys(target).length;
      let eExpected1: number = beforeCount + 2;
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_2600
     * @tc.name objectPropertyKeyPart04Case026
     * @tc.desc Verify Object.assign returns the target so adding key b to the result mutates target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      const source: Record<string, Any> = { 'a': 1 };
      const result: Record<string, Any> = Object.assign(target, source);
      result['b'] = 2;
      let rResult1: int = Object.keys(target).length;
      let eExpected1: int = 2;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = (target['b']! as Object).toString();
      let eExpected2: string = '2';
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_2700
     * @tc.name objectPropertyKeyPart04Case027
     * @tc.desc Verify adding key y to an assign target is visible through the returned result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Record<string, Any> = { 'x': 1 };
      const target: Record<string, Any> = {};
      const result: Record<string, Any> = Object.assign(target, source);
      target['y'] = 2;
      let rResult1: int = Object.keys(result).length;
      let eExpected1: int = 2;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = (result['y']! as Object).toString();
      let eExpected2: string = '2';
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_2800
     * @tc.name objectPropertyKeyPart04Case028
     * @tc.desc Verify Object.assign from a plain new Object leaves Record key name unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { "name": "ArkTS" };
      const before: string[] = Object.keys(target);
      Object.assign(target, new Object());
      let rResult1: int = Object.keys(target).length;
      let eExpected1: number = before.length;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = Object.keys(target)[0];
      let eExpected2: string = before[0];
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_2900
     * @tc.name objectPropertyKeyPart04Case029
     * @tc.desc Verify Object.assign of key b into Record a/1 then adding c gives three keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Record<string, Any> = { 'b': 2 };
      const target: Record<string, Any> = { 'a': 1 };
      const ret: Record<string, Any> = Object.assign(target, source);
      ret['c'] = 3;
      let rResult1: int = Object.keys(target).length;
      let eExpected1: int = 3;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = (target['c']! as Object).toString();
      let eExpected2: string = '3';
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_3000
     * @tc.name objectPropertyKeyPart04Case030
     * @tc.desc Verify Object.entries on a Record built from pairs a/1 and b/2 returns pair b/2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: Array<[string, int]> = [
        ['a', 1],
        ['b', 2],
      ];
      const rec: Record<string, Any> = Object.fromEntries<int>(pairs) as Record<string, Any>;
      const entries = Object.entries(rec);
      let rResult1: int = entries.length;
      let eExpected1: int = 2;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = entries[1]![0];
      let eExpected2: string = 'b';
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: Any = entries[1]![1];
      let eExpected3: int = 2;
      expect(rResult3 as int).assertEqual(eExpected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_3100
     * @tc.name objectPropertyKeyPart04Case031
     * @tc.desc Verify Object.hasOwn is true for boolean key flag built via fromEntries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: Array<[string, boolean]> = [["flag", true]];
      const rec: Record<string, boolean> = Object.fromEntries<boolean>(pairs);
      let rResult1: boolean = Object.hasOwn(rec, "flag");
      expect(rResult1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_3200
     * @tc.name objectPropertyKeyPart04Case032
     * @tc.desc Verify hasOwnProperty is true for string key k on a fromEntries Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: Array<[string, string]> = [['k', 'v']];
      const rec: Record<string, string> = Object.fromEntries<string>(pairs);
      let rResult1: boolean = rec.hasOwnProperty('k');
      expect(rResult1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_3300
     * @tc.name objectPropertyKeyPart04Case033
     * @tc.desc Verify Object.getOwnPropertyNames on a fromEntries pair year/2026 returns year
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: Array<[string, int]> = [["year", 2026]];
      const rec: Record<string, Any> = Object.fromEntries<int>(pairs) as Record<string, Any>;
      const names: string[] = Object.getOwnPropertyNames(rec);
      let rResult1: string = names[0];
      let eExpected1: string = "year";
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_3400
     * @tc.name objectPropertyKeyPart04Case034
     * @tc.desc Verify fromEntries with duplicate key a keeps one own key with value 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: Array<[string, int]> = [
        ['a', 1],
        ['a', 2],
      ];
      const rec: Record<string, Any> = Object.fromEntries<int>(pairs) as Record<string, Any>;
      let rResult1: int = Object.keys(rec).length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: boolean = Object.hasOwn(rec, 'a');
      expect(rResult2).assertTrue();
      let rResult3: Any = rec['a']!;
      let eExpected3: int = 2;
      expect(rResult3 as int).assertEqual(eExpected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_3500
     * @tc.name objectPropertyKeyPart04Case035
     * @tc.desc Verify assigning Record b/2 into a fromEntries Record a/1 gives two keys a and b
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: Array<[string, int]> = [['a', 1]];
      const rec: Record<string, Any> = Object.fromEntries<int>(pairs) as Record<string, Any>;
      const source: Record<string, int> = { 'b': 2 };
      const merged: Record<string, Any> = Object.assign(rec, source);
      let rResult1: int = Object.keys(merged).length;
      let eExpected1: int = 2;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = (merged['b']! as Object).toString();
      let eExpected2: string = '2';
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_3600
     * @tc.name objectPropertyKeyPart04Case036
     * @tc.desc Verify Object.keys matches Object.getOwnPropertyNames for Record a, b and c
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2, 'c': 3 };
      const keys: string[] = Object.keys(record);
      const names: string[] = Object.getOwnPropertyNames(record);
      let rResult1: string = keys[0];
      let eExpected1: string = names[0];
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = keys[1];
      let eExpected2: string = names[1];
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: string = keys[2];
      let eExpected3: string = names[2];
      expect(rResult3).assertEqual(eExpected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_3700
     * @tc.name objectPropertyKeyPart04Case037
     * @tc.desc Verify Object.keys and Object.values align for Record with keys first and second
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "first": 'F', "second": 'S' };
      const keys: string[] = Object.keys(record);
      const vals: Any[] = Object.values(record);
      let rResult1: string = keys[0];
      let eExpected1: string = "first";
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: Any = vals[0];
      let eExpected2: string = 'F';
      expect(rResult2 as string).assertEqual(eExpected2);
      let rResult3: string = keys[1];
      let eExpected3: string = "second";
      expect(rResult3).assertEqual(eExpected3);
      let rResult4: Any = vals[1];
      let eExpected4: string = 'S';
      expect(rResult4 as string).assertEqual(eExpected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_3800
     * @tc.name objectPropertyKeyPart04Case038
     * @tc.desc Verify Object.entries pair keys match Object.keys for Record {x:1,y:2}
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'x': 1, 'y': 2 };
      const keys: string[] = Object.keys(record);
      const entries = Object.entries(record);
      let rResult1: string = entries[0]![0];
      let eExpected1: string = keys[0];
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = entries[1]![0];
      let eExpected2: string = keys[1];
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_3900
     * @tc.name objectPropertyKeyPart04Case039
     * @tc.desc Verify Object.entries values equal Object.values for Record x/10 and y/20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'x': 10, 'y': 20 };
      const vals: Any[] = Object.values(record);
      const entries = Object.entries(record);
      let rResult1: Any = entries[0]![1];
      let eExpected1: Any = vals[0];
      expect(rResult1 as Object).assertEqual(eExpected1 as Object);
      let rResult2: Any = entries[1]![1];
      let eExpected2: Any = vals[1];
      expect(rResult2 as Object).assertEqual(eExpected2 as Object);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_4000
     * @tc.name objectPropertyKeyPart04Case040
     * @tc.desc Verify entries round-trip through fromEntries keeps keys a and b in that order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: Array<[string, int]> = [
        ['a', 1],
        ['b', 2],
      ];
      const rec: Record<string, Any> = Object.fromEntries<int>(pairs) as Record<string, Any>;
      const entries = Object.entries(rec);
      const backPairs: Array<[string, Any]> = [];
      for (let i: int = 0; i < entries.length; i++) {
        backPairs.push([entries[i]![0]!, entries[i]![1]!]);
      }
      const back: Record<string, Any> = Object.fromEntries(backPairs);
      const backKeys: string[] = Object.keys(back);
      let rResult1: int = backKeys.length;
      let eExpected1: int = 2;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = backKeys[0];
      let eExpected2: string = 'a';
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: string = backKeys[1];
      let eExpected3: string = 'b';
      expect(rResult3).assertEqual(eExpected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_4100
     * @tc.name objectPropertyKeyPart04Case041
     * @tc.desc Verify fromEntries of pairs n/v1 and m/v2 maps both string values back
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: Array<[string, string]> = [
        ['n', "v1"],
        ['m', "v2"],
      ];
      const rec: Record<string, string> = Object.fromEntries<string>(pairs);
      let rResult1: string = rec['n']!;
      let eExpected1: string = "v1";
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = rec['m']!;
      let eExpected2: string = "v2";
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_4200
     * @tc.name objectPropertyKeyPart04Case042
     * @tc.desc Verify Object.hasOwn and hasOwnProperty are both true for key name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "name": "ArkTS" };
      let rResult1: boolean = Object.hasOwn(record, "name");
      expect(rResult1).assertTrue();
      let rResult2: boolean = record.hasOwnProperty("name");
      expect(rResult2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_4300
     * @tc.name objectPropertyKeyPart04Case043
     * @tc.desc Verify Object.hasOwn and hasOwnProperty are both false for absent key missing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "name": "ArkTS" };
      let rResult1: boolean = Object.hasOwn(record, "missing");
      expect(rResult1).assertFalse();
      let rResult2: boolean = record.hasOwnProperty("missing");
      expect(rResult2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_4400
     * @tc.name objectPropertyKeyPart04Case044
     * @tc.desc Verify Object.entries on Record {x:1,y:2} returns two pairs beginning with key x
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'x': 1, 'y': 2 };
      let rResult1: int = Object.entries(record).length;
      let eExpected1: number = 2;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = Object.entries(record)[0]![0];
      let eExpected2: string = 'x';
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_4500
     * @tc.name objectPropertyKeyPart04Case045
     * @tc.desc Verify Object.keys matches getOwnPropertyNames for a two-field Rect instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Rect001 = new Rect001();
      const keys: string[] = Object.keys(r);
      const names: string[] = Object.getOwnPropertyNames(r);
      let rResult1: string = keys[0];
      let eExpected1: string = names[0];
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = keys[1];
      let eExpected2: string = names[1];
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_4600
     * @tc.name objectPropertyKeyPart04Case046
     * @tc.desc Verify Object.keys of the values array returns index 0 first for a three-key Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2, 'c': 3 };
      const inner: Any[] = Object.values(record);
      const outer: string[] = Object.keys(inner);
      let rResult1: int = outer.length;
      let eExpected1: int = 3;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = outer[0];
      let eExpected2: string = '0';
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_4700
     * @tc.name objectPropertyKeyPart04Case047
     * @tc.desc Verify Object.keys of the entries array returns index 1 for a two-entry array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'x': 1, 'y': 2 };
      const inner = Object.entries(record);
      const outer: string[] = Object.keys(inner);
      let rResult1: int = outer.length;
      let eExpected1: int = 2;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = outer[1];
      let eExpected2: string = '1';
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_4800
     * @tc.name objectPropertyKeyPart04Case048
     * @tc.desc Verify nested Object.assign of sources a/1 and b/2 yields two keys ending b
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Record<string, Any> = {};
      const s1: Record<string, Any> = { 'a': 1 };
      const s2: Record<string, Any> = { 'b': 2 };
      const result: Record<string, Any> = Object.assign(Object.assign(t, s1), s2);
      let rResult1: int = Object.keys(result).length;
      let eExpected1: int = 2;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = (result['b']! as Object).toString();
      let eExpected2: string = '2';
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_4900
     * @tc.name objectPropertyKeyPart04Case049
     * @tc.desc Verify Object.assign of a fromEntries pair c/3 into Record a/1 gives two keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: Array<[string, int]> = [['c', 3]];
      const target: Record<string, Any> = { 'a': 1 };
      const merged: Record<string, Any> = Object.assign(target, Object.fromEntries<int>(pairs) as Record<string, Any>);
      let rResult1: int = Object.keys(merged).length;
      let eExpected1: int = 2;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = (merged['c']! as Object).toString();
      let eExpected2: string = '3';
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_5000
     * @tc.name objectPropertyKeyPart04Case050
     * @tc.desc Verify fromEntries of pair ok/true stores boolean true under key ok
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: Array<[string, boolean]> = [["ok", true]];
      const rec: Record<string, boolean> = Object.fromEntries<boolean>(pairs);
      let rResult1: boolean = rec["ok"]!;
      expect(rResult1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_5100
     * @tc.name objectPropertyKeyPart04Case051
     * @tc.desc Verify Object.hasOwn is true for name on the result of assigning name/ArkTS
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      const source: Record<string, Any> = { "name": "ArkTS" };
      let rResult1: boolean = Object.hasOwn(Object.assign(target, source), "name");
      expect(rResult1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_5200
     * @tc.name objectPropertyKeyPart04Case052
     * @tc.desc Verify Object.values after assign returns two values ending with source value 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'a': 1 };
      const source: Record<string, Any> = { 'b': 2 };
      const vals: Any[] = Object.values(Object.assign(target, source));
      let rResult1: int = vals.length;
      let eExpected1: int = 2;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: Any = vals[1];
      let eExpected2: int = 2;
      expect(rResult2 as int).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_5300
     * @tc.name objectPropertyKeyPart04Case053
     * @tc.desc Verify Object.entries of the assign result holds one pair with value 7 for key k
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      const source: Record<string, Any> = { 'k': 7 };
      const entries = Object.entries(Object.assign(target, source));
      let rResult1: int = entries.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: Any = entries[0]![1];
      let eExpected2: int = 7;
      expect(rResult2 as int).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_5400
     * @tc.name objectPropertyKeyPart04Case054
     * @tc.desc Verify Object.keys of the assign result returns the single key year
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      const source: Record<string, Any> = { "year": 2026 };
      const keys: string[] = Object.keys(Object.assign(target, source));
      let rResult1: int = keys.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = keys[0];
      let eExpected2: string = "year";
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_5500
     * @tc.name objectPropertyKeyPart04Case055
     * @tc.desc Verify Object.hasOwn is true for first key year of a one-key Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "year": 2026 };
      const keys: string[] = Object.keys(record);
      let rResult1: boolean = Object.hasOwn(record, keys[0]);
      expect(rResult1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_5600
     * @tc.name objectPropertyKeyPart04Case056
     * @tc.desc Verify toString and toLocaleString on assigned Record a/1 b/2 give a,1,b,2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'a': 1 };
      const source: Record<string, Any> = { 'b': 2 };
      Object.assign(target, source);
      let rResult1: string = target.toString();
      let eExpected1: string = "a,1,b,2";
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = target.toLocaleString();
      let eExpected2: string = "a,1,b,2";
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_5700
     * @tc.name objectPropertyKeyPart04Case057
     * @tc.desc Verify Object.assign of three sources yields keys a, b and c in that order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      const s1: Record<string, Any> = { 'a': 1 };
      const s2: Record<string, Any> = { 'b': 2 };
      const s3: Record<string, Any> = { 'c': 3 };
      Object.assign(target, s1, s2, s3);
      const keys: string[] = Object.keys(target);
      let rResult1: int = keys.length;
      let eExpected1: int = 3;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = keys[2];
      let eExpected2: string = 'c';
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_5800
     * @tc.name objectPropertyKeyPart04Case058
     * @tc.desc Verify Object.assign of sources first/second orders target keys first then second
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      const s1: Record<string, Any> = { "first": 1 };
      const s2: Record<string, Any> = { "second": 2 };
      Object.assign(target, s1, s2);
      let rResult1: string = Object.keys(target)[0];
      let eExpected1: string = "first";
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = Object.keys(target)[1];
      let eExpected2: string = "second";
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_5900
     * @tc.name objectPropertyKeyPart04Case059
     * @tc.desc Verify Object.assign with sources v/one then v/two keeps value two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      const s1: Record<string, Any> = { 'v': "one" };
      const s2: Record<string, Any> = { 'v': "two" };
      Object.assign(target, s1, s2);
      let rResult1: string = (target['v']! as Object).toString();
      let eExpected1: string = "two";
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_6000
     * @tc.name objectPropertyKeyPart04Case060
     * @tc.desc Verify Object.assign from sources from1 and from2 keeps target key own with T
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { "own": 'T' };
      const s1: Record<string, Any> = { "from1": 1 };
      const s2: Record<string, Any> = { "from2": 2 };
      Object.assign(target, s1, s2);
      let rResult1: string = (target["own"]! as Object).toString();
      let eExpected1: string = 'T';
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: int = Object.keys(target).length;
      let eExpected2: int = 3;
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_6100
     * @tc.name objectPropertyKeyPart04Case061
     * @tc.desc Verify Object.values after a multi-source assign shows a as 1 and b as 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'a': 0 };
      const s1: Record<string, Any> = { 'a': 1, 'b': 2 };
      const s2: Record<string, Any> = { 'b': 3 };
      Object.assign(target, s1, s2);
      const vals: Any[] = Object.values(target);
      let rResult1: Any = vals[0];
      let eExpected1: int = 1;
      expect(rResult1 as int).assertEqual(eExpected1);
      let rResult2: Any = vals[1];
      let eExpected2: int = 3;
      expect(rResult2 as int).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_6200
     * @tc.name objectPropertyKeyPart04Case062
     * @tc.desc Verify Object.entries after assign has three pairs ending with key u
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 't': 0 };
      const s1: Record<string, Any> = { 's': 1 };
      const s2: Record<string, Any> = { 'u': 2 };
      Object.assign(target, s1, s2);
      const entries = Object.entries(target);
      let rResult1: int = entries.length;
      let eExpected1: int = 3;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = entries[2]![0];
      let eExpected2: string = 'u';
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_6300
     * @tc.name objectPropertyKeyPart04Case063
     * @tc.desc Verify Object.assign with empty object source only copies defined keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      const empty: Object = new Object();
      const src: Record<string, Any> = { 'x': 1 };
      Object.assign(target, empty, src);
      let rResult1: int = Object.keys(target).length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = (target['x']! as Object).toString();
      let eExpected2: string = '1';
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_6400
     * @tc.name objectPropertyKeyPart04Case064
     * @tc.desc Verify Object.assign copies class instance and Record source keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      const inst: Origin001 = new Origin001();
      const src: Record<string, Any> = { "label": 'L' };
      Object.assign(target, inst, src);
      let rResult1: int = Object.keys(target).length;
      let eExpected1: int = 2;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = (target["originX"]! as Object).toString();
      let eExpected2: string = '0';
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: string = (target["label"]! as Object).toString();
      let eExpected3: string = 'L';
      expect(rResult3).assertEqual(eExpected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_6500
     * @tc.name objectPropertyKeyPart04Case065
     * @tc.desc Verify Object.assign copies array index keys and Record source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [10, 20];
      const target: Record<string, Any> = {};
      const src: Record<string, Any> = { "tag": 'T' };
      Object.assign(target, arr, src);
      let rResult1: string = (target['0']! as Object).toString();
      let eExpected1: string = "10";
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = (target['1']! as Object).toString();
      let eExpected2: string = "20";
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: string = (target["tag"]! as Object).toString();
      let eExpected3: string = 'T';
      expect(rResult3).assertEqual(eExpected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_6600
     * @tc.name objectPropertyKeyPart04Case066
     * @tc.desc Verify chained assign of Record a/1 with a fromEntries pair b/2 gives two keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t1: Record<string, Any> = {};
      const s1: Record<string, Any> = { 'a': 1 };
      const t2: Record<string, Any> = Object.assign(t1, s1);
      const pairs: Array<[string, int]> = [['b', 2]];
      const t3: Record<string, Any> = Object.fromEntries<int>(pairs) as Record<string, Any>;
      const t4: Record<string, Any> = Object.assign(t2, t3);
      let rResult1: int = Object.keys(t4).length;
      let eExpected1: int = 2;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = (t4['b']! as Object).toString();
      let eExpected2: string = '2';
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_6700
     * @tc.name objectPropertyKeyPart04Case067
     * @tc.desc Verify hasOwn and hasOwnProperty are true for name after assign overwrites Old with New
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { "name": "Old" };
      const source: Record<string, Any> = { "name": "New" };
      Object.assign(target, source);
      let rResult1: boolean = Object.hasOwn(target, "name");
      expect(rResult1).assertTrue();
      let rResult2: boolean = target.hasOwnProperty("name");
      expect(rResult2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_6800
     * @tc.name objectPropertyKeyPart04Case068
     * @tc.desc Verify fromEntries of pairs z/26 then a/1 keeps key order z then a
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: Array<[string, int]> = [
        ['z', 26],
        ['a', 1],
      ];
      const rec: Record<string, Any> = Object.fromEntries<int>(pairs) as Record<string, Any>;
      const keys: string[] = Object.keys(rec);
      let rResult1: string = keys[0];
      let eExpected1: string = 'z';
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = keys[1];
      let eExpected2: string = 'a';
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_6900
     * @tc.name objectPropertyKeyPart04Case069
     * @tc.desc Verify Object.keys and Object.values after assign give k1/10 then k2/20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { "k1": 10 };
      const source: Record<string, Any> = { "k2": 20 };
      Object.assign(target, source);
      const keys: string[] = Object.keys(target);
      const vals: Any[] = Object.values(target);
      let rResult1: string = keys[0];
      let eExpected1: string = "k1";
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: Any = vals[0];
      let eExpected2: int = 10;
      expect(rResult2 as int).assertEqual(eExpected2);
      let rResult3: string = keys[1];
      let eExpected3: string = "k2";
      expect(rResult3).assertEqual(eExpected3);
      let rResult4: Any = vals[1];
      let eExpected4: int = 20;
      expect(rResult4 as int).assertEqual(eExpected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_7000
     * @tc.name objectPropertyKeyPart04Case070
     * @tc.desc Verify keys, values, entries and own names agree for Record name/ArkTS
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "name": "ArkTS" };
      const k1: string[] = Object.keys(record);
      const valsA: Any[] = Object.values(record);
      const entries1 = Object.entries(record);
      const n1: string[] = Object.getOwnPropertyNames(record);
      let rResult1: int = k1.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: Any = valsA[0];
      let eExpected2: string = "ArkTS";
      expect(rResult2 as string).assertEqual(eExpected2);
      let rResult3: Any = entries1[0]![1];
      let eExpected3: string = "ArkTS";
      expect(rResult3 as string).assertEqual(eExpected3);
      let rResult4: string = n1[0];
      let eExpected4: string = k1[0];
      expect(rResult4).assertEqual(eExpected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_7100
     * @tc.name objectPropertyKeyPart04Case071
     * @tc.desc Verify fromEntries keeps a Date value under key d with epoch time 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: Array<[string, Date]> = [['d', new Date(0)]];
      const rec: Record<string, Date> = Object.fromEntries<Date>(pairs);
      expect(rec['d']!.getTime()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_7200
     * @tc.name objectPropertyKeyPart04Case072
     * @tc.desc Verify Object.values after assign of keys s, n, b returns str, 42 and true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      const source: Record<string, Any> = { 's': "str", 'n': 42, 'b': true };
      Object.assign(target, source);
      const vals: Any[] = Object.values(target);
      let rResult1: Any = vals[0];
      let eExpected1: string = "str";
      expect(rResult1 as string).assertEqual(eExpected1);
      let rResult2: Any = vals[1];
      let eExpected2: int = 42;
      expect(rResult2 as int).assertEqual(eExpected2);
      let rResult3: Any = vals[2];
      expect(rResult3 as boolean).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_7300
     * @tc.name objectPropertyKeyPart04Case073
     * @tc.desc Verify toLocaleString with locale en returns [object Object] keeping hash stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const h1: int = obj.$_hashCode();
      const locEn: string = obj.toLocaleString("en");
      expect(locEn).assertEqual("[object Object]");
      const h2: int = obj.$_hashCode();
      expect(h1).assertEqual(h2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_7400
     * @tc.name objectPropertyKeyPart04Case074
     * @tc.desc Verify an empty fromEntries Record gains key x with value 1 after assign of Record x/1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pairs: Array<[string, int]> = [];
      const rec: Record<string, Any> = Object.fromEntries<int>(pairs) as Record<string, Any>;
      let rResult1: int = Object.keys(rec).length;
      let eExpected1: int = 0;
      expect(rResult1).assertEqual(eExpected1);
      const source: Record<string, Any> = { 'x': 1 };
      Object.assign(rec, source);
      let rResult2: int = Object.keys(rec).length;
      let eExpected2: int = 1;
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: string = (rec['x']! as Object).toString();
      let eExpected3: string = '1';
      expect(rResult3).assertEqual(eExpected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_7500
     * @tc.name objectPropertyKeyPart04Case075
     * @tc.desc Verify toLocaleString with locale zh-Hans-CN on a new Object gives [object Object]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const result: string = obj.toLocaleString("zh-Hans-CN");
      expect(result).assertEqual("[object Object]");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_7600
     * @tc.name objectPropertyKeyPart04Case076
     * @tc.desc Verify hasOwnProperty(1) returns true for array second index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [10, 20, 30];
      const rResult1: boolean = arr.hasOwnProperty(1);
      expect(rResult1).assertTrue();
      const rResult2: boolean = arr.hasOwnProperty(2);
      expect(rResult2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_7700
     * @tc.name objectPropertyKeyPart04Case077
     * @tc.desc Verify hasOwnProperty returns true for existing key and false for missing key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, number> = { "key": 42 } as Record<string, number>;
      const result: boolean = record.hasOwnProperty("key");
      expect(result).assertTrue();
      const hasMissingKey: boolean = record.hasOwnProperty("missing");
      expect(hasMissingKey).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_7800
     * @tc.name objectPropertyKeyPart04Case078
     * @tc.desc Verify getOwnPropertyNames and hasOwn on object with NaN Infinity values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "nan": Number.NaN, "inf": Number.POSITIVE_INFINITY };
      const names: string[] = Object.getOwnPropertyNames(record);
      let rResult1: int = names.length;
      let eExpected1: int = 2;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: boolean = Object.hasOwn(record, "nan");
      expect(rResult2).assertTrue();
      let rResult3: boolean = Object.hasOwn(record, "inf");
      expect(rResult3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_7900
     * @tc.name objectPropertyKeyPart04Case079
     * @tc.desc Verify getOwnPropertyNames includes key holding Map value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('k', 1);
      const record: Record<string, Any> = { "map": m, "num": 7 };
      const names: string[] = Object.getOwnPropertyNames(record);
      let rResult1: int = names.length;
      let eExpected1: int = 2;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = names[0];
      let eExpected2: string = "map";
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: boolean = Object.hasOwn(record, "map");
      expect(rResult3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_8000
     * @tc.name objectPropertyKeyPart04Case080
     * @tc.desc Verify entries returns pair with Map value unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('k', 1);
      const record: Record<string, Any> = { "map": m };
      const entries = Object.entries(record);
      let rResult1: int = entries.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = entries[0]![0];
      let eExpected2: string = "map";
      expect(rResult2).assertEqual(eExpected2);
      const got: Map<string, int> = entries[0]![1] as Map<string, int>;
      expect(got).assertEqual(m);
      let rResult3: int = got.get('k')!;
      let eExpected3: int = 1;
      expect(rResult3).assertEqual(eExpected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part04_8100
     * @tc.name objectPropertyKeyPart04Case081
     * @tc.desc Verify Object.hasOwn is true for k0 and k9999 and false for missing in a 10000-key Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart04Case081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = {};
      for (let i: int = 0; i < 10000; i++) {
        record['k' + i] = i;
      }
      let rResult1: boolean = Object.hasOwn(record, "k0");
      expect(rResult1).assertTrue();
      let rResult2: boolean = Object.hasOwn(record, "k9999");
      expect(rResult2).assertTrue();
      let rResult3: boolean = Object.hasOwn(record, "missing");
      expect(rResult3).assertFalse();
      let rResult4: int = Object.keys(record).length;
      let eExpected4: int = 10000;
      expect(rResult4).assertEqual(eExpected4);
      let rResult5: string = Object.keys(record)[0];
      let eExpected5: string = "k0";
      expect(rResult5).assertEqual(eExpected5);
      let rResult6: string = Object.keys(record)[9999];
      let eExpected6: string = "k9999";
      expect(rResult6).assertEqual(eExpected6);
    });
  });
}
