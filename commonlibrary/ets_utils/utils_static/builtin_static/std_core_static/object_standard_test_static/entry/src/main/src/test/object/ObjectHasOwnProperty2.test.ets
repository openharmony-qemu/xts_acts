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

class Foo001 {
  x: number = 1;
}
class Base001 {
  field: string = 'v';
  method(): number {
    return 1;
  }
}
class Parent001 {
  parentField: string = 'p';
}
class Child001 extends Parent001 {
  childField: string = 'c';
}
class Ho2Box001 {
  name: string = '';
  constructor(name: string) {
    this.name = name;
  }
}
class Calculator001 {
  add(a: number, b: number): number {
    return a + b;
  }
}
class Temp001 {
  private c: number = 25;
  get value(): number {
    return this.c;
  }
  set value(v: number) {
    this.c = v;
  }
}
class Base004 {
  greet(): string {
    return "hi";
  }
}
class Child002 extends Base004 {}
class Ho2Person001 {
  name: string = "ark";
}


export default function ObjectHasOwnProperty2Test(): void {
  describe("ObjectHasOwnProperty2Test", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part02_0100
     * @tc.name objectHasOwnPropertyPart02Case001
     * @tc.desc Verify hasOwnProperty returns true for index 0 on a two-element nested int array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart02Case001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[][] = [
        [1, 2],
        [3, 4],
      ];
      let rResult1: boolean = arr.hasOwnProperty(0);
      expect(rResult1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part02_0200
     * @tc.name objectHasOwnPropertyPart02Case002
     * @tc.desc Verify hasOwnProperty returns true for index 0 of a number array holding 100 ints
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart02Case002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [];
      for (let i: int = 0; i < 100; i++) {
        arr.push(i);
      }
      let rResult1: boolean = arr.hasOwnProperty(0);
      expect(rResult1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part02_0300
     * @tc.name objectHasOwnPropertyPart02Case003
     * @tc.desc Verify hasOwnProperty returns false for index 0 on an empty string array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart02Case003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = [];
      let rResult1: boolean = arr.hasOwnProperty(0);
      expect(rResult1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part02_0400
     * @tc.name objectHasOwnPropertyPart02Case004
     * @tc.desc Verify hasOwnProperty returns false for numeric key 0 on a Record holding string key name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart02Case004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Record<string, int> = { "name": 1 };
      let rResult1: boolean = obj.hasOwnProperty(0);
      expect(rResult1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part02_0500
     * @tc.name objectHasOwnPropertyPart02Case005
     * @tc.desc Verify hasOwnProperty returns false for key -1 on a plain empty Object instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart02Case005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      let rResult1: boolean = obj.hasOwnProperty(-1);
      expect(rResult1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part02_0600
     * @tc.name objectHasOwnPropertyPart02Case006
     * @tc.desc Verify hasOwnProperty returns true for string key "0" on a Record with numeric string keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart02Case006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Record<string, int> = { '0': 10, '1': 20 };
      let rResult1: boolean = obj.hasOwnProperty('0');
      expect(rResult1).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part02_0700
     * @tc.name objectHasOwnPropertyPart02Case007
     * @tc.desc Verify hasOwnProperty returns false for numeric key 0 on a class instance with field x
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart02Case007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Foo001 = new Foo001();
      let rResult1: boolean = obj.hasOwnProperty(0);
      expect(rResult1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part02_0800
     * @tc.name objectHasOwnPropertyPart02Case008
     * @tc.desc Verify hasOwnProperty returns false for a CJK key absent from a Record holding another CJK key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart02Case008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "测试": "ok" };
      let rResult1: boolean = record.hasOwnProperty("开发");
      expect(rResult1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part02_0900
     * @tc.name objectHasOwnPropertyPart02Case009
     * @tc.desc Verify hasOwnProperty is true for a zero-width-space-prefixed key but false for the bare key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart02Case009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = {};
      record["\u200Btext"] = 'v';
      let rResult1: boolean = record.hasOwnProperty("\u200Btext");
      expect(rResult1).assertTrue();
      let rResult2: boolean = record.hasOwnProperty("text");
      expect(rResult2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part02_1000
     * @tc.name objectHasOwnPropertyPart02Case010
     * @tc.desc Verify hasOwnProperty returns true for a 3600-character uppercase alphanumeric Record key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart02Case010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longKey: string = '';
      for (let i = 0; i < 100; i++) {
        longKey = longKey + "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
      }
      const record: Record<string, Any> = {};
      record[longKey] = "longStr";
      let rResult1: boolean = record.hasOwnProperty(longKey);
      expect(rResult1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part02_1100
     * @tc.name objectHasOwnPropertyPart02Case011
     * @tc.desc Verify hasOwnProperty is false for a 1300-char lowercase key on Record short/1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart02Case011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longKey: string = '';
      for (let i = 0; i < 50; i++) {
        longKey = longKey + "abcdefghijklmnopqrstuvwxyz";
      }
      const record: Record<string, Any> = { "short": 1 };
      let rResult1: boolean = record.hasOwnProperty(longKey);
      expect(rResult1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part02_1200
     * @tc.name objectHasOwnPropertyPart02Case012
     * @tc.desc Verify hasOwnProperty is true for keys x, y, z and false for key zzz
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart02Case012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'x': 1, 'y': 2, 'z': 3 };
      const keys: string[] = Object.keys(record);
      for (const key of keys) {
        let rResult1: boolean = record.hasOwnProperty(key);
        expect(rResult1).assertTrue();
      }
      let rResult2: boolean = record.hasOwnProperty("zzz");
      expect(rResult2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part02_1300
     * @tc.name objectHasOwnPropertyPart02Case013
     * @tc.desc Verify hasOwnProperty is true for own data field but false for method on a class instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart02Case013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inst: Base001 = new Base001();
      let rResult1: boolean = inst.hasOwnProperty("field");
      expect(rResult1).assertTrue();
      let rResult2: boolean = inst.hasOwnProperty("method");
      expect(rResult2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part02_1400
     * @tc.name objectHasOwnPropertyPart02Case014
     * @tc.desc Verify hasOwnProperty is true for both own child field and inherited parent field on a subclass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart02Case014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const child: Child001 = new Child001();
      let rResult1: boolean = child.hasOwnProperty("childField");
      expect(rResult1).assertTrue();
      let rResult2: boolean = child.hasOwnProperty("parentField");
      expect(rResult2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part02_1500
     * @tc.name objectHasOwnPropertyPart02Case015
     * @tc.desc Verify hasOwnProperty is false for numeric 0 but true for string "00" on a Record keyed "00"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart02Case015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "00": "doubleZero" };
      let rResult1: boolean = record.hasOwnProperty(0);
      expect(rResult1).assertFalse();
      let rResult2: boolean = record.hasOwnProperty("00");
      expect(rResult2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part02_1600
     * @tc.name objectHasOwnPropertyPart02Case016
     * @tc.desc Verify hasOwnProperty returns false for NaN and Infinity used as keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart02Case016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { '0': "zero" };
      let rResult1: boolean = record.hasOwnProperty(Number.NaN);
      expect(rResult1).assertFalse();
      let rResult2: boolean = record.hasOwnProperty(Number.POSITIVE_INFINITY);
      expect(rResult2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part02_1700
     * @tc.name objectHasOwnPropertyPart02Case017
     * @tc.desc Verify hasOwnProperty out-of-range index false and length property true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart02Case017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<string> = ['a', 'b'];
      let rResult1: boolean = arr.hasOwnProperty(arr.length);
      expect(rResult1).assertFalse();
      let rResult2: boolean = arr.hasOwnProperty("length");
      expect(rResult2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part02_1800
     * @tc.name objectHasOwnPropertyPart02Case018
     * @tc.desc Verify hasOwnProperty is true for indices 0 and 2 of a three-element array and false for index 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart02Case018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<string> = ['a', 'b', 'c'];
      let rResult1: boolean = arr.hasOwnProperty(0);
      expect(rResult1).assertTrue();
      let rResult2: boolean = arr.hasOwnProperty(2);
      expect(rResult2).assertTrue();
      let rResult3: boolean = arr.hasOwnProperty(3);
      expect(rResult3).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part02_1900
     * @tc.name objectHasOwnPropertyPart02Case019
     * @tc.desc Verify hasOwnProperty returns true for field name on a Box instance constructed with gift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart02Case019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box: Ho2Box001 = new Ho2Box001("gift");
      let rResult1: boolean = box.hasOwnProperty("name");
      expect(rResult1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part02_2000
     * @tc.name objectHasOwnPropertyPart02Case020
     * @tc.desc Verify hasOwnProperty is false for method add on a Calculator instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart02Case020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const calc: Calculator001 = new Calculator001();
      let rResult1: boolean = calc.hasOwnProperty("add");
      expect(rResult1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part02_2100
     * @tc.name objectHasOwnPropertyPart02Case021
     * @tc.desc Verify hasOwnProperty is false for accessor value on a Temp instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart02Case021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Temp001 = new Temp001();
      let rResult1: boolean = t.hasOwnProperty("value");
      expect(rResult1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part02_2200
     * @tc.name objectHasOwnPropertyPart02Case022
     * @tc.desc Verify hasOwnProperty is true for key u holding undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart02Case022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Record<string, Any> = { 'u': undefined };
      let rResult1: boolean = obj.hasOwnProperty('u');
      expect(rResult1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part02_2300
     * @tc.name objectHasOwnPropertyPart02Case023
     * @tc.desc Verify hasOwnProperty is true for key n holding null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart02Case023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Record<string, Any> = { 'n': null };
      let rResult1: boolean = obj.hasOwnProperty('n');
      expect(rResult1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part02_2400
     * @tc.name objectHasOwnPropertyPart02Case024
     * @tc.desc Verify hasOwnProperty is true for string keys true, null and undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart02Case024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Record<string, Any> = { "true": 1, "null": 2, "undefined": 3 };
      let rResult1: boolean = obj.hasOwnProperty("true");
      expect(rResult1).assertTrue();
      let rResult2: boolean = obj.hasOwnProperty("null");
      expect(rResult2).assertTrue();
      let rResult3: boolean = obj.hasOwnProperty("undefined");
      expect(rResult3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part02_2500
     * @tc.name objectHasOwnPropertyPart02Case025
     * @tc.desc Verify hasOwnProperty and Object.hasOwn are both true for key k
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart02Case025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Record<string, Any> = { 'k': 1 };
      let rResult1: boolean = obj.hasOwnProperty('k');
      expect(rResult1).assertTrue();
      let rResult2: boolean = Object.hasOwn(obj, 'k');
      expect(rResult2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part02_2600
     * @tc.name objectHasOwnPropertyPart02Case026
     * @tc.desc Verify hasOwnProperty and Object.hasOwn both return false for absent key x on a one-key Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart02Case026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Record<string, Any> = { 'k': 1 };
      let rResult1: boolean = obj.hasOwnProperty('x');
      expect(rResult1).assertFalse();
      let rResult2: boolean = Object.hasOwn(obj, 'x');
      expect(rResult2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part02_2700
     * @tc.name objectHasOwnPropertyPart02Case027
     * @tc.desc Verify hasOwnProperty and Object.hasOwn return false for method greet inherited by a subclass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart02Case027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c: Child002 = new Child002();
      let rResult1: boolean = c.hasOwnProperty("greet");
      expect(rResult1).assertFalse();
      let rResult2: boolean = Object.hasOwn(c, "greet");
      expect(rResult2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part02_2800
     * @tc.name objectHasOwnPropertyPart02Case028
     * @tc.desc Verify hasOwnProperty and Object.hasOwn are both true for string key 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart02Case028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { '0': "zero" };
      let rResult1: boolean = record.hasOwnProperty('0');
      expect(rResult1).assertTrue();
      let rResult2: boolean = Object.hasOwn(record, '0');
      expect(rResult2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part02_2900
     * @tc.name objectHasOwnPropertyPart02Case029
     * @tc.desc Verify keys a and b of a two-key Record both have hasOwnProperty true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart02Case029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Record<string, Any> = { 'a': 1, 'b': 2 };
      const keys: Array<string> = Object.keys(obj);
      let rResult1: int = keys.length;
      let eExpected1: int = 2;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: boolean = obj.hasOwnProperty('a');
      expect(rResult2).assertTrue();
      let rResult3: boolean = obj.hasOwnProperty('b');
      expect(rResult3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part02_3000
     * @tc.name objectHasOwnPropertyPart02Case030
     * @tc.desc Verify a three-element string array owns index keys 0 and 2 from Object.keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart02Case030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<string> = ['a', 'b', 'c'];
      const keys: Array<string> = Object.keys(arr);
      let rResult1: int = keys.length;
      let eExpected1: int = 3;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: boolean = arr.hasOwnProperty(keys[0]);
      expect(rResult2).assertTrue();
      let rResult3: boolean = arr.hasOwnProperty(keys[2]);
      expect(rResult3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part02_3100
     * @tc.name objectHasOwnPropertyPart02Case031
     * @tc.desc Verify Record a/1 owns the name a returned by getOwnPropertyNames
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart02Case031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Record<string, Any> = { 'a': 1 };
      const names: Array<string> = Object.getOwnPropertyNames(obj);
      let rResult1: int = names.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: boolean = obj.hasOwnProperty(names[0]);
      expect(rResult2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part02_3200
     * @tc.name objectHasOwnPropertyPart02Case032
     * @tc.desc Verify a two-element array owns length while Object.keys reports two indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart02Case032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<string> = ['a', 'b'];
      let rResult1: boolean = arr.hasOwnProperty("length");
      expect(rResult1).assertTrue();
      let rResult2: int = Object.keys(arr).length;
      let eExpected2: int = 2;
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part02_3300
     * @tc.name objectHasOwnPropertyPart02Case033
     * @tc.desc Verify an empty Record has zero keys and owns neither a nor 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart02Case033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty: Record<string, Any> = {};
      let rResult1: int = Object.keys(empty).length;
      let eExpected1: int = 0;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: boolean = empty.hasOwnProperty('a');
      expect(rResult2).assertFalse();
      let rResult3: boolean = empty.hasOwnProperty(0);
      expect(rResult3).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part02_3400
     * @tc.name objectHasOwnPropertyPart02Case034
     * @tc.desc Verify a one-field class instance reports own key name and one Object.keys entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart02Case034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const person: Ho2Person001 = new Ho2Person001();
      let rResult1: boolean = person.hasOwnProperty("name");
      expect(rResult1).assertTrue();
      let rResult2: boolean = Object.hasOwn(person, "name");
      expect(rResult2).assertTrue();
      let rResult3: int = Object.keys(person).length;
      let eExpected3: int = 1;
      expect(rResult3).assertEqual(eExpected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part02_3500
     * @tc.name objectHasOwnPropertyPart02Case035
     * @tc.desc Verify every Object.keys entry of a three-key Record x, y, z is own
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart02Case035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Record<string, Any> = { 'x': 1, 'y': 2, 'z': 3 };
      const keys: Array<string> = Object.keys(obj);
      for (let i: int = 0; i < keys.length; i++) {
        let rResult1: boolean = obj.hasOwnProperty(keys[i]);
        expect(rResult1).assertTrue();
      }
      let rResult2: int = keys.length;
      let eExpected2: int = 3;
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part02_3600
     * @tc.name objectHasOwnPropertyPart02Case036
     * @tc.desc Verify Object.keys of Record with string key 0 returns that key as own
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart02Case036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { '0': "zero" };
      const keys: Array<string> = Object.keys(record);
      let rResult1: int = keys.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: boolean = Object.hasOwn(record, keys[0]);
      expect(rResult2).assertTrue();
      let rResult3: boolean = record.hasOwnProperty('0');
      expect(rResult3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part02_3700
     * @tc.name objectHasOwnPropertyPart02Case037
     * @tc.desc Verify hasOwnProperty returns true for a ZWJ family emoji sequence key added to an empty Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart02Case037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const familyEmoji: string = "👨\u200D👩\u200D👧\u200D👦";
      const record: Record<string, Any> = {};
      record[familyEmoji] = "family";
      let rResult1: boolean = record.hasOwnProperty(familyEmoji);
      expect(rResult1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part02_3800
     * @tc.name objectHasOwnPropertyPart02Case038
     * @tc.desc Verify hasOwnProperty is true for emoji and name keys in a Record and false for another emoji
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart02Case038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { '🎉': 1, "name": 'n' };
      let rResult1: boolean = record.hasOwnProperty('🎉');
      expect(rResult1).assertTrue();
      let rResult2: boolean = record.hasOwnProperty("name");
      expect(rResult2).assertTrue();
      let rResult3: boolean = record.hasOwnProperty('🎊');
      expect(rResult3).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part02_3900
     * @tc.name objectHasOwnPropertyPart02Case039
     * @tc.desc Verify a 1000-char key round-trips through getOwnPropertyNames and is own
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart02Case039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const longKey: string = 'k'.repeat(1000);
      const record: Record<string, Any> = {};
      record[longKey] = 1;
      const names: Array<string> = Object.getOwnPropertyNames(record);
      let rResult1: int = names.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: boolean = record.hasOwnProperty(names[0]);
      expect(rResult2).assertTrue();
      expect(names[0]).assertEqual(longKey);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part02_4000
     * @tc.name objectHasOwnPropertyPart02Case040
     * @tc.desc Verify all three own names a, b and c of a Record have hasOwnProperty true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart02Case040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2, 'c': 3 };
      const names: Array<string> = Object.getOwnPropertyNames(record);
      let rResult1: int = names.length;
      let eExpected1: int = 3;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: boolean = record.hasOwnProperty(names[0]);
      expect(rResult2).assertTrue();
      let rResult3: boolean = record.hasOwnProperty(names[1]);
      expect(rResult3).assertTrue();
      let rResult4: boolean = record.hasOwnProperty(names[2]);
      expect(rResult4).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part02_4100
     * @tc.name objectHasOwnPropertyPart02Case041
     * @tc.desc Verify Record a/1 owns its name a but not the absent key b
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart02Case041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1 };
      const names: Array<string> = Object.getOwnPropertyNames(record);
      let rResult1: int = names.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: boolean = record.hasOwnProperty('b');
      expect(rResult2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part02_4200
     * @tc.name objectHasOwnPropertyPart02Case042
     * @tc.desc Verify an empty Record has no own names and does not own key a
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart02Case042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = {};
      const names: Array<string> = Object.getOwnPropertyNames(record);
      let rResult1: int = names.length;
      let eExpected1: int = 0;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: boolean = record.hasOwnProperty('a');
      expect(rResult2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part02_4300
     * @tc.name objectHasOwnPropertyPart02Case043
     * @tc.desc Verify a script-tag-like key is returned by getOwnPropertyNames and is own
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart02Case043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const xssKey: string = "<script>alert(1)</script>";
      const record: Record<string, Any> = {};
      record[xssKey] = 1;
      const names: Array<string> = Object.getOwnPropertyNames(record);
      let rResult1: int = names.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: boolean = record.hasOwnProperty(names[0]);
      expect(rResult2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part02_4400
     * @tc.name objectHasOwnPropertyPart02Case044
     * @tc.desc Verify a key assigned undefined still counts in Object.values and as own
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart02Case044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = {};
      record['a'] = undefined;
      const values = Object.values(record);
      let rResult1: int = values.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: boolean = record.hasOwnProperty('a');
      expect(rResult2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part02_4500
     * @tc.name objectHasOwnPropertyPart02Case045
     * @tc.desc Verify an empty Record yields zero values and does not own key x
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart02Case045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = {};
      const values = Object.values(record);
      let rResult1: int = values.length;
      let eExpected1: int = 0;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: boolean = record.hasOwnProperty('x');
      expect(rResult2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part02_4600
     * @tc.name objectHasOwnPropertyPart02Case046
     * @tc.desc Verify Record with keys a and b yields two values and owns both keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart02Case046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1 };
      record['b'] = 2;
      const values = Object.values(record);
      let rResult1: int = values.length;
      let eExpected1: int = 2;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: boolean = record.hasOwnProperty('a');
      expect(rResult2).assertTrue();
      let rResult3: boolean = record.hasOwnProperty('b');
      expect(rResult3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part02_4700
     * @tc.name objectHasOwnPropertyPart02Case047
     * @tc.desc Verify a script-tag-like key holds value 3 in Object.values and counts as own
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart02Case047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const xssKey: string = "<script>alert(1)</script>";
      const record: Record<string, Any> = {};
      record[xssKey] = 3;
      const values = Object.values(record);
      let rResult1: int = values.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: boolean = record.hasOwnProperty(xssKey);
      expect(rResult2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part02_4800
     * @tc.name objectHasOwnPropertyPart02Case048
     * @tc.desc Verify a two-key Record yields two entries and owns keys a and b
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart02Case048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2 };
      const entries = Object.entries(record);
      let rResult1: int = entries.length;
      let eExpected1: int = 2;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: boolean = record.hasOwnProperty('a');
      expect(rResult2).assertTrue();
      let rResult3: boolean = record.hasOwnProperty('b');
      expect(rResult3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part02_4900
     * @tc.name objectHasOwnPropertyPart02Case049
     * @tc.desc Verify Record with key b owns that name but not a or missing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart02Case049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'b': 2 };
      const names: Array<string> = Object.getOwnPropertyNames(record);
      let rResult1: int = names.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: boolean = record.hasOwnProperty(names[0]);
      expect(rResult2).assertTrue();
      let rResult3: boolean = record.hasOwnProperty('a');
      expect(rResult3).assertFalse();
      let rResult4: boolean = record.hasOwnProperty("missing");
      expect(rResult4).assertFalse();
    });
  });
}
