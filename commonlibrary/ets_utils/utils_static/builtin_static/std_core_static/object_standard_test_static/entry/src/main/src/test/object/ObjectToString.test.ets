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


class CustomData {
  public name: string = "test";
  public value: int = 42;
}

class InnerData {
  public data: string = "nested";
}

class OuterData {
  public inner: InnerData = new InnerData();
  public label: string = "outer";
}

class MyClassWithToString {
  public override toString(): String {
    return "MyClass instance";
  }
}

class EmptyToStringClass {
  public override toString(): String {
    return "";
  }
}

class Point {
  public x: int = 0;
  public y: int = 0;
  public constructor(px: int, py: int) {
    this.x = px;
    this.y = py;
  }
  public override toString(): String {
    return "Point(" + String(this.x) + ", " + String(this.y) + ")";
  }
}

class BaseWithOverride {
  public override toString(): String {
    return "Base";
  }
}

class GrandParent {
}

class Parent extends GrandParent {
}

class Child extends Parent {
}

class ClassA {
  public override toString(): String {
    return "ClassA";
  }
}

class ClassB extends ClassA {
}

class DecoratedToString {
  public override toString(): String {
    return "Decorated: " + super.toString();
  }
}

class ArrayStringItem {
  public label: string;
  public constructor(label: string) {
    this.label = label;
  }
  public override toString(): String {
    return "item:" + this.label;
  }
}

class SuperCustomBase {
  public override toString(): String {
    return "SuperCustomBase";
  }
}

class SuperCustomChild extends SuperCustomBase {
  public override toString(): String {
    return "Child->" + super.toString();
  }
}

final class FinalClass {
}

export default function ObjectToStringTest(): void {
  describe('ObjectToStringTest', (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {});
    afterAll((): void => {});

    /**
     * @tc.name testObjectToString001
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_STRING_0100
     * @tc.desc Verify toString method with empty Object instance for default [object Object] return
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectToString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      let result: String = obj.toString();
      expect(result).assertEqual("[object Object]");
    });

    /**
     * @tc.name testObjectToString002
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_STRING_0200
     * @tc.desc Verify toString method with custom class instance not overriding toString for default [object Object] return
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectToString002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: CustomData = new CustomData();
      let result: String = obj.toString();
      expect(result).assertEqual("[object Object]");
    });

    /**
     * @tc.name testObjectToString003
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_STRING_0300
     * @tc.desc Verify toString method with int value cast to Object reference for numeric string representation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectToString003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 42;
      let obj: Object = val;
      let result: String = obj.toString();
      expect(result).assertEqual("42");
    });

    /**
     * @tc.name testObjectToString004
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_STRING_0400
     * @tc.desc Verify toString method with double value cast to Object reference for decimal string representation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectToString004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: double = 3.14;
      let obj: Object = val;
      let result: String = obj.toString();
      expect(result).assertEqual("3.14");
    });

    /**
     * @tc.name testObjectToString005
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_STRING_0500
     * @tc.desc Verify toString method with boolean true/false values for correct string representation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectToString005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let valTrue: boolean = true;
      let objTrue: Object = valTrue;
      let resultTrue: String = objTrue.toString();
      expect(resultTrue).assertEqual("true");
      let valFalse: boolean = false;
      let objFalse: Object = valFalse;
      let resultFalse: String = objFalse.toString();
      expect(resultFalse).assertEqual("false");
    });

    /**
     * @tc.name testObjectToString006
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_STRING_0600
     * @tc.desc Verify toString method with string value for self-returning identity behavior
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectToString006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: string = "hello中文";
      let obj: Object = val;
      let result: String = obj.toString();
      expect(result).assertEqual("hello中文");
      let isSame: boolean = result === val;
      expect(isSame).assertTrue();
    });

    /**
     * @tc.name testObjectToString007
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_STRING_0700
     * @tc.desc Verify toString method with number array for non-empty string serialization
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectToString007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [1, 2, 3];
      let obj: Object = arr;
      let result: String = obj.toString();
      expect(result).assertEqual("1,2,3");
    });

    /**
     * @tc.name testObjectToString008
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_STRING_0800
     * @tc.desc Verify toString method with empty array for empty string return
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectToString008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [];
      let obj: Object = arr;
      let result: String = obj.toString();
      expect(result).assertEqual("");
    });

    /**
     * @tc.name testObjectToString009
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_STRING_0900
     * @tc.desc Verify toString method with Record object literal for non-empty string return
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectToString009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = { "key1": "value1" as Any, "key2": 42 as Any };
      let result: String = record.toString();
      expect(result).assertEqual("key1,value1,key2,42");
    });

    /**
     * @tc.name testObjectToString010
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_STRING_1000
     * @tc.desc Verify toString method with object type alias for consistent [object Object] return
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectToString010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: object = new Object();
      let result: String = value.toString();
      expect(result).assertEqual("[object Object]");
    });

    /**
     * @tc.name testObjectToString011
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_STRING_1100
     * @tc.desc Verify toString method with nested object instance for default [object Object] return without recursion
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectToString011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let outer: OuterData = new OuterData();
      let result: String = outer.toString();
      expect(result).assertEqual("[object Object]");
    });

    /**
     * @tc.name testObjectToString012
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_STRING_1200
     * @tc.desc Verify toString return type is String via runtime type reflection for SDK contract compliance
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectToString012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      let result: String = obj.toString();
      let resultType: string = Class.of(result).getName();
      expect(resultType).assertEqual('std.core.String');
    });

    /**
     * @tc.name testObjectToString013
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_STRING_1300
     * @tc.desc Verify toString idempotent behavior with consecutive calls returning identical results
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectToString013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      let result1: String = obj.toString();
      let result2: String = obj.toString();
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.name testObjectToString014
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_STRING_1400
     * @tc.desc Verify toString method with different Object instances both returning identical [object Object]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectToString014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj1: Object = new Object();
      let obj2: Object = new Object();
      let r1: String = obj1.toString();
      let r2: String = obj2.toString();
      expect(r1).assertEqual("[object Object]");
      expect(r2).assertEqual("[object Object]");
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.name testObjectToString015
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_STRING_1500
     * @tc.desc Verify toString method with byte max value for 127 string return
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectToString015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: byte = 127;
      let obj: Object = val;
      let result: String = obj.toString();
      expect(result).assertEqual("127");
    });

    /**
     * @tc.name testObjectToString016
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_STRING_1600
     * @tc.desc Verify toString method with bigint value for numeric string without n suffix
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectToString016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: bigint = 100n;
      let obj: Object = val;
      let result: String = obj.toString();
      expect(result).assertEqual("100");
    });

    /**
     * @tc.name testObjectToString017
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_STRING_1700
     * @tc.desc Verify toString result supports method chaining with length and indexOf String methods
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectToString017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      let result: String = obj.toString();
      let len: int = result.length;
      let idx: int = result.indexOf("[object");
      let isLenPositive: boolean = len > 0;
      expect(isLenPositive).assertTrue();
      let isIdxZero: boolean = idx == 0;
      expect(isIdxZero).assertTrue();
    });

    /**
     * @tc.name testObjectToString018
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_STRING_1800
     * @tc.desc Verify overridden toString method in custom class returns user-defined string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectToString018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: MyClassWithToString = new MyClassWithToString();
      let result: String = obj.toString();
      expect(result).assertEqual("MyClass instance");
    });

    /**
     * @tc.name testObjectToString019
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_STRING_1900
     * @tc.desc Verify overridden toString returning empty string for boundary empty value behavior
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectToString019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: EmptyToStringClass = new EmptyToStringClass();
      let result: String = obj.toString();
      expect(result).assertEqual("");
      let isEmpty: boolean = result.length == 0;
      expect(isEmpty).assertTrue();
    });

    /**
     * @tc.name testObjectToString020
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_STRING_2000
     * @tc.desc Verify overridden toString returns formatted string with instance property values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectToString020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: Point = new Point(3, 4);
      let result: String = p.toString();
      expect(result).assertEqual("Point(3, 4)");
    });

    /**
     * @tc.name testObjectToString021
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_STRING_2100
     * @tc.desc Verify polymorphic toString dispatch with Object reference to overridden subclass instance
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectToString021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new BaseWithOverride();
      let result: String = obj.toString();
      expect(result).assertEqual("Base");
    });

    /**
     * @tc.name testObjectToString022
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_STRING_2200
     * @tc.desc Verify toString in multi-level inheritance chain with no override returns default [object Object]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectToString022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Child = new Child();
      let result: String = obj.toString();
      expect(result).assertEqual("[object Object]");
    });

    /**
     * @tc.name testObjectToString023
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_STRING_2300
     * @tc.desc Verify toString inheritance where intermediate class overrides and subclass inherits the override
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectToString023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: ClassB = new ClassB();
      let result: String = obj.toString();
      expect(result).assertEqual("ClassA");
    });

    /**
     * @tc.name testObjectToString024
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_STRING_2400
     * @tc.desc Verify overridden toString invoking super.toString() returns concatenated result with default prefix
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectToString024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: DecoratedToString = new DecoratedToString();
      let result: String = obj.toString();
      expect(result).assertEqual("Decorated: [object Object]");
      let hasPrefix: boolean = result.indexOf("Decorated: ") == 0;
      expect(hasPrefix).assertTrue();
    });

    /**
     * @tc.name testObjectToString025
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_STRING_2500
     * @tc.desc Verify toString method on final class instance for default [object Object] return
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectToString025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: FinalClass = new FinalClass();
      let result: String = obj.toString();
      expect(result).assertEqual("[object Object]");
    });

    /**
     * @tc.name testObjectToString026
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_STRING_2600
     * @tc.desc Verify number array toString returns exact comma-joined element string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectToString026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [1, 2, 3];
      let result: String = arr.toString();
      expect(result).assertEqual("1,2,3");
    });

    /**
     * @tc.name testObjectToString027
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_STRING_2700
     * @tc.desc Verify string array toString preserves empty element separators and whitespace content
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectToString027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: string[] = ["alpha", "", " gamma"];
      let result: String = arr.toString();
      expect(result).assertEqual("alpha,, gamma");
    });

    /**
     * @tc.name testObjectToString028
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_STRING_2800
     * @tc.desc Verify array toString uses each custom element overridden toString result in order
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectToString028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ArrayStringItem[] = [new ArrayStringItem("A"), new ArrayStringItem("B")];
      let result: String = arr.toString();
      expect(result).assertEqual("item:A,item:B");
    });

    /**
     * @tc.name testObjectToString029
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_STRING_2900
     * @tc.desc Verify array direct call and Object typed view return identical toString results
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectToString029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [4, 5, 6];
      let obj: Object = arr;
      let arrResult: String = arr.toString();
      let objResult: String = obj.toString();
      expect(arrResult).assertEqual("4,5,6");
      expect(objResult).assertEqual(arrResult);
    });

    /**
     * @tc.name testObjectToString030
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_STRING_3000
     * @tc.desc Verify empty Record toString returns a stable non-empty string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectToString030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = {} as Record<string, Any>;
      let result: String = record.toString();
      expect(result).assertEqual("[object Map]");
    });

    /**
     * @tc.name testObjectToString031
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_STRING_3100
     * @tc.desc Verify Record viewed as Object returns a stable non-empty string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectToString031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = {
        "x": 1,
        "y": 2
      } as Record<string, Any>;
      let obj: Object = record;
      let result: String = obj.toString();
      expect(result).assertEqual("x,1,y,2");
    });

    /**
     * @tc.name testObjectToString032
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_STRING_3200
     * @tc.desc Verify short subtype toString keeps negative integer text representation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectToString032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: short = -123;
      let obj: Object = val;
      let result: String = obj.toString();
      expect(result).assertEqual("-123");
    });

    /**
     * @tc.name testObjectToString033
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_STRING_3300
     * @tc.desc Verify negative bigint toString returns signed decimal text without suffix
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectToString033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: bigint = -900n;
      let obj: Object = val;
      let result: String = obj.toString();
      expect(result).assertEqual("-900");
    });

    /**
     * @tc.name testObjectToString034
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_STRING_3400
     * @tc.desc Verify empty string primitive toString returns the same empty content
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectToString034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: string = "";
      let obj: Object = val;
      let result: String = obj.toString();
      expect(result).assertEqual("");
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name testObjectToString035
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_STRING_3500
     * @tc.desc Verify Unicode and zero-width characters are preserved in string primitive toString result
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectToString035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: string = "零宽​键";
      let obj: Object = val;
      let result: String = obj.toString();
      expect(result).assertEqual("零宽​键");
    });

    /**
     * @tc.name testObjectToString036
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_STRING_3600
     * @tc.desc Verify overridden toString can call a custom super.toString implementation and compose the result
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectToString036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: SuperCustomChild = new SuperCustomChild();
      let result: String = obj.toString();
      expect(result).assertEqual("Child->SuperCustomBase");
    });

    /**
     * @tc.name testObjectToString037
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_STRING_3700
     * @tc.desc Verify Object typed Record with non-callable own toString property still returns a string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectToString037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = {
        "toString": "notCallable"
      } as Record<string, Any>;
      let obj: Object = record;
      let caughtError: boolean = false;
      let result: String = "";
      try {
        result = obj.toString();
      } catch (e) {
        caughtError = true;
      }
      expect(caughtError).assertFalse();
      expect(result).assertEqual("toString,notCallable");
    });

    /**
     * @tc.name testObjectToString038
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_STRING_3800
     * @tc.desc Verify overridden toString reflects current mutable field values after state changes
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectToString038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let point: Point = new Point(1, 2);
      let before: String = point.toString();
      point.x = 9;
      point.y = -4;
      let after: String = point.toString();
      expect(before).assertEqual("Point(1, 2)");
      expect(after).assertEqual("Point(9, -4)");
    });

    /**
     * @tc.name testObjectToString039
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_STRING_3900
     * @tc.desc Verify repeated toString calls on array with custom elements remain stable across invocations
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testObjectToString039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ArrayStringItem[] = [new ArrayStringItem("X"), new ArrayStringItem("Y")];
      let result1: String = arr.toString();
      let result2: String = arr.toString();
      expect(result1).assertEqual("item:X,item:Y");
      expect(result2).assertEqual(result1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_STRING_4000
     * @tc.name testObjectToString040
     * @tc.desc Verify repeated toString calls on a mutated Point instance reflect updated state each time
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectToString040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let point: Point = new Point(0, 0);
      let r1: string = point.toString();
      point.x = 7;
      let r2: string = point.toString();
      point.y = 9;
      let r3: string = point.toString();
      expect(r1).assertEqual("Point(0, 0)");
      expect(r2).assertEqual("Point(7, 0)");
      expect(r3).assertEqual("Point(7, 9)");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_STRING_4100
     * @tc.name testObjectToString041
     * @tc.desc Verify toString on an empty Record viewed through Object type returns the default object tag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectToString041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec: Record<string, Any> = {} as Record<string, Any>;
      let obj: Object = rec;
      let result: string = obj.toString();
      expect(result).assertEqual("[object Map]");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_STRING_4200
     * @tc.name testObjectToString042
     * @tc.desc Verify int zero toString returns the literal zero string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectToString042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 0;
      let obj: Object = val;
      expect(obj.toString()).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_STRING_4300
     * @tc.name testObjectToString043
     * @tc.desc Verify negative int toString returns a leading minus decimal representation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectToString043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = -1;
      let obj: Object = val;
      expect(obj.toString()).assertEqual("-1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_STRING_4400
     * @tc.name testObjectToString044
     * @tc.desc Verify double zero toString returns a zero decimal string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectToString044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: double = 0.0;
      let obj: Object = val;
      expect(obj.toString()).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_STRING_4500
     * @tc.name testObjectToString045
     * @tc.desc Verify double toString with fractional part preserves the decimal point and digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectToString045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: double = 2.5;
      let obj: Object = val;
      expect(obj.toString()).assertEqual("2.5");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_STRING_4600
     * @tc.name testObjectToString046
     * @tc.desc Verify single-element int array toString returns that number without separators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectToString046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [42];
      expect(arr.toString()).assertEqual("42");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_STRING_4700
     * @tc.name testObjectToString047
     * @tc.desc Verify boolean array toString joins true and false literals with commas
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectToString047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: boolean[] = [true, false, true];
      expect(arr.toString()).assertEqual("true,false,true");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_STRING_4800
     * @tc.name testObjectToString048
     * @tc.desc Verify array of arrays toString flattens nested elements with comma separation in current runtime
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectToString048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Object[] = [[1, 2] as Object, 3 as Object] as Object[];
      expect(arr.toString()).assertEqual("1,2,3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_STRING_4900
     * @tc.name testObjectToString049
     * @tc.desc Verify single custom-element array toString returns that element's custom string with no separators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectToString049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ArrayStringItem[] = [new ArrayStringItem("only")];
      expect(arr.toString()).assertEqual("item:only");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_STRING_5000
     * @tc.name testObjectToString050
     * @tc.desc Verify mixed primitive and custom object array toString joins primitive and custom conversions with commas
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectToString050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Object[] = [1 as Object, new ArrayStringItem("X") as Object, "z" as Object] as Object[];
      expect(arr.toString()).assertEqual("1,item:X,z");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_STRING_5100
     * @tc.name testObjectToString051
     * @tc.desc Verify String-typed view of a primitive string returns the same content via toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectToString051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: string = "abc";
      let obj: String = val;
      expect(obj.toString()).assertEqual("abc");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_STRING_5200
     * @tc.name testObjectToString052
     * @tc.desc Verify toString result of plain Object participates in string concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectToString052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      let combined: string = obj.toString() + "|tail";
      expect(combined).assertEqual("[object Object]|tail");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_STRING_5300
     * @tc.name testObjectToString053
     * @tc.desc Verify toString on an Object referencing a custom class dispatches to the overridden implementation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectToString053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new MyClassWithToString();
      expect(obj.toString()).assertEqual("MyClass instance");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_STRING_5400
     * @tc.name testObjectToString054
     * @tc.desc Verify toString on an Object referencing a Point instance returns the formatted coordinate string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectToString054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Point(5, 6);
      expect(obj.toString()).assertEqual("Point(5, 6)");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_STRING_5500
     * @tc.name testObjectToString055
     * @tc.desc Verify a subclass inheriting the parent toString override returns the parent string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectToString055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: ClassA = new ClassB();
      expect(obj.toString()).assertEqual("ClassA");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_STRING_5600
     * @tc.name testObjectToString056
     * @tc.desc Verify toString on an Object-view of an int[] matches the direct array toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectToString056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [7, 8, 9];
      let obj: Object = arr;
      expect(obj.toString()).assertEqual("7,8,9");
      expect(obj.toString()).assertEqual(arr.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_STRING_5700
     * @tc.name testObjectToString057
     * @tc.desc Verify toString on a populated Record literal enumerates keys and values comma-separated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectToString057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, Any> = { "a": 1 as Any, "b": "x" as Any };
      expect(record.toString()).assertEqual("a,1,b,x");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_STRING_5800
     * @tc.name testObjectToString058
     * @tc.desc Verify String class wrapper toString returns the underlying primitive string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectToString058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boxed: String = new String("boxed");
      expect(boxed.toString()).assertEqual("boxed");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_STRING_5900
     * @tc.name testObjectToString059
     * @tc.desc Verify Boolean class wrapper toString returns the boolean literal text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectToString059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t: Boolean = new Boolean(true);
      let f: Boolean = new Boolean(false);
      expect(t.toString()).assertEqual("true");
      expect(f.toString()).assertEqual("false");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_STRING_6000
     * @tc.name testObjectToString060
     * @tc.desc Verify Number class wrapper toString returns decimal text for the wrapped integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectToString060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: Number = new Number(77);
      expect(n.toString()).assertEqual("77");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_STRING_6100
     * @tc.name testObjectToString061
     * @tc.desc Verify array toString preserves leading/trailing empty string elements as empty fields between commas
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectToString061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: string[] = ["", "a", ""];
      expect(arr.toString()).assertEqual(",a,");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_STRING_6200
     * @tc.name testObjectToString062
     * @tc.desc Verify toString on a final class instance through an Object reference returns the default object tag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectToString062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new FinalClass();
      expect(obj.toString()).assertEqual("[object Object]");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_STRING_6300
     * @tc.name testObjectToString063
     * @tc.desc Verify overridden toString returning empty string reports length zero through Object reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectToString063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new EmptyToStringClass();
      let r: String = obj.toString();
      expect(r).assertEqual("");
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_TO_STRING_6400
     * @tc.name testObjectToString064
     * @tc.desc Verify the default toString of a plain Object returns a string containing the Object class tag substring
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectToString064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = new Object().toString() as string;
      expect(r.indexOf("[object Object]")).assertEqual(0);
      expect(r.length).assertEqual("[object Object]".length);
    });
  });
}
