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


class ValuesObjClass {
  name: string = "test";
  num: int = 123;
}

class ValuesMultiTypeClass {
  text: string = "hello";
  count: int = 42;
  flag: boolean = true;
  data: Object | null = null;
}

class ValuesSingleFieldClass {
  only: string = "onlyValue";
}

class ValuesDynamicObj {
  value: string = "original";
}

class ValuesBaseFields {
  baseName: string = "base";
}

class ValuesDerivedFields extends ValuesBaseFields {
  derivedCount: int = 2;
}

class ValuesAllNumeric {
  a: int = 1;
  b: int = 2;
  c: int = 3;
}

class ValuesWithNested {
  label: string = "root";
  child: ValuesObjClass = new ValuesObjClass();
}

class ValuesGrandBase {
  g: string = "grand";
}

class ValuesMidBase extends ValuesGrandBase {
  m: int = 10;
}

class ValuesLeaf extends ValuesMidBase {
  l: boolean = true;
}

class ValuesOptionalField {
  present: string = "here";
  maybe: string | null = null;
}

export default function ObjectValuesTest(): void {
  describe('ObjectValuesTest', (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {});
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_0100
     * @tc.name testObjectValues001
     * @tc.desc Verify Object.values with empty Record and empty Object instance returns empty array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = {} as Record<string, Any>;
      let values: Array<Any> = Object.values(record);
      expect(values.length).assertEqual(0);
      let obj: Object = new Object();
      let objValues: Array<Any> = Object.values(obj);
      expect(objValues.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_0200
     * @tc.name testObjectValues002
     * @tc.desc Verify Object.values with single string property returns correct value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = { "a": "hello" } as Record<string, Any>;
      let values: Array<Any> = Object.values(record);
      expect(values.length).assertEqual(1);
      expect(values[0] as string).assertEqual("hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_0300
     * @tc.name testObjectValues003
     * @tc.desc Verify Object.values with single number property returns correct value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = { "a": 42 } as Record<string, Any>;
      let values: Array<Any> = Object.values(record);
      expect(values.length).assertEqual(1);
      expect(values[0] as int).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_0400
     * @tc.name testObjectValues004
     * @tc.desc Verify Object.values with single boolean true property returns correct value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = { "a": true } as Record<string, Any>;
      let values: Array<Any> = Object.values(record);
      expect(values.length).assertEqual(1);
      expect(values[0] as boolean).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_0500
     * @tc.name testObjectValues005
     * @tc.desc Verify Object.values with single null property returns array containing null
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = { "a": null } as Record<string, Any>;
      let values: Array<Any> = Object.values(record);
      expect(values.length).assertEqual(1);
      expect(values[0] as null).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_0600
     * @tc.name testObjectValues006
     * @tc.desc Verify Object.values with single array property returns the array as value element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<int> = [1, 2, 3];
      let record: Record<string, Any> = { "a": arr } as Record<string, Any>;
      let values: Array<Any> = Object.values(record);
      expect(values.length).assertEqual(1);
      expect(values[0] as Object).assertEqual(arr as Object);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_0700
     * @tc.name testObjectValues007
     * @tc.desc Verify Object.values with single value 0 returns [0] not confused with falsy
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = { "a": 0 } as Record<string, Any>;
      let values: Array<Any> = Object.values(record);
      expect(values.length).assertEqual(1);
      expect(values[0] as int).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_0800
     * @tc.name testObjectValues008
     * @tc.desc Verify Object.values with single boolean false returns [false]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = { "a": false } as Record<string, Any>;
      let values: Array<Any> = Object.values(record);
      expect(values.length).assertEqual(1);
      expect(values[0] as boolean).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_0900
     * @tc.name testObjectValues009
     * @tc.desc Verify Object.values with single empty string property returns [""]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = { "a": "" } as Record<string, Any>;
      let values: Array<Any> = Object.values(record);
      expect(values.length).assertEqual(1);
      expect(values[0] as string).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_1000
     * @tc.name testObjectValues010
     * @tc.desc Verify Object.values with single negative integer property returns [-123]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = { "a": (-123) as Any } as Record<string, Any>;
      let values: Array<Any> = Object.values(record);
      expect(values.length).assertEqual(1);
      expect(values[0] as int).assertEqual(-123);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_1100
     * @tc.name testObjectValues011
     * @tc.desc Verify Object.values with single float property returns [3.14]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = { "a": 3.14 } as Record<string, Any>;
      let values: Array<Any> = Object.values(record);
      expect(values.length).assertEqual(1);
      expect(values[0] as double).assertEqual(3.14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_1200
     * @tc.name testObjectValues012
     * @tc.desc Verify Object.values with single large number property returns [99999999]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = { "a": 99999999 } as Record<string, Any>;
      let values: Array<Any> = Object.values(record);
      expect(values.length).assertEqual(1);
      expect(values[0] as int).assertEqual(99999999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_1300
     * @tc.name testObjectValues013
     * @tc.desc Verify Object.values with mixed types Record returns all values correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arrVal: Array<int> = [1, 2, 3];
      let record: Record<string, Any> = {
        "strVal": "hello", "numVal": 42, "boolVal": true, "nullVal": null, "arrVal": arrVal
      } as Record<string, Any>;
      let values: Array<Any> = Object.values(record);
      expect(values.length).assertEqual(5);
      expect(values[0] as string).assertEqual("hello");
      expect(values[1] as int).assertEqual(42);
      expect(values[2] as boolean).assertEqual(true);
      expect(values[3] as null).assertEqual(null);
      expect(values[4] as Object).assertEqual(arrVal as Object);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_1400
     * @tc.name testObjectValues014
     * @tc.desc Verify Object.values with 10 properties returns correct length and elements
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = {
        "prop0": 0, "prop1": 1, "prop2": 2, "prop3": 3, "prop4": 4,
        "prop5": 5, "prop6": 6, "prop7": 7, "prop8": 8, "prop9": 9
      } as Record<string, Any>;
      let values: Array<Any> = Object.values(record);
      expect(values.length).assertEqual(10);
      expect(values[0] as int).assertEqual(0);
      expect(values[9] as int).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_1500
     * @tc.name testObjectValues015
     * @tc.desc Verify Object.values when property value comes from a variable
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: Object = "dynamic";
      let record: Record<string, Any> = { "a": val } as Record<string, Any>;
      let values: Array<Any> = Object.values(record);
      expect(values.length).assertEqual(1);
      expect(values[0] as string).assertEqual("dynamic");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_1600
     * @tc.name testObjectValues016
     * @tc.desc Verify Object.values with single undefined property returns [undefined]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = { "a": undefined } as Record<string, Any>;
      let values: Array<Any> = Object.values(record);
      expect(values.length).assertEqual(1);
      expect(values[0] as undefined).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_1700
     * @tc.name testObjectValues017
     * @tc.desc Verify Object.values with numeric string keys preserves insertion order
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = { "1": "one", "2": "two", "3": "three" } as Record<string, Any>;
      let values: Array<Any> = Object.values(record);
      expect(values.length).assertEqual(3);
      expect(values[0] as string).assertEqual("one");
      expect(values[1] as string).assertEqual("two");
      expect(values[2] as string).assertEqual("three");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_1800
     * @tc.name testObjectValues018
     * @tc.desc Verify Object.values with custom class instance returns field values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: ValuesObjClass = new ValuesObjClass();
      let values: Array<Any> = Object.values(obj);
      expect(values.length).assertEqual(2);
      expect(values[0] as string).assertEqual("test");
      expect(values[1] as int).assertEqual(123);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_1900
     * @tc.name testObjectValues019
     * @tc.desc Verify Object.values with array object returns element values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: string[] = ["x", "y", "z"];
      let values: Array<Any> = Object.values(arr);
      expect(values.length).assertEqual(3);
      expect(values[0] as string).assertEqual("x");
      expect(values[1] as string).assertEqual("y");
      expect(values[2] as string).assertEqual("z");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_2000
     * @tc.name testObjectValues020
     * @tc.desc Verify Object.values with empty array returns empty array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: string[] = [];
      let values: Array<Any> = Object.values(arr);
      expect(values.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_2100
     * @tc.name testObjectValues021
     * @tc.desc Verify Object.values with class containing multi-type properties returns all values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: ValuesMultiTypeClass = new ValuesMultiTypeClass();
      let values: Array<Any> = Object.values(obj);
      expect(values.length).assertEqual(4);
      expect(values[0] as string).assertEqual("hello");
      expect(values[1] as int).assertEqual(42);
      expect(values[2] as boolean).assertEqual(true);
      expect(values[3] as null).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_2200
     * @tc.name testObjectValues022
     * @tc.desc Verify Object.values returns one value for a one-property Record
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = { "a": 1 } as Record<string, Any>;
      let values: Array<Any> = Object.values(record);
      expect(values.length).assertEqual(1);
      expect(values[0] as int).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_2300
     * @tc.name testObjectValues023
     * @tc.desc Verify Object.values preserves the definition order of properties
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = { "first": "alpha", "second": "beta", "third": "gamma" } as Record<string, Any>;
      let values: Array<Any> = Object.values(record);
      expect(values.length).assertEqual(3);
      expect(values[0] as string).assertEqual("alpha");
      expect(values[1] as string).assertEqual("beta");
      expect(values[2] as string).assertEqual("gamma");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_2400
     * @tc.name testObjectValues024
     * @tc.desc Verify Object.values handles duplicate property values correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = { "a": "same", "b": "same" } as Record<string, Any>;
      let values: Array<Any> = Object.values(record);
      expect(values.length).assertEqual(2);
      expect(values[0] as string).assertEqual("same");
      expect(values[1] as string).assertEqual("same");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_2500
     * @tc.name testObjectValues025
     * @tc.desc Verify Object.values with class having single property returns single-element array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: ValuesSingleFieldClass = new ValuesSingleFieldClass();
      let values: Array<Any> = Object.values(obj);
      expect(values.length).assertEqual(1);
      expect(values[0] as string).assertEqual("onlyValue");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_2600
     * @tc.name testObjectValues026
     * @tc.desc Verify Object.values with unicode and special characters preserves values correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = { "chinese": "中文", "emoji": "😀", "special": "!@#" } as Record<string, Any>;
      let values: Array<Any> = Object.values(record);
      expect(values.length).assertEqual(3);
      expect(values[0] as string).assertEqual("中文");
      expect(values[1] as string).assertEqual("😀");
      expect(values[2] as string).assertEqual("!@#");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_2700
     * @tc.name testObjectValues027
     * @tc.desc Verify Object.values on derived class instance returns inherited and own field values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: ValuesDerivedFields = new ValuesDerivedFields();
      let values: Array<Any> = Object.values(obj);
      expect(values.length).assertEqual(2);
      expect(values[0] as string).assertEqual("base");
      expect(values[1] as int).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_2800
     * @tc.name testObjectValues028
     * @tc.desc Verify Object.values returns correct value after assigning a new property to a Record
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = {} as Record<string, Any>;
      record["key"] = "newValue";
      let values: Array<Any> = Object.values(record);
      expect(values.length).assertEqual(1);
      expect(values[0] as string).assertEqual("newValue");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_2900
     * @tc.name testObjectValues029
     * @tc.desc Verify Object.values is idempotent when called multiple times on same object
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = { "a": 1 } as Record<string, Any>;
      let v1: Array<Any> = Object.values(record);
      let v2: Array<Any> = Object.values(record);
      expect(v1.length).assertEqual(v2.length);
      expect(v1[0] as int).assertEqual(v2[0] as int);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_3000
     * @tc.name testObjectValues030
     * @tc.desc Verify Object.values lists shadowed toString property on Record as an own enumerable value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = { "toString": "shadow", "real": 1 } as Record<string, Any>;
      let values: Array<Any> = Object.values(record);
      expect(values.length).assertEqual(2);
      expect(values[0] as string).assertEqual("shadow");
      expect(values[1] as int).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_3100
     * @tc.name testObjectValues031
     * @tc.desc Verify Object.values returns class fields in declared order
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: ValuesAllNumeric = new ValuesAllNumeric();
      let values: Array<Any> = Object.values(obj);
      expect(values.length).assertEqual(3);
      expect(values[0] as int).assertEqual(1);
      expect(values[1] as int).assertEqual(2);
      expect(values[2] as int).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_3200
     * @tc.name testObjectValues032
     * @tc.desc Verify Object.values returns values in insertion order across interleaved types
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = { "s": "x", "n": 1, "b": false } as Record<string, Any>;
      let values: Array<Any> = Object.values(record);
      expect(values.length).assertEqual(3);
      expect(values[0] as string).assertEqual("x");
      expect(values[1] as int).assertEqual(1);
      expect(values[2] as boolean).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_3300
     * @tc.name testObjectValues033
     * @tc.desc Verify Object.values reflects mutated class field values after assignment
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: ValuesDynamicObj = new ValuesDynamicObj();
      obj.value = "updated";
      let values: Array<Any> = Object.values(obj);
      expect(values.length).assertEqual(1);
      expect(values[0] as string).assertEqual("updated");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_3400
     * @tc.name testObjectValues034
     * @tc.desc Verify Object.values includes all falsy values (null, false, 0, empty string) as separate entries
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = { "n": null, "b": false, "z": 0, "s": "" } as Record<string, Any>;
      let values: Array<Any> = Object.values(record);
      expect(values.length).assertEqual(4);
      expect(values[0] as null).assertEqual(null);
      expect(values[1] as boolean).assertEqual(false);
      expect(values[2] as int).assertEqual(0);
      expect(values[3] as string).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_3500
     * @tc.name testObjectValues035
     * @tc.desc Verify Object.values returns the same object reference stored as a value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let shared: ValuesObjClass = new ValuesObjClass();
      let record: Record<string, Any> = { "ref": shared } as Record<string, Any>;
      let values: Array<Any> = Object.values(record);
      expect(values.length).assertEqual(1);
      expect(values[0] as Object).assertEqual(shared as Object);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_3600
     * @tc.name testObjectValues036
     * @tc.desc Verify Object.values returns values for records with CJK keys in insertion order
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = { "名称": "n", "値": 1 } as Record<string, Any>;
      let values: Array<Any> = Object.values(record);
      expect(values.length).assertEqual(2);
      expect(values[0] as string).assertEqual("n");
      expect(values[1] as int).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_3700
     * @tc.name testObjectValues037
     * @tc.desc Verify Object.values on class instance returns field count matching declared fields and not methods
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: ValuesWithNested = new ValuesWithNested();
      let values: Array<Any> = Object.values(obj);
      expect(values.length).assertEqual(2);
      expect(values[0] as string).assertEqual("root");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_3800
     * @tc.name testObjectValues038
     * @tc.desc Verify Object.values pairs element-by-element with Object.keys on a Record
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = { "alpha": "A", "beta": "B", "gamma": "C" } as Record<string, Any>;
      let keys: string[] = Object.keys(record);
      let values: Array<Any> = Object.values(record);
      expect(values.length).assertEqual(keys.length);
      for (let i: int = 0; i < keys.length; i++) {
        expect(values[i] as string).assertEqual(record[keys[i]] as string);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_3900
     * @tc.name testObjectValues039
     * @tc.desc Verify Object.values length matches Object.entries length for the same Record
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = { "one": 11, "two": 22 } as Record<string, Any>;
      let entries = Object.entries(record);
      let values: Array<Any> = Object.values(record);
      expect(values.length).assertEqual(entries.length);
      expect(values[0] as int).assertEqual(11);
      expect(values[1] as int).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_4000
     * @tc.name testObjectValues040
     * @tc.desc Verify Object.values reflects a value updated through bracket assignment on a Record
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = { "count": 1 } as Record<string, Any>;
      record["count"] = 5;
      let values: Array<Any> = Object.values(record);
      expect(values.length).assertEqual(1);
      expect(values[0] as int).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_4100
     * @tc.name testObjectValues041
     * @tc.desc Verify Object.values contains values explicitly set to undefined as present undefined entries
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = { "a": 1 } as Record<string, Any>;
      record["a"] = undefined;
      let values: Array<Any> = Object.values(record);
      expect(values.length).assertEqual(1);
      expect(values[0] as undefined).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_4200
     * @tc.name testObjectValues042
     * @tc.desc Verify Object.values treats duplicate key literal as a single entry with the last value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = { "k": 1 } as Record<string, Any>;
      record["k"] = 2;
      let values: Array<Any> = Object.values(record);
      expect(values.length).assertEqual(1);
      expect(values[0] as int).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_4300
     * @tc.name testObjectValues043
     * @tc.desc Verify Object.values on a 10-element int Record sums correctly through iteration
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = {
        "a": 1, "b": 2, "c": 3, "d": 4, "e": 5,
        "f": 6, "g": 7, "h": 8, "i": 9, "j": 10
      } as Record<string, Any>;
      let values: Array<Any> = Object.values(record);
      let sum: int = 0;
      for (let i: int = 0; i < values.length; i++) {
        sum = sum + (values[i] as int);
      }
      expect(sum).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_4400
     * @tc.name testObjectValues044
     * @tc.desc Verify Object.values does not alias returned array across calls
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = { "a": 1, "b": 2 } as Record<string, Any>;
      let v1: Array<Any> = Object.values(record);
      v1[0] = 999;
      let v2: Array<Any> = Object.values(record);
      expect(v2[0] as int).assertEqual(1);
      expect(v2[1] as int).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_4500
     * @tc.name testObjectValues045
     * @tc.desc Verify mutating the returned values array does not change the source Record values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = { "a": 10, "b": 20 } as Record<string, Any>;
      let values: Array<Any> = Object.values(record);
      values[0] = 999;
      let reread: Array<Any> = Object.values(record);
      expect(reread[0] as int).assertEqual(10);
      expect(reread[1] as int).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_4600
     * @tc.name testObjectValues046
     * @tc.desc Verify Object.values returns the same object reference when stored under multiple keys
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let shared: ValuesObjClass = new ValuesObjClass();
      let record: Record<string, Any> = { "x": shared, "y": shared } as Record<string, Any>;
      let values: Array<Any> = Object.values(record);
      expect(values.length).assertEqual(2);
      expect(values[0] as Object).assertEqual(shared as Object);
      expect(values[1] as Object).assertEqual(shared as Object);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_4700
     * @tc.name testObjectValues047
     * @tc.desc Verify Object.values preserves order across a 50-property Record built in a loop
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = {} as Record<string, Any>;
      for (let i: int = 0; i < 50; i++) {
        record["k" + i] = i * 2;
      }
      let values: Array<Any> = Object.values(record);
      expect(values.length).assertEqual(50);
      expect(values[0] as int).assertEqual(0);
      expect(values[25] as int).assertEqual(50);
      expect(values[49] as int).assertEqual(98);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_4800
     * @tc.name testObjectValues048
     * @tc.desc Verify Object.values returns int max and int min boundary values intact
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = { "max": 2147483647, "min": -2147483648 } as Record<string, Any>;
      let values: Array<Any> = Object.values(record);
      expect(values.length).assertEqual(2);
      expect(values[0] as int).assertEqual(2147483647);
      expect(values[1] as int).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_4900
     * @tc.name testObjectValues049
     * @tc.desc Verify Object.values keeps negative and positive float values distinct and in order
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = { "pos": 1.5, "neg": -2.5 } as Record<string, Any>;
      let values: Array<Any> = Object.values(record);
      expect(values.length).assertEqual(2);
      expect(values[0] as double).assertEqual(1.5);
      expect(values[1] as double).assertEqual(-2.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_5000
     * @tc.name testObjectValues050
     * @tc.desc Verify Object.values returns a single-character emoji string value without splitting it
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = { "icon": "🚀" } as Record<string, Any>;
      let values: Array<Any> = Object.values(record);
      expect(values.length).assertEqual(1);
      expect(values[0] as string).assertEqual("🚀");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_5100
     * @tc.name testObjectValues051
     * @tc.desc Verify Object.values keeps whitespace-only and newline string values exactly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = { "space": "   ", "newline": "a\nb" } as Record<string, Any>;
      let values: Array<Any> = Object.values(record);
      expect(values.length).assertEqual(2);
      expect(values[0] as string).assertEqual("   ");
      expect(values[1] as string).assertEqual("a\nb");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_5200
     * @tc.name testObjectValues052
     * @tc.desc Verify Object.values on a three-level inheritance chain returns all own fields in declaration order
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: ValuesLeaf = new ValuesLeaf();
      let values: Array<Any> = Object.values(obj);
      expect(values.length).assertEqual(3);
      expect(values[0] as string).assertEqual("grand");
      expect(values[1] as int).assertEqual(10);
      expect(values[2] as boolean).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_5300
     * @tc.name testObjectValues053
     * @tc.desc Verify Object.values returns a nested class instance as a reference without flattening
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: ValuesWithNested = new ValuesWithNested();
      let values: Array<Any> = Object.values(obj);
      expect(values.length).assertEqual(2);
      expect(values[0] as string).assertEqual("root");
      expect(values[1] as Object).assertEqual(obj.child as Object);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_5400
     * @tc.name testObjectValues054
     * @tc.desc Verify Object.values returns null for an optional class field left as null
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: ValuesOptionalField = new ValuesOptionalField();
      let values: Array<Any> = Object.values(obj);
      expect(values.length).assertEqual(2);
      expect(values[0] as string).assertEqual("here");
      expect(values[1] as null).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_5500
     * @tc.name testObjectValues055
     * @tc.desc Verify Object.values pairs with Object.keys for a class instance by comparing field values positionally
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: ValuesAllNumeric = new ValuesAllNumeric();
      let keys: string[] = Object.keys(obj);
      let values: Array<Any> = Object.values(obj);
      expect(values.length).assertEqual(keys.length);
      expect(values[0] as int).assertEqual(1);
      expect(values[1] as int).assertEqual(2);
      expect(values[2] as int).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_5600
     * @tc.name testObjectValues056
     * @tc.desc Verify Object.values length matches Object.entries length for a class instance
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: ValuesAllNumeric = new ValuesAllNumeric();
      let entries = Object.entries(obj);
      let values: Array<Any> = Object.values(obj);
      expect(values.length).assertEqual(entries.length);
      expect(values[0] as int).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_5700
     * @tc.name testObjectValues057
     * @tc.desc Verify Object.values grows the result after a new key is added to a Record
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = { "a": 1 } as Record<string, Any>;
      let before: Array<Any> = Object.values(record);
      expect(before.length).assertEqual(1);
      record["b"] = 2;
      let values: Array<Any> = Object.values(record);
      expect(values.length).assertEqual(2);
      expect(values[0] as int).assertEqual(1);
      expect(values[1] as int).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_5800
     * @tc.name testObjectValues058
     * @tc.desc Verify Object.values returns nested array references without flattening
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner: Array<int> = [7, 8];
      let record: Record<string, Any> = { "list": inner, "tag": "x" } as Record<string, Any>;
      let values: Array<Any> = Object.values(record);
      expect(values.length).assertEqual(2);
      expect(values[0] as Object).assertEqual(inner as Object);
      expect(values[1] as string).assertEqual("x");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_5900
     * @tc.name testObjectValues059
     * @tc.desc Verify Object.values on a 300-element numeric Record returns all values in order
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = {} as Record<string, Any>;
      for (let i: int = 0; i < 300; i++) {
        record["n" + i] = i;
      }
      let values: Array<Any> = Object.values(record);
      expect(values.length).assertEqual(300);
      expect(values[0] as int).assertEqual(0);
      expect(values[299] as int).assertEqual(299);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_6000
     * @tc.name testObjectValues060
     * @tc.desc Verify Object.values on a single-space string primitive returns the space as one element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = " ";
      let values: Array<Any> = Object.values(str);
      expect(values.length).assertEqual(1);
      expect(values[0] as string).assertEqual(" ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_6100
     * @tc.name testObjectValues061
     * @tc.desc Verify Object.values on an empty string primitive returns an empty array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "";
      let values: Array<Any> = Object.values(str);
      expect(values.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_6200
     * @tc.name testObjectValues062
     * @tc.desc Verify Object.values on a single-element array returns that one element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [42];
      let values: Array<Any> = Object.values(arr);
      expect(values.length).assertEqual(1);
      expect(values[0] as int).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_6300
     * @tc.name testObjectValues063
     * @tc.desc Verify Object.values keeps duplicate numeric values across many keys
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = { "a": 7, "b": 7, "c": 7 } as Record<string, Any>;
      let values: Array<Any> = Object.values(record);
      expect(values.length).assertEqual(3);
      expect(values[0] as int).assertEqual(7);
      expect(values[1] as int).assertEqual(7);
      expect(values[2] as int).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_6400
     * @tc.name testObjectValues064
     * @tc.desc Verify Object.values returns float values preserving fractional precision
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = { "pi": 3.14159 } as Record<string, Any>;
      let values: Array<Any> = Object.values(record);
      expect(values.length).assertEqual(1);
      expect(values[0] as double).assertEqual(3.14159);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_6500
     * @tc.name testObjectValues065
     * @tc.desc Verify Object.values allows rebuilding a Record when paired with Object.keys
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = { "x": 1, "y": 2 } as Record<string, Any>;
      let keys: string[] = Object.keys(record);
      let values: Array<Any> = Object.values(record);
      let rebuilt: Record<string, Any> = {} as Record<string, Any>;
      for (let i: int = 0; i < keys.length; i++) {
        rebuilt[keys[i]] = values[i];
      }
      expect(rebuilt["x"] as int).assertEqual(1);
      expect(rebuilt["y"] as int).assertEqual(2);
      expect(Object.values(rebuilt).length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_6600
     * @tc.name testObjectValues066
     * @tc.desc Verify Object.values keeps a long single string value intact without truncation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr: string = "";
      for (let i: int = 0; i < 200; i++) {
        longStr += "x";
      }
      let record: Record<string, Any> = { "big": longStr } as Record<string, Any>;
      let values: Array<Any> = Object.values(record);
      expect(values.length).assertEqual(1);
      expect((values[0] as string).length).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_6700
     * @tc.name testObjectValues067
     * @tc.desc Verify Object.values of two int properties returns both in order
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { 'a': 10, 'b': 20 } as Record<string, Any>;
      let values: Array<Any> = Object.values(rec);
      expect(values.length).assertEqual(2);
      expect(values[0] as int).assertEqual(10);
      expect(values[1] as int).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_6800
     * @tc.name testObjectValues068
     * @tc.desc Verify Object.values of string array returns elements in order
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: string[] = ['x', 'y'];
      let values: Array<Any> = Object.values(arr);
      expect(values.length).assertEqual(2);
      expect(values[0] as string).assertEqual('x');
      expect(values[1] as string).assertEqual('y');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_6900
     * @tc.name testObjectValues069
     * @tc.desc Verify Object.values length matches Object.keys length and values align for int Record
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { 'a': 1, 'b': 2, 'c': 3 } as Record<string, Any>;
      let keys: string[] = Object.keys(rec);
      let values: Array<Any> = Object.values(rec);
      expect(keys.length).assertEqual(values.length);
      expect(values[0] as int).assertEqual(1);
      expect(values[1] as int).assertEqual(2);
      expect(values[2] as int).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_7000
     * @tc.name testObjectValues070
     * @tc.desc Verify Object.values on boolean array returns elements in declared order
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: boolean[] = [true, false, true];
      let values: Array<Any> = Object.values(arr);
      expect(values.length).assertEqual(3);
      expect(values[0] as boolean).assertEqual(true);
      expect(values[1] as boolean).assertEqual(false);
      expect(values[2] as boolean).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_7100
     * @tc.name testObjectValues071
     * @tc.desc Verify Object.values returns double elements from a double array in order
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: double[] = [1.5, 2.5, 3.5];
      let values: Array<Any> = Object.values(arr);
      expect(values.length).assertEqual(3);
      expect(values[0] as double).assertEqual(1.5);
      expect(values[1] as double).assertEqual(2.5);
      expect(values[2] as double).assertEqual(3.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_7200
     * @tc.name testObjectValues072
     * @tc.desc Verify Object.values on int array with negatives returns signed values in order
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [-1, 0, 1];
      let values: Array<Any> = Object.values(arr);
      expect(values.length).assertEqual(3);
      expect(values[0] as int).assertEqual(-1);
      expect(values[1] as int).assertEqual(0);
      expect(values[2] as int).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_7300
     * @tc.name testObjectValues073
     * @tc.desc Verify Object.values on nested arrays returns inner array references in order
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner1: int[] = [1, 2];
      let inner2: int[] = [3];
      let first: Object = inner1;
      let second: Object = inner2;
      let arr: Object[] = [first, second];
      let values: Array<Any> = Object.values(arr);
      expect(values.length).assertEqual(2);
      expect(values[0] as Object).assertEqual(inner1 as Object);
      expect(values[1] as Object).assertEqual(inner2 as Object);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_7400
     * @tc.name testObjectValues074
     * @tc.desc Verify Object.values reflects mutations of class fields after instantiation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: ValuesDynamicObj = new ValuesDynamicObj();
      obj.value = 'changed';
      let values: Array<Any> = Object.values(obj);
      expect(values.length).assertEqual(1);
      expect(values[0] as string).assertEqual('changed');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_7500
     * @tc.name testObjectValues075
     * @tc.desc Verify Object.values treats a duplicate key in a literal as a single entry with the last value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [];
      arr.push(1);
      arr.push(2);
      let values: Array<Any> = Object.values(arr);
      expect(values.length).assertEqual(2);
      expect(values[0] as int).assertEqual(1);
      expect(values[1] as int).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_7600
     * @tc.name testObjectValues076
     * @tc.desc Verify Object.values length matches Object.entries length for a multi-type Record
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { 'n': 1, 's': 'x', 'b': false } as Record<string, Any>;
      expect(Object.values(rec).length).assertEqual(Object.entries(rec).length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_7700
     * @tc.name testObjectValues077
     * @tc.desc Verify Object.values returns null and undefined entries as distinct entries
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { 'n': null, 'u': undefined } as Record<string, Any>;
      let values: Array<Any> = Object.values(rec);
      expect(values.length).assertEqual(2);
      expect(values[0] as null).assertEqual(null);
      expect(values[1] as undefined).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_7800
     * @tc.name testObjectValues078
     * @tc.desc Verify Object.values on Record with numeric-string keys returns values in insertion order
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { '2': 'b', '1': 'a' } as Record<string, Any>;
      let values: Array<Any> = Object.values(rec);
      expect(values.length).assertEqual(2);
      expect(values[0] as string).assertEqual('b');
      expect(values[1] as string).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_7900
     * @tc.name testObjectValues079
     * @tc.desc Verify Object.values returns empty-string and whitespace strings as distinct values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { 'empty': '', 'blank': ' ' } as Record<string, Any>;
      let values: Array<Any> = Object.values(rec);
      expect(values.length).assertEqual(2);
      expect(values[0] as string).assertEqual('');
      expect(values[1] as string).assertEqual(' ');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_8000
     * @tc.name testObjectValues080
     * @tc.desc Verify Object.values on Record viewed as Object returns values through Object type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { 'k': 7 } as Record<string, Any>;
      let values: Array<Any> = Object.values(rec);
      expect(values.length).assertEqual(1);
      expect(values[0] as int).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_8100
     * @tc.name testObjectValues081
     * @tc.desc Verify Object.values of an array containing null and undefined keeps those slots in place
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<Object | null | undefined> = [1 as Object, null, undefined] as Array<Object | null | undefined>;
      let values: Array<Any> = Object.values(arr);
      expect(values.length).assertEqual(3);
      expect(values[0] as int).assertEqual(1);
      expect(values[1] as null).assertEqual(null);
      expect(values[2] as undefined).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_8200
     * @tc.name testObjectValues082
     * @tc.desc Verify Object.values on Record with Chinese key returns associated Chinese value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { '名称': '值' } as Record<string, Any>;
      let values: Array<Any> = Object.values(rec);
      expect(values.length).assertEqual(1);
      expect(values[0] as string).assertEqual('值');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_8300
     * @tc.name testObjectValues083
     * @tc.desc Verify Object.values returns values for keys containing dot and bracket characters
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { 'a.b': 1, 'c[0]': 2 } as Record<string, Any>;
      let values: Array<Any> = Object.values(rec);
      expect(values.length).assertEqual(2);
      expect(values[0] as int).assertEqual(1);
      expect(values[1] as int).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_8400
     * @tc.name testObjectValues084
     * @tc.desc Verify Object.values iteration can sum all integer values of a Record
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { 'a': 10, 'b': 20, 'c': 30 } as Record<string, Any>;
      let values: Array<Any> = Object.values(rec);
      let total: int = 0;
      for (let i: int = 0; i < values.length; i++) {
        total = total + (values[i] as int);
      }
      expect(total).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_8500
     * @tc.name testObjectValues085
     * @tc.desc Verify Object.values length stays unchanged after updating multiple existing keys
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { 'a': 1, 'b': 2 } as Record<string, Any>;
      rec['a'] = 11;
      rec['b'] = 22;
      let values: Array<Any> = Object.values(rec);
      expect(values.length).assertEqual(2);
      expect(values[0] as int).assertEqual(11);
      expect(values[1] as int).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_8600
     * @tc.name testObjectValues086
     * @tc.desc Verify Object.values ordering on array matches index iteration
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [10, 20, 30];
      let values: Array<Any> = Object.values(arr);
      expect(values.length).assertEqual(3);
      for (let i: int = 0; i < arr.length; i++) {
        expect(values[i] as int).assertEqual(arr[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_VALUES_8700
     * @tc.name testObjectValues087
     * @tc.desc Verify Object.values on Object-typed array matches the direct array values call
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectValues087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [4, 5, 6];
      let obj: Object = arr;
      let direct: Array<Any> = Object.values(arr);
      let viaObj: Array<Any> = Object.values(obj);
      expect(direct.length).assertEqual(3);
      expect(viaObj.length).assertEqual(3);
      expect(viaObj[0] as int).assertEqual(direct[0] as int);
      expect(viaObj[1] as int).assertEqual(direct[1] as int);
      expect(viaObj[2] as int).assertEqual(direct[2] as int);
    });
  });
}
