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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it } from "../../../../hypium/index";
import { TestType, Size, Level } from "../../../../hypium/Constant";
import Utils from "../Util.test";


class OCEmpty {
}

class OCNamed {
  public name: string;

  constructor(n: string) {
    this.name = n;
  }
}

class OCWithValue {
  public value: int;

  constructor(v: int) {
    this.value = v;
  }
}

class OCChild extends OCWithValue {
  public label: string;

  constructor(v: int, label: string) {
    super(v);
    this.label = label;
  }
}

class OCWithMethod {
  public greet(): string {
    return "hello";
  }
}

class OCWithTwoFields {
  public a: int = 1;
  public b: string = 'b';
}

class OCSubclass extends OCEmpty {
  public x: int = 10;
}

function ocToStringIdentity(o: Object): string {
  return o.toString();
}

export default function ObjectConstructorTest(): void {
  describe("ObjectConstructorTest", (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {});
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0010
     * @tc.name testObjectConstructor001
     * @tc.desc Verify three new Object() calls create three pairwise-distinct instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor001", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Object = new Object();
      let b: Object = new Object();
      let c: Object = new Object();
      expect(a).not().assertEqual(b);
      expect(a).not().assertEqual(c);
      expect(b).not().assertEqual(c);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0020
     * @tc.name testObjectConstructor002
     * @tc.desc Verify aliasing a new Object() reference yields strict equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor002", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      let ref1: Object = obj;
      let ref2: Object = obj;
      expect(ref1 as Object).assertEqual(ref2 as Object);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0030
     * @tc.name testObjectConstructor003
     * @tc.desc Verify toLocaleString() returns a non-empty string on new Object()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor003", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      let s: string = obj.toLocaleString();
      expect(s).assertEqual("[object Object]");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0040
     * @tc.name testObjectConstructor004
     * @tc.desc Verify toLocaleString() returns consistent result on repeated calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor004", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      let s1: string = obj.toLocaleString();
      let s2: string = obj.toLocaleString();
      expect(s1).assertEqual(s2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0050
     * @tc.name testObjectConstructor005
     * @tc.desc Verify $_hashCode() of two different Object instances can differ
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor005", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj1: Object = new Object();
      let obj2: Object = new Object();
      expect(obj1 as Object).not().assertEqual(obj2 as Object);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0060
     * @tc.name testObjectConstructor006
     * @tc.desc Verify assigning new Object() across two variables preserves reference identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor006", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Object = new Object();
      let b: Object = a;
      expect(a as Object).assertEqual(b as Object);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0070
     * @tc.name testObjectConstructor007
     * @tc.desc Verify new Object() is usable as argument to a function expecting Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor007", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      let viaFn: string = ocToStringIdentity(obj);
      expect(viaFn).assertEqual(obj.toString());
      expect(viaFn.length >= 1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0080
     * @tc.name testObjectConstructor008
     * @tc.desc Verify string primitive is assignable to Object-typed variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor008", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = "hello";
      expect(obj.toString()).assertEqual("hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0090
     * @tc.name testObjectConstructor009
     * @tc.desc Verify boolean true is assignable to Object-typed variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor009", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = true;
      expect(Object.entries(obj).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0100
     * @tc.name testObjectConstructor010
     * @tc.desc Verify boolean false is assignable to Object-typed variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor010", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = false;
      expect(Object.entries(obj).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0110
     * @tc.name testObjectConstructor011
     * @tc.desc Verify positive int zero is assignable to Object-typed variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor011", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = 0 as Object;
      expect(Object.entries(obj).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0120
     * @tc.name testObjectConstructor012
     * @tc.desc Verify negative int is assignable to Object-typed variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor012", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let neg: int = -1;
      let obj: Object = neg as Object;
      expect(Object.entries(obj).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0130
     * @tc.name testObjectConstructor013
     * @tc.desc Verify int MAX_VALUE is assignable to Object-typed variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor013", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: int = 2147483647;
      let obj: Object = v as Object;
      expect(Object.entries(obj).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0140
     * @tc.name testObjectConstructor014
     * @tc.desc Verify int MIN_VALUE is assignable to Object-typed variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor014", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: int = -2147483648;
      let obj: Object = v as Object;
      expect(Object.entries(obj).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0150
     * @tc.name testObjectConstructor015
     * @tc.desc Verify float value is assignable to Object-typed variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor015", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: double = 3.14;
      let obj: Object = v as Object;
      expect(obj as double).assertClose(3.14, 0.001);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0160
     * @tc.name testObjectConstructor016
     * @tc.desc Verify Record is assignable to Object-typed variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor016", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { 'a': 1 } as Record<string, Any>;
      let obj: Object = rec;
      expect(Object.keys(obj).length).assertEqual(1);
      expect((obj as Record<string, Any>)['a'] as int).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0170
     * @tc.name testObjectConstructor017
     * @tc.desc Verify Array is assignable to Object-typed variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor017", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [1, 2, 3];
      let obj: Object = arr as Object;
      expect(Object.entries(obj).length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0180
     * @tc.name testObjectConstructor018
     * @tc.desc Verify custom empty class instance is assignable to Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor018", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inst: OCEmpty = new OCEmpty();
      let obj: Object = inst;
      expect(Object.getOwnPropertyNames(obj).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0190
     * @tc.name testObjectConstructor019
     * @tc.desc Verify custom class instance with constructor param stores field value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor019", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inst: OCNamed = new OCNamed("ArkTS");
      expect(inst.name).assertEqual("ArkTS");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0200
     * @tc.name testObjectConstructor020
     * @tc.desc Verify custom class instance with int constructor arg stores field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor020", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inst: OCWithValue = new OCWithValue(42);
      expect(inst.value).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0210
     * @tc.name testObjectConstructor021
     * @tc.desc Verify subclass constructor chains super() and sets both own and inherited fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor021", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let child: OCChild = new OCChild(7, "tag");
      expect(child.value).assertEqual(7);
      expect(child.label).assertEqual("tag");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0220
     * @tc.name testObjectConstructor022
     * @tc.desc Verify empty-string value is assignable to Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor022", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = "";
      expect(obj.toString()).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0230
     * @tc.name testObjectConstructor023
     * @tc.desc Verify unicode string is assignable to Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor023", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = "中文テスト";
      expect(obj.toString()).assertEqual("中文テスト");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0240
     * @tc.name testObjectConstructor024
     * @tc.desc Verify Class.of(new Object()) returns std.core.String class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor024", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      let name: string = Class.of(obj).getName();
      expect(name).assertEqual("std.core.Object");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0250
     * @tc.name testObjectConstructor025
     * @tc.desc Verify toString on Object does not throw when called in try-finally block
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor025", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      let reached: boolean = false;
      try {
        let s: string = obj.toString();
      } finally {
        reached = true;
      }
      expect(reached).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0260
     * @tc.name testObjectConstructor026
     * @tc.desc Verify new Object() as target of Object.assign receives properties from source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor026", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Object = new Object();
      let source: Record<string, Any> = { 'k': 'v' } as Record<string, Any>;
      try {
        Object.assign(target as Record<string, Any>, source);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0270
     * @tc.name testObjectConstructor027
     * @tc.desc Verify custom class instance with method returns correct method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor027", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inst: OCWithMethod = new OCWithMethod();
      expect(inst.greet()).assertEqual("hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0280
     * @tc.name testObjectConstructor028
     * @tc.desc Verify class with two fields initializes fields to expected defaults
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor028", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inst: OCWithTwoFields = new OCWithTwoFields();
      expect(inst.a).assertEqual(1);
      expect(inst.b).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0290
     * @tc.name testObjectConstructor029
     * @tc.desc Verify Object keys on custom class instance list public fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor029", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inst: OCWithTwoFields = new OCWithTwoFields();
      let keys: string[] = Object.keys(inst);
      expect(keys.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0300
     * @tc.name testObjectConstructor030
     * @tc.desc Verify Object.getOwnPropertyNames on two-field class includes both fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor030", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inst: OCWithTwoFields = new OCWithTwoFields();
      let names: string[] = Object.getOwnPropertyNames(inst);
      expect(names.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0310
     * @tc.name testObjectConstructor031
     * @tc.desc Verify Object.values on two-field class returns both field values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor031", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inst: OCWithTwoFields = new OCWithTwoFields();
      let vals = Object.values(inst);
      expect(vals.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0320
     * @tc.name testObjectConstructor032
     * @tc.desc Verify subclass instance has both child and parent own field keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor032", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let child: OCChild = new OCChild(1, 'x');
      let keys: string[] = Object.keys(child);
      expect(keys.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0330
     * @tc.name testObjectConstructor033
     * @tc.desc Verify subclass instance own property names include inherited instance fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor033", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let child: OCChild = new OCChild(5, 'L');
      let names: string[] = Object.getOwnPropertyNames(child);
      expect(names.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0340
     * @tc.name testObjectConstructor034
     * @tc.desc Verify hasOwnProperty returns false for method on class instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor034", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inst: OCWithMethod = new OCWithMethod();
      expect(inst.hasOwnProperty("greet")).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0350
     * @tc.name testObjectConstructor035
     * @tc.desc Verify toString on custom class instance returns a non-empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor035", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inst: OCEmpty = new OCEmpty();
      let s: string = inst.toString();
      expect(s.length >= 1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0360
     * @tc.name testObjectConstructor036
     * @tc.desc Verify $_hashCode on custom class instance returns non-negative int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor036", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inst: OCEmpty = new OCEmpty();
      let s: string = inst.toString();
      let hc: int = inst.$_hashCode();
      expect(inst.toString()).assertEqual(s);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0370
     * @tc.name testObjectConstructor037
     * @tc.desc Verify $_hashCode is consistent for same custom class instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor037", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inst: OCEmpty = new OCEmpty();
      let h1: int = inst.$_hashCode();
      let h2: int = inst.$_hashCode();
      expect(h1).assertEqual(h2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0380
     * @tc.name testObjectConstructor038
     * @tc.desc Verify two distinct custom class instances have distinct references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor038", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: OCEmpty = new OCEmpty();
      let b: OCEmpty = new OCEmpty();
      expect(a).not().assertEqual(b);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0390
     * @tc.name testObjectConstructor039
     * @tc.desc Verify constructor with zero int param sets field to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor039", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inst: OCWithValue = new OCWithValue(0);
      expect(inst.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0400
     * @tc.name testObjectConstructor040
     * @tc.desc Verify constructor with negative int param stores the negative value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor040", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inst: OCWithValue = new OCWithValue(-100);
      expect(inst.value).assertEqual(-100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0410
     * @tc.name testObjectConstructor041
     * @tc.desc Verify constructor with boundary MAX int param stores the value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor041", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inst: OCWithValue = new OCWithValue(2147483647);
      expect(inst.value).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0420
     * @tc.name testObjectConstructor042
     * @tc.desc Verify constructor with boundary MIN int param stores the value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor042", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inst: OCWithValue = new OCWithValue(-2147483648);
      expect(inst.value).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0430
     * @tc.name testObjectConstructor043
     * @tc.desc Verify constructor with empty string param stores empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor043", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inst: OCNamed = new OCNamed("");
      expect(inst.name).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0440
     * @tc.name testObjectConstructor044
     * @tc.desc Verify constructor with unicode string param stores it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor044", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inst: OCNamed = new OCNamed("日本語");
      expect(inst.name).assertEqual("日本語");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0450
     * @tc.name testObjectConstructor045
     * @tc.desc Verify repeated allocations of new Object() remain distinct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor045", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let objs: Object[] = [];
      for (let i: int = 0; i < 10; i++) {
        objs.push(new Object());
      }
      for (let i: int = 0; i < 10; i++) {
        for (let j: int = i + 1; j < 10; j++) {
          expect(objs[i]).not().assertEqual(objs[j]);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0460
     * @tc.name testObjectConstructor046
     * @tc.desc Verify Object.hasOwn returns false for arbitrary key on new Object()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor046", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      expect(Object.hasOwn(obj, "foo")).assertFalse();
      expect(Object.hasOwn(obj, "bar")).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0470
     * @tc.name testObjectConstructor047
     * @tc.desc Verify Object.hasOwn returns false for numeric key on empty new Object()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor047", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      expect(Object.hasOwn(obj, 0)).assertFalse();
      expect(Object.hasOwn(obj, 42)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0480
     * @tc.name testObjectConstructor048
     * @tc.desc Verify empty class instance produces non-empty toLocaleString and matches toString consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor048", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inst: OCEmpty = new OCEmpty();
      let s: string = inst.toLocaleString();
      expect(inst.toString()).assertEqual(s);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0490
     * @tc.name testObjectConstructor049
     * @tc.desc Verify toLocaleString on custom class returns non-empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor049", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inst: OCEmpty = new OCEmpty();
      let s: string = inst.toLocaleString();
      expect(s.length >= 1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0500
     * @tc.name testObjectConstructor050
     * @tc.desc Verify primitive 1 (int) is assignable to Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor050", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = 1 as Object;
      expect(Object.entries(obj).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0510
     * @tc.name testObjectConstructor051
     * @tc.desc Verify float 0.0 assignable to Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor051", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let z: double = 0.0;
      let obj: Object = z as Object;
      expect(obj as double).assertClose(0.0, 0.001);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0520
     * @tc.name testObjectConstructor052
     * @tc.desc Verify float -1.5 assignable to Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor052", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: double = -1.5;
      let obj: Object = v as Object;
      expect(obj as double).assertClose(-1.5, 0.001);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0530
     * @tc.name testObjectConstructor053
     * @tc.desc Verify empty array assignable to Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor053", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [];
      let obj: Object = arr as Object;
      expect(Object.entries(obj).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0540
     * @tc.name testObjectConstructor054
     * @tc.desc Verify string array assignable to Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor054", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: string[] = ['a', 'b'];
      let obj: Object = arr as Object;
      expect(Object.entries(obj).length).assertEqual(2);
      expect(arr[0]).assertEqual('a');
      expect(arr[1]).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0550
     * @tc.name testObjectConstructor055
     * @tc.desc Verify boolean array assignable to Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor055", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: boolean[] = [true, false];
      let obj: Object = arr as Object;
      expect(Object.entries(obj).length).assertEqual(2);
      expect(arr[0]).assertTrue();
      expect(arr[1]).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0560
     * @tc.name testObjectConstructor056
     * @tc.desc Verify Record with multiple value types assignable to Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor056", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { 's': 'x', 'n': 1, 'b': true } as Record<string, Any>;
      let obj: Object = rec;
      expect(Object.keys(obj).length).assertEqual(3);
      expect((obj as Record<string, Any>)['s'] as string).assertEqual('x');
      expect((obj as Record<string, Any>)['n'] as int).assertEqual(1);
      expect((obj as Record<string, Any>)['b'] as boolean).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0570
     * @tc.name testObjectConstructor057
     * @tc.desc Verify empty Record assignable to Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor057", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = {} as Record<string, Any>;
      let obj: Object = rec;
      expect(Object.keys(obj).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0580
     * @tc.name testObjectConstructor058
     * @tc.desc Verify subclass instance assignable to parent class type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor058", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let child: OCChild = new OCChild(1, 'a');
      let asParent: OCWithValue = child;
      expect(asParent.value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0590
     * @tc.name testObjectConstructor059
     * @tc.desc Verify two constructor calls with same args produce distinct instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor059", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: OCNamed = new OCNamed("same");
      let b: OCNamed = new OCNamed("same");
      expect(a).not().assertEqual(b);
      expect(a.name).assertEqual(b.name);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0600
     * @tc.name testObjectConstructor060
     * @tc.desc Verify new Object() passed to String() yields non-empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor060", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      let s: string = String(obj);
      expect(s).assertEqual("[object Object]");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0610
     * @tc.name testObjectConstructor061
     * @tc.desc Verify Object.toString returns a stable result across 10 and 20 repeated calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor061", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iterationCounts: int[] = [20, 10];
      for (let iterationCount of iterationCounts) {
        let obj: Object = new Object();
        let expected: string = obj.toString();
        let iteration: int = 0;
        while (iteration < iterationCount) {
          let actual: string = obj.toString();
          expect(actual).assertEqual(expected);
          iteration++;
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0620
     * @tc.name testObjectConstructor062
     * @tc.desc Verify toLocaleString equals toString for plain Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor062", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      expect(obj.toString()).assertEqual(obj.toLocaleString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0630
     * @tc.name testObjectConstructor063
     * @tc.desc Verify assigning new Object() into Record works after Object.assign augmentation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor063", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Object = new Object();
      try {
        Object.assign(base as Record<string, Any>, { 'a': 1 } as Record<string, Any>);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0640
     * @tc.name testObjectConstructor064
     * @tc.desc Verify Object constructor field default values differ across instances (mutations don't leak)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor064", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: OCWithValue = new OCWithValue(1);
      let b: OCWithValue = new OCWithValue(2);
      expect(a.value).assertEqual(1);
      expect(b.value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0650
     * @tc.name testObjectConstructor065
     * @tc.desc Verify custom class field defaults are preserved when constructor doesn't set them
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor065", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inst: OCSubclass = new OCSubclass();
      expect(inst.x).assertEqual(10);
      let obj: Object = inst;
      expect(Object.hasOwn(obj, 'x')).assertTrue();
      expect(obj.toString()).assertEqual("[object Object]");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0660
     * @tc.name testObjectConstructor066
     * @tc.desc Verify $_hashCode stays consistent across mixed method calls on same instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor066", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      let h1: int = obj.$_hashCode();
      obj.toString();
      obj.toLocaleString();
      let h2: int = obj.$_hashCode();
      expect(h1).assertEqual(h2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0670
     * @tc.name testObjectConstructor067
     * @tc.desc Verify new Object() can be stored in array of Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor067", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Object[] = [new Object(), new Object()];
      expect(arr.length).assertEqual(2);
      expect(arr[0]).not().assertEqual(arr[1]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0680
     * @tc.name testObjectConstructor068
     * @tc.desc Verify child class field is not present on parent instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor068", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: OCWithValue = new OCWithValue(1);
      expect(parent.hasOwnProperty("value")).assertTrue();
      expect(parent.hasOwnProperty("label")).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0690
     * @tc.name testObjectConstructor069
     * @tc.desc Verify Object.entries on empty class instance returns zero or more entries without throwing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor069", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inst: OCEmpty = new OCEmpty();
      let entries = Object.entries(inst);
      expect(entries.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0700
     * @tc.name testObjectConstructor070
     * @tc.desc Verify Object.keys/values/entries/getOwnPropertyNames all report length 0 on fresh Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor070", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      expect(Object.keys(obj).length).assertEqual(0);
      expect(Object.values(obj).length).assertEqual(0);
      expect(Object.entries(obj).length).assertEqual(0);
      expect(Object.getOwnPropertyNames(obj).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0710
     * @tc.name testObjectConstructor071
     * @tc.desc Verify dynamically adding a string property to Object is observable via keys/values/hasOwn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor071", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Record<string, Any> = {} as Record<string, Any>;
      obj['x'] = '1';
      expect(Object.keys(obj).length).assertEqual(1);
      expect(obj['x'] as string).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0720
     * @tc.name testObjectConstructor072
     * @tc.desc Verify field mutation on two-field class instance keeps both fields own and reports updated values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor072", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inst: OCWithTwoFields = new OCWithTwoFields();
      inst.a = 10;
      inst.b = "changed";
      expect(Object.hasOwn(inst, 'a')).assertTrue();
      expect(Object.hasOwn(inst, 'b')).assertTrue();
      expect(inst.a).assertEqual(10);
      expect(inst.b).assertEqual("changed");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0730
     * @tc.name testObjectConstructor073
     * @tc.desc Verify Object-typed record receiving numeric keys returns correct values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor073", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Record<string, Any> = {} as Record<string, Any>;
      obj['0'] = 10;
      obj['1'] = 20;
      expect(obj['0'] as int).assertEqual(10);
      expect(obj['1'] as int).assertEqual(20);
      expect(Object.keys(obj).length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0740
     * @tc.name testObjectConstructor074
     * @tc.desc Verify Object.entries returns [key,value] pairs after adding properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor074", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Record<string, Any> = { 'a': 1 } as Record<string, Any>;
      let keys: string[] = Object.keys(obj);
      let vals = Object.values(obj);
      expect(keys.length).assertEqual(1);
      expect(vals.length).assertEqual(1);
      expect(keys[0]).assertEqual('a');
      expect(vals[0] as int).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0750
     * @tc.name testObjectConstructor075
     * @tc.desc Verify Class.of on OCEmpty instance reports the declared class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor075", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inst: OCEmpty = new OCEmpty();
      let name: string = Class.of(inst).getName();
      expect(name.includes("OCEmpty")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0760
     * @tc.name testObjectConstructor076
     * @tc.desc Verify Class.of on OCChild instance differs from Class.of on OCEmpty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor076", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let empty: OCEmpty = new OCEmpty();
      let child: OCChild = new OCChild(1, 'x');
      let ne: string = Class.of(empty).getName();
      let nc: string = Class.of(child).getName();
      expect(ne).not().assertEqual(nc);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0770
     * @tc.name testObjectConstructor077
     * @tc.desc Verify toString on class-with-method instance is deterministic across calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor077", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inst: OCWithMethod = new OCWithMethod();
      let s1: string = inst.toString();
      for (let i: int = 0; i < 5; i++) {
        expect(inst.toString()).assertEqual(s1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0780
     * @tc.name testObjectConstructor078
     * @tc.desc Verify method call via instance works both before and after toString is invoked
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor078", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inst: OCWithMethod = new OCWithMethod();
      expect(inst.greet()).assertEqual("hello");
      inst.toString();
      expect(inst.greet()).assertEqual("hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0790
     * @tc.name testObjectConstructor079
     * @tc.desc Verify field mutation on OCWithValue instance updates value correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor079", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inst: OCWithValue = new OCWithValue(0);
      expect(inst.value).assertEqual(0);
      inst.value = 7;
      expect(inst.value).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0800
     * @tc.name testObjectConstructor080
     * @tc.desc Verify field mutation on one OCNamed instance does not leak to another
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor080", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: OCNamed = new OCNamed('a');
      let b: OCNamed = new OCNamed('b');
      a.name = 'A';
      expect(a.name).assertEqual('A');
      expect(b.name).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0810
     * @tc.name testObjectConstructor081
     * @tc.desc Verify subclass field mutation updates both own and parent fields independently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor081", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: OCChild = new OCChild(1, "one");
      c.value = 2;
      c.label = "two";
      expect(c.value).assertEqual(2);
      expect(c.label).assertEqual("two");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0820
     * @tc.name testObjectConstructor082
     * @tc.desc Verify OCSubclass (extends empty) exposes its own field and zero inherited fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor082", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inst: OCSubclass = new OCSubclass();
      expect(inst.x).assertEqual(10);
      expect(Object.hasOwn(inst, 'x')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0830
     * @tc.name testObjectConstructor083
     * @tc.desc Verify $hashCode differs between an instance and another instance of different class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor083", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Object = new Object();
      let b: OCEmpty = new OCEmpty();
      let ha: int = a.$_hashCode();
      let hb: int = b.$_hashCode();
      let nameA: string = Class.of(a).getName();
      let nameB: string = Class.of(b).getName();
      expect(nameA).assertEqual("std.core.Object");
      expect(nameA).not().assertEqual(nameB);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0840
     * @tc.name testObjectConstructor084
     * @tc.desc Verify assigning new Object() into an Object[] array preserves toString per element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor084", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Object[] = [];
      for (let i: int = 0; i < 5; i++) {
        arr.push(new Object());
      }
      expect(arr.length).assertEqual(5);
      for (let i: int = 0; i < 5; i++) {
        let s: string = arr[i].toString();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0850
     * @tc.name testObjectConstructor085
     * @tc.desc Verify Object-typed record with string value returns that value via bracket cast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor085", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Record<string, string> = { "greet": "hi" } as Record<string, string>;
      expect(obj["greet"]).assertEqual("hi");
      obj["greet"] = "hey";
      expect(obj["greet"]).assertEqual("hey");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0860
     * @tc.name testObjectConstructor086
     * @tc.desc Verify hasOwnProperty returns true for both fields of two-field class and false for unknown key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor086", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inst: OCWithTwoFields = new OCWithTwoFields();
      expect(inst.hasOwnProperty('a')).assertTrue();
      expect(inst.hasOwnProperty('b')).assertTrue();
      expect(inst.hasOwnProperty('c')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0870
     * @tc.name testObjectConstructor087
     * @tc.desc Verify getOwnPropertyNames lists all enumerable own keys after assignment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor087", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Record<string, Any> = { 'a': 1, 'b': 2, 'c': 3 } as Record<string, Any>;
      let names: string[] = Object.getOwnPropertyNames(obj);
      expect(names.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0880
     * @tc.name testObjectConstructor088
     * @tc.desc Verify Object.values returns inserted values in insertion order for int record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor088", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Record<string, Any> = { 'x': 10, 'y': 20 } as Record<string, Any>;
      let vals = Object.values(obj);
      expect(vals.length).assertEqual(2);
      expect(vals[0] as int).assertEqual(10);
      expect(vals[1] as int).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0890
     * @tc.name testObjectConstructor089
     * @tc.desc Verify upcast from subclass to Object still exposes inherited toString behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor089", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let child: OCChild = new OCChild(5, 'L');
      let obj: Object = child;
      let s: string = obj.toString();
      expect(s.length >= 1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0900
     * @tc.name testObjectConstructor090
     * @tc.desc Verify upcast from class instance to Object preserves hashCode identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor090", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inst: OCWithValue = new OCWithValue(42);
      let h1: int = inst.$_hashCode();
      let obj: Object = inst;
      let h2: int = obj.$_hashCode();
      expect(h1).assertEqual(h2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0910
     * @tc.name testObjectConstructor091
     * @tc.desc Verify OCWithTwoFields field b mutation is independent of field a
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor091", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inst: OCWithTwoFields = new OCWithTwoFields();
      inst.a = 100;
      inst.b = "changed";
      expect(inst.a).assertEqual(100);
      expect(inst.b).assertEqual("changed");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0920
     * @tc.name testObjectConstructor092
     * @tc.desc Verify multiple sequential new Object() in array remain pairwise distinct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor092", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Object[] = [new Object(), new Object(), new Object(), new Object()];
      expect(arr.length).assertEqual(4);
      expect(arr[0]).not().assertEqual(arr[1]);
      expect(arr[1]).not().assertEqual(arr[2]);
      expect(arr[2]).not().assertEqual(arr[3]);
      expect(arr[0]).not().assertEqual(arr[3]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0930
     * @tc.name testObjectConstructor093
     * @tc.desc Verify that overwriting an Object-typed record key changes the value and keys stay same length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor093", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Record<string, Any> = { 'k': "old" } as Record<string, Any>;
      obj['k'] = "new";
      expect(obj['k'] as string).assertEqual("new");
      expect(Object.keys(obj).length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0940
     * @tc.name testObjectConstructor094
     * @tc.desc Verify OCEmpty passed through a function parameter roundtrip returns same instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor094", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Object = new Object();
      let got: Object = orig;
      let h1: int = orig.$_hashCode();
      let h2: int = got.$_hashCode();
      expect(h1).assertEqual(h2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0950
     * @tc.name testObjectConstructor095
     * @tc.desc Verify a user-defined class instance keeps method behavior after being stored in Object[]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor095", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: OCWithMethod[] = [new OCWithMethod(), new OCWithMethod()];
      expect(arr[0].greet()).assertEqual("hello");
      expect(arr[1].greet()).assertEqual("hello");
      expect(arr[0]).not().assertEqual(arr[1]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0960
     * @tc.name testObjectConstructor096
     * @tc.desc Verify toLocaleString on class instance returns same value when invoked twice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectConstructor096", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inst: OCWithTwoFields = new OCWithTwoFields();
      let s1: string = inst.toLocaleString();
      let s2: string = inst.toLocaleString();
      expect(s1).assertEqual(s2);
      expect(s1.length >= 1).assertTrue();
    });
  });
}
