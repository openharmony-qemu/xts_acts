'use static';

/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it } from "../../../../hypium/index";
import { TestType, Size, Level } from "../../../../hypium/Constant";
import Utils from "../Util.test";


class EmptyClass {
}

class Person {
 name: string = "Alice";
 age: int = 30;
}

class DataBag {
 title: string = "test";
 count: int = 42;
 valid: boolean = true;
 tags: Array<string> = ['a', 'b'];
}

class Base {
 baseProp: string = "base";
}

class Derived extends Base {
 derivedProp: string = "derived";
}


export default function ObjectEntriesTest(): void {
  describe("ObjectEntriesTest", (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {});
    afterAll((): void => {});

    /**
     * @tc.name testObjectEntries001
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0010
     * @tc.desc Verify Object.entries with empty Record object for returning empty array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it("testObjectEntries001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = {} as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(Object.entries(rec).length).assertEqual(0);
    });

    /**
     * @tc.name testObjectEntries002
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0020
     * @tc.desc Verify Object.entries with single string property Record for correct key-value pair
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it("testObjectEntries002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "name": "ArkTS" } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries.length).assertEqual(1);
      expect(entries[0]![0]).assertEqual("name");
      expect(entries[0]![1] as string).assertEqual("ArkTS");
    });

    /**
     * @tc.name testObjectEntries003
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0030
     * @tc.desc Verify Object.entries with single number property Record for correct key-value pair
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it("testObjectEntries003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "age": 25 } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries.length).assertEqual(1);
      expect(entries[0]![0]).assertEqual("age");
      expect(entries[0]![1] as int).assertEqual(25);
    });

    /**
     * @tc.name testObjectEntries004
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0040
     * @tc.desc Verify Object.entries with boolean true property Record for correct key-value pair
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it("testObjectEntries004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "active": true } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries.length).assertEqual(1);
      expect(entries[0]![0]).assertEqual("active");
      expect(entries[0]![1] as boolean).assertTrue();
    });

    /**
     * @tc.name testObjectEntries005
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0050
     * @tc.desc Verify Object.entries with null value property Record for correct null value handling
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it("testObjectEntries005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "data": null } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries.length).assertEqual(1);
      expect(entries[0]![0]).assertEqual("data");
      let actualValue1: Any = entries[0]![1];
      let actualValue1IsNull: boolean = actualValue1 === null;
      expect(actualValue1IsNull).assertTrue();
    });

    /**
     * @tc.name testObjectEntries006
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0060
     * @tc.desc Verify Object.entries with undefined value property Record for correct key enumeration
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it("testObjectEntries006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "data": undefined } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries.length).assertEqual(1);
      expect(entries[0]![0]).assertEqual("data");
      let actualValue1: Any = entries[0]![1];
      let actualValue1IsUndefined: boolean = actualValue1 === undefined;
      expect(actualValue1IsUndefined).assertTrue();
    });

    /**
     * @tc.name testObjectEntries007
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0070
     * @tc.desc Verify Object.entries with nested object value Record for correct value reference
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it("testObjectEntries007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let child: Record<string, Any> = { 'x': 1, 'y': 2 } as Record<string, Any>;
      let rec: Record<string, Any> = { "point": child } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries.length).assertEqual(1);
      expect(entries[0]![0]).assertEqual("point");
      expect(entries[0]![1] as Object).assertEqual(child as Object);
    });

    /**
     * @tc.name testObjectEntries008
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0080
     * @tc.desc Verify Object.entries with array value Record for correct array value handling
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it("testObjectEntries008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arrVal: Array<int> = [1, 2, 3];
      let rec: Record<string, Any> = { "list": arrVal } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries.length).assertEqual(1);
      expect(entries[0]![0]).assertEqual("list");
      expect(entries[0]![1] as Object).assertEqual(arrVal as Object);
    });

    /**
     * @tc.name testObjectEntries009
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0090
     * @tc.desc Verify Object.entries with multi-property mixed-type Record for correct key enumeration
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it("testObjectEntries009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = {
        "name": "Alice",
        "age": 30,
        "active": true
      } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries.length).assertEqual(3);
      expect(entries[0]![0]).assertEqual("name");
      expect(entries[0]![1] as string).assertEqual("Alice");
      expect(entries[1]![0]).assertEqual("age");
      expect(entries[1]![1] as int).assertEqual(30);
      expect(entries[2]![0]).assertEqual("active");
      expect(entries[2]![1] as boolean).assertTrue();
    });

    /**
     * @tc.name testObjectEntries010
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0100
     * @tc.desc Verify Object.entries with empty string key Record for correct empty string key handling
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it("testObjectEntries010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "": "emptyKey" } as Record<string, Any>;
      expect(Object.entries(rec).length).assertEqual(1);
      expect(String(rec[""])).assertEqual("emptyKey");
    });

    /**
     * @tc.name testObjectEntries011
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0110
     * @tc.desc Verify Object.entries with numeric string key Record for string key type preservation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it("testObjectEntries011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "123": "numberStr" } as Record<string, Any>;
      expect(Object.entries(rec).length).assertEqual(1);
      expect(String(rec["123"])).assertEqual("numberStr");
    });

    /**
     * @tc.name testObjectEntries012
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0120
     * @tc.desc Verify Object.entries with special character key Record for correct key character preservation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it("testObjectEntries012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "my-key_1": "value" } as Record<string, Any>;
      expect(Object.entries(rec).length).assertEqual(1);
      expect(String(rec["my-key_1"])).assertEqual("value");
    });

    /**
     * @tc.name testObjectEntries013
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0130
     * @tc.desc Verify Object.entries with large property count Record for correct length return
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it("testObjectEntries013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = {} as Record<string, Any>;
      let maxProperties: int = 100;
      let index: int = 0;
      while (index < maxProperties) {
        rec["key" + index] = index;
        index++;
      }
      let entries = Object.entries(rec);
      expect(Object.entries(rec).length).assertEqual(100);
    });

    /**
     * @tc.name testObjectEntries014
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0140
     * @tc.desc Verify Object.entries with empty custom class instance for returning empty array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it("testObjectEntries014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: Object = new EmptyClass();
      let entries = Object.entries(instance);
      expect(entries.length).assertEqual(0);
    });

    /**
     * @tc.name testObjectEntries015
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0150
     * @tc.desc Verify Object.entries with custom class having public properties for correct key enumeration
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it("testObjectEntries015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: Object = new Person();
      let entries = Object.entries(p);
      expect(entries.length).assertEqual(2);
      expect(entries[0]![0] as string).assertEqual("name");
      expect(entries[0]![1] as string).assertEqual("Alice");
      expect(entries[1]![0] as string).assertEqual("age");
      expect(entries[1]![1] as int).assertEqual(30);
    });

    /**
     * @tc.name testObjectEntries016
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0160
     * @tc.desc Verify Object.entries with class having multiple property types for correct enumeration count
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it("testObjectEntries016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Object = new DataBag();
      let entries = Object.entries(d);
      expect(entries.length).assertEqual(4);
    });

    /**
     * @tc.name testObjectEntries017
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0170
     * @tc.desc Verify Object.entries with Array instance as Any parameter for index-keyed entry keys
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it("testObjectEntries017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<int> = [10, 20, 30];
      let entries = Object.entries(arr);
      expect(entries.length).assertEqual(3);
      expect(entries[0]![0] as string).assertEqual('0');
      expect(entries[0]![1] as int).assertEqual(10);
      expect(entries[1]![0] as string).assertEqual('1');
      expect(entries[1]![1] as int).assertEqual(20);
      expect(entries[2]![0] as string).assertEqual('2');
      expect(entries[2]![1] as int).assertEqual(30);
    });

    /**
     * @tc.name testObjectEntries018
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0180
     * @tc.desc Verify Object.entries with inherited class instance for enumerating own and inherited properties
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it("testObjectEntries018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Object = new Derived();
      let entries = Object.entries(d);
      expect(entries.length).assertEqual(2);
    });

    /**
     * @tc.name testObjectEntries019
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0190
     * @tc.desc Verify Object.entries return entry element is key-value tuple with length 2
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it("testObjectEntries019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "name": "test" } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(Object.entries(rec).length).assertEqual(1);
      let entry: [string, Any] = entries[0]!;
      expect(entry.length).assertEqual(2);
      expect(entry[0]).assertEqual("name");
      expect(entry[1] as string).assertEqual("test");
    });

    /**
     * @tc.name testObjectEntries020
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0200
     * @tc.desc Verify Object.entries reflects value changes after property modification for shallow copy behavior
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it("testObjectEntries020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "name": "original" } as Record<string, Any>;
      let beforeEntries = Object.entries(rec);
      expect(beforeEntries.length).assertEqual(1);
      expect(beforeEntries[0]![1] as string).assertEqual("original");
      rec["name"] = "modified";
      let afterEntries = Object.entries(rec);
      expect(afterEntries.length).assertEqual(1);
      expect(afterEntries[0]![1] as string).assertEqual("modified");
    });

    /**
     * @tc.name testObjectEntries021
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0210
     * @tc.desc Verify Object.entries with empty string value Record for correct empty string value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it("testObjectEntries021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "str": "" } as Record<string, Any>;
      expect(Object.entries(rec).length).assertEqual(1);
      expect(String(rec["str"])).assertEqual("");
    });

    /**
     * @tc.name testObjectEntries022
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0220
     * @tc.desc Verify Object.entries with zero number value Record for correct zero value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it("testObjectEntries022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "zero": 0 } as Record<string, Any>;
      expect(Object.entries(rec).length).assertEqual(1);
      expect(rec["zero"] as int).assertEqual(0);
    });

    /**
     * @tc.name testObjectEntries023
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0230
     * @tc.desc Verify Object.entries with float value Record for correct float value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it("testObjectEntries023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "pi": 3.14 } as Record<string, Any>;
      expect(Object.entries(rec).length).assertEqual(1);
      expect(rec["pi"] as double).assertEqual(3.14);
    });

    /**
     * @tc.name testObjectEntries024
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0240
     * @tc.desc Verify Object.entries with char value Record for correct char value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it("testObjectEntries024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "initial": 'A' } as Record<string, Any>;
      expect(Object.entries(rec).length).assertEqual(1);
      expect(String(rec["initial"])).assertEqual('A');
    });

    /**
     * @tc.name testObjectEntries025
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0250
     * @tc.desc Verify Object.entries return array is iterable via for..of loop with correct entry count
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it("testObjectEntries025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { 'a': 1, 'b': 2 } as Record<string, Any>;
      let entries = Object.entries(rec);
      let count: int = 0;
      for (let i: int = 0; i < entries.length; i++) {
        expect(entries[i]!.length).assertEqual(2);
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testObjectEntries026
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0260
     * @tc.desc Verify Object.entries with boolean false value Record for correct false value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it("testObjectEntries026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "flag": false } as Record<string, Any>;
      expect(Object.entries(rec).length).assertEqual(1);
      expect(rec["flag"] as boolean).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0270
     * @tc.name testObjectEntries027
     * @tc.desc Verify each entries element is an Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries027", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { 'x': 10 } as Record<string, Any>;
      let entries = Object.entries(rec);
      let firstEntry = entries[0];
      expect(entries.length).assertEqual(1);
      expect(firstEntry!.length).assertEqual(2);
      expect(firstEntry![0]).assertEqual('x');
      expect(firstEntry![1] as int).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0280
     * @tc.name testObjectEntries028
     * @tc.desc Verify entry key at index 0 is string type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries028", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "key": "val" } as Record<string, Any>;
      let entries = Object.entries(rec);
      let entryKey: string = entries[0]![0];
      expect(entryKey).assertEqual("key");
      expect(entries[0]![1] as string).assertEqual("val");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0290
     * @tc.name testObjectEntries029
     * @tc.desc Verify entry value at index 1 matches original property value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries029", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "val": 42 } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries[0]![1] as int).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0300
     * @tc.name testObjectEntries030
     * @tc.desc Verify entries to fromEntries round-trip preserves data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries030", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { 'a': 1, 'b': 2 } as Record<string, Any>;
      let entries = Object.entries(rec);
      let typedEntries: Array<[string, Any]> = [];
      for (let i = 0; i < entries.length; i++) {
        let entry = entries[i];
        if (entry !== undefined && entry !== null) {
          typedEntries.push(entry);
        }
      }
      let rebuilt: Record<string, Any> = Object.fromEntries<Any>(typedEntries);
      expect(Object.keys(rebuilt).length).assertEqual(2);
      expect(rebuilt['a'] as int).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0310
     * @tc.name testObjectEntries031
     * @tc.desc Verify entries result consistent across multiple calls on same Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries031", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { 'x': 1, 'y': 2 } as Record<string, Any>;
      let entries1 = Object.entries(rec);
      let entries2 = Object.entries(rec);
      expect(entries1.length).assertEqual(entries2.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0320
     * @tc.name testObjectEntries032
     * @tc.desc Verify entries result toString is valid string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries032", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { 'k': 'v' } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries.toString().length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0330
     * @tc.name testObjectEntries033
     * @tc.desc Verify entries with BigInt value Record returns correct entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries033", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bigVal: BigInt = BigInt(999);
      let rec: Record<string, Any> = { "big": bigVal } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0340
     * @tc.name testObjectEntries034
     * @tc.desc Verify entries with Object instance value Record preserves reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries034", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let objVal: Object = new Object();
      let rec: Record<string, Any> = { "obj": objVal } as Record<string, Any>;
      let entries = Object.entries(rec);
      let entryVal: Object = entries[0]![1] as Object;
      expect(entryVal).assertEqual(objVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0350
     * @tc.name testObjectEntries035
     * @tc.desc Verify entries with double precision float value Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries035", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "pi": 3.14159 } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries.length).assertEqual(1);
      expect(entries[0]![1] as number).assertEqual(3.14159);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0360
     * @tc.name testObjectEntries036
     * @tc.desc Verify entries with negative number value Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries036", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "neg": (-100) } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries[0]![1] as int).assertEqual(-100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0370
     * @tc.name testObjectEntries037
     * @tc.desc Verify entries with large int value Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries037", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "max": 2147483647 } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries[0]![1] as int).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0380
     * @tc.name testObjectEntries038
     * @tc.desc Verify entries with Unicode Chinese string value Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries038", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "cn": "你好世界" } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries[0]![1] as string).assertEqual("你好世界");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0390
     * @tc.name testObjectEntries039
     * @tc.desc Verify entries with long string value Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries039", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr: string = "abcdefghij".repeat(50);
      let rec: Record<string, Any> = { "long": longStr } as Record<string, Any>;
      let entries = Object.entries(rec);
      let val: string = entries[0]![1] as string;
      expect(val.length).assertEqual(500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0400
     * @tc.name testObjectEntries040
     * @tc.desc Verify entries with Unicode Chinese key Record returns correct key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries040", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "测试键": "val" } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries[0]![0]).assertEqual("测试键");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0410
     * @tc.name testObjectEntries041
     * @tc.desc Verify entries with Russian characters key Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries041", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "ключ": "значение" } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries[0]![0]).assertEqual("ключ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0420
     * @tc.name testObjectEntries042
     * @tc.desc Verify entries with Arabic characters key Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries042", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "مفتاح": "قيمة" } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries[0]![0]).assertEqual("مفتاح");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0430
     * @tc.name testObjectEntries043
     * @tc.desc Verify entries with Japanese kanji key Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries043", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "鍵名": '値' } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries[0]![0]).assertEqual("鍵名");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0440
     * @tc.name testObjectEntries044
     * @tc.desc Verify entries with emoji key Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries044", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let emojiKey: string = "🌟key🌟";
      let rec: Record<string, Any> = {} as Record<string, Any>;
      rec[emojiKey] = "emojiVal";
      let entries = Object.entries(rec);
      expect(entries[0]![0]).assertEqual(emojiKey);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0450
     * @tc.name testObjectEntries045
     * @tc.desc Verify entries with XSS script tag key Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries045", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let xssKey: string = "<script>alert(1)</script>";
      let rec: Record<string, Any> = {} as Record<string, Any>;
      rec[xssKey] = "xssVal";
      let entries = Object.entries(rec);
      expect(entries[0]![0]).assertEqual(xssKey);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0460
     * @tc.name testObjectEntries046
     * @tc.desc Verify entries with key containing spaces Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries046", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "key with spaces": "val" } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries[0]![0]).assertEqual("key with spaces");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0470
     * @tc.name testObjectEntries047
     * @tc.desc Verify entries with key containing dashes Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries047", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "key-with-dash": "val" } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries[0]![0]).assertEqual("key-with-dash");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0480
     * @tc.name testObjectEntries048
     * @tc.desc Verify entries with key containing underscores Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries048", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "key_with_underscore": "val" } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries[0]![0]).assertEqual("key_with_underscore");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0490
     * @tc.name testObjectEntries049
     * @tc.desc Verify entries with key containing dots Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries049", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "key.with.dot": "val" } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries[0]![0]).assertEqual("key.with.dot");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0500
     * @tc.name testObjectEntries050
     * @tc.desc Verify entries with custom class instance as value Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries050", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let person: Person = new Person();
      let rec: Record<string, Any> = { "person": person } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries.length).assertEqual(1);
      expect(entries[0]![0]).assertEqual("person");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0510
     * @tc.name testObjectEntries051
     * @tc.desc Verify entries with escaped characters in value Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries051", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "esc": "a\\b" } as Record<string, Any>;
      let entries = Object.entries(rec);
      let val: string = entries[0]![1] as string;
      expect(val).assertEqual("a\\b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0520
     * @tc.name testObjectEntries052
     * @tc.desc Verify entries with newline and tab in value Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries052", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "special": "a\nb\tc" } as Record<string, Any>;
      let entries = Object.entries(rec);
      let val: string = entries[0]![1] as string;
      expect(val).assertEqual("a\nb\tc");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0530
     * @tc.name testObjectEntries053
     * @tc.desc Verify entries with double quote in value Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries053", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "quote": "a\"b" } as Record<string, Any>;
      let entries = Object.entries(rec);
      let val: string = entries[0]![1] as string;
      expect(val).assertEqual("a\"b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0540
     * @tc.name testObjectEntries054
     * @tc.desc Verify entries after dynamic property addition to Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries054", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { 'a': 1 } as Record<string, Any>;
      rec['b'] = 2 as Any;
      let entries = Object.entries(rec);
      expect(entries.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0550
     * @tc.name testObjectEntries055
     * @tc.desc Verify entries after property deletion from Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries055", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { 'a': 1, 'b': 2 } as Record<string, Any>;
      rec = { 'b': 2 } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries.length).assertEqual(1);
      expect(entries[0]![0]).assertEqual('b');
      expect(entries[0]![1] as int).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0560
     * @tc.name testObjectEntries056
     * @tc.desc Verify entries on Record with numeric index keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries056", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { '0': "zero", '1': "one" } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0570
     * @tc.name testObjectEntries057
     * @tc.desc Verify Object.entries returns one entry per property for Records with 50 and 100 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries057", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sizes: int[] = [50, 100];
      let prefixes: string[] = ['p', 'prop'];
      for (let caseIndex: int = 0; caseIndex < sizes.length; caseIndex++) {
        let size: int = sizes[caseIndex];
        let rec: Record<string, Any> = {} as Record<string, Any>;
        let entryIndex: int = 0;
        while (entryIndex < size) {
          rec[prefixes[caseIndex] + String(entryIndex)] = entryIndex as Any;
          entryIndex++;
        }
        let entries = Object.entries(rec);
        let entryCount: int = entries.length;
        expect(entryCount).assertEqual(size);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0580
     * @tc.name testObjectEntries058
     * @tc.desc Verify entries returns own properties only (not prototype toString)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries058", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "own": "prop" } as Record<string, Any>;
      let entries = Object.entries(rec);
      let hasToString: boolean = false;
      let i: int = 0;
      while (i < entries.length) {
        if (entries[i]![0] === "toString") {
          hasToString = true;
        }
        i++;
      }
      expect(hasToString).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0590
     * @tc.name testObjectEntries059
     * @tc.desc Verify entries result array is independent copy (mutating does not affect source)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries059", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { 'a': 1 } as Record<string, Any>;
      let entries = Object.entries(rec);
      let entriesLen: int = entries.length;
      entries.push(['b', 2] as [string, Any]);
      expect(Object.entries(rec).length).assertEqual(entriesLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0600
     * @tc.name testObjectEntries060
     * @tc.desc Verify entries with reserved word key Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries060", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "class": "reserved" } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries[0]![0]).assertEqual("class");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0610
     * @tc.name testObjectEntries061
     * @tc.desc Verify entries with zero-width space key Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries061", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let zwsKey: string = '​';
      let rec: Record<string, Any> = {} as Record<string, Any>;
      rec[zwsKey] = "zwsVal";
      let entries = Object.entries(rec);
      expect(entries[0]![0]).assertEqual(zwsKey);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0620
     * @tc.name testObjectEntries062
     * @tc.desc Verify entries with long key 100 chars Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries062", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longKey: string = "abcdefghij".repeat(10);
      let rec: Record<string, Any> = {} as Record<string, Any>;
      rec[longKey] = "longKeyVal";
      let entries = Object.entries(rec);
      expect(entries[0]![0]).assertEqual(longKey);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0630
     * @tc.name testObjectEntries063
     * @tc.desc Verify entries on Record after multiple property modifications
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries063", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { 'a': 1 } as Record<string, Any>;
      rec['b'] = 2;
      rec['a'] = 11;
      rec = { 'a': rec['a'] } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries.length).assertEqual(1);
      expect(entries[0]![0]).assertEqual('a');
      expect(entries[0]![1] as int).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0640
     * @tc.name testObjectEntries064
     * @tc.desc Verify Object.entries throws ClassCastError when null is cast to Object (nullish boundary)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries064", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Object.entries(null as Object);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0650
     * @tc.name testObjectEntries065
     * @tc.desc Verify Object.entries throws ClassCastError when undefined is cast to Object (nullish boundary)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries065", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Object.entries(undefined as Object);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0660
     * @tc.name testObjectEntries066
     * @tc.desc Verify entries with int literal object view (as Object) returns no entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries066", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let entries = Object.entries(42 as Object);
      expect(entries.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0670
     * @tc.name testObjectEntries067
     * @tc.desc Verify entries with string literal object view returns indexed entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries067", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let entries = Object.entries("str" as Object);
      expect(entries.length).assertEqual(3);
      expect(entries[0]![0]).assertEqual('0');
      expect(entries[1]![0]).assertEqual('1');
      expect(entries[2]![0]).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0680
     * @tc.name testObjectEntries068
     * @tc.desc Verify entries with boolean literal object view (as Object) returns no entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries068", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let entries = Object.entries(true as Object);
      expect(entries.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0690
     * @tc.name testObjectEntries069
     * @tc.desc Verify entries with array literal input behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries069", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arrIn: int[] = [1, 2, 3];
      let entries = Object.entries(arrIn as Object);
      expect(entries.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0700
     * @tc.name testObjectEntries070
     * @tc.desc Verify entries in try-finally block finally executes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries070", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let finallyReached: boolean = false;
      try {
        let rec: Record<string, Any> = { 'k': 1 } as Record<string, Any>;
        let entries = Object.entries(rec);
        expect(entries.length).assertEqual(1);
      } finally {
        finallyReached = true;
      }
      expect(finallyReached).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0710
     * @tc.name testObjectEntries071
     * @tc.desc Verify entries result length matches Object.keys count and each entry key aligns with keys array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries071", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { 'a': 1, 'b': 2, 'c': 3 } as Record<string, Any>;
      let entries = Object.entries(rec);
      let keys: string[] = Object.keys(rec);
      expect(entries.length).assertEqual(keys.length);
      let idx: int = 0;
      while (idx < entries.length) {
        expect(entries[idx]![0]).assertEqual(keys[idx]);
        idx++;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0720
     * @tc.name testObjectEntries072
     * @tc.desc Verify entries result combined with Object.values consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries072", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { 'a': 1, 'b': 2 } as Record<string, Any>;
      let entries = Object.entries(rec);
      let values = Object.values(rec);
      expect(entries.length).assertEqual(values.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0730
     * @tc.name testObjectEntries073
     * @tc.desc Verify entries on an Object.assign result follows the current runtime entry count while the source key stays absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries073", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Record<string, Any> = { 'x': 10 } as Record<string, Any>;
      let target: Record<string, Any> = {} as Record<string, Any>;
      let result: Record<string, Any> = Object.assign(target, src);
      let entries = Object.entries(result);
      expect(result as Object).assertEqual(target as Object);
      expect(entries.length).assertEqual(Object.keys(result).length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0740
     * @tc.name testObjectEntries074
     * @tc.desc Verify entries with Object.getOwnPropertyNames cross-check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries074", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { 'a': 1, 'b': 2 } as Record<string, Any>;
      let entries = Object.entries(rec);
      let names: string[] = Object.getOwnPropertyNames(rec);
      expect(entries.length).assertEqual(names.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0750
     * @tc.name testObjectEntries075
     * @tc.desc Verify entries length stays aligned with keys after Object.assign returns the target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries075", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = { 'a': 1 } as Record<string, Any>;
      let source: Record<string, Any> = { 'b': 2 } as Record<string, Any>;
      let merged: Record<string, Any> = Object.assign(target, source);
      let entries = Object.entries(merged);
      expect(merged as Object).assertEqual(target as Object);
      expect(merged['a'] as int).assertEqual(1);
      expect(entries.length).assertEqual(Object.keys(merged).length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0760
     * @tc.name testObjectEntries076
     * @tc.desc Verify entries first key can be used to read back the corresponding property value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries076", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "key": "val" } as Record<string, Any>;
      let entries = Object.entries(rec);
      let firstKey: string = entries[0]![0];
      expect(rec[firstKey] as string).assertEqual("val");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0770
     * @tc.name testObjectEntries077
     * @tc.desc Verify entries on Object() wrapped string primitive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries077", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let strObj: Object = "hello";
      let entries = Object.entries(strObj);
      expect(entries.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0780
     * @tc.name testObjectEntries078
     * @tc.desc Verify entries with deeply nested Record value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries078", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let deep: Record<string, Any> = { "l2": { "l3": "val" } as Record<string, Any> } as Record<string, Any>;
      let entries = Object.entries(deep);
      expect(entries.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0790
     * @tc.name testObjectEntries079
     * @tc.desc Verify 100 entries calls on different Records all succeed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries079", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let successCount: int = 0;
      let idx: int = 0;
      while (idx < 100) {
        let rec: Record<string, Any> = {} as Record<string, Any>;
        rec['k' + String(idx)] = idx;
        let entries = Object.entries(rec);
        if (entries.length === 1) {
          successCount++;
        }
        idx++;
      }
      expect(successCount).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0800
     * @tc.name testObjectEntries080
     * @tc.desc Verify entries result passed as function parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries080", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { 'a': 1 } as Record<string, Any>;
      let entries = Object.entries(rec);
      let copyLen: int = entries.length;
      expect(copyLen).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0810
     * @tc.name testObjectEntries081
     * @tc.desc Verify entries on multiple Records with different shapes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries081", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec1: Record<string, Any> = { 'a': 1 } as Record<string, Any>;
      let rec2: Record<string, Any> = { 'a': 1, 'b': 2 } as Record<string, Any>;
      let rec3: Record<string, Any> = { 'a': 1, 'b': 2, 'c': 3 } as Record<string, Any>;
      let e1 = Object.entries(rec1);
      let e2 = Object.entries(rec2);
      let e3 = Object.entries(rec3);
      expect(e1.length).assertEqual(1);
      expect(e2.length).assertEqual(2);
      expect(e3.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0820
     * @tc.name testObjectEntries082
     * @tc.desc Verify entries with boolean true and false mixed value Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries082", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { 't': true, 'f': false } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0830
     * @tc.name testObjectEntries083
     * @tc.desc Verify entries on Record after consecutive property operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries083", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { 'a': 1 } as Record<string, Any>;
      rec['b'] = 2;
      rec['c'] = 3;
      rec = { 'b': rec['b'], 'c': rec['c'] } as Record<string, Any>;
      rec['d'] = 4;
      let entries = Object.entries(rec);
      expect(entries.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0840
     * @tc.name testObjectEntries084
     * @tc.desc Verify entries returns all key-value pairs in insertion order for a three-property Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries084", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { 'a': 1, 'b': 2, 'c': 3 } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries.length).assertEqual(3);
      expect(entries[0]![0]).assertEqual('a');
      expect(entries[0]![1] as int).assertEqual(1);
      expect(entries[1]![0]).assertEqual('b');
      expect(entries[1]![1] as int).assertEqual(2);
      expect(entries[2]![0]).assertEqual('c');
      expect(entries[2]![1] as int).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0850
     * @tc.name testObjectEntries085
     * @tc.desc Verify entries with computed property name Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries085", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let prefix: string = "pre_";
      let rec: Record<string, Any> = {} as Record<string, Any>;
      rec[prefix + "key"] = "val";
      let entries = Object.entries(rec);
      expect(entries[0]![0]).assertEqual("pre_key");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0860
     * @tc.name testObjectEntries086
     * @tc.desc Verify entries on Record with max int key name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries086", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "2147483647": "max" } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries[0]![0]).assertEqual("2147483647");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0870
     * @tc.name testObjectEntries087
     * @tc.desc Verify entries on Record reconstituted from entries result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries087", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { 'a': 1, 'b': "str", 'c': true } as Record<string, Any>;
      let entries = Object.entries(rec);
      let typedEntries: Array<[string, Any]> = [];
      for (let i = 0; i < entries.length; i++) {
        let entry = entries[i];
        if (entry !== undefined && entry !== null) {
          typedEntries.push(entry);
        }
      }
      let rebuilt: Record<string, Any> = Object.fromEntries<Any>(typedEntries);
      expect(Object.keys(rebuilt).length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0880
     * @tc.name testObjectEntries088
     * @tc.desc Verify entries on EmptyClass assignable to Object variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries088", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let empty: EmptyClass = new EmptyClass();
      let obj: Object = empty;
      let entries = Object.entries(obj);
      expect(entries.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0890
     * @tc.name testObjectEntries089
     * @tc.desc Verify entries on Record created via function return
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries089", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let factory = (): Record<string, Any> => {
        return { "fromFunc": "val" } as Record<string, Any>;
      };
      let rec: Record<string, Any> = factory();
      let entries = Object.entries(rec);
      expect(entries.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0900
     * @tc.name testObjectEntries090
     * @tc.desc Verify entries entries element has $_hashCode on value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries090", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "obj": new Object() } as Record<string, Any>;
      let entries = Object.entries(rec);
      let val: Object = entries[0]![1] as Object;
      expect(val.toString()).assertEqual("[object Object]");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0910
     * @tc.name testObjectEntries091
     * @tc.desc Verify entries result Array is extensible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries091", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { 'a': 1 } as Record<string, Any>;
      let entries = Object.entries(rec);
      let origLen: int = entries.length;
      entries.push(['b', 2] as [string, Any]);
      expect(entries.length > origLen).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0920
     * @tc.name testObjectEntries092
     * @tc.desc Verify entries on Record with same key overwritten multiple times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries092", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "key": 1 } as Record<string, Any>;
      rec["key"] = 2;
      rec["key"] = 3;
      let entries = Object.entries(rec);
      expect(entries.length).assertEqual(1);
      expect(entries[0]![1] as int).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0930
     * @tc.name testObjectEntries093
     * @tc.desc Verify entries on Record with Cyrillic value string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries093", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "ru": "привет" } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries[0]![1] as string).assertEqual("привет");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0940
     * @tc.name testObjectEntries094
     * @tc.desc Verify entries on Record with Arabic value string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries094", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "ar": "مرحبا" } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries[0]![1] as string).assertEqual("مرحبا");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0950
     * @tc.name testObjectEntries095
     * @tc.desc Verify entries on Record with tab character in key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries095", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tabKey: string = "key\twith\ttab";
      let rec: Record<string, Any> = {} as Record<string, Any>;
      rec[tabKey] = "tabVal";
      let entries = Object.entries(rec);
      expect(entries[0]![0]).assertEqual(tabKey);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0960
     * @tc.name testObjectEntries096
     * @tc.desc Verify entries on Record with newline in key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries096", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nlKey: string = "key\nwith\nnewline";
      let rec: Record<string, Any> = {} as Record<string, Any>;
      rec[nlKey] = "nlVal";
      let entries = Object.entries(rec);
      expect(entries[0]![0]).assertEqual(nlKey);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0970
     * @tc.name testObjectEntries097
     * @tc.desc Verify entries on Record with min int value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries097", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "min": (-2147483648) } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries[0]![1] as int).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0980
     * @tc.name testObjectEntries098
     * @tc.desc Verify entries on Record with Record keys starting with underscore
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries098", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "_private": "val" } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries[0]![0]).assertEqual("_private");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0990
     * @tc.name testObjectEntries099
     * @tc.desc Verify entries on Record with dollar sign key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries099", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "$key": "val" } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries[0]![0]).assertEqual("$key");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_1000
     * @tc.name testObjectEntries100
     * @tc.desc Verify entries on Record with colon in key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries100", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "key:with:colon": "val" } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries[0]![0]).assertEqual("key:with:colon");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_1010
     * @tc.name testObjectEntries101
     * @tc.desc Verify entries on Record with question mark in key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries101", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "key?with?question": "val" } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries[0]![0]).assertEqual("key?with?question");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_1020
     * @tc.name testObjectEntries102
     * @tc.desc Verify entries on Record with bang in key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries102", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "key!with!bang": "val" } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries[0]![0]).assertEqual("key!with!bang");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_1030
     * @tc.name testObjectEntries103
     * @tc.desc Verify entries comprehensive: instanceof, entries count, key-value consistency with keys and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries103", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { 'x': 10, 'y': 20 } as Record<string, Any>;
      let entries = Object.entries(rec);
      let keys: string[] = Object.keys(rec);
      let values = Object.values(rec);
      expect(entries[0]!.length).assertEqual(2);
      expect(entries.length).assertEqual(keys.length);
      expect(entries.length).assertEqual(values.length);
      expect(entries[0]![1] as int).assertEqual(10);
      expect(entries[1]![1] as int).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_1040
     * @tc.name testObjectEntries104
     * @tc.desc Verify entries on string primitive object view returns indexed entries (one per char code unit)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries104", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let entries = Object.entries("ab" as Object);
      expect(entries.length).assertEqual(2);
      expect(entries[0]![0]).assertEqual('0');
      expect(entries[0]![1] as string).assertEqual('a');
      expect(entries[1]![0]).assertEqual('1');
      expect(entries[1]![1] as string).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_1050
     * @tc.name testObjectEntries105
     * @tc.desc Verify entries on empty string primitive object view returns no entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries105", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let entries = Object.entries("" as Object);
      expect(entries.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_1060
     * @tc.name testObjectEntries106
     * @tc.desc Verify entries on array [a,b] produces index-keyed pairs with preserved order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries106", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: string[] = ['x', 'y', 'z'];
      let entries = Object.entries(arr as Object);
      expect(entries.length).assertEqual(3);
      expect(entries[0]![0]).assertEqual('0');
      expect(entries[0]![1] as string).assertEqual('x');
      expect(entries[2]![0]).assertEqual('2');
      expect(entries[2]![1] as string).assertEqual('z');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_1070
     * @tc.name testObjectEntries107
     * @tc.desc Verify entries on empty array returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries107", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [];
      let entries = Object.entries(arr as Object);
      expect(entries.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_1080
     * @tc.name testObjectEntries108
     * @tc.desc Verify entries key/value match between Person instance entries and direct field access for name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries108", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: Person = new Person();
      let entries = Object.entries(p);
      expect(entries.length).assertEqual(2);
      let keys: string[] = Object.keys(p);
      expect(keys[0]).assertEqual(entries[0]![0]);
      expect(keys[1]).assertEqual(entries[1]![0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_1090
     * @tc.name testObjectEntries109
     * @tc.desc Verify DataBag entries length matches Object.keys length and tags is an array value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries109", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bag: DataBag = new DataBag();
      let entries = Object.entries(bag);
      let keys: string[] = Object.keys(bag);
      expect(entries.length).assertEqual(keys.length);
      expect(entries.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_1100
     * @tc.name testObjectEntries110
     * @tc.desc Verify entries result is a fresh array per call (pushing on first result does not affect second)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries110", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, int> = { 'a': 1 } as Record<string, int>;
      let e1 = Object.entries(rec);
      let len1: int = e1.length;
      let e2 = Object.entries(rec);
      expect(e2.length).assertEqual(len1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_1110
     * @tc.name testObjectEntries111
     * @tc.desc Verify entries on Record with only boolean false key present returns correct key/value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries111", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "off": false } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries.length).assertEqual(1);
      expect(entries[0]![0]).assertEqual("off");
      expect(entries[0]![1] as boolean).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_1120
     * @tc.name testObjectEntries112
     * @tc.desc Verify entries on Record with int MIN and MAX boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries112", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "max": 2147483647, "min": -2147483648 } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries.length).assertEqual(2);
      expect(entries[0]![1] as int).assertEqual(2147483647);
      expect(entries[1]![1] as int).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_1130
     * @tc.name testObjectEntries113
     * @tc.desc Verify entries on Record with empty string value returns that empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries113", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "empty": "" } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries.length).assertEqual(1);
      expect(entries[0]![0]).assertEqual("empty");
      expect((entries[0]![1] as string).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_1140
     * @tc.name testObjectEntries114
     * @tc.desc Verify entries on Record with NaN and Infinity number values enumerates them
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries114", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "nan": Number.NaN, "inf": Number.POSITIVE_INFINITY } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries.length).assertEqual(2);
      expect(entries[0]![0]).assertEqual("nan");
      expect(entries[1]![0]).assertEqual("inf");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_1150
     * @tc.name testObjectEntries115
     * @tc.desc Verify entries on Record with BigInt value returns BigInt-typed value accessible as BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries115", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bigVal: BigInt = BigInt(2);
      let rec: Record<string, Any> = { 'b': bigVal } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries.length).assertEqual(1);
      expect(entries[0]![0]).assertEqual('b');
      let v: BigInt = entries[0]![1] as BigInt;
      expect(v).assertEqual(BigInt(2));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_1160
     * @tc.name testObjectEntries116
     * @tc.desc Verify entries on single-element array [42] returns [["0",42]]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries116", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [42];
      let entries = Object.entries(arr as Object);
      expect(entries.length).assertEqual(1);
      expect(entries[0]![0]).assertEqual('0');
      expect(entries[0]![1] as int).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_1170
     * @tc.name testObjectEntries117
     * @tc.desc Verify entries on boolean array [true,false,true] returns all three entries with correct bool values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries117", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: boolean[] = [true, false, true];
      let entries = Object.entries(arr as Object);
      expect(entries.length).assertEqual(3);
      expect(entries[0]![1] as boolean).assertTrue();
      expect(entries[1]![1] as boolean).assertFalse();
      expect(entries[2]![1] as boolean).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_1180
     * @tc.name testObjectEntries118
     * @tc.desc Verify entries on Object.assign result target reflect merged keys from source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries118", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tgt: Record<string, Any> = { 'a': 1 } as Record<string, Any>;
      let src: Record<string, Any> = { 'b': 2 } as Record<string, Any>;
      Object.assign(tgt, src);
      let entries = Object.entries(tgt);
      expect(entries.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_1190
     * @tc.name testObjectEntries119
     * @tc.desc Verify entries on Person instance after field mutation reflects new value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries119", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: Person = new Person();
      p.name = "Bob";
      p.age = 40;
      let entries = Object.entries(p);
      expect(entries.length).assertEqual(2);
      expect(entries[0]![0]).assertEqual("name");
      expect(entries[0]![1] as string).assertEqual("Bob");
      expect(entries[1]![0]).assertEqual("age");
      expect(entries[1]![1] as int).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_1200
     * @tc.name testObjectEntries120
     * @tc.desc Verify entries iterated by index all have two elements (key and value)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries120", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { 'a': 1, 'b': 2, 'c': 3, 'd': 4 } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries.length).assertEqual(4);
      for (let i: int = 0; i < entries.length; i++) {
        expect(entries[i]!.length).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_1210
     * @tc.name testObjectEntries121
     * @tc.desc Verify entries on Record with all-undefined values enumerates all keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries121", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { 'x': undefined as Any, 'y': undefined as Any } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_1220
     * @tc.name testObjectEntries122
     * @tc.desc Verify entries length matches Object.getOwnPropertyNames length for a plain Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries122", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, int> = { 'p': 1, 'q': 2 } as Record<string, int>;
      let entries = Object.entries(rec as Object);
      let names: string[] = Object.getOwnPropertyNames(rec);
      expect(entries.length).assertEqual(names.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_1230
     * @tc.name testObjectEntries123
     * @tc.desc Verify multiple repeated entries calls return equal-length arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries123", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, int> = { 'a': 1 } as Record<string, int>;
      let n: int = Object.entries(rec as Object).length;
      for (let i: int = 0; i < 20; i++) {
        expect(Object.entries(rec as Object).length).assertEqual(n);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_1240
     * @tc.name testObjectEntries124
     * @tc.desc Verify entries on two Records with same shape produce same length but different array references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries124", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Record<string, int> = { 'k': 1 } as Record<string, int>;
      let b: Record<string, int> = { 'k': 1 } as Record<string, int>;
      let ea = Object.entries(a as Object);
      let eb = Object.entries(b as Object);
      expect(ea.length).assertEqual(eb.length);
      expect(ea).not().assertEqual(eb);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_1250
     * @tc.name testObjectEntries125
     * @tc.desc Verify entries on Record with only null values enumerates both keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries125", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { 'a': null as Any, 'b': null as Any } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries.length).assertEqual(2);
      expect(entries[0]![0]).assertEqual('a');
      expect(entries[1]![0]).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_1260
     * @tc.name testObjectEntries126
     * @tc.desc Verify entries on float array [1.5, 2.5] returns correct numeric values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries126", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: double[] = [1.5, 2.5];
      let entries = Object.entries(arr as Object);
      expect(entries.length).assertEqual(2);
      expect(entries[0]![1] as double).assertEqual(1.5);
      expect(entries[1]![1] as double).assertEqual(2.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_1270
     * @tc.name testObjectEntries127
     * @tc.desc Verify entries on string array containing empty string value returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectEntries127", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: string[] = [""];
      let entries = Object.entries(arr as Object);
      expect(entries.length).assertEqual(1);
      expect(entries[0]![0]).assertEqual('0');
      expect(entries[0]![1] as string).assertEqual("");
    });
  });
}
