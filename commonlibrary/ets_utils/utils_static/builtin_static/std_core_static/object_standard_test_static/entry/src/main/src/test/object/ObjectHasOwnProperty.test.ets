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

class HasOwnPropertyPerson {
  public name: string = "Alice";
  public age: int = 30;
}

class HasOwnPropertyBase {
  public baseProp: string = "base";

  baseMethod(): string {
    return "baseMethod";
  }
}

class HasOwnPropertyDerived extends HasOwnPropertyBase {
  public derivedProp: string = "derived";
}


class HasOwnPropertyEmpty {
}

class HasOwnPropertyMulti {
  public a: int = 1;
  public b: string = 'b';
  public c: boolean = true;
}

class HasOwnPropertyWithMethod {
  public greet(): string {
    return "hi";
  }
}

export default function ObjectHasOwnPropertyTest(): void {
  describe("ObjectHasOwnPropertyTest", (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => {
    await Utils.msSleep(30);
    });
    afterEach((): void => {});
    afterAll((): void => {});

    /**
     * @tc.name testHasOwnProperty001
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_0100
     * @tc.desc Verify hasOwnProperty returns true for existing numeric array indexes
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it("testHasOwnProperty001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [10, 20, 30];
      expect(arr.hasOwnProperty(0)).assertTrue();
      expect(arr.hasOwnProperty(1)).assertTrue();
      expect(arr.hasOwnProperty(arr.length - 1)).assertTrue();
    });

    /**
     * @tc.name testHasOwnProperty002
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_0200
     * @tc.desc Verify hasOwnProperty handles single-element array boundaries
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it("testHasOwnProperty002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [99];
      expect(arr.hasOwnProperty(0)).assertTrue();
      expect(arr.hasOwnProperty(arr.length)).assertFalse();
    });

    /**
     * @tc.name testHasOwnProperty003
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_0300
     * @tc.desc Verify hasOwnProperty rejects out-of-range and negative array indexes
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it("testHasOwnProperty003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [10, 20];
      expect(arr.hasOwnProperty(100)).assertFalse();
      expect(arr.hasOwnProperty(999999)).assertFalse();
      expect(arr.hasOwnProperty(-1)).assertFalse();
    });

    /**
     * @tc.name testHasOwnProperty004
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_0400
     * @tc.desc Verify hasOwnProperty returns false for numeric lookups on an empty array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it("testHasOwnProperty004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [];
      expect(arr.hasOwnProperty(0)).assertFalse();
      expect(arr.hasOwnProperty(1)).assertFalse();
    });

    /**
     * @tc.name testHasOwnProperty005
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_0500
     * @tc.desc Verify hasOwnProperty recognizes array own string keys and excludes unrelated keys
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it("testHasOwnProperty005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [10, 20, 30];
      expect(arr.hasOwnProperty("length")).assertTrue();
      expect(arr.hasOwnProperty('0')).assertTrue();
      expect(arr.hasOwnProperty("invalidProp")).assertFalse();
    });

    /**
     * @tc.name testHasOwnProperty006
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_0600
     * @tc.desc Verify numeric-like Record keys are readable while hasOwnProperty reports false for existing and unrelated keys
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it("testHasOwnProperty006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = {
        '0': "zero",
        "123": "numericString",
        "1.5": "floatLike"
      } as Record<string, Any>;
      expect(record["123"] as string).assertEqual("numericString");
      expect(record['0'] as string).assertEqual("zero");
      expect(record["1.5"] as string).assertEqual("floatLike");
      expect(record.hasOwnProperty(5)).assertFalse();
    });

    /**
     * @tc.name testHasOwnProperty007
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_0700
     * @tc.desc Verify Record special-character keys are index-readable while hasOwnProperty reports false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it("testHasOwnProperty007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = {
        '': "empty",
        "my-property": 1,
        "my property": 2,
        "hasOwnProperty": "ownKey"
      } as Record<string, Any>;
      expect(record[''] as string).assertEqual("empty");
      expect(record["my-property"] as int).assertEqual(1);
      expect(record["my property"] as int).assertEqual(2);
      expect(record["hasOwnProperty"] as string).assertEqual("ownKey");
    });

    /**
     * @tc.name testHasOwnProperty008
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_0800
     * @tc.desc Verify Record index access preserves null and undefined values while missing hasOwnProperty is false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it("testHasOwnProperty008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = {
        "nullable": null as Any,
        "undef": undefined as Any
      } as Record<string, Any>;
      let actualValue1: Any = record["nullable"];
      let actualValue1IsNull: boolean = actualValue1 === null;
      expect(actualValue1IsNull).assertTrue();
      let actualValue2: Any = record["undef"];
      let actualValue2IsUndefined: boolean = actualValue2 === undefined;
      expect(actualValue2IsUndefined).assertTrue();
      expect(record.hasOwnProperty("missing")).assertFalse();
    });

    /**
     * @tc.name testHasOwnProperty009
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_0900
     * @tc.desc Verify added Record keys are index-readable while hasOwnProperty still returns false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it("testHasOwnProperty009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = {} as Record<string, Any>;
      expect(record.hasOwnProperty("newKey")).assertFalse();
      record["newKey"] = "added";
      expect(record["newKey"] as string).assertEqual("added");
    });

    /**
     * @tc.name testHasOwnProperty010
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_1000
     * @tc.desc Verify reconstructed Record removes index access for the omitted key and hasOwnProperty reports false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it("testHasOwnProperty010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = {
        "keep": 1,
        "removeMe": 2
      } as Record<string, Any>;
      expect(record["removeMe"] as int).assertEqual(2);
      record = { "keep": record["keep"] } as Record<string, Any>;
      expect(record.hasOwnProperty("removeMe")).assertFalse();
      expect(record["keep"] as int).assertEqual(1);
    });

    /**
     * @tc.name testHasOwnProperty011
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_1100
     * @tc.desc Verify hasOwnProperty on a plain Object excludes inherited prototype members
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it("testHasOwnProperty011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      expect(obj.hasOwnProperty("toString")).assertFalse();
      expect(obj.hasOwnProperty("constructor")).assertFalse();
      expect(obj.hasOwnProperty("missing")).assertFalse();
    });

    /**
     * @tc.name testHasOwnProperty012
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_1200
     * @tc.desc Verify hasOwnProperty finds own public fields on a custom class instance
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it("testHasOwnProperty012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let person: Object = new HasOwnPropertyPerson();
      expect(person.hasOwnProperty("name")).assertTrue();
      expect(person.hasOwnProperty("age")).assertTrue();
      expect(person.hasOwnProperty("salary")).assertFalse();
      expect(person.hasOwnProperty("missing")).assertFalse();
    });

    /**
     * @tc.name testHasOwnProperty013
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_1300
     * @tc.desc Verify hasOwnProperty on a derived instance distinguishes own fields from prototype methods
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it("testHasOwnProperty013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Object = new HasOwnPropertyDerived();
      expect(target.hasOwnProperty("baseProp")).assertTrue();
      expect(target.hasOwnProperty("derivedProp")).assertTrue();
      expect(target.hasOwnProperty("baseMethod")).assertFalse();
    });

    /**
     * @tc.name testHasOwnProperty014
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_1400
     * @tc.desc Verify hasOwnProperty on a string primitive reports in-range indexes and rejects out-of-range indexes
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it("testHasOwnProperty014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "hello";
      expect(str.hasOwnProperty(0)).assertTrue();
      expect(str.hasOwnProperty(4)).assertTrue();
      expect(str.hasOwnProperty(5)).assertFalse();
    });

    /**
     * @tc.name testHasOwnProperty015
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_1500
     * @tc.desc Verify nested Record values remain index-readable while nested inner keys are not reported
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it("testHasOwnProperty015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nested: Record<string, Any> = { "inner": "value" } as Record<string, Any>;
      let record: Record<string, Any> = { "nested": nested } as Record<string, Any>;
      expect(record["nested"] as Object).assertEqual(nested as Object);
      expect(record.hasOwnProperty("inner")).assertFalse();
    });

    /**
     * @tc.name testHasOwnProperty016
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_1600
     * @tc.desc Verify hasOwnProperty is consistent with Object.keys and Object.getOwnPropertyNames on arrays
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it("testHasOwnProperty016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [10, 20];
      let keys: string[] = Object.keys(arr);
      let names: string[] = Object.getOwnPropertyNames(arr);
      expect(keys.length).assertEqual(2);
      expect(arr.hasOwnProperty('0')).assertTrue();
      expect(arr.hasOwnProperty('1')).assertTrue();
      expect(arr.hasOwnProperty("length")).assertTrue();
      expect(names.length >= keys.length).assertTrue();
    });

    /**
     * @tc.name testHasOwnProperty017
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_1700
     * @tc.desc Verify repeated hasOwnProperty checks remain stable for arrays, Record keys, and missing keys
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it("testHasOwnProperty017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [42];
      let record: Record<string, Any> = { "key": "value" } as Record<string, Any>;
      let arrFirst: boolean = arr.hasOwnProperty(0);
      let arrSecond: boolean = arr.hasOwnProperty(0);
      let recFirst: boolean = record.hasOwnProperty("key");
      let recSecond: boolean = record.hasOwnProperty("key");
      let missFirst: boolean = record.hasOwnProperty("missing");
      let missSecond: boolean = record.hasOwnProperty("missing");
      expect(arrFirst).assertEqual(arrSecond);
      expect(recFirst).assertEqual(recSecond);
      expect(missFirst).assertEqual(missSecond);
      expect(arrFirst).assertTrue();
      expect(missFirst).assertFalse();
      expect(record["key"] as string).assertEqual("value");
    });

    /**
     * @tc.name testHasOwnProperty018
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_1800
     * @tc.desc Verify hasOwnProperty on a string primitive recognizes own length and excludes prototype methods
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it("testHasOwnProperty018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "hi";
      expect(str.hasOwnProperty("length")).assertTrue();
      expect(str.hasOwnProperty("toString")).assertFalse();
    });

    /**
     * @tc.name testHasOwnProperty019
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_1900
     * @tc.desc Verify Record direct access and missing-key hasOwnProperty result
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it("testHasOwnProperty019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = { "custom": 1 } as Record<string, Any>;
      expect(record["custom"] as int).assertEqual(1);
      expect(record.hasOwnProperty("missing")).assertFalse();
    });

    /**
     * @tc.name testHasOwnProperty020
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_2000
     * @tc.desc Verify hasOwnProperty on arrays excludes inherited prototype methods while preserving own element keys
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it("testHasOwnProperty020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [1, 2, 3];
      expect(arr.hasOwnProperty("map")).assertFalse();
      expect(arr.hasOwnProperty('2')).assertTrue();
    });

    /**
     * @tc.name testHasOwnProperty021
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_2100
     * @tc.desc Verify prototype-named Record keys are index-readable while hasOwnProperty reports false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it("testHasOwnProperty021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = {
        "toString": "ownToString",
        "constructor": "ownConstructor"
      } as Record<string, Any>;
      expect(record["toString"] as string).assertEqual("ownToString");
      expect(record["constructor"] as string).assertEqual("ownConstructor");
    });

    /**
     * @tc.name testHasOwnProperty022
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_2200
     * @tc.desc Verify Unicode and zero-width Record keys are index-readable while hasOwnProperty reports false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it("testHasOwnProperty022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = {
        "\u6C49\u5B57": 1,
        "zero\u200Bwidth": 2
      } as Record<string, Any>;
      expect(record["\u6C49\u5B57"] as int).assertEqual(1);
      expect(record["zero\u200Bwidth"] as int).assertEqual(2);
      expect(record.hasOwnProperty("zerowidth")).assertFalse();
    });

    /**
     * @tc.name testHasOwnProperty023
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_2300
     * @tc.desc Verify array own-property checks stay correct after an array is viewed through Object type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it("testHasOwnProperty023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [5, 6];
      let obj: Object = arr;
      expect(obj.hasOwnProperty("length")).assertTrue();
      expect(obj.hasOwnProperty('0')).assertTrue();
      expect(obj.hasOwnProperty("push")).assertFalse();
    });

    /**
     * @tc.name testHasOwnProperty024
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_2400
     * @tc.desc Verify an empty string primitive still has own length while lacking element indexes
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it("testHasOwnProperty024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let empty: string = '';
      expect(empty.hasOwnProperty("length")).assertTrue();
      expect(empty.hasOwnProperty(0)).assertFalse();
      expect(empty.hasOwnProperty('0')).assertFalse();
    });

    /**
     * @tc.name testHasOwnProperty025
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_2500
     * @tc.desc Verify negative zero is treated as the same own array index as zero
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it("testHasOwnProperty025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [7];
      expect(arr.hasOwnProperty(-0.0)).assertTrue();
      expect(arr.hasOwnProperty(0)).assertTrue();
    });

    /**
     * @tc.name testHasOwnProperty026
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_2600
     * @tc.desc Verify integer-like Record keys are index-readable while unrelated float hasOwnProperty is false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it("testHasOwnProperty026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = {
        '2': "two",
        "2.5": "twoPointFive"
      } as Record<string, Any>;
      expect(record['2'] as string).assertEqual("two");
      expect(record["2.5"] as string).assertEqual("twoPointFive");
      expect(record.hasOwnProperty(3.0)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_2700
     * @tc.name testHasOwnProperty027
     * @tc.desc Verify Empty Record returns false for any key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwnProperty027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let empty: Record<string, Any> = {} as Record<string, Any>;
      expect(empty.hasOwnProperty('a')).assertFalse();
      expect(empty.hasOwnProperty('')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_2800
     * @tc.name testHasOwnProperty028
     * @tc.desc Verify Single property record hasOwnProperty returns false for existing keys in current runtime
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwnProperty028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "key": "val" } as Record<string, Any>;
      expect(rec["key"] as string).assertEqual("val");
      expect(rec.hasOwnProperty("other")).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_2900
     * @tc.name testHasOwnProperty029
     * @tc.desc Verify Array length is own property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwnProperty029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [1, 2, 3];
      expect(arr.hasOwnProperty("length")).assertTrue();
      expect(arr.hasOwnProperty('0')).assertTrue();
      expect(arr.hasOwnProperty('3')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_3000
     * @tc.name testHasOwnProperty030
     * @tc.desc Verify Class instance fields are own properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwnProperty030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let person: HasOwnPropertyPerson = new HasOwnPropertyPerson();
      expect(person.hasOwnProperty("name")).assertTrue();
      expect(person.hasOwnProperty("age")).assertTrue();
      expect(person.hasOwnProperty("missing")).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_3100
     * @tc.name testHasOwnProperty031
     * @tc.desc Verify Negative array index returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwnProperty031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: string[] = ['x'];
      expect(arr.hasOwnProperty(-1)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_3200
     * @tc.name testHasOwnProperty032
     * @tc.desc Verify hasOwnProperty on empty class instance returns false for arbitrary keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwnProperty032", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Object = new HasOwnPropertyEmpty();
      expect(e.hasOwnProperty("any")).assertFalse();
      expect(e.hasOwnProperty("toString")).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_3300
     * @tc.name testHasOwnProperty033
     * @tc.desc Verify hasOwnProperty on multi-field class returns true for all declared public fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwnProperty033", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Object = new HasOwnPropertyMulti();
      expect(m.hasOwnProperty('a')).assertTrue();
      expect(m.hasOwnProperty('b')).assertTrue();
      expect(m.hasOwnProperty('c')).assertTrue();
      expect(m.hasOwnProperty('d')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_3400
     * @tc.name testHasOwnProperty034
     * @tc.desc Verify hasOwnProperty returns false for a method on a class (method lives on prototype)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwnProperty034", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let w: Object = new HasOwnPropertyWithMethod();
      expect(w.hasOwnProperty("greet")).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_3500
     * @tc.name testHasOwnProperty035
     * @tc.desc Verify class fields remain own after mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwnProperty035", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: HasOwnPropertyPerson = new HasOwnPropertyPerson();
      p.name = "Bob";
      p.age = 40;
      expect(p.hasOwnProperty("name")).assertTrue();
      expect(p.hasOwnProperty("age")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_3600
     * @tc.name testHasOwnProperty036
     * @tc.desc Verify hasOwnProperty returns true for length on a non-empty array and false for push method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwnProperty036", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [1, 2, 3];
      expect(arr.hasOwnProperty("length")).assertTrue();
      expect(arr.hasOwnProperty("push")).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_3700
     * @tc.name testHasOwnProperty037
     * @tc.desc Verify hasOwnProperty returns true for index 0 on a single-element boolean array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwnProperty037", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: boolean[] = [true];
      expect(arr.hasOwnProperty(0)).assertTrue();
      expect(arr.hasOwnProperty(1)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_3800
     * @tc.name testHasOwnProperty038
     * @tc.desc Verify hasOwnProperty is stable across repeated calls with the same key and target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwnProperty038", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [10, 20];
      for (let i: int = 0; i < 10; i++) {
        expect(arr.hasOwnProperty(0)).assertTrue();
        expect(arr.hasOwnProperty(9)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_3900
     * @tc.name testHasOwnProperty039
     * @tc.desc Verify hasOwnProperty returns false for arbitrary key on an empty Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwnProperty039", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, int> = {} as Record<string, int>;
      expect(rec.hasOwnProperty('x')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_4000
     * @tc.name testHasOwnProperty040
     * @tc.desc Verify hasOwnProperty returns false for existing Record keys (current runtime Record bug) after value mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwnProperty040", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, int> = { 'k': 1 } as Record<string, int>;
      rec['k'] = 2;
      expect(rec['k']).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_4100
     * @tc.name testHasOwnProperty041
     * @tc.desc Verify hasOwnProperty returns false for toString/constructor shadow keys on a Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwnProperty041", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, int> = { "toString": 1 } as Record<string, int>;
      expect(rec["toString"] as int).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_4200
     * @tc.name testHasOwnProperty042
     * @tc.desc Verify empty array only reports length as own property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwnProperty042", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [];
      expect(arr.hasOwnProperty("length")).assertTrue();
      expect(arr.hasOwnProperty(0)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_4300
     * @tc.name testHasOwnProperty043
     * @tc.desc Verify boolean true/false primitive object view does not expose own properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwnProperty043", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t: Object = true as Object;
      let f: Object = false as Object;
      expect(t.hasOwnProperty("toString")).assertFalse();
      expect(f.hasOwnProperty('0')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_4400
     * @tc.name testHasOwnProperty044
     * @tc.desc Verify number primitive object view does not expose own properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwnProperty044", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: Object = 42 as Object;
      expect(n.hasOwnProperty("toString")).assertFalse();
      expect(n.hasOwnProperty('0')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_4500
     * @tc.name testHasOwnProperty045
     * @tc.desc Verify string primitive reports length and character indexes as own
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwnProperty045", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Object = "xy" as Object;
      expect(s.hasOwnProperty("length")).assertTrue();
      expect(s.hasOwnProperty('0')).assertTrue();
      expect(s.hasOwnProperty('1')).assertTrue();
      expect(s.hasOwnProperty('2')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_4600
     * @tc.name testHasOwnProperty046
     * @tc.desc Verify empty string only reports length as own property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwnProperty046", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Object = '' as Object;
      expect(s.hasOwnProperty("length")).assertTrue();
      expect(s.hasOwnProperty('0')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_4700
     * @tc.name testHasOwnProperty047
     * @tc.desc Verify hasOwnProperty throws ClassCastError when null is cast to Object (nullish boundary)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwnProperty047", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        (null as Object).hasOwnProperty('k');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_4800
     * @tc.name testHasOwnProperty048
     * @tc.desc Verify hasOwnProperty throws ClassCastError when undefined is cast to Object (nullish boundary)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwnProperty048", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        (undefined as Object).hasOwnProperty('k');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_4900
     * @tc.name testHasOwnProperty049
     * @tc.desc Verify multi-element string array recognizes all in-range indexes as own
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwnProperty049", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: string[] = ['a', 'b', 'c', 'd'];
      expect(arr.hasOwnProperty(0)).assertTrue();
      expect(arr.hasOwnProperty(3)).assertTrue();
      expect(arr.hasOwnProperty(4)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_5000
     * @tc.name testHasOwnProperty050
     * @tc.desc Verify base class instance does not expose derived field as own
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwnProperty050", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: Object = new HasOwnPropertyBase();
      expect(b.hasOwnProperty("baseProp")).assertTrue();
      expect(b.hasOwnProperty("derivedProp")).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_5100
     * @tc.name testHasOwnProperty051
     * @tc.desc Verify keys produced by Object.keys on a class instance are all reported as own by hasOwnProperty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwnProperty051", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: Object = new HasOwnPropertyPerson();
      let keys: string[] = Object.keys(p);
      for (let i: int = 0; i < keys.length; i++) {
        expect(p.hasOwnProperty(keys[i])).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_5200
     * @tc.name testHasOwnProperty052
     * @tc.desc Verify hasOwnProperty returns boolean primitive for both own and non-own cases on a class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwnProperty052", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: Object = new HasOwnPropertyPerson();
      let own: boolean = p.hasOwnProperty("name");
      let miss: boolean = p.hasOwnProperty("xxx");
      expect(own).assertTrue();
      expect(miss).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_5300
     * @tc.name testHasOwnProperty053
     * @tc.desc Verify string-formed numeric index "0" works the same as number 0 for arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwnProperty053", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [42];
      expect(arr.hasOwnProperty('0')).assertTrue();
      expect(arr.hasOwnProperty('1')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_5400
     * @tc.name testHasOwnProperty054
     * @tc.desc Verify hasOwnProperty on Person class instance returns false for toString and constructor inherited members
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwnProperty054", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: Object = new HasOwnPropertyPerson();
      expect(p.hasOwnProperty("toString")).assertFalse();
      expect(p.hasOwnProperty("constructor")).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_5500
     * @tc.name testHasOwnProperty055
     * @tc.desc Verify string-formed numeric index "0" works the same as number 0 for arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwnProperty055", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [42];
      expect(arr.hasOwnProperty(0)).assertTrue();
      expect(arr.hasOwnProperty('0')).assertTrue();
      expect(arr.hasOwnProperty(1)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_HAS_OWN_PROPERTY_5600
     * @tc.name testHasOwnProperty056
     * @tc.desc Verify array keys returned by Object.keys are all own properties, and length is also own
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testHasOwnProperty056", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [10, 20, 30];
      let keys: string[] = Object.keys(arr);
      for (let i: int = 0; i < keys.length; i++) {
        expect(arr.hasOwnProperty(keys[i])).assertTrue();
      }
      expect(arr.hasOwnProperty("length")).assertTrue();
    });
  });
}
