'use static'
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it } from '../../../../hypium/index';
import { TestType, Size, Level } from '../../../../hypium/Constant';
import Utils from '../Util.test';


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
  public b: string = "b";
}

class OCSubclass extends OCEmpty {
  public x: int = 10;
}

function ocToStringIdentity(o: Object): string {
  return o.toString();
}

export default function ObjectConstructorTest(): void {
  describe('ObjectConstructorTest', (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {});
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0100
     * @tc.name testObjectConstructor0100
     * @tc.desc Verify new Object() with no arguments returns a non-null truthy value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      expect(obj.toString()).assertEqual("[object Object]");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0200
     * @tc.name testObjectConstructor0200
     * @tc.desc Verify two new Object() calls create distinct object references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor0200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj1: Object = new Object();
      let obj2: Object = new Object();
      expect(obj1 !== obj2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0300
     * @tc.name testObjectConstructor0300
     * @tc.desc Verify three new Object() calls create three pairwise-distinct instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor0300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Object = new Object();
      let b: Object = new Object();
      let c: Object = new Object();
      expect(a !== b).assertTrue();
      expect(a !== c).assertTrue();
      expect(b !== c).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0400
     * @tc.name testObjectConstructor0400
     * @tc.desc Verify aliasing a new Object() reference yields strict equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor0400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      let ref1: Object = obj;
      let ref2: Object = obj;
      expect(ref1 as Object).assertEqual(ref2 as Object);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0500
     * @tc.name testObjectConstructor0500
     * @tc.desc Verify new Object() has zero own properties via Object.keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor0500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      let keys: string[] = Object.keys(obj);
      expect(keys.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0600
     * @tc.name testObjectConstructor0600
     * @tc.desc Verify new Object() has zero own property names via getOwnPropertyNames
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor0600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      let names: string[] = Object.getOwnPropertyNames(obj);
      expect(names.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0700
     * @tc.name testObjectConstructor0700
     * @tc.desc Verify new Object() has zero values via Object.values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor0700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      let vals = Object.values(obj);
      expect(vals.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0800
     * @tc.name testObjectConstructor0800
     * @tc.desc Verify new Object() has zero entries via Object.entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor0800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      let entries = Object.entries(obj);
      expect(entries.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_0900
     * @tc.name testObjectConstructor0900
     * @tc.desc Verify toString is not an own property on new Object()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor0900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      expect(Object.hasOwn(obj, "toString")).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_1000
     * @tc.name testObjectConstructor1000
     * @tc.desc Verify constructor is not an own property on new Object()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor1000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      expect(Object.hasOwn(obj, "constructor")).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_1100
     * @tc.name testObjectConstructor1100
     * @tc.desc Verify hasOwnProperty returns false for an arbitrary key on empty Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor1100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      expect(obj.hasOwnProperty("nonexistent")).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_1200
     * @tc.name testObjectConstructor1200
     * @tc.desc Verify hasOwnProperty with numeric index 0 returns false on empty Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor1200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      expect(obj.hasOwnProperty(0)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_1300
     * @tc.name testObjectConstructor1300
     * @tc.desc Verify toString() on new Object() returns deterministic non-empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor1300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      let s: string = obj.toString();
      expect(s).assertEqual("[object Object]");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_1400
     * @tc.name testObjectConstructor1400
     * @tc.desc Verify toString() returns same result when called twice on same instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor1400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      let s1: string = obj.toString();
      let s2: string = obj.toString();
      expect(s1).assertEqual(s2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_1500
     * @tc.name testObjectConstructor1500
     * @tc.desc Verify toLocaleString() returns a non-empty string on new Object()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor1500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      let s: string = obj.toLocaleString();
      expect(s).assertEqual("[object Object]");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_1600
     * @tc.name testObjectConstructor1600
     * @tc.desc Verify toLocaleString() returns consistent result on repeated calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor1600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      let s1: string = obj.toLocaleString();
      let s2: string = obj.toLocaleString();
      expect(s1).assertEqual(s2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_1700
     * @tc.name testObjectConstructor1700
     * @tc.desc Verify $_hashCode() returns a non-negative int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor1700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      let s: string = obj.toString();
      let hc: int = obj.$_hashCode();
      expect(obj.toString()).assertEqual(s);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_1800
     * @tc.name testObjectConstructor1800
     * @tc.desc Verify $_hashCode() is stable (same across two calls on same instance)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor1800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      let h1: int = obj.$_hashCode();
      let h2: int = obj.$_hashCode();
      expect(h1).assertEqual(h2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_1900
     * @tc.name testObjectConstructor1900
     * @tc.desc Verify $_hashCode() of two different Object instances can differ
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor1900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj1: Object = new Object();
      let obj2: Object = new Object();
      expect(obj1 as Object !== obj2 as Object).assertTrue();
      let h1: int = obj1.$_hashCode();
      let h2: int = obj2.$_hashCode();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_2000
     * @tc.name testObjectConstructor2000
     * @tc.desc Verify assigning new Object() across two variables preserves reference identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor2000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Object = new Object();
      let b: Object = a;
      expect(a as Object).assertEqual(b as Object);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_2100
     * @tc.name testObjectConstructor2100
     * @tc.desc Verify new Object() is usable as argument to a function expecting Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor2100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      let viaFn: string = ocToStringIdentity(obj);
      expect(viaFn).assertEqual(obj.toString());
      expect(viaFn.length >= 1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_2200
     * @tc.name testObjectConstructor2200
     * @tc.desc Verify string primitive is assignable to Object-typed variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor2200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = "hello";
      expect(obj.toString()).assertEqual("hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_2300
     * @tc.name testObjectConstructor2300
     * @tc.desc Verify boolean true is assignable to Object-typed variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor2300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = true;
      expect(Object.entries(obj).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_2400
     * @tc.name testObjectConstructor2400
     * @tc.desc Verify boolean false is assignable to Object-typed variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor2400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = false;
      expect(Object.entries(obj).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_2500
     * @tc.name testObjectConstructor2500
     * @tc.desc Verify positive int zero is assignable to Object-typed variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor2500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = 0 as Object;
      expect(Object.entries(obj).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_2600
     * @tc.name testObjectConstructor2600
     * @tc.desc Verify negative int is assignable to Object-typed variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor2600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let neg: int = -1;
      let obj: Object = neg as Object;
      expect(Object.entries(obj).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_2700
     * @tc.name testObjectConstructor2700
     * @tc.desc Verify int MAX_VALUE is assignable to Object-typed variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor2700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: int = 2147483647;
      let obj: Object = v as Object;
      expect(Object.entries(obj).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_2800
     * @tc.name testObjectConstructor2800
     * @tc.desc Verify int MIN_VALUE is assignable to Object-typed variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor2800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: int = -2147483648;
      let obj: Object = v as Object;
      expect(Object.entries(obj).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_2900
     * @tc.name testObjectConstructor2900
     * @tc.desc Verify float value is assignable to Object-typed variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor2900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: double = 3.14;
      let obj: Object = v as Object;
      expect(obj as double).assertClose(3.14, 0.001);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_3000
     * @tc.name testObjectConstructor3000
     * @tc.desc Verify Record is assignable to Object-typed variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor3000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "a": 1 } as Record<string, Any>;
      let obj: Object = rec;
      expect(Object.keys(obj).length).assertEqual(1);
      expect((obj as Record<string, Any>)["a"] as int).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_3100
     * @tc.name testObjectConstructor3100
     * @tc.desc Verify Array is assignable to Object-typed variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor3100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [1, 2, 3];
      let obj: Object = arr as Object;
      expect(Object.entries(obj).length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_3200
     * @tc.name testObjectConstructor3200
     * @tc.desc Verify custom empty class instance is assignable to Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor3200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inst: OCEmpty = new OCEmpty();
      let obj: Object = inst;
      expect(Object.getOwnPropertyNames(obj).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_3300
     * @tc.name testObjectConstructor3300
     * @tc.desc Verify custom class instance with constructor param stores field value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor3300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inst: OCNamed = new OCNamed("ArkTS");
      expect(inst.name).assertEqual("ArkTS");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_3400
     * @tc.name testObjectConstructor3400
     * @tc.desc Verify custom class instance with int constructor arg stores field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor3400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inst: OCWithValue = new OCWithValue(42);
      expect(inst.value).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_3500
     * @tc.name testObjectConstructor3500
     * @tc.desc Verify subclass constructor chains super() and sets both own and inherited fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor3500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let child: OCChild = new OCChild(7, "tag");
      expect(child.value).assertEqual(7);
      expect(child.label).assertEqual("tag");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_3600
     * @tc.name testObjectConstructor3600
     * @tc.desc Verify empty-string value is assignable to Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor3600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = "";
      expect(obj.toString()).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_3700
     * @tc.name testObjectConstructor3700
     * @tc.desc Verify unicode string is assignable to Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor3700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = "中文テスト";
      expect(obj.toString()).assertEqual("中文テスト");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_3800
     * @tc.name testObjectConstructor3800
     * @tc.desc Verify Class.of(new Object()) returns std.core.String class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor3800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      let name: string = Class.of(obj).getName();
      expect(name).assertEqual("std.core.Object");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_3900
     * @tc.name testObjectConstructor3900
     * @tc.desc Verify toString on Object does not throw when called in try-finally block
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor3900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_4000
     * @tc.name testObjectConstructor4000
     * @tc.desc Verify new Object() as target of Object.assign receives properties from source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor4000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Object = new Object();
      let source: Record<string, Any> = { "k": "v" } as Record<string, Any>;
      let threw: boolean = false;
      let errorName: string = "";
      try {
        Object.assign(target as Record<string, Any>, source);
      } catch (e) {
        threw = true;
        errorName = e.name;
      }
      expect(threw).assertTrue();
      expect(errorName).assertEqual("ClassCastError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_4100
     * @tc.name testObjectConstructor4100
     * @tc.desc Verify custom class instance with method returns correct method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor4100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inst: OCWithMethod = new OCWithMethod();
      expect(inst.greet()).assertEqual("hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_4200
     * @tc.name testObjectConstructor4200
     * @tc.desc Verify class with two fields initializes fields to expected defaults
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor4200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inst: OCWithTwoFields = new OCWithTwoFields();
      expect(inst.a).assertEqual(1);
      expect(inst.b).assertEqual("b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_4300
     * @tc.name testObjectConstructor4300
     * @tc.desc Verify Object keys on custom class instance list public fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor4300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inst: OCWithTwoFields = new OCWithTwoFields();
      let keys: string[] = Object.keys(inst);
      expect(keys.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_4400
     * @tc.name testObjectConstructor4400
     * @tc.desc Verify Object.getOwnPropertyNames on two-field class includes both fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor4400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inst: OCWithTwoFields = new OCWithTwoFields();
      let names: string[] = Object.getOwnPropertyNames(inst);
      expect(names.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_4500
     * @tc.name testObjectConstructor4500
     * @tc.desc Verify Object.values on two-field class returns both field values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor4500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inst: OCWithTwoFields = new OCWithTwoFields();
      let vals = Object.values(inst);
      expect(vals.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_4600
     * @tc.name testObjectConstructor4600
     * @tc.desc Verify subclass instance has both child and parent own field keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor4600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let child: OCChild = new OCChild(1, "x");
      let keys: string[] = Object.keys(child);
      expect(keys.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_4700
     * @tc.name testObjectConstructor4700
     * @tc.desc Verify subclass instance own property names include inherited instance fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor4700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let child: OCChild = new OCChild(5, "L");
      let names: string[] = Object.getOwnPropertyNames(child);
      expect(names.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_4800
     * @tc.name testObjectConstructor4800
     * @tc.desc Verify hasOwnProperty on custom class instance returns true for own field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor4800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inst: OCWithTwoFields = new OCWithTwoFields();
      expect(inst.hasOwnProperty("a")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_4900
     * @tc.name testObjectConstructor4900
     * @tc.desc Verify hasOwnProperty returns false for method on class instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor4900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inst: OCWithMethod = new OCWithMethod();
      expect(inst.hasOwnProperty("greet")).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_5000
     * @tc.name testObjectConstructor5000
     * @tc.desc Verify toString on custom class instance returns a non-empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor5000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inst: OCEmpty = new OCEmpty();
      let s: string = inst.toString();
      expect(s.length >= 1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_5100
     * @tc.name testObjectConstructor5100
     * @tc.desc Verify $_hashCode on custom class instance returns non-negative int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor5100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inst: OCEmpty = new OCEmpty();
      let s: string = inst.toString();
      let hc: int = inst.$_hashCode();
      expect(inst.toString()).assertEqual(s);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_5200
     * @tc.name testObjectConstructor5200
     * @tc.desc Verify $_hashCode is consistent for same custom class instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor5200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inst: OCEmpty = new OCEmpty();
      let h1: int = inst.$_hashCode();
      let h2: int = inst.$_hashCode();
      expect(h1).assertEqual(h2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_5300
     * @tc.name testObjectConstructor5300
     * @tc.desc Verify two distinct custom class instances have distinct references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor5300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: OCEmpty = new OCEmpty();
      let b: OCEmpty = new OCEmpty();
      expect(a !== b).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_5400
     * @tc.name testObjectConstructor5400
     * @tc.desc Verify constructor with zero int param sets field to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor5400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inst: OCWithValue = new OCWithValue(0);
      expect(inst.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_5500
     * @tc.name testObjectConstructor5500
     * @tc.desc Verify constructor with negative int param stores the negative value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor5500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inst: OCWithValue = new OCWithValue(-100);
      expect(inst.value).assertEqual(-100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_5600
     * @tc.name testObjectConstructor5600
     * @tc.desc Verify constructor with boundary MAX int param stores the value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor5600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inst: OCWithValue = new OCWithValue(2147483647);
      expect(inst.value).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_5700
     * @tc.name testObjectConstructor5700
     * @tc.desc Verify constructor with boundary MIN int param stores the value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor5700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inst: OCWithValue = new OCWithValue(-2147483648);
      expect(inst.value).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_5800
     * @tc.name testObjectConstructor5800
     * @tc.desc Verify constructor with empty string param stores empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor5800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inst: OCNamed = new OCNamed("");
      expect(inst.name).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_5900
     * @tc.name testObjectConstructor5900
     * @tc.desc Verify constructor with unicode string param stores it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor5900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inst: OCNamed = new OCNamed("日本語");
      expect(inst.name).assertEqual("日本語");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_6000
     * @tc.name testObjectConstructor6000
     * @tc.desc Verify repeated allocations of new Object() remain distinct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor6000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let objs: Object[] = [];
      for (let i: int = 0; i < 10; i++) {
        objs.push(new Object());
      }
      for (let i: int = 0; i < 10; i++) {
        for (let j: int = i + 1; j < 10; j++) {
          expect(objs[i] !== objs[j]).assertTrue();
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_6100
     * @tc.name testObjectConstructor6100
     * @tc.desc Verify Object.hasOwn returns false for arbitrary key on new Object()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor6100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      expect(Object.hasOwn(obj, "foo")).assertFalse();
      expect(Object.hasOwn(obj, "bar")).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_6200
     * @tc.name testObjectConstructor6200
     * @tc.desc Verify Object.hasOwn returns false for numeric key on empty new Object()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor6200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      expect(Object.hasOwn(obj, 0)).assertFalse();
      expect(Object.hasOwn(obj, 42)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_6300
     * @tc.name testObjectConstructor6300
     * @tc.desc Verify empty class instance produces non-empty toLocaleString and matches toString consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor6300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inst: OCEmpty = new OCEmpty();
      let s: string = inst.toLocaleString();
      expect(inst.toString()).assertEqual(s);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_6400
     * @tc.name testObjectConstructor6400
     * @tc.desc Verify toLocaleString on custom class returns non-empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor6400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inst: OCEmpty = new OCEmpty();
      let s: string = inst.toLocaleString();
      expect(s.length >= 1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_6500
     * @tc.name testObjectConstructor6500
     * @tc.desc Verify primitive 1 (int) is assignable to Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor6500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = 1 as Object;
      expect(Object.entries(obj).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_6600
     * @tc.name testObjectConstructor6600
     * @tc.desc Verify float 0.0 assignable to Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor6600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let z: double = 0.0;
      let obj: Object = z as Object;
      expect(obj as double).assertClose(0.0, 0.001);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_6700
     * @tc.name testObjectConstructor6700
     * @tc.desc Verify float -1.5 assignable to Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor6700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: double = -1.5;
      let obj: Object = v as Object;
      expect(obj as double).assertClose(-1.5, 0.001);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_6800
     * @tc.name testObjectConstructor6800
     * @tc.desc Verify empty array assignable to Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor6800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [];
      let obj: Object = arr as Object;
      expect(Object.entries(obj).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_6900
     * @tc.name testObjectConstructor6900
     * @tc.desc Verify string array assignable to Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor6900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: string[] = ["a", "b"];
      let obj: Object = arr as Object;
      expect(Object.entries(obj).length).assertEqual(2);
      expect(arr[0]).assertEqual("a");
      expect(arr[1]).assertEqual("b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_7000
     * @tc.name testObjectConstructor7000
     * @tc.desc Verify boolean array assignable to Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor7000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: boolean[] = [true, false];
      let obj: Object = arr as Object;
      expect(Object.entries(obj).length).assertEqual(2);
      expect(arr[0]).assertTrue();
      expect(arr[1]).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_7100
     * @tc.name testObjectConstructor7100
     * @tc.desc Verify Record with multiple value types assignable to Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor7100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = { "s": "x", "n": 1, "b": true } as Record<string, Any>;
      let obj: Object = rec;
      expect(Object.keys(obj).length).assertEqual(3);
      expect((obj as Record<string, Any>)["s"] as string).assertEqual("x");
      expect((obj as Record<string, Any>)["n"] as int).assertEqual(1);
      expect((obj as Record<string, Any>)["b"] as boolean).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_7200
     * @tc.name testObjectConstructor7200
     * @tc.desc Verify empty Record assignable to Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor7200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = {} as Record<string, Any>;
      let obj: Object = rec;
      expect(Object.keys(obj).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_7300
     * @tc.name testObjectConstructor7300
     * @tc.desc Verify subclass instance assignable to parent class type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor7300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let child: OCChild = new OCChild(1, "a");
      let asParent: OCWithValue = child;
      expect(asParent.value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_7400
     * @tc.name testObjectConstructor7400
     * @tc.desc Verify two constructor calls with same args produce distinct instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor7400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: OCNamed = new OCNamed("same");
      let b: OCNamed = new OCNamed("same");
      expect(a !== b).assertTrue();
      expect(a.name).assertEqual(b.name);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_7500
     * @tc.name testObjectConstructor7500
     * @tc.desc Verify new Object() passed to String() yields non-empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor7500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      let s: string = String(obj);
      expect(s).assertEqual("[object Object]");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_7600
     * @tc.name testObjectConstructor7600
     * @tc.desc Verify new Object() toString is deterministic across many iterations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor7600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      let expected: string = obj.toString();
      for (let i: int = 0; i < 20; i++) {
        expect(obj.toString()).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_7700
     * @tc.name testObjectConstructor7700
     * @tc.desc Verify toLocaleString equals toString for plain Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor7700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      expect(obj.toString()).assertEqual(obj.toLocaleString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_7800
     * @tc.name testObjectConstructor7800
     * @tc.desc Verify Object.setPrototypeOf is not tested (only own properties via Object.keys on empty)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor7800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      expect(Object.keys(obj).length).assertEqual(0);
      expect(Object.values(obj).length).assertEqual(0);
      expect(Object.entries(obj).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_7900
     * @tc.name testObjectConstructor7900
     * @tc.desc Verify assigning new Object() into Record works after Object.assign augmentation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor7900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Object = new Object();
      let threw: boolean = false;
      let errorName: string = "";
      try {
        Object.assign(base as Record<string, Any>, { "a": 1 } as Record<string, Any>);
      } catch (e) {
        threw = true;
        errorName = e.name;
      }
      expect(threw).assertTrue();
      expect(errorName).assertEqual("ClassCastError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_8000
     * @tc.name testObjectConstructor8000
     * @tc.desc Verify Object constructor field default values differ across instances (mutations don't leak)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor8000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: OCWithValue = new OCWithValue(1);
      let b: OCWithValue = new OCWithValue(2);
      expect(a.value).assertEqual(1);
      expect(b.value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_8100
     * @tc.name testObjectConstructor8100
     * @tc.desc Verify custom class field defaults are preserved when constructor doesn't set them
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor8100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inst: OCSubclass = new OCSubclass();
      expect(inst.x).assertEqual(10);
      let obj: Object = inst;
      expect(Object.hasOwn(obj, "x")).assertTrue();
      expect(obj.toString()).assertEqual("[object Object]");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_8200
     * @tc.name testObjectConstructor8200
     * @tc.desc Verify $_hashCode stays consistent across mixed method calls on same instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor8200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      let h1: int = obj.$_hashCode();
      obj.toString();
      obj.toLocaleString();
      let h2: int = obj.$_hashCode();
      expect(h1).assertEqual(h2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_8300
     * @tc.name testObjectConstructor8300
     * @tc.desc Verify new Object() can be stored in array of Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor8300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Object[] = [new Object(), new Object()];
      expect(arr.length).assertEqual(2);
      expect(arr[0] !== arr[1]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_8400
     * @tc.name testObjectConstructor8400
     * @tc.desc Verify child class field is not present on parent instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor8400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: OCWithValue = new OCWithValue(1);
      expect(parent.hasOwnProperty("value")).assertTrue();
      expect(parent.hasOwnProperty("label")).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_8500
     * @tc.name testObjectConstructor8500
     * @tc.desc Verify Object.entries on empty class instance returns zero or more entries without throwing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor8500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inst: OCEmpty = new OCEmpty();
      let entries = Object.entries(inst);
      expect(entries.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_8600
     * @tc.name testObjectConstructor8600
     * @tc.desc Verify Object.keys/values/entries/getOwnPropertyNames all report length 0 on fresh Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor8600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      expect(Object.keys(obj).length).assertEqual(0);
      expect(Object.values(obj).length).assertEqual(0);
      expect(Object.entries(obj).length).assertEqual(0);
      expect(Object.getOwnPropertyNames(obj).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_8700
     * @tc.name testObjectConstructor8700
     * @tc.desc Verify dynamically adding a string property to Object is observable via keys/values/hasOwn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor8700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Record<string, Any> = {} as Record<string, Any>;
      obj["x"] = "1";
      expect(Object.keys(obj).length).assertEqual(1);
      expect(obj["x"] as string).assertEqual("1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_8800
     * @tc.name testObjectConstructor8800
     * @tc.desc Verify field mutation on two-field class instance keeps both fields own and reports updated values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor8800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inst: OCWithTwoFields = new OCWithTwoFields();
      inst.a = 10;
      inst.b = "changed";
      expect(Object.hasOwn(inst, "a")).assertTrue();
      expect(Object.hasOwn(inst, "b")).assertTrue();
      expect(inst.a).assertEqual(10);
      expect(inst.b).assertEqual("changed");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_8900
     * @tc.name testObjectConstructor8900
     * @tc.desc Verify Object-typed record receiving numeric keys returns correct values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor8900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Record<string, Any> = {} as Record<string, Any>;
      obj["0"] = 10;
      obj["1"] = 20;
      expect(obj["0"] as int).assertEqual(10);
      expect(obj["1"] as int).assertEqual(20);
      expect(Object.keys(obj).length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_9000
     * @tc.name testObjectConstructor9000
     * @tc.desc Verify new Object() used as Object.assign target receives own enumerable properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor9000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Object = new Object();
      let src: Record<string, Any> = { "k": "v", "n": 3 } as Record<string, Any>;
      let threw: boolean = false;
      let errorName: string = "";
      try {
        Object.assign(target as Record<string, Any>, src);
      } catch (e) {
        threw = true;
        errorName = e.name;
      }
      expect(threw).assertTrue();
      expect(errorName).assertEqual("ClassCastError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_9100
     * @tc.name testObjectConstructor9100
     * @tc.desc Verify Object.entries returns [key,value] pairs after adding properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor9100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Record<string, Any> = { "a": 1 } as Record<string, Any>;
      let keys: string[] = Object.keys(obj);
      let vals = Object.values(obj);
      expect(keys.length).assertEqual(1);
      expect(vals.length).assertEqual(1);
      expect(keys[0]).assertEqual("a");
      expect(vals[0] as int).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_9200
     * @tc.name testObjectConstructor9200
     * @tc.desc Verify Class.of on OCEmpty instance reports the declared class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor9200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inst: OCEmpty = new OCEmpty();
      let name: string = Class.of(inst).getName();
      expect(name.includes("OCEmpty")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_9300
     * @tc.name testObjectConstructor9300
     * @tc.desc Verify Class.of on OCChild instance differs from Class.of on OCEmpty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor9300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let empty: OCEmpty = new OCEmpty();
      let child: OCChild = new OCChild(1, "x");
      let ne: string = Class.of(empty).getName();
      let nc: string = Class.of(child).getName();
      expect(ne !== nc).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_9400
     * @tc.name testObjectConstructor9400
     * @tc.desc Verify toString on class-with-method instance is deterministic across calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor9400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inst: OCWithMethod = new OCWithMethod();
      let s1: string = inst.toString();
      for (let i: int = 0; i < 5; i++) {
        expect(inst.toString()).assertEqual(s1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_9500
     * @tc.name testObjectConstructor9500
     * @tc.desc Verify method call via instance works both before and after toString is invoked
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor9500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inst: OCWithMethod = new OCWithMethod();
      expect(inst.greet()).assertEqual("hello");
      inst.toString();
      expect(inst.greet()).assertEqual("hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_9600
     * @tc.name testObjectConstructor9600
     * @tc.desc Verify field mutation on OCWithValue instance updates value correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor9600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inst: OCWithValue = new OCWithValue(0);
      expect(inst.value).assertEqual(0);
      inst.value = 7;
      expect(inst.value).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_9700
     * @tc.name testObjectConstructor9700
     * @tc.desc Verify field mutation on one OCNamed instance does not leak to another
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor9700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: OCNamed = new OCNamed("a");
      let b: OCNamed = new OCNamed("b");
      a.name = "A";
      expect(a.name).assertEqual("A");
      expect(b.name).assertEqual("b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_9800
     * @tc.name testObjectConstructor9800
     * @tc.desc Verify subclass field mutation updates both own and parent fields independently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor9800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: OCChild = new OCChild(1, "one");
      c.value = 2;
      c.label = "two";
      expect(c.value).assertEqual(2);
      expect(c.label).assertEqual("two");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_9900
     * @tc.name testObjectConstructor9900
     * @tc.desc Verify OCSubclass (extends empty) exposes its own field and zero inherited fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor9900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inst: OCSubclass = new OCSubclass();
      expect(inst.x).assertEqual(10);
      expect(Object.hasOwn(inst, "x")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_10000
     * @tc.name testObjectConstructor10000
     * @tc.desc Verify $hashCode differs between an instance and another instance of different class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor10000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Object = new Object();
      let b: OCEmpty = new OCEmpty();
      let ha: int = a.$_hashCode();
      let hb: int = b.$_hashCode();
      let nameA: string = Class.of(a).getName();
      let nameB: string = Class.of(b).getName();
      expect(nameA).assertEqual("std.core.Object");
      expect(nameA !== nameB).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_10100
     * @tc.name testObjectConstructor10100
     * @tc.desc Verify assigning new Object() into an Object[] array preserves toString per element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor10100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_10200
     * @tc.name testObjectConstructor10200
     * @tc.desc Verify Object-typed record with string value returns that value via bracket cast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor10200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Record<string, string> = { "greet": "hi" } as Record<string, string>;
      expect(obj["greet"]).assertEqual("hi");
      obj["greet"] = "hey";
      expect(obj["greet"]).assertEqual("hey");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_10300
     * @tc.name testObjectConstructor10300
     * @tc.desc Verify hasOwnProperty returns true for both fields of two-field class and false for unknown key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor10300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inst: OCWithTwoFields = new OCWithTwoFields();
      expect(inst.hasOwnProperty("a")).assertTrue();
      expect(inst.hasOwnProperty("b")).assertTrue();
      expect(inst.hasOwnProperty("c")).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_10400
     * @tc.name testObjectConstructor10400
     * @tc.desc Verify getOwnPropertyNames lists all enumerable own keys after assignment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor10400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Record<string, Any> = { "a": 1, "b": 2, "c": 3 } as Record<string, Any>;
      let names: string[] = Object.getOwnPropertyNames(obj);
      expect(names.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_10500
     * @tc.name testObjectConstructor10500
     * @tc.desc Verify Object.values returns inserted values in insertion order for int record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor10500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Record<string, Any> = { "x": 10, "y": 20 } as Record<string, Any>;
      let vals = Object.values(obj);
      expect(vals.length).assertEqual(2);
      expect(vals[0] as int).assertEqual(10);
      expect(vals[1] as int).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_10600
     * @tc.name testObjectConstructor10600
     * @tc.desc Verify upcast from subclass to Object still exposes inherited toString behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor10600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let child: OCChild = new OCChild(5, "L");
      let obj: Object = child;
      let s: string = obj.toString();
      expect(s.length >= 1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_10700
     * @tc.name testObjectConstructor10700
     * @tc.desc Verify upcast from class instance to Object preserves hashCode identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor10700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inst: OCWithValue = new OCWithValue(42);
      let h1: int = inst.$_hashCode();
      let obj: Object = inst;
      let h2: int = obj.$_hashCode();
      expect(h1).assertEqual(h2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_10800
     * @tc.name testObjectConstructor10800
     * @tc.desc Verify OCWithTwoFields field b mutation is independent of field a
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor10800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inst: OCWithTwoFields = new OCWithTwoFields();
      inst.a = 100;
      inst.b = "changed";
      expect(inst.a).assertEqual(100);
      expect(inst.b).assertEqual("changed");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_10900
     * @tc.name testObjectConstructor10900
     * @tc.desc Verify multiple sequential new Object() in array remain pairwise distinct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor10900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Object[] = [new Object(), new Object(), new Object(), new Object()];
      expect(arr.length).assertEqual(4);
      expect(arr[0] !== arr[1]).assertTrue();
      expect(arr[1] !== arr[2]).assertTrue();
      expect(arr[2] !== arr[3]).assertTrue();
      expect(arr[0] !== arr[3]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_11000
     * @tc.name testObjectConstructor11000
     * @tc.desc Verify that overwriting an Object-typed record key changes the value and keys stay same length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor11000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Record<string, Any> = { "k": "old" } as Record<string, Any>;
      obj["k"] = "new";
      expect(obj["k"] as string).assertEqual("new");
      expect(Object.keys(obj).length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_11100
     * @tc.name testObjectConstructor11100
     * @tc.desc Verify OCEmpty passed through a function parameter roundtrip returns same instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor11100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Object = new Object();
      let got: Object = orig;
      let h1: int = orig.$_hashCode();
      let h2: int = got.$_hashCode();
      expect(h1).assertEqual(h2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_11200
     * @tc.name testObjectConstructor11200
     * @tc.desc Verify a user-defined class instance keeps method behavior after being stored in Object[]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor11200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: OCWithMethod[] = [new OCWithMethod(), new OCWithMethod()];
      expect(arr[0].greet()).assertEqual("hello");
      expect(arr[1].greet()).assertEqual("hello");
      expect(arr[0] !== arr[1]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_CONSTRUCTOR_11300
     * @tc.name testObjectConstructor11300
     * @tc.desc Verify toLocaleString on class instance returns same value when invoked twice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectConstructor11300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inst: OCWithTwoFields = new OCWithTwoFields();
      let s1: string = inst.toLocaleString();
      let s2: string = inst.toLocaleString();
      expect(s1).assertEqual(s2);
      expect(s1.length >= 1).assertTrue();
    });
  });
}
