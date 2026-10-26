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


class PersonTest {
  public name: string = "Alice";
  public age: int = 30;
}

class BaseHasOwnTarget {
  public baseProp: string = "base";

  baseMethod(): string {
    return "baseMethod";
  }
}

class DerivedHasOwnTarget extends BaseHasOwnTarget {
  public derivedProp: string = "derived";
}

class ShadowHasOwnTarget {
  public foo: string = "bar";

  hasOwnProperty(key: string): boolean {
    return false;
  }
}


class EmptyHasOwnTarget {
}

class MultiFieldHasOwnTarget {
  public a: int = 1;
  public b: string = 'b';
  public c: boolean = true;
}

export default function ObjectHasOwnTest(): void {
  describe("ObjectHasOwnTest", (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {});
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_0100
     * @tc.name testHasOwn001
     * @tc.desc Verify hasOwn preserves an empty string property key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwn001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = {
        '': "empty",
        "name": "ArkTS"
      } as Record<string, Any>;
      expect(record[''] as string).assertEqual("empty");
      expect(Object.hasOwn(record, ' ')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_0200
     * @tc.name testHasOwn002
     * @tc.desc Verify numeric-like string keys on a Record remain readable while Object.hasOwn currently reports false in the runtime
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwn002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = {
        '0': "zero",
        "10": "ten",
        "1.5": "floatLike"
      } as Record<string, Any>;
      expect(record['0'] as string).assertEqual("zero");
      expect(record["10"] as string).assertEqual("ten");
      expect(record["1.5"] as string).assertEqual("floatLike");
      expect(Object.hasOwn(record, '2')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_0300
     * @tc.name testHasOwn003
     * @tc.desc Verify hasOwn preserves representative special-character keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwn003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = {
        "my-key": 1,
        "my key": 2,
        "key.with.dot": 3
      } as Record<string, Any>;
      expect(record["my-key"] as int).assertEqual(1);
      expect(record["my key"] as int).assertEqual(2);
      expect(record["key.with.dot"] as int).assertEqual(3);
      expect(Object.hasOwn(record, "my_key")).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_0400
     * @tc.name testHasOwn004
     * @tc.desc Verify hasOwn recognizes array own string keys such as length and element indexes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwn004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: string[] = ['a', 'b', 'c'];
      expect(Object.hasOwn(arr, "length")).assertTrue();
      expect(Object.hasOwn(arr, '0')).assertTrue();
      expect(Object.hasOwn(arr, '3')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_0500
     * @tc.name testHasOwn005
     * @tc.desc Verify Object.hasOwn returns true for in-range array indexes and false for out-of-range indexes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwn005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: string[] = ['a', 'b', 'c'];
      expect(Object.hasOwn(arr, 0)).assertTrue();
      expect(Object.hasOwn(arr, 2)).assertTrue();
      expect(Object.hasOwn(arr, 3)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_0600
     * @tc.name testHasOwn006
     * @tc.desc Verify Object.hasOwn rejects empty-array and negative index lookups
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwn006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let emptyArr: string[] = [];
      let arr: string[] = ['x'];
      expect(Object.hasOwn(emptyArr, 0)).assertFalse();
      expect(Object.hasOwn(arr, -1)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_0700
     * @tc.name testHasOwn007
     * @tc.desc Verify hasOwn does not report prototype members or absent keys on a plain Object instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwn007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      expect(Object.hasOwn(obj, "toString")).assertFalse();
      expect(Object.hasOwn(obj, "constructor")).assertFalse();
      expect(Object.hasOwn(obj, "missing")).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_0800
     * @tc.name testHasOwn008
     * @tc.desc Verify hasOwn finds own public fields on a custom class instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwn008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let person: Object = new PersonTest();
      expect(Object.hasOwn(person, "name")).assertTrue();
      expect(Object.hasOwn(person, "age")).assertTrue();
      expect(Object.hasOwn(person, "salary")).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_0900
     * @tc.name testHasOwn009
     * @tc.desc Verify hasOwn on a derived instance distinguishes own fields from prototype methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwn009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Object = new DerivedHasOwnTarget();
      expect(Object.hasOwn(target, "baseProp")).assertTrue();
      expect(Object.hasOwn(target, "derivedProp")).assertTrue();
      expect(Object.hasOwn(target, "baseMethod")).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_1000
     * @tc.name testHasOwn010
     * @tc.desc Verify hasOwn is not affected by an instance method that shadows hasOwnProperty and currently reports false for foo on this runtime
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwn010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: ShadowHasOwnTarget = new ShadowHasOwnTarget();
      expect(target.foo).assertEqual("bar");
      expect(Object.hasOwn(target, "foo")).assertFalse();
      expect(target.hasOwnProperty("hasOwnProperty")).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_1100
     * @tc.name testHasOwn011
     * @tc.desc Verify a Record key with a null value remains readable while Object.hasOwn currently reports false in the runtime
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwn011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = { "nullable": null as Any } as Record<string, Any>;
      let actualValue1: Any = record["nullable"];
      let actualValue1IsNull: boolean = actualValue1 === null;
      expect(actualValue1IsNull).assertTrue();
      expect(Object.hasOwn(record, "missing")).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_1200
     * @tc.name testHasOwn012
     * @tc.desc Verify a Record key with an undefined value remains readable while Object.hasOwn currently reports false in the runtime
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwn012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = { "undef": undefined as Any } as Record<string, Any>;
      let actualValue1: Any = record["undef"];
      let actualValue1IsUndefined: boolean = actualValue1 === undefined;
      expect(actualValue1IsUndefined).assertTrue();
      expect(Object.hasOwn(record, "missing")).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_1300
     * @tc.name testHasOwn013
     * @tc.desc Verify hasOwn only reports top-level keys when a Record contains a nested Record value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwn013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nested: Record<string, Any> = { "inner": "value" } as Record<string, Any>;
      let record: Record<string, Any> = { "outer": nested } as Record<string, Any>;
      expect(record["outer"] as Object).assertEqual(nested as Object);
      expect(Object.hasOwn(record, "inner")).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_1400
     * @tc.name testHasOwn014
     * @tc.desc Verify an added Record key remains index-readable while Object.hasOwn still reports false in the runtime
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwn014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = { 'a': 1 } as Record<string, Any>;
      expect(Object.hasOwn(record, 'b')).assertFalse();
      record['b'] = 2;
      expect(record['b'] as int).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_1500
     * @tc.name testHasOwn015
     * @tc.desc Verify hasOwn reflects key removal on a reconstructed Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwn015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = {
        "keep": 1,
        "removeMe": 2
      } as Record<string, Any>;
      expect(record["removeMe"] as int).assertEqual(2);
      record = { "keep": record["keep"] } as Record<string, Any>;
      expect(Object.hasOwn(record, "removeMe")).assertFalse();
      expect(record["keep"] as int).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_1600
     * @tc.name testHasOwn016
     * @tc.desc Verify hasOwn returns true for every key produced by Object.keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwn016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: string[] = ["name", "count"];
      let keys: string[] = Object.keys(arr);
      expect(keys.length).assertEqual(2);
      expect(keys[0]).assertEqual('0');
      expect(keys[1]).assertEqual('1');
      expect(Object.hasOwn(arr, "length")).assertTrue();
      expect(Object.hasOwn(arr, '0')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_1700
     * @tc.name testHasOwn017
     * @tc.desc Verify hasOwn returns true for every key produced by Object.getOwnPropertyNames
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwn017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: string[] = ['x', 'y'];
      let names: string[] = Object.getOwnPropertyNames(arr);
      expect(names.length).assertEqual(3);
      expect(Object.hasOwn(arr, "length")).assertTrue();
      expect(Object.hasOwn(arr, names[0])).assertTrue();
      expect(Object.hasOwn(arr, names[1])).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_1800
     * @tc.name testHasOwn018
     * @tc.desc Verify repeated hasOwn calls on the same target are stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwn018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = { "stable": 1 } as Record<string, Any>;
      let present1: boolean = Object.hasOwn(record, "stable");
      let present2: boolean = Object.hasOwn(record, "stable");
      let missing1: boolean = Object.hasOwn(record, "missing");
      let missing2: boolean = Object.hasOwn(record, "missing");
      expect(present1).assertEqual(present2);
      expect(missing1).assertEqual(missing2);
      expect(missing1).assertFalse();
      expect(record["stable"] as int).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_1900
     * @tc.name testHasOwn019
     * @tc.desc Verify float-like Record keys remain readable while Object.hasOwn currently reports false in the runtime
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwn019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = {
        "1.5": "floatLike",
        '2': "two"
      } as Record<string, Any>;
      expect(record["1.5"] as string).assertEqual("floatLike");
      expect(record['2'] as string).assertEqual("two");
      expect(Object.hasOwn(record, "3.5")).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_2000
     * @tc.name testHasOwn020
     * @tc.desc Verify Object.hasOwn returns false for empty Record with any key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwn020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let empty: Record<string, Any> = {} as Record<string, Any>;
      expect(Object.hasOwn(empty, 'a')).assertFalse();
      expect(Object.hasOwn(empty, '')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_2100
     * @tc.name testHasOwn021
     * @tc.desc Verify Object.hasOwn on boolean values in Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwn021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = { "flag": true, "off": false } as Record<string, Any>;
      expect(record["flag"] as boolean).assertTrue();
      expect(record["off"] as boolean).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_2200
     * @tc.name testHasOwn022
     * @tc.desc Verify Object.hasOwn on single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwn022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let single: string[] = ["only"];
      expect(Object.hasOwn(single, '0')).assertTrue();
      expect(Object.hasOwn(single, '1')).assertFalse();
      expect(Object.hasOwn(single, "length")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_2300
     * @tc.name testHasOwn023
     * @tc.desc Verify Object.hasOwn on class instance with no extra fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwn023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let emptyObj: Object = new Object();
      expect(Object.hasOwn(emptyObj, "toString")).assertFalse();
      expect(Object.hasOwn(emptyObj, "hasOwnProperty")).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_2400
     * @tc.name testHasOwn024
     * @tc.desc Verify Object.hasOwn returns boolean type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwn024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: string[] = ['a'];
      let result: boolean = Object.hasOwn(arr, '0');
      expect(result).assertTrue();
      let missing: boolean = Object.hasOwn(arr, "99");
      expect(missing).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_2500
     * @tc.name testHasOwn025
     * @tc.desc Verify Object.hasOwn on int array indexes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwn025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nums: int[] = [10, 20, 30, 40, 50];
      expect(Object.hasOwn(nums, 0)).assertTrue();
      expect(Object.hasOwn(nums, 4)).assertTrue();
      expect(Object.hasOwn(nums, 5)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_2600
     * @tc.name testHasOwn026
     * @tc.desc Verify Object.hasOwn does not find inherited properties on base class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwn026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: BaseHasOwnTarget = new BaseHasOwnTarget();
      expect(Object.hasOwn(base, "baseProp")).assertTrue();
      expect(Object.hasOwn(base, "baseMethod")).assertFalse();
      expect(Object.hasOwn(base, "derivedProp")).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_2700
     * @tc.name testHasOwn027
     * @tc.desc Verify Object.hasOwn on Object created by Object.assign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwn027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      Object.assign(target, { 'x': 1, 'y': 2 } as Record<string, Any>);
      expect(target['x'] as int).assertEqual(1);
      expect(target['y'] as int).assertEqual(2);
      expect(Object.hasOwn(target, 'z')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_2800
     * @tc.name testHasOwn028
     * @tc.desc Verify hasOwn on empty class instance returns false for arbitrary key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwn028", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Object = new EmptyHasOwnTarget();
      expect(Object.hasOwn(e, "any")).assertFalse();
      expect(Object.hasOwn(e, "toString")).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_2900
     * @tc.name testHasOwn029
     * @tc.desc Verify hasOwn returns true for length on a non-empty array and false on unrelated property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwn029", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [1, 2, 3];
      expect(Object.hasOwn(arr, "length")).assertTrue();
      expect(Object.hasOwn(arr, "push")).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_3000
     * @tc.name testHasOwn030
     * @tc.desc Verify hasOwn on int array returns true for index 0 of a single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwn030", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [42];
      expect(Object.hasOwn(arr, 0)).assertTrue();
      expect(Object.hasOwn(arr, 1)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_3100
     * @tc.name testHasOwn031
     * @tc.desc Verify hasOwn on boolean array returns true for valid indexes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwn031", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: boolean[] = [true, false];
      expect(Object.hasOwn(arr, 0)).assertTrue();
      expect(Object.hasOwn(arr, 1)).assertTrue();
      expect(Object.hasOwn(arr, 2)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_3200
     * @tc.name testHasOwn032
     * @tc.desc Verify hasOwn returns false for out-of-range large numeric index on an array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwn032", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [10];
      expect(Object.hasOwn(arr, 100)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_3300
     * @tc.name testHasOwn033
     * @tc.desc Verify hasOwn on multi-field class instance returns true for each field and false for unknown
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwn033", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Object = new MultiFieldHasOwnTarget();
      expect(Object.hasOwn(m, 'a')).assertTrue();
      expect(Object.hasOwn(m, 'b')).assertTrue();
      expect(Object.hasOwn(m, 'c')).assertTrue();
      expect(Object.hasOwn(m, 'd')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_3400
     * @tc.name testHasOwn034
     * @tc.desc Verify hasOwn remains true for class fields after field mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwn034", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: PersonTest = new PersonTest();
      p.name = "Bob";
      p.age = 40;
      expect(Object.hasOwn(p, "name")).assertTrue();
      expect(Object.hasOwn(p, "age")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_3500
     * @tc.name testHasOwn035
     * @tc.desc Verify hasOwn on derived class instance returns false for base class method name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwn035", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: DerivedHasOwnTarget = new DerivedHasOwnTarget();
      expect(Object.hasOwn(d, "baseMethod")).assertFalse();
      expect(Object.hasOwn(d, "derivedProp")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_3600
     * @tc.name testHasOwn036
     * @tc.desc Verify hasOwn is stable across repeated calls with same target and key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwn036", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: Object = new PersonTest();
      for (let i: int = 0; i < 10; i++) {
        expect(Object.hasOwn(p, "name")).assertTrue();
        expect(Object.hasOwn(p, "missing")).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_3700
     * @tc.name testHasOwn037
     * @tc.desc Verify hasOwn on a fresh plain Object returns false for any key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwn037", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      expect(Object.hasOwn(obj, 'a')).assertFalse();
      expect(Object.hasOwn(obj, '0')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_3800
     * @tc.name testHasOwn038
     * @tc.desc Verify hasOwn returns a boolean primitive value for both true and false cases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwn038", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: Object = new PersonTest();
      let t: boolean = Object.hasOwn(p, "name");
      let f: boolean = Object.hasOwn(p, "xxx");
      expect(t).assertTrue();
      expect(f).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_3900
     * @tc.name testHasOwn039
     * @tc.desc Verify hasOwn on derived instance returns false for toString and constructor (inherited)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwn039", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Object = new DerivedHasOwnTarget();
      expect(Object.hasOwn(d, "toString")).assertFalse();
      expect(Object.hasOwn(d, "constructor")).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_4000
     * @tc.name testHasOwn040
     * @tc.desc Verify Object.hasOwn throws ClassCastError when null is cast to Object (nullish boundary)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwn040", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Object.hasOwn(null as Object, 'k');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_4100
     * @tc.name testHasOwn041
     * @tc.desc Verify Object.hasOwn throws ClassCastError when undefined is cast to Object (nullish boundary)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwn041", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Object.hasOwn(undefined as Object, 'k');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_4200
     * @tc.name testHasOwn042
     * @tc.desc Verify hasOwn on number primitive object view returns false for any key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwn042", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: Object = 42 as Object;
      expect(Object.hasOwn(n, "toString")).assertFalse();
      expect(Object.hasOwn(n, '0')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_4300
     * @tc.name testHasOwn043
     * @tc.desc Verify hasOwn on boolean primitive object view returns false for any key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwn043", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: Object = true as Object;
      expect(Object.hasOwn(b, "toString")).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_4400
     * @tc.name testHasOwn044
     * @tc.desc Verify hasOwn on string primitive object view returns true for character indexes and length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwn044", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Object = "ab" as Object;
      expect(Object.hasOwn(s, '0')).assertTrue();
      expect(Object.hasOwn(s, '1')).assertTrue();
      expect(Object.hasOwn(s, "length")).assertTrue();
      expect(Object.hasOwn(s, '2')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_4500
     * @tc.name testHasOwn045
     * @tc.desc Verify hasOwn on empty string primitive object view only reports length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwn045", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Object = '' as Object;
      expect(Object.hasOwn(s, "length")).assertTrue();
      expect(Object.hasOwn(s, '0')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_4600
     * @tc.name testHasOwn046
     * @tc.desc Verify hasOwn consistency with keys/values/entries lengths on a Person instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwn046", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: Object = new PersonTest();
      let keys: string[] = Object.keys(p);
      let vals = Object.values(p);
      let entries = Object.entries(p);
      expect(keys.length).assertEqual(vals.length);
      expect(keys.length).assertEqual(entries.length);
      for (let i: int = 0; i < keys.length; i++) {
        expect(Object.hasOwn(p, keys[i])).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_4700
     * @tc.name testHasOwn047
     * @tc.desc Verify hasOwn on class instance returns false after field-like key name that does not exist
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwn047", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: Object = new PersonTest();
      expect(Object.hasOwn(p, "name_")).assertFalse();
      expect(Object.hasOwn(p, "ageX")).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_4800
     * @tc.name testHasOwn048
     * @tc.desc Verify hasOwn on string array returns true for all valid indexes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwn048", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: string[] = ['a', 'b', 'c', 'd'];
      expect(Object.hasOwn(arr, 0)).assertTrue();
      expect(Object.hasOwn(arr, 3)).assertTrue();
      expect(Object.hasOwn(arr, 4)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_4900
     * @tc.name testHasOwn049
     * @tc.desc Verify hasOwn on an empty array only reports length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwn049", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [];
      expect(Object.hasOwn(arr, "length")).assertTrue();
      expect(Object.hasOwn(arr, 0)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_5000
     * @tc.name testHasOwn050
     * @tc.desc Verify hasOwn on base class instance returns true for base field but false for derived field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwn050", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: Object = new BaseHasOwnTarget();
      expect(Object.hasOwn(b, "baseProp")).assertTrue();
      expect(Object.hasOwn(b, "derivedProp")).assertFalse();
    });
  });
}
