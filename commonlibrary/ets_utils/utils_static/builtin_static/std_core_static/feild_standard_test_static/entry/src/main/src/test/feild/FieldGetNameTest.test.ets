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
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import Utils from './../Util.test';

class GnSample001 {
  static count: int = 1;
}

class GnSample007 {
  static value: int = 42;
}

class GnSample008 {
  static count: int = 1;
  static name: string = "test";
}

class GnSample012 {
  static cntField: int = 1;
}

class GnSample013 {
  static _private_count: int = 1;
}

class GnSample014 {
  static $value: int = 1;
}

class GnSample015 {
  static field_01_test: int = 1;
}

class GnSample016 {
  static abc: int = 1;
}

class GnSample017 {
  static ABC: int = 1;
}

class GnSample018 {
  static x: int = 1;
}

class GnSample020Alt {
  static value: int = 2;
}

class GnParent021 {
  static parentField: int = 1;
}

class GnChild021 extends GnParent021 {
  static childField: int = 2;
}

class GnParent030 {
  static sameName: int = 1;
}

class GnChild030 extends GnParent030 {
  static sameName: string = "child";
}

class GnSample022 {
  static staticField: int = 1;
}

class GnSample032 {
  static A_value99: int = 1;
}

class GnSample033 {
  static mixed_Name_2026: int = 1;
}

class GnSample034 {
  static item1: int = 1;
  static item10: int = 10;
  static Item1: int = 100;
}

class GnNameScalar035 {
  static longId: long = 900719925;
  static score: float = 1.5f;
  static ratio: double = 2.5;
  static ready: boolean = true;
  static title: string = "name";
}

class GnNameArray036 {
  static ids: int[] = [1, 2, 3];
  names: string[] = ["left", "right"];
}

class GnNameInner037 {
  code: int = 1;
}

class GnNameObject037 {
  static custom: GnNameInner037 = new GnNameInner037();
  static obj: Object = new Object();
}

enum GnNameColor038 {
  RED = 0, BLUE = 1
}

enum GnNameStatus038 {
  OK = "OK", FAIL = "FAIL"
}

class GnNameEnum038 {
  static color: GnNameColor038 = GnNameColor038.RED;
  status: GnNameStatus038 = GnNameStatus038.OK;
}

class GnNameBox039<T> {
  value: T;

  constructor(value: T) {
    this.value = value;
  }
}

class GnNameGeneric039 {
  static intBox: GnNameBox039<int> = new GnNameBox039<int>(1);
  stringBox: GnNameBox039<string> = new GnNameBox039<string>("one");
}

class GnNameFunctionSource040 {
  static makeText(value: int): string {
    return value.toString();
  }
}

class GnNameFunction040 {
  static transform: Function = GnNameFunctionSource040.makeText;
  readonly callback: string = "cb";
}

class GnNameParent041 {
  inheritedTitle: string = "parent";
}

class GnNameChild041 extends GnNameParent041 {
  childFlag: boolean = true;
}

class GnNameParent042 {
  static hiddenKey: int = 1;
}

class GnNameChild042 extends GnNameParent042 {
  static hiddenKey: string = "child";
}

class GnNameModifier043 {
  static readonly maxCount: int = 10;
  static mutableCount: int = 1;
  readonly label: string = "tag";
  enabled: boolean = true;
}

class GnNameUninitialized044 {
  title!: string;
  count!: int;
}

class GnNameSpecial045 {
  static classField: int = 1;
  static functionField: string = "call";
  static returnField: boolean = true;
  static _ID_2026_value: double = 1.25;
}

class GnNameCase046 {
  static name1: int = 1;
  static name01: int = 1;
  static Name1: int = 1;
  static NAME_1: int = 1;
}

class GnNameNullable047 {
  parA: undefined = undefined;
  parB: null = null;
  parC: string | undefined = undefined;
  parD: string | null = null;
  parE?: string;
  parF: Array<string> = new Array<string>();
  parG: string[] = [];
}

export default function FieldGetNameTest(): void {
  describe('FieldGetNameTest', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_NAME_0100
     * @tc.name testGetName0100
     * @tc.desc getName returns exact field name and getType confirms type for static int field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetName0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<GnSample001>() as ClassType).getFieldByName("count");
      const name: string = field.getName();
      expect(name).assertEqual("count");
      expect(field.getType().toString()).assertEqual("int");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_NAME_0200
     * @tc.name testGetName0200
     * @tc.desc getName result equals the original field name string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetName0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<GnSample013>() as ClassType).getFieldByName("_private_count");
      const name: string = field.getName();
      expect(name).assertEqual("_private_count");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_NAME_0300
     * @tc.name testGetName0300
     * @tc.desc getName returns correct name for field with special prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetName0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<GnSample014>() as ClassType).getFieldByName("$value");
      const name: string = field.getName();
      expect(name).assertEqual("$value");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_NAME_0400
     * @tc.name testGetName0400
     * @tc.desc Verify getName preserves an identifier with letters, underscores, and digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetName0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<GnSample015>() as ClassType).getFieldByName("field_01_test");
      const name: string = field.getName();
      expect(name).assertEqual("field_01_test");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_NAME_0500
     * @tc.name testGetName0500
     * @tc.desc Verify getName result matches queried field name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetName0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<GnSample007>() as ClassType).getFieldByName("value");
      const name: string = field.getName();
      expect(name).assertEqual("value");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_NAME_0600
     * @tc.name testGetName0600
     * @tc.desc Verify getName returns correct names for multiple fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetName0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GnSample008>() as ClassType;
      const field1 = classType.getFieldByName("count");
      const field2 = classType.getFieldByName("name");
      expect(field1.getName()).assertEqual("count");
      expect(field1.getType().toString()).assertEqual("int");
      expect(field1.isStatic()).assertTrue();
      expect(field2.getName()).assertEqual("name");
      expect(field2.getType().toString()).assertEqual("string");
      expect(field2.isStatic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_NAME_0700
     * @tc.name testGetName0700
     * @tc.desc Verify getName returns correct camelCase field name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetName0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<GnSample012>() as ClassType).getFieldByName("cntField");
      const name: string = field.getName();
      expect(name).assertEqual("cntField");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_NAME_0800
     * @tc.name testGetName0800
     * @tc.desc Verify getName returns lowercase field name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetName0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<GnSample016>() as ClassType).getFieldByName("abc");
      const name: string = field.getName();
      expect(name).assertEqual("abc");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_NAME_0900
     * @tc.name testGetName0900
     * @tc.desc Verify getName returns uppercase field name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetName0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<GnSample017>() as ClassType).getFieldByName("ABC");
      const name: string = field.getName();
      expect(name).assertEqual("ABC");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_NAME_1000
     * @tc.name testGetName1000
     * @tc.desc Verify getName returns single character field name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetName1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<GnSample018>() as ClassType).getFieldByName("x");
      const name: string = field.getName();
      expect(name).assertEqual("x");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_NAME_1100
     * @tc.name testGetName1100
     * @tc.desc Verify getName returns consistent results on repeated calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetName1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<GnSample001>() as ClassType).getFieldByName("count");
      const name1: string = field.getName();
      const name2: string = field.getName();
      const name3: string = field.getName();
      expect(name1).assertEqual("count");
      expect(name2).assertEqual("count");
      expect(name3).assertEqual("count");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_NAME_1200
     * @tc.name testGetName1200
     * @tc.desc Verify getName returns correct names for different class fields independently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetName1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fieldA = (Type.from<GnSample001>() as ClassType).getFieldByName("count");
      const fieldB = (Type.from<GnSample020Alt>() as ClassType).getFieldByName("value");
      expect(fieldA.getName()).assertEqual("count");
      expect(fieldB.getName()).assertEqual("value");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_NAME_1300
     * @tc.name testGetName1300
     * @tc.desc Verify getName returns correct name for child class field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetName1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<GnChild021>() as ClassType).getFieldByName("childField");
      const name: string = field.getName();
      expect(name).assertEqual("childField");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_NAME_1400
     * @tc.name testGetName1400
     * @tc.desc Verify getName returns correct static field name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetName1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<GnSample022>() as ClassType).getFieldByName("staticField");
      const name: string = field.getName();
      expect(name).assertEqual("staticField");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_NAME_1500
     * @tc.name testGetName1500
     * @tc.desc Verify missing field lookup throws TypeError before getName can be called
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetName1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GnSample001>() as ClassType;
      try {
        classType.getFieldByName("nonExistent");
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('TypeError');
      }
      expect(classType.getFieldByName("count").getName()).assertEqual("count");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_NAME_1600
     * @tc.name testGetName1600
     * @tc.desc Verify getName result stays stable across two freshly resolved Field objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetName1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GnSample001>() as ClassType;
      const field = classType.getFieldByName("count");
      const other = classType.getFieldByName("count");
      const name: string = field.getName();
      expect(name).assertEqual("count");
      expect(other.getName()).assertEqual(name);
      expect(field.equals(other)).assertTrue();
      expect(field.getOwnerType().getName()).assertEqual(classType.getName());
      expect(other.getOwnerType().getName()).assertEqual(classType.getName());
      expect(field.getType().toString()).assertEqual("int");
      expect(other.getType().toString()).assertEqual("int");
      expect(field.isStatic()).assertTrue();
      expect(other.isStatic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_NAME_1700
     * @tc.name testGetName1700
     * @tc.desc Verify getName preserves distinct identifier spellings within the same class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetName1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GnSample008>() as ClassType;
      const countName: string = classType.getFieldByName("count").getName();
      const textName: string = classType.getFieldByName("name").getName();
      expect(countName).assertEqual("count");
      expect(textName).assertEqual("name");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_NAME_1800
     * @tc.name testGetName1800
     * @tc.desc Verify inherited and child static field names are resolved as distinct declarations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetName1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GnChild021>() as ClassType;
      const parentName: string = classType.getFieldByName("parentField").getName();
      const childName: string = classType.getFieldByName("childField").getName();
      expect(parentName).assertEqual("parentField");
      expect(childName).assertEqual("childField");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_NAME_1900
     * @tc.name testGetName1900
     * @tc.desc Verify hidden parent and child fields keep the same name but different type text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetName1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parentField = (Type.from<GnParent030>() as ClassType).getFieldByName("sameName");
      const childField = (Type.from<GnChild030>() as ClassType).getFieldByName("sameName");
      expect(parentField.getName()).assertEqual("sameName");
      expect(childField.getName()).assertEqual("sameName");
      expect(parentField.getType().toString()).assertEqual("int");
      expect(childField.getType().toString()).assertEqual("string");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_NAME_2000
     * @tc.name testGetName2000
     * @tc.desc Verify getName preserves a mixed uppercase underscore and numeric suffix field name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetName2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<GnSample032>() as ClassType).getFieldByName("A_value99");
      expect(field.getName()).assertEqual("A_value99");
      expect(field.getType().toString()).assertEqual("int");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_NAME_2100
     * @tc.name testGetName2100
     * @tc.desc Verify getName resolves case-sensitive and numeric-suffix field names without prefix confusion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetName2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GnSample034>() as ClassType;
      expect(classType.getFieldByName("item1").getName()).assertEqual("item1");
      expect(classType.getFieldByName("item10").getName()).assertEqual("item10");
      expect(classType.getFieldByName("Item1").getName()).assertEqual("Item1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_NAME_2200
     * @tc.name testGetName2200
     * @tc.desc Verify getName preserves a long mixed-case underscored field name with type cross-check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetName2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<GnSample033>() as ClassType).getFieldByName("mixed_Name_2026");
      expect(field.getName()).assertEqual("mixed_Name_2026");
      expect(field.getType().toString()).assertEqual("int");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_NAME_2300
     * @tc.name testGetName2300
     * @tc.desc Verify getName remains unchanged after reflective setStaticValue modifies the field value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetName2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<GnSample001>() as ClassType).getFieldByName("count");
      const name: string = field.getName();
      expect(name).assertEqual("count");
      const original = field.getStaticValue() as int;
      try {
        field.setStaticValue(42);
        expect(field.getStaticValue() as int).assertEqual(42);
        expect(field.getName()).assertEqual("count");
      } finally {
        field.setStaticValue(original);
      }
      expect(field.getName()).assertEqual("count");
      expect(field.getStaticValue() as int).assertEqual(original);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_NAME_2400
     * @tc.name testGetName2400
     * @tc.desc Verify getName for scalar built-in fields with exact getType text cross-checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetName2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GnNameScalar035>() as ClassType;
      const longField = classType.getFieldByName("longId");
      const floatField = classType.getFieldByName("score");
      const doubleField = classType.getFieldByName("ratio");
      const boolField = classType.getFieldByName("ready");
      const stringField = classType.getFieldByName("title");
      expect(longField.getName()).assertEqual("longId");
      expect(longField.getType().toString()).assertEqual("long");
      expect(floatField.getName()).assertEqual("score");
      expect(floatField.getType().toString()).assertEqual("float");
      expect(doubleField.getName()).assertEqual("ratio");
      expect(doubleField.getType().toString()).assertEqual("double");
      expect(boolField.getName()).assertEqual("ready");
      expect(boolField.getType().toString()).assertEqual("boolean");
      expect(stringField.getName()).assertEqual("title");
      expect(stringField.getType().toString()).assertEqual("string");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_NAME_2500
     * @tc.name testGetName2500
     * @tc.desc Verify getName distinguishes static and instance array fields while getType stays Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetName2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GnNameArray036>() as ClassType;
      const idsField = classType.getFieldByName("ids");
      const namesField = classType.getFieldByName("names");
      expect(idsField.getName()).assertEqual("ids");
      expect(idsField.getType().toString()).assertEqual("std.core.Array");
      expect(idsField.isStatic()).assertTrue();
      expect(namesField.getName()).assertEqual("names");
      expect(namesField.getType().toString()).assertEqual("std.core.Array");
      expect(namesField.isStatic()).assertFalse();
      expect(idsField.equals(namesField)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_NAME_2600
     * @tc.name testGetName2600
     * @tc.desc Verify getName for custom class and Object typed fields with exact type reflection comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetName2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GnNameObject037>() as ClassType;
      const customField = classType.getFieldByName("custom");
      const objectField = classType.getFieldByName("obj");
      const customTypeText: string = Type.from<GnNameInner037>().toString();
      expect(customField.getName()).assertEqual("custom");
      expect(customField.getType().toString()).assertEqual(customTypeText);
      expect(customField.getType().getName()).assertEqual((Type.from<GnNameInner037>() as ClassType).getName());
      expect(objectField.getName()).assertEqual("obj");
      expect(objectField.getType().getName()).assertEqual("std.core.Object");
      expect(objectField.isStatic()).assertTrue();
      expect(customField.equals(objectField)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_NAME_2700
     * @tc.name testGetName2700
     * @tc.desc Verify getName for numeric and string enum fields with exact enum type reflection comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetName2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GnNameEnum038>() as ClassType;
      const colorField = classType.getFieldByName("color");
      const statusField = classType.getFieldByName("status");
      expect(colorField.getName()).assertEqual("color");
      expect(colorField.getType().toString()).assertEqual(Type.from<GnNameColor038>().toString());
      expect(colorField.isStatic()).assertTrue();
      expect(statusField.getName()).assertEqual("status");
      expect(statusField.getType().toString()).assertEqual(Type.from<GnNameStatus038>().toString());
      expect(statusField.isStatic()).assertFalse();
      expect(colorField.equals(statusField)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_NAME_2800
     * @tc.name testGetName2800
     * @tc.desc Verify getName for generic class instance fields with exact generic type text comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetName2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GnNameGeneric039>() as ClassType;
      const intBoxField = classType.getFieldByName("intBox");
      const stringBoxField = classType.getFieldByName("stringBox");
      expect(intBoxField.getName()).assertEqual("intBox");
      expect(intBoxField.getType().toString()).assertEqual(Type.from<GnNameBox039<int>>().toString());
      expect(intBoxField.toString()).assertEqual("intBox: " + Type.from<GnNameBox039<int>>().toString());
      expect(intBoxField.isStatic()).assertTrue();
      expect(stringBoxField.getName()).assertEqual("stringBox");
      expect(stringBoxField.getType().toString()).assertEqual(Type.from<GnNameBox039<string>>().toString());
      expect(stringBoxField.toString()).assertEqual("stringBox: " + Type.from<GnNameBox039<string>>().toString());
      expect(stringBoxField.isStatic()).assertFalse();
      expect(intBoxField.equals(stringBoxField)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_NAME_2900
     * @tc.name testGetName2900
     * @tc.desc Verify getName for static Function and readonly callback fields with static and equality metadata
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetName2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GnNameFunction040>() as ClassType;
      const transformField = classType.getFieldByName("transform");
      const callbackField = classType.getFieldByName("callback");
      expect(transformField.getName()).assertEqual("transform");
      expect(transformField.isStatic()).assertTrue();
      expect(callbackField.getName()).assertEqual("callback");
      expect(callbackField.isStatic()).assertFalse();
      expect(callbackField.isReadonly()).assertTrue();
      expect(transformField.equals(callbackField)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_NAME_3000
     * @tc.name testGetName3000
     * @tc.desc Verify getName for inherited parent instance field resolved through child type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetName3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parentField = (Type.from<GnNameParent041>() as ClassType).getFieldByName("inheritedTitle");
      const childField = (Type.from<GnNameChild041>() as ClassType).getFieldByName("inheritedTitle");
      expect(parentField.getName()).assertEqual("inheritedTitle");
      expect(childField.getName()).assertEqual("inheritedTitle");
      expect(childField.getType().toString()).assertEqual("string");
      expect(childField.isStatic()).assertFalse();
      expect(parentField.equals(childField)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_NAME_3100
     * @tc.name testGetName3100
     * @tc.desc Verify hidden parent and child static fields keep exact same name but different type text and equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetName3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parentField = (Type.from<GnNameParent042>() as ClassType).getFieldByName("hiddenKey");
      const childField = (Type.from<GnNameChild042>() as ClassType).getFieldByName("hiddenKey");
      expect(parentField.getName()).assertEqual("hiddenKey");
      expect(childField.getName()).assertEqual("hiddenKey");
      expect(parentField.getType().toString()).assertEqual("int");
      expect(childField.getType().toString()).assertEqual("string");
      expect(parentField.isStatic()).assertTrue();
      expect(childField.isStatic()).assertTrue();
      expect(parentField.equals(childField)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_NAME_3200
     * @tc.name testGetName3200
     * @tc.desc Verify getName across static readonly static mutable readonly instance and mutable instance fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetName3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GnNameModifier043>() as ClassType;
      const maxField = classType.getFieldByName("maxCount");
      const mutableField = classType.getFieldByName("mutableCount");
      const labelField = classType.getFieldByName("label");
      const enabledField = classType.getFieldByName("enabled");
      expect(maxField.getName()).assertEqual("maxCount");
      expect(maxField.getType().toString()).assertEqual("int");
      expect(maxField.isStatic()).assertTrue();
      expect(maxField.isReadonly()).assertTrue();
      expect(mutableField.getName()).assertEqual("mutableCount");
      expect(mutableField.isStatic()).assertTrue();
      expect(mutableField.isReadonly()).assertFalse();
      expect(labelField.getName()).assertEqual("label");
      expect(labelField.getType().toString()).assertEqual("string");
      expect(labelField.isStatic()).assertFalse();
      expect(labelField.isReadonly()).assertTrue();
      expect(enabledField.getName()).assertEqual("enabled");
      expect(enabledField.getType().toString()).assertEqual("boolean");
      expect(enabledField.isStatic()).assertFalse();
      expect(enabledField.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_NAME_3300
     * @tc.name testGetName3300
     * @tc.desc Verify getName and modifier metadata for definite assignment fields without initializer values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetName3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GnNameUninitialized044>() as ClassType;
      const titleField = classType.getFieldByName("title");
      const countField = classType.getFieldByName("count");
      expect(titleField.getName()).assertEqual("title");
      expect(titleField.getType().toString()).assertEqual("string");
      expect(titleField.isStatic()).assertFalse();
      expect(countField.getName()).assertEqual("count");
      expect(countField.isReadonly()).assertFalse();
      expect(titleField.equals(countField)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_NAME_3400
     * @tc.name testGetName3400
     * @tc.desc Verify getName preserves metadata-like field identifiers with exact type and static cross-checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetName3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GnNameSpecial045>() as ClassType;
      const classField = classType.getFieldByName("classField");
      const functionField = classType.getFieldByName("functionField");
      const returnField = classType.getFieldByName("returnField");
      expect(classField.getName()).assertEqual("classField");
      expect(classField.getType().toString()).assertEqual("int");
      expect(functionField.getName()).assertEqual("functionField");
      expect(functionField.getType().toString()).assertEqual("string");
      expect(returnField.getName()).assertEqual("returnField");
      expect(returnField.getType().toString()).assertEqual("boolean");
      expect(classField.isStatic()).assertTrue();
      expect(functionField.equals(returnField)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_NAME_3500
     * @tc.name testGetName3500
     * @tc.desc Verify getName preserves case digit and underscore differences without prefix confusion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetName3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GnNameCase046>() as ClassType;
      const name1 = classType.getFieldByName("name1");
      const name01 = classType.getFieldByName("name01");
      const nameUpper = classType.getFieldByName("Name1");
      const nameAllUpper = classType.getFieldByName("NAME_1");
      expect(name1.getName()).assertEqual("name1");
      expect(name01.getName()).assertEqual("name01");
      expect(nameUpper.getName()).assertEqual("Name1");
      expect(nameAllUpper.getName()).assertEqual("NAME_1");
      expect(name1.getType().toString()).assertEqual("int");
      expect(name1.equals(name01)).assertFalse();
      expect(nameUpper.equals(nameAllUpper)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_NAME_3600
     * @tc.name testGetName3600
     * @tc.desc Verify duplicate Field lookups keep exact name and equals true while another field stays unequal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetName3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GnNameObject037>() as ClassType;
      const first = classType.getFieldByName("custom");
      const second = classType.getFieldByName("custom");
      const other = classType.getFieldByName("obj");
      expect(first.getName()).assertEqual("custom");
      expect(second.getName()).assertEqual("custom");
      expect(first.getOwnerType().getName()).assertEqual(classType.getName());
      expect(second.getOwnerType().getName()).assertEqual(classType.getName());
      expect(first.getType().getName()).assertEqual((Type.from<GnNameInner037>() as ClassType).getName());
      expect(second.getType().getName()).assertEqual((Type.from<GnNameInner037>() as ClassType).getName());
      expect(first.equals(second)).assertTrue();
      expect(first.equals(other)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_NAME_3700
     * @tc.name testGetName3700
     * @tc.desc Verify static readonly field getName remains exact with getType and modifier metadata
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetName3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GnNameModifier043>() as ClassType;
      const field = classType.getFieldByName("maxCount");
      const repeated = classType.getFieldByName("maxCount");
      const mutable = classType.getFieldByName("mutableCount");
      expect(field.getName()).assertEqual("maxCount");
      expect(repeated.getName()).assertEqual("maxCount");
      expect(field.toString()).assertEqual("maxCount: int");
      expect(field.getOwnerType().getName()).assertEqual(classType.getName());
      expect(field.equals(repeated)).assertTrue();
      expect(field.equals(mutable)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_NAME_3800
     * @tc.name testGetName3800
     * @tc.desc Verify getName returns exact names for undefined null union and optional template fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetName3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GnNameNullable047>() as ClassType;
      const parA = classType.getFieldByName("parA");
      const parB = classType.getFieldByName("parB");
      const parC = classType.getFieldByName("parC");
      const parD = classType.getFieldByName("parD");
      const parE = classType.getFieldByName("parE");
      const parF = classType.getFieldByName("parF");
      const parG = classType.getFieldByName("parG");
      expect(parA.getName()).assertEqual("parA");
      expect(parB.getName()).assertEqual("parB");
      expect(parC.getName()).assertEqual("parC");
      expect(parD.getName()).assertEqual("parD");
      expect(parE.getName()).assertEqual("parE");
      expect(parF.getName()).assertEqual("parF");
      expect(parG.getName()).assertEqual("parG");
      expect(parF.getType().toString()).assertEqual("std.core.Array");
      expect(parG.getType().toString()).assertEqual("std.core.Array");
      expect(parA.isStatic()).assertFalse();
      expect(parE.isReadonly()).assertFalse();
    });

  });
}
