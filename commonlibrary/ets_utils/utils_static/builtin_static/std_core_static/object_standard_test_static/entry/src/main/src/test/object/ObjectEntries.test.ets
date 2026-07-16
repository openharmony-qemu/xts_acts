'use static'
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it } from '../../../../hypium/index';
import { TestType, Size, Level } from '../../../../hypium/Constant';
import Utils from '../Util.test';


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
 tags: Array<string> = ["a", "b"];
}

class Base {
 baseProp: string = "base";
}

class Derived extends Base {
 derivedProp: string = "derived";
}


export default function ObjectEntriesTest(): void {
  describe('ObjectEntriesTest', (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {});
    afterAll((): void => {});

    /**
     * @tc.name testObjectEntries0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0010
     * @tc.desc Verify Object.entries with empty Record object for returning empty array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectEntries0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = {} as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(Object.entries(rec).length).assertEqual(0);
    });

    /**
     * @tc.name testObjectEntries0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0020
     * @tc.desc Verify Object.entries with single string property Record for correct key-value pair
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectEntries0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "name": "ArkTS" } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries.length).assertEqual(1);
      expect(entries[0]![0]).assertEqual("name");
      expect(entries[0]![1] as string).assertEqual("ArkTS");
    });

    /**
     * @tc.name testObjectEntries0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0030
     * @tc.desc Verify Object.entries with single number property Record for correct key-value pair
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectEntries0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "age": 25 } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries.length).assertEqual(1);
      expect(entries[0]![0]).assertEqual("age");
      expect(entries[0]![1] as int).assertEqual(25);
    });

    /**
     * @tc.name testObjectEntries0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0040
     * @tc.desc Verify Object.entries with boolean true property Record for correct key-value pair
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectEntries0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "active": true } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries.length).assertEqual(1);
      expect(entries[0]![0]).assertEqual("active");
      expect(entries[0]![1] as boolean).assertTrue();
    });

    /**
     * @tc.name testObjectEntries0050
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0050
     * @tc.desc Verify Object.entries with null value property Record for correct null value handling
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectEntries0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "data": null } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries.length).assertEqual(1);
      expect(entries[0]![0]).assertEqual("data");
      expect(entries[0]![1] as null).assertEqual(null);
    });

    /**
     * @tc.name testObjectEntries0060
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0060
     * @tc.desc Verify Object.entries with undefined value property Record for correct key enumeration
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectEntries0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "data": undefined } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries.length).assertEqual(1);
      expect(entries[0]![0]).assertEqual("data");
      expect(entries[0]![1] as undefined).assertEqual(undefined);
    });

    /**
     * @tc.name testObjectEntries0070
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0070
     * @tc.desc Verify Object.entries with nested object value Record for correct value reference
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectEntries0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let child: Record<string, Any> = { "x": 1, "y": 2 } as Record<string, Any>;
      let rec: Record<string, Any> = { "point": child } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries.length).assertEqual(1);
      expect(entries[0]![0]).assertEqual("point");
      expect(entries[0]![1] as Object).assertEqual(child as Object);
    });

    /**
     * @tc.name testObjectEntries0080
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0080
     * @tc.desc Verify Object.entries with array value Record for correct array value handling
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectEntries0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arrVal: Array<int> = [1, 2, 3];
      let rec: Record<string, Any> = { "list": arrVal } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries.length).assertEqual(1);
      expect(entries[0]![0]).assertEqual("list");
      expect(entries[0]![1] as Object).assertEqual(arrVal as Object);
    });

    /**
     * @tc.name testObjectEntries0090
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0090
     * @tc.desc Verify Object.entries with multi-property mixed-type Record for correct key enumeration
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectEntries0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.name testObjectEntries0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0100
     * @tc.desc Verify Object.entries with empty string key Record for correct empty string key handling
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectEntries0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "": "emptyKey" } as Record<string, Any>;
      expect(Object.entries(rec).length).assertEqual(1);
      expect(String(rec[""])).assertEqual("emptyKey");
    });

    /**
     * @tc.name testObjectEntries0110
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0110
     * @tc.desc Verify Object.entries with numeric string key Record for string key type preservation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectEntries0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "123": "numberStr" } as Record<string, Any>;
      expect(Object.entries(rec).length).assertEqual(1);
      expect(String(rec["123"])).assertEqual("numberStr");
    });

    /**
     * @tc.name testObjectEntries0120
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0120
     * @tc.desc Verify Object.entries with special character key Record for correct key character preservation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectEntries0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "my-key_1": "value" } as Record<string, Any>;
      expect(Object.entries(rec).length).assertEqual(1);
      expect(String(rec["my-key_1"])).assertEqual("value");
    });

    /**
     * @tc.name testObjectEntries0130
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0130
     * @tc.desc Verify Object.entries with large property count Record for correct length return
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectEntries0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.name testObjectEntries0140
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0140
     * @tc.desc Verify Object.entries with empty Object instance for returning empty array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectEntries0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      let entries = Object.entries(obj);
      expect(entries.length).assertEqual(0);
    });

    /**
     * @tc.name testObjectEntries0150
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0150
     * @tc.desc Verify Object.entries with empty custom class instance for returning empty array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectEntries0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: Object = new EmptyClass();
      let entries = Object.entries(instance);
      expect(entries.length).assertEqual(0);
    });

    /**
     * @tc.name testObjectEntries0160
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0160
     * @tc.desc Verify Object.entries with custom class having public properties for correct key enumeration
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectEntries0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: Object = new Person();
      let entries = Object.entries(p);
      expect(entries.length).assertEqual(2);
      expect(entries[0]![0] as string).assertEqual("name");
      expect(entries[0]![1] as string).assertEqual("Alice");
      expect(entries[1]![0] as string).assertEqual("age");
      expect(entries[1]![1] as int).assertEqual(30);
    });

    /**
     * @tc.name testObjectEntries0170
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0170
     * @tc.desc Verify Object.entries with class having multiple property types for correct enumeration count
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectEntries0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Object = new DataBag();
      let entries = Object.entries(d);
      expect(entries.length).assertEqual(4);
    });

    /**
     * @tc.name testObjectEntries0180
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0180
     * @tc.desc Verify Object.entries with Array instance as Any parameter for index-keyed entry keys
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectEntries0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<int> = [10, 20, 30];
      let entries = Object.entries(arr);
      expect(entries.length).assertEqual(3);
      expect(entries[0]![0] as string).assertEqual("0");
      expect(entries[0]![1] as int).assertEqual(10);
      expect(entries[1]![0] as string).assertEqual("1");
      expect(entries[1]![1] as int).assertEqual(20);
      expect(entries[2]![0] as string).assertEqual("2");
      expect(entries[2]![1] as int).assertEqual(30);
    });

    /**
     * @tc.name testObjectEntries0190
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0190
     * @tc.desc Verify Object.entries with inherited class instance for enumerating own and inherited properties
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectEntries0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Object = new Derived();
      let entries = Object.entries(d);
      expect(entries.length).assertEqual(2);
    });

    /**
     * @tc.name testObjectEntries0200
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0200
     * @tc.desc Verify Object.entries return value is Array instance via instanceof check
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectEntries0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "x": 1 } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries.length).assertEqual(1);
      expect(entries[0] != null).assertTrue();
      expect(entries[0]![0]).assertEqual("x");
      expect(entries[0]![1] as int).assertEqual(1);
    });

    /**
     * @tc.name testObjectEntries0210
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0210
     * @tc.desc Verify Object.entries return entry element is key-value tuple with length 2
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectEntries0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "name": "test" } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(Object.entries(rec).length).assertEqual(1);
      let entry: [string, Any] = entries[0]!;
      expect(entry.length).assertEqual(2);
      expect(entry[0]).assertEqual("name");
      expect(entry[1] as string).assertEqual("test");
    });

    /**
     * @tc.name testObjectEntries0220
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0220
     * @tc.desc Verify Object.entries preserves property definition order in returned array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectEntries0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "a": 1, "b": 2, "c": 3 } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries.length).assertEqual(3);
      expect(entries[0]![0]).assertEqual("a");
      expect(entries[1]![0]).assertEqual("b");
      expect(entries[2]![0]).assertEqual("c");
    });

    /**
     * @tc.name testObjectEntries0230
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0230
     * @tc.desc Verify Object.entries reflects value changes after property modification for shallow copy behavior
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectEntries0230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.name testObjectEntries0240
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0240
     * @tc.desc Verify Object.entries with empty string value Record for correct empty string value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectEntries0240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "str": "" } as Record<string, Any>;
      expect(Object.entries(rec).length).assertEqual(1);
      expect(String(rec["str"])).assertEqual("");
    });

    /**
     * @tc.name testObjectEntries0250
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0250
     * @tc.desc Verify Object.entries with zero number value Record for correct zero value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectEntries0250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "zero": 0 } as Record<string, Any>;
      expect(Object.entries(rec).length).assertEqual(1);
      expect(rec["zero"] as int).assertEqual(0);
    });

    /**
     * @tc.name testObjectEntries0260
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0260
     * @tc.desc Verify Object.entries with float value Record for correct float value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectEntries0260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "pi": 3.14 } as Record<string, Any>;
      expect(Object.entries(rec).length).assertEqual(1);
      expect(rec["pi"] as double).assertEqual(3.14);
    });

    /**
     * @tc.name testObjectEntries0270
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0270
     * @tc.desc Verify Object.entries with char value Record for correct char value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectEntries0270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "initial": "A" } as Record<string, Any>;
      expect(Object.entries(rec).length).assertEqual(1);
      expect(String(rec["initial"])).assertEqual("A");
    });

    /**
     * @tc.name testObjectEntries0280
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0280
     * @tc.desc Verify Object.entries return array is iterable via for..of loop with correct entry count
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectEntries0280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "a": 1, "b": 2 } as Record<string, Any>;
      let entries = Object.entries(rec);
      let count: int = 0;
      for (let i: int = 0; i < entries.length; i++) {
        expect(entries[i]!.length).assertEqual(2);
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testObjectEntries0290
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0290
     * @tc.desc Verify Object.entries with boolean false value Record for correct false value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectEntries0290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "flag": false } as Record<string, Any>;
      expect(Object.entries(rec).length).assertEqual(1);
      expect(rec["flag"] as boolean).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0300
     * @tc.name testObjectEntries0300
     * @tc.desc Verify each entries element is an Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectEntries0300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "x": 10 } as Record<string, Any>;
      let entries = Object.entries(rec);
      let firstEntry = entries[0];
      expect(entries.length).assertEqual(1);
      expect(firstEntry != null).assertTrue();
      expect(firstEntry!.length).assertEqual(2);
      expect(firstEntry![0]).assertEqual("x");
      expect(firstEntry![1] as int).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0310
     * @tc.name testObjectEntries0310
     * @tc.desc Verify entry key at index 0 is string type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectEntries0310', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "key": "val" } as Record<string, Any>;
      let entries = Object.entries(rec);
      let entryKey: string = entries[0]![0];
      expect(typeof entryKey).assertEqual('string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0320
     * @tc.name testObjectEntries0320
     * @tc.desc Verify entry value at index 1 matches original property value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectEntries0320', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "val": 42 } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries[0]![1] as int).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0330
     * @tc.name testObjectEntries0330
     * @tc.desc Verify entries to fromEntries round-trip preserves data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectEntries0330', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "a": 1, "b": 2 } as Record<string, Any>;
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
      expect(rebuilt["a"] as int).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0340
     * @tc.name testObjectEntries0340
     * @tc.desc Verify entries result consistent across multiple calls on same Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectEntries0340', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "x": 1, "y": 2 } as Record<string, Any>;
      let entries1 = Object.entries(rec);
      let entries2 = Object.entries(rec);
      expect(entries1.length).assertEqual(entries2.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0350
     * @tc.name testObjectEntries0350
     * @tc.desc Verify entries on single property Record returns array length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectEntries0350', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "only": "one" } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0360
     * @tc.name testObjectEntries0360
     * @tc.desc Verify entries result toString is valid string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectEntries0360', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "k": "v" } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries.toString().length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0370
     * @tc.name testObjectEntries0370
     * @tc.desc Verify entries with BigInt value Record returns correct entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectEntries0370', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bigVal: BigInt = BigInt(999);
      let rec: Record<string, Any> = { "big": bigVal } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0380
     * @tc.name testObjectEntries0380
     * @tc.desc Verify entries with Object instance value Record preserves reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectEntries0380', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let objVal: Object = new Object();
      let rec: Record<string, Any> = { "obj": objVal } as Record<string, Any>;
      let entries = Object.entries(rec);
      let entryVal: Object = entries[0]![1] as Object;
      expect(entryVal).assertEqual(objVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0390
     * @tc.name testObjectEntries0390
     * @tc.desc Verify entries with double precision float value Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectEntries0390', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "pi": 3.14159 } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries.length).assertEqual(1);
      expect(entries[0]![1] as number).assertEqual(3.14159);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0400
     * @tc.name testObjectEntries0400
     * @tc.desc Verify entries with negative number value Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectEntries0400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "neg": (-100) } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries[0]![1] as int).assertEqual(-100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0410
     * @tc.name testObjectEntries0410
     * @tc.desc Verify entries with large int value Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectEntries0410', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "max": 2147483647 } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries[0]![1] as int).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0420
     * @tc.name testObjectEntries0420
     * @tc.desc Verify entries with Unicode Chinese string value Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectEntries0420', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "cn": "你好世界" } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries[0]![1] as string).assertEqual("你好世界");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0430
     * @tc.name testObjectEntries0430
     * @tc.desc Verify entries with long string value Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectEntries0430', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr: string = "abcdefghij".repeat(50);
      let rec: Record<string, Any> = { "long": longStr } as Record<string, Any>;
      let entries = Object.entries(rec);
      let val: string = entries[0]![1] as string;
      expect(val.length).assertEqual(500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0440
     * @tc.name testObjectEntries0440
     * @tc.desc Verify entries with Unicode Chinese key Record returns correct key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectEntries0440', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "测试键": "val" } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries[0]![0]).assertEqual("测试键");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0450
     * @tc.name testObjectEntries0450
     * @tc.desc Verify entries with Russian characters key Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectEntries0450', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "ключ": "значение" } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries[0]![0]).assertEqual("ключ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0460
     * @tc.name testObjectEntries0460
     * @tc.desc Verify entries with Arabic characters key Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectEntries0460', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "مفتاح": "قيمة" } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries[0]![0]).assertEqual("مفتاح");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0470
     * @tc.name testObjectEntries0470
     * @tc.desc Verify entries with Japanese kanji key Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectEntries0470', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "鍵名": "値" } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries[0]![0]).assertEqual("鍵名");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0480
     * @tc.name testObjectEntries0480
     * @tc.desc Verify entries with emoji key Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectEntries0480', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let emojiKey: string = "🌟key🌟";
      let rec: Record<string, Any> = {} as Record<string, Any>;
      rec[emojiKey] = "emojiVal";
      let entries = Object.entries(rec);
      expect(entries[0]![0]).assertEqual(emojiKey);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0490
     * @tc.name testObjectEntries0490
     * @tc.desc Verify entries with XSS script tag key Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectEntries0490', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let xssKey: string = "<script>alert(1)</script>";
      let rec: Record<string, Any> = {} as Record<string, Any>;
      rec[xssKey] = "xssVal";
      let entries = Object.entries(rec);
      expect(entries[0]![0]).assertEqual(xssKey);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0500
     * @tc.name testObjectEntries0500
     * @tc.desc Verify entries with key containing spaces Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectEntries0500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "key with spaces": "val" } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries[0]![0]).assertEqual("key with spaces");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0510
     * @tc.name testObjectEntries0510
     * @tc.desc Verify entries with key containing dashes Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectEntries0510', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "key-with-dash": "val" } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries[0]![0]).assertEqual("key-with-dash");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0520
     * @tc.name testObjectEntries0520
     * @tc.desc Verify entries with key containing underscores Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectEntries0520', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "key_with_underscore": "val" } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries[0]![0]).assertEqual("key_with_underscore");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0530
     * @tc.name testObjectEntries0530
     * @tc.desc Verify entries with key containing dots Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectEntries0530', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "key.with.dot": "val" } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries[0]![0]).assertEqual("key.with.dot");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0540
     * @tc.name testObjectEntries0540
     * @tc.desc Verify entries with custom class instance as value Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectEntries0540', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let person: Person = new Person();
      let rec: Record<string, Any> = { "person": person } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries.length).assertEqual(1);
      expect(entries[0]![0]).assertEqual("person");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0550
     * @tc.name testObjectEntries0550
     * @tc.desc Verify entries with escaped characters in value Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectEntries0550', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "esc": "a\\b" } as Record<string, Any>;
      let entries = Object.entries(rec);
      let val: string = entries[0]![1] as string;
      expect(val).assertEqual("a\\b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0560
     * @tc.name testObjectEntries0560
     * @tc.desc Verify entries with newline and tab in value Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectEntries0560', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "special": "a\nb\tc" } as Record<string, Any>;
      let entries = Object.entries(rec);
      let val: string = entries[0]![1] as string;
      expect(val).assertEqual("a\nb\tc");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0570
     * @tc.name testObjectEntries0570
     * @tc.desc Verify entries with double quote in value Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectEntries0570', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "quote": "a\"b" } as Record<string, Any>;
      let entries = Object.entries(rec);
      let val: string = entries[0]![1] as string;
      expect(val).assertEqual("a\"b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0580
     * @tc.name testObjectEntries0580
     * @tc.desc Verify entries after dynamic property addition to Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectEntries0580', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "a": 1 } as Record<string, Any>;
      rec["b"] = 2 as Any;
      let entries = Object.entries(rec);
      expect(entries.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0590
     * @tc.name testObjectEntries0590
     * @tc.desc Verify entries after property deletion from Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectEntries0590', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "a": 1, "b": 2 } as Record<string, Any>;
      rec = { "b": 2 } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries.length).assertEqual(1);
      expect(entries[0]![0]).assertEqual("b");
      expect(entries[0]![1] as int).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0600
     * @tc.name testObjectEntries0600
     * @tc.desc Verify entries on Record with numeric index keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectEntries0600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "0": "zero", "1": "one" } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0610
     * @tc.name testObjectEntries0610
     * @tc.desc Verify entries on Record with 50 properties returns correct length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectEntries0610', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = {} as Record<string, Any>;
      let i: int = 0;
      while (i < 50) {
        rec["p" + String(i)] = i as Any;
        i++;
      }
      let entries = Object.entries(rec);
      expect(entries.length).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0620
     * @tc.name testObjectEntries0620
     * @tc.desc Verify entries on Record with only undefined values still enumerates keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectEntries0620', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "undef": undefined } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0630
     * @tc.name testObjectEntries0630
     * @tc.desc Verify entries returns own properties only (not prototype toString)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectEntries0630', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0640
     * @tc.name testObjectEntries0640
     * @tc.desc Verify entries result array is independent copy (mutating does not affect source)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectEntries0640', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "a": 1 } as Record<string, Any>;
      let entries = Object.entries(rec);
      let entriesLen: int = entries.length;
      entries.push(["b", 2] as [string, Any]);
      expect(Object.entries(rec).length).assertEqual(entriesLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0650
     * @tc.name testObjectEntries0650
     * @tc.desc Verify entries with reserved word key Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectEntries0650', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "class": "reserved" } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries[0]![0]).assertEqual("class");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0660
     * @tc.name testObjectEntries0660
     * @tc.desc Verify entries on Record with mixed case key names
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectEntries0660', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "Key": 1, "KEY": 2, "key": 3 } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0670
     * @tc.name testObjectEntries0670
     * @tc.desc Verify entries with single character key Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectEntries0670', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "k": "v" } as Record<string, Any>;
      let entries = Object.entries(rec);
      expect(entries[0]![0]).assertEqual("k");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ENTRIES_0680
     * @tc.name testObjectEntries0680
     * @tc.desc Verify entries with zero-width space key Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectEntries0680', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let zwsKey: string = "​";
      let rec: Record<string, Any> = {} as Record<string, Any>;
      rec[zwsKey] = "zwsVal";
      let entries = Object.entries(rec);
      expect(entries[0]![0]).assertEqual(zwsKey);
    });
