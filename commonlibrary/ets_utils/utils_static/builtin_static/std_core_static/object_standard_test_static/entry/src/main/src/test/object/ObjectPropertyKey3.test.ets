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

class Pk3Point002 {
  x: number = 3;
  y: number = 4;
}
class Pk3Point003 {
  x: number = 3;
  y: number = 4;
}
class Pk3Point004 {
  x: number = 3;
  y: number = 4;
}
class Pk3Point005 {
  x: number = 3;
}
class Pk3Point006 {
  x: number = 3;
}
class Point007 {
  x: number = 3;
}
class Point008 {
  x: number = 3;
}
class Point009 {
  x: number = 3;
}
class Point010 {
  x: number = 3;
}
class Src001 {
  name: string = "Src001";
}
class Src002 {
  name: string = "Src002";
}
class SrcA001 {
  name: string = 'A';
}
class SrcB001 {
  name: string = 'B';
}
class SrcA002 {
  name: string = 'A';
}
class SrcB002 {
  name: string = 'B';
}

export default function ObjectPropertyKey3Test(): void {
  describe("ObjectPropertyKey3Test", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part03_0100
     * @tc.name objectPropertyKeyPart03Case001
     * @tc.desc Verify the single value of a Record holding a Date is still a Date instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart03Case001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'd': new Date(0) };
      const values = Object.values(record);
      let rResult1: Any = values[0] instanceof Date;
      expect(rResult1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part03_0200
     * @tc.name objectPropertyKeyPart03Case002
     * @tc.desc Verify Object.values call does not alter Record property value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart03Case002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "name": "ArkTS" };
      const before: string = (record["name"]! as Object).toString();
      Object.values(record);
      const after: string = (record["name"]! as Object).toString();
      expect(after).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part03_0300
     * @tc.name objectPropertyKeyPart03Case003
     * @tc.desc Verify Object.values of a one-key Record returns length 1 and the value 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart03Case003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'x': 1 };
      const valsA: Any[] = Object.values(record);
      let rResult1: int = valsA.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: Any = valsA[0]!;
      let eExpected2: int = 1;
      expect(rResult2 as int).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part03_0400
     * @tc.name objectPropertyKeyPart03Case004
     * @tc.desc Verify Object.values on a Point instance returns two numbers 3 and 4 in field order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart03Case004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Object.values(new Pk3Point002());
      let rResult1: int = values.length;
      let eExpected1: int = 2;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: Any = values[0]!;
      let eExpected2: number = 3;
      expect(rResult2 as number).assertEqual(eExpected2);
      let rResult3: Any = values[1]!;
      let eExpected3: number = 4;
      expect(rResult3 as number).assertEqual(eExpected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part03_0500
     * @tc.name objectPropertyKeyPart03Case005
     * @tc.desc Verify Object.values on int array [10,20,30] returns 3 items with 10 first and 30 last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart03Case005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [10, 20, 30];
      const values = Object.values(arr);
      let rResult1: int = values.length;
      let eExpected1: int = 3;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: Any = values[0]!;
      let eExpected2: int = 10;
      expect(rResult2 as int).assertEqual(eExpected2);
      let rResult3: Any = values[2]!;
      let eExpected3: int = 30;
      expect(rResult3 as int).assertEqual(eExpected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part03_0600
     * @tc.name objectPropertyKeyPart03Case006
     * @tc.desc Verify Object.entries on Record {a:1,b:2} returns second pair with key b and value 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart03Case006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2 };
      const entries = Object.entries(record);
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part03_0700
     * @tc.name objectPropertyKeyPart03Case007
     * @tc.desc Verify Object.entries of a Record with a null value yields one pair holding null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart03Case007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'n': null };
      const entries = Object.entries(record);
      let rResult1: int = entries.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
      let actualValue1: Any = entries[0]![1];
      let actualValue1IsNull: boolean = actualValue1 === null;
      expect(actualValue1IsNull).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part03_0800
     * @tc.name objectPropertyKeyPart03Case008
     * @tc.desc Verify Object.entries keeps numeric string key 0 for Record whose value is zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart03Case008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { '0': "zero" };
      const entries = Object.entries(record);
      let rResult1: string = entries[0]![0];
      let eExpected1: string = '0';
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: Any = entries[0]![1];
      let eExpected2: string = "zero";
      expect(rResult2 as string).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part03_0900
     * @tc.name objectPropertyKeyPart03Case009
     * @tc.desc Verify Object.entries on a Point instance returns 2 pairs starting with key x value 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart03Case009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const entries = Object.entries(new Pk3Point003());
      let rResult1: int = entries.length;
      let eExpected1: int = 2;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = entries[0]![0];
      let eExpected2: string = 'x';
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: Any = entries[0]![1];
      let eExpected3: number = 3;
      expect(rResult3 as number).assertEqual(eExpected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part03_1000
     * @tc.name objectPropertyKeyPart03Case010
     * @tc.desc Verify Object.entries on int array [10,20] returns index key 0 holding value 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart03Case010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [10, 20];
      const entries = Object.entries(arr);
      let rResult1: int = entries.length;
      let eExpected1: int = 2;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = entries[0]![0];
      let eExpected2: string = '0';
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: Any = entries[0]![1];
      let eExpected3: int = 10;
      expect(rResult3 as int).assertEqual(eExpected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part03_1100
     * @tc.name objectPropertyKeyPart03Case011
     * @tc.desc Verify getOwnPropertyNames of a one-key Record name/ArkTS lists only key name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart03Case011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "name": "ArkTS" };
      const names = Object.getOwnPropertyNames(record);
      let rResult1: int = names.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = names[0]!;
      let eExpected2: string = "name";
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part03_1200
     * @tc.name objectPropertyKeyPart03Case012
     * @tc.desc Verify getOwnPropertyNames of a two-key Record a/1 and b/2 lists keys a then b
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart03Case012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2 };
      const names = Object.getOwnPropertyNames(record);
      let rResult1: string = names[0]!;
      let eExpected1: string = 'a';
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = names[1]!;
      let eExpected2: string = 'b';
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part03_1300
     * @tc.name objectPropertyKeyPart03Case013
     * @tc.desc Verify getOwnPropertyNames keeps the numeric string key 0 of a one-key Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart03Case013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { '0': "zero" };
      const names = Object.getOwnPropertyNames(record);
      let rResult1: string = names[0]!;
      let eExpected1: string = '0';
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part03_1400
     * @tc.name objectPropertyKeyPart03Case014
     * @tc.desc Verify getOwnPropertyNames of a one-key Record x/1 returns a single name x
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart03Case014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'x': 1 };
      const names: string[] = Object.getOwnPropertyNames(record);
      let rResult1: int = names.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = names[0];
      let eExpected2: string = 'x';
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part03_1500
     * @tc.name objectPropertyKeyPart03Case015
     * @tc.desc Verify getOwnPropertyNames of a two-key Record equals Object.keys entry by entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart03Case015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2 };
      const names = Object.getOwnPropertyNames(record);
      const keys = Object.keys(record);
      let rResult1: int = names.length;
      let eExpected1: number = keys.length;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = names[0]!;
      let eExpected2: string = keys[0]!;
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: string = names[1]!;
      let eExpected3: string = keys[1]!;
      expect(rResult3).assertEqual(eExpected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part03_1600
     * @tc.name objectPropertyKeyPart03Case016
     * @tc.desc Verify getOwnPropertyNames of a class instance with fields x and y lists x then y
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart03Case016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const names = Object.getOwnPropertyNames(new Pk3Point004());
      let rResult1: int = names.length;
      let eExpected1: int = 2;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = names[0]!;
      let eExpected2: string = 'x';
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: string = names[1]!;
      let eExpected3: string = 'y';
      expect(rResult3).assertEqual(eExpected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part03_1700
     * @tc.name objectPropertyKeyPart03Case017
     * @tc.desc Verify getOwnPropertyNames of int array 10,20,30 returns 4 names starting at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart03Case017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [10, 20, 30];
      const names = Object.getOwnPropertyNames(arr);
      let rResult1: int = names.length;
      let eExpected1: int = 4;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = names[0]!;
      let eExpected2: string = '0';
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part03_1800
     * @tc.name objectPropertyKeyPart03Case018
     * @tc.desc Verify Object.hasOwn returns true for key x on a class instance declaring field x
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart03Case018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const has: boolean = Object.hasOwn(new Pk3Point005(), 'x');
      expect(has).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part03_1900
     * @tc.name objectPropertyKeyPart03Case019
     * @tc.desc Verify Object.hasOwn returns false for a missing key on a Point class instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart03Case019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const has: boolean = Object.hasOwn(new Pk3Point006(), "missing");
      expect(has).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part03_2000
     * @tc.name objectPropertyKeyPart03Case020
     * @tc.desc Verify Object.hasOwn returns false for an empty string key on a plain Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart03Case020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new Object();
      let rResult1: boolean = Object.hasOwn(obj, '');
      expect(rResult1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part03_2100
     * @tc.name objectPropertyKeyPart03Case021
     * @tc.desc Verify Object.hasOwn returns false for a 50-char repeated-a key on a plain Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart03Case021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new Object();
      const longKey: string = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";
      let rResult1: boolean = Object.hasOwn(obj, longKey);
      expect(rResult1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part03_2200
     * @tc.name objectPropertyKeyPart03Case022
     * @tc.desc Verify Object.hasOwn returns true for index 0 on int array 10,20,30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart03Case022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [10, 20, 30];
      let rResult1: boolean = Object.hasOwn(arr, 0);
      expect(rResult1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part03_2300
     * @tc.name objectPropertyKeyPart03Case023
     * @tc.desc Verify Object.hasOwn returns false for negative key -1 on int array [10,20,30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart03Case023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [10, 20, 30];
      let rResult1: boolean = Object.hasOwn(arr, -1);
      expect(rResult1).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part03_2400
     * @tc.name objectPropertyKeyPart03Case024
     * @tc.desc Verify hasOwnProperty returns true for key x on a class instance declaring only x
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart03Case024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p = new Point007();
      let rResult1: boolean = p.hasOwnProperty('x');
      expect(rResult1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part03_2500
     * @tc.name objectPropertyKeyPart03Case025
     * @tc.desc Verify hasOwnProperty returns false for y on a class instance declaring only x
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart03Case025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p = new Point008();
      let rResult1: boolean = p.hasOwnProperty('y');
      expect(rResult1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part03_2600
     * @tc.name objectPropertyKeyPart03Case026
     * @tc.desc Verify hasOwnProperty returns false for an empty string key on a plain Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart03Case026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new Object();
      let rResult1: boolean = obj.hasOwnProperty('');
      expect(rResult1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part03_2700
     * @tc.name objectPropertyKeyPart03Case027
     * @tc.desc Verify hasOwnProperty is true for key x on a Point009 class instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart03Case027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p = new Point009();
      expect(p.hasOwnProperty('x')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part03_2800
     * @tc.name objectPropertyKeyPart03Case028
     * @tc.desc Verify toString of a single-field class instance returns [object Object]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart03Case028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rResult1: string = new Point010().toString();
      let eExpected1: string = "[object Object]";
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part03_2900
     * @tc.name objectPropertyKeyPart03Case029
     * @tc.desc Verify toLocaleString with locale en on a plain Object returns [object Object]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart03Case029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new Object();
      let rResult1: string = obj.toLocaleString("en");
      let eExpected1: string = "[object Object]";
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part03_3000
     * @tc.name objectPropertyKeyPart03Case030
     * @tc.desc Verify two $_hashCode calls on a plain Object return equal hash values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart03Case030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new Object();
      const h1 = obj.$_hashCode();
      const h2 = obj.$_hashCode();
      expect(h1).assertEqual(h2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part03_3100
     * @tc.name objectPropertyKeyPart03Case031
     * @tc.desc Verify $_hashCode of a new plain Object is non-negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart03Case031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new Object();
      expect(obj.$_hashCode()).assertLargerOrEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part03_3200
     * @tc.name objectPropertyKeyPart03Case032
     * @tc.desc Verify $_hashCode of a three-element int array is stable across two calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart03Case032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const arr: int[] = [1, 2, 3];
      const h1: int = arr.$_hashCode();
      const h2: int = arr.$_hashCode();
      expect(h1).assertEqual(h2);});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part03_3300
     * @tc.name objectPropertyKeyPart03Case033
     * @tc.desc Verify Object.assign with a one-field class source returns the target object itself
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart03Case033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      const ret = Object.assign(target, new Src001());
      ret["name"] = "Changed";
      let rResult1: string = (target["name"]! as Object).toString();
      let eExpected1: string = "Changed";
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part03_3400
     * @tc.name objectPropertyKeyPart03Case034
     * @tc.desc Verify Object.assign copies class instance property value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart03Case034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { "name": "Old" };
      const ret = Object.assign(target, new Src002());
      let rResult1: string = (ret["name"]! as Object).toString();
      let eExpected1: string = "Src002";
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = (target["name"]! as Object).toString();
      let eExpected2: string = "Src002";
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part03_3500
     * @tc.name objectPropertyKeyPart03Case035
     * @tc.desc Verify Object.assign later source overrides earlier source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart03Case035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      Object.assign(target, new SrcA001(), new SrcB001());
      let rResult1: string = (target["name"]! as Object).toString();
      let eExpected1: string = 'B';
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part03_3600
     * @tc.name objectPropertyKeyPart03Case036
     * @tc.desc Verify chaining Object.assign twice with class instance sources leaves name B
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart03Case036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Record<string, Any> = {};
      const assign1 = Object.assign(t, new SrcA002());
      const assign2 = Object.assign(assign1, new SrcB002());
      let rResult1: string = (assign2["name"]! as Object).toString();
      let eExpected1: string = 'B';
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part03_3700
     * @tc.name objectPropertyKeyPart03Case037
     * @tc.desc Verify Object.assign with empty source preserves target value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart03Case037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'a': 100 };
      const ret = Object.assign(target, new Object());
      let rResult1: string = (ret['a']! as Object).toString();
      let eExpected1: string = "100";
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part03_3800
     * @tc.name objectPropertyKeyPart03Case038
     * @tc.desc Verify hasOwnProperty returns false for a 1001-char key on a one-key Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart03Case038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "name": "ArkTS" };
      let longKey: string = 'k';
      for (let i = 0; i < 1000; i++) {
        longKey = longKey + 'x';
      }
      const hit: boolean = record.hasOwnProperty(longKey);
      expect(hit).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part03_3900
     * @tc.name objectPropertyKeyPart03Case039
     * @tc.desc Verify hasOwnProperty returns false for numeric key -1 on Record with key name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart03Case039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "name": "ArkTS" };
      const hit: boolean = record.hasOwnProperty(-1);
      expect(hit).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part03_4000
     * @tc.name objectPropertyKeyPart03Case040
     * @tc.desc Verify hasOwnProperty returns true for numeric string key 0 on a one-key Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart03Case040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { '0': "zero" };
      const hit: boolean = record.hasOwnProperty('0');
      expect(hit).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part03_4100
     * @tc.name objectPropertyKeyPart03Case041
     * @tc.desc Verify Object.hasOwn returns false for a CJK key absent from a one-key Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart03Case041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "name": "ArkTS" };
      const hit: boolean = Object.hasOwn(record, "属性名");
      expect(hit).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part03_4200
     * @tc.name objectPropertyKeyPart03Case042
     * @tc.desc Verify Object.hasOwn returns false for index 999 on an int array of length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart03Case042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: int[] = [10, 20];
      const hit: boolean = Object.hasOwn(values, 999);
      expect(hit).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part03_4300
     * @tc.name objectPropertyKeyPart03Case043
     * @tc.desc Verify Object.values on Record {name:ArkTS} returns the single value ArkTS
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart03Case043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "name": "ArkTS" };
      const result = Object.values(record);
      let rResult1: int = result.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: Any = result[0];
      let eExpected2: string = "ArkTS";
      expect(rResult2 as string).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part03_4400
     * @tc.name objectPropertyKeyPart03Case044
     * @tc.desc Verify Object.keys of a Record with a CJK key returns that CJK key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart03Case044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "中文": 1 };
      const result = Object.keys(record);
      let rResult1: string = result[0];
      let eExpected1: string = "中文";
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part03_4500
     * @tc.name objectPropertyKeyPart03Case045
     * @tc.desc Verify Object.values on Record with numeric string key 0 returns value zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart03Case045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { '0': "zero" };
      const result = Object.values(record);
      let rResult1: Any = result[0];
      let eExpected1: string = "zero";
      expect(rResult1 as string).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part03_4600
     * @tc.name objectPropertyKeyPart03Case046
     * @tc.desc Verify Object.entries of a Record with empty string key yields one pair value empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart03Case046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { '': "empty" };
      const result = Object.entries(record);
      let rResult1: int = result.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
      let rResult3: string = result[0]![1] as string;
      let eExpected3: string = "empty";
      expect(rResult3).assertEqual(eExpected3);
      let rResult2: Any = result[0]![0];
      let eExpected2: string = '';
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part03_4700
     * @tc.name objectPropertyKeyPart03Case047
     * @tc.desc Verify getOwnPropertyNames of a Record with a space-containing key returns that key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart03Case047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "key with spaces": 'v' };
      const result = Object.getOwnPropertyNames(record);
      let rResult1: string = result[0];
      let eExpected1: string = "key with spaces";
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part03_4800
     * @tc.name objectPropertyKeyPart03Case048
     * @tc.desc Verify record toString returns "name,ArkTS"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart03Case048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "name": "ArkTS" };
      const s: String = record.toString();
      expect(s).assertEqual("name,ArkTS");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part03_4900
     * @tc.name objectPropertyKeyPart03Case049
     * @tc.desc Verify toLocaleString with a 502-char locale on a plain Object returns [object Object]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart03Case049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new Object();
      let locale: string = "en";
      for (let i = 0; i < 500; i++) {
        locale = locale + 'x';
      }
      const s: String = obj.toLocaleString(locale);
      expect(s).assertEqual("[object Object]");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part03_5000
     * @tc.name objectPropertyKeyPart03Case050
     * @tc.desc Verify toLocaleString with an invalid locale and empty options returns [object Object]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart03Case050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new Object();
      const opts: Record<string, Any> = {};
      const s: String = obj.toLocaleString("bad-locale", opts);
      expect(s).assertEqual("[object Object]");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part03_5100
     * @tc.name objectPropertyKeyPart03Case051
     * @tc.desc Verify $_hashCode of a Record with one key is stable across two calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart03Case051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "name": "ArkTS" };
      const h1: int = record.$_hashCode();
      const h2: int = record.$_hashCode();
      expect(h1).assertEqual(h2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part03_5200
     * @tc.name objectPropertyKeyPart03Case052
     * @tc.desc Verify assign with only target returns target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart03Case052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'a': 1 };
      const result = Object.assign(target);
      expect(result).assertEqual(target);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part03_5300
     * @tc.name objectPropertyKeyPart03Case053
     * @tc.desc Verify Object.assign with a source Record b/2 returns the target object itself
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart03Case053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      const source: Record<string, Any> = { 'b': 2 };
      const result = Object.assign(target, source);
      expect(result).assertEqual(target);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part03_5400
     * @tc.name objectPropertyKeyPart03Case054
     * @tc.desc Verify Object.assign source overrides target same-key value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart03Case054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { "name": "old" };
      const source: Record<string, Any> = { "name": "new" };
      Object.assign(target, source);
      let rResult1: string = (target["name"]! as Object).toString();
      let eExpected1: string = "new";
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part03_5500
     * @tc.name objectPropertyKeyPart03Case055
     * @tc.desc Verify Object.assign multi-source later value wins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart03Case055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = {};
      const s1: Record<string, Any> = { 'x': 1 };
      const s2: Record<string, Any> = { 'x': 2 };
      Object.assign(target, s1, s2);
      let rResult1: string = (target['x']! as Object).toString();
      let eExpected1: string = '2';
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part03_5600
     * @tc.name objectPropertyKeyPart03Case056
     * @tc.desc Verify Object.keys of the source Record stays length 1 after Object.assign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart03Case056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'a': 1 };
      const source: Record<string, Any> = { 'b': 2 };
      Object.assign(target, source);
      const sk: string[] = Object.keys(source);
      let rResult1: int = sk.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTPROPERTYKEY_Part03_5700
     * @tc.name objectPropertyKeyPart03Case057
     * @tc.desc Verify Object.assign adds source key b so target has 2 keys with value 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectPropertyKeyPart03Case057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Record<string, Any> = { 'a': 1 };
      const source: Record<string, Any> = { 'b': 2 };
      Object.assign(target, source);
      let rResult1: int = Object.keys(target).length;
      let eExpected1: int = 2;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = (target['b']! as Object).toString();
      let eExpected2: string = '2';
      expect(rResult2).assertEqual(eExpected2);
    });
  });
}
