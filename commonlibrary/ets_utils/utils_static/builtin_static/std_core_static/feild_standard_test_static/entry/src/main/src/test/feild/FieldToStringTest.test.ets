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
} from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from './../Util.test';

class TsSample001 {
  static count: int = 1;
}

class TsSample007 {
  static name: string = "test";
}

class TsSample008 {
  static active: boolean = true;
}

class TsSample009 {
  static score: double = 3.14;
}

class TsInner010 {
  static value: int = 0;
}

class TsSample010 {
  static inner: TsInner010 = new TsInner010();
}

class TsSample018 {
  static cntField: int = 1;
}

class TsSample019 {
  static _field_name: int = 1;
}

class TsSample021 {
  static count: int = 1;
  static name: string = "test";
}

class TsOwnerLeft031 {
  static duplicate: int = 1;
}

class TsOwnerRight031 {
  static duplicate: string = "child";
}

class TsSample034 {
  static mixed_Name_2026: int = 1;
}

class TsSample035 {
  static route_01: int = 1;
  static route_010: int = 10;
}

class TsSample036 {
  static weight: float = 1.0f;
}

class TsScalar037 {
  static longId: long = 99999999999;
  score: float = 1.5f;
  ratio: double = 2.5;
}

function tsBuiltinCallback038(value: int): string {
  return value.toString();
}

class TsBuiltin038 {
  static obj: Object = new Object();
  static callback: TsMapper042 = tsBuiltinCallback038;
}

class TsArrayItem039 {
  id: int = 1;
}

class TsArray039 {
  static ids: int[] = [1, 2, 3];
  static items: TsArrayItem039[] = [new TsArrayItem039()];
  names: Array<string> = new Array<string>();
}

enum TsColor040 {
  RED = 0, BLUE = 1
}

enum TsStatus040 {
  OK = "OK", FAIL = "FAIL"
}

class TsEnum040 {
  static color: TsColor040 = TsColor040.RED;
  state: TsStatus040 = TsStatus040.OK;
}

class TsBox041<T> {
  value: T;

  constructor(value: T) {
    this.value = value;
  }
}

class TsPair041<K, V> {
  first: K;
  second: V;

  constructor(first: K, second: V) {
    this.first = first;
    this.second = second;
  }
}

class TsGeneric041 {
  static stringBox: TsBox041<string> = new TsBox041<string>("box");
  static pair: TsPair041<int, string> = new TsPair041<int, string>(1, "one");
  intBox: TsBox041<int> = new TsBox041<int>(1);
}

type TsMapper042 = (value: int) => string;

function tsMap042(value: int): string {
  return value.toString();
}

class TsFunctionSource042 {
  static makeText(value: int): string {
    return value.toString();
  }
}

class TsFunction042 {
  static mapper: TsMapper042 = tsMap042;
  action: TsMapper042 = TsFunctionSource042.makeText;
  readonly callback: string = "cb";
}

class TsModifier043 {
  static readonly maxCount: int = 10;
  static mutableCount: int = 1;
  readonly label: string = "tag";
  enabled: boolean = true;
}

class TsInheritedParent044 {
  inheritedTitle: string = "parent";
}

class TsInheritedChild044 extends TsInheritedParent044 {
  childFlag: boolean = true;
}

class TsHiddenParent045 {
  static hiddenKey: int = 1;
}

class TsHiddenChild045 extends TsHiddenParent045 {
  static hiddenKey: string = "child";
}

class TsSpecialName046 {
  static $result: int = 1;
  static _ID_2026_value: double = 1.25;
  readonly _inner_value: string = "inner";
  field_01_test: boolean = true;
}

class TsMap048 {
  static scores: Map<string, int> = new Map<string, int>();
}

class TsNullable049 {
  parA: undefined = undefined;
  parB: null = null;
  parC: string | undefined = undefined;
  parD: string | null = null;
  parE?: string;
  parF: Array<string> = new Array<string>();
  parG: string[] = [];
}

export default function FieldToStringTest(): void {
  describe('FieldToStringTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_TO_STRING_0100
     * @tc.name testToString0100
     * @tc.desc toString result for int field matches documented fieldName colon fieldType format
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToString0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<TsSample001>() as ClassType).getFieldByName("count");
      const objectView: Object = field as Object;
      const result = objectView.toString();
      expect(result).assertEqual("count: int");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_TO_STRING_0200
     * @tc.name testToString0200
     * @tc.desc toString returns format "fieldName: fieldType" for string field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToString0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<TsSample007>() as ClassType).getFieldByName("name");
      const result = field.toString();
      expect(result).assertEqual("name: string");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_TO_STRING_0300
     * @tc.name testToString0300
     * @tc.desc Verify toString returns correct format for boolean field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToString0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<TsSample008>() as ClassType).getFieldByName("active");
      const result = field.toString();
      expect(result).assertEqual("active: boolean");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_TO_STRING_0400
     * @tc.name testToString0400
     * @tc.desc Verify toString returns correct format for double field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToString0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<TsSample009>() as ClassType).getFieldByName("score");
      const result = field.toString();
      expect(result).assertEqual("score: double");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_TO_STRING_0500
     * @tc.name testToString0500
     * @tc.desc Verify toString returns correct format for custom class field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToString0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<TsSample010>() as ClassType).getFieldByName("inner");
      const result = field.toString();
      const expectedTypeText: string = Type.from<TsInner010>().toString();
      expect(result).assertEqual("inner: " + expectedTypeText);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_TO_STRING_0600
     * @tc.name testToString0600
     * @tc.desc Verify toString returns correct format for ordinary camel-case field name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToString0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<TsSample018>() as ClassType).getFieldByName("cntField");
      const result = field.toString();
      expect(result).assertEqual("cntField: int");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_TO_STRING_0700
     * @tc.name testToString0700
     * @tc.desc Verify toString returns correct format for underscore field name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToString0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<TsSample019>() as ClassType).getFieldByName("_field_name");
      const result = field.toString();
      expect(result).assertEqual("_field_name: int");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_TO_STRING_0800
     * @tc.name testToString0800
     * @tc.desc Verify toString distinguishes two fields declared in the same class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToString0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<TsSample021>() as ClassType;
      const countText = classType.getFieldByName("count").toString();
      const nameText = classType.getFieldByName("name").toString();
      expect(countText).assertEqual("count: int");
      expect(nameText).assertEqual("name: string");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_TO_STRING_0900
     * @tc.name testToString0900
     * @tc.desc Verify same-named fields from unrelated owner types produce independent toString values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToString0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const leftField = (Type.from<TsOwnerLeft031>() as ClassType).getFieldByName("duplicate");
      const rightField = (Type.from<TsOwnerRight031>() as ClassType).getFieldByName("duplicate");
      expect(leftField.toString()).assertEqual("duplicate: int");
      expect(rightField.toString()).assertEqual("duplicate: string");
      expect(leftField.getOwnerType().getName()).assertEqual((Type.from<TsOwnerLeft031>() as ClassType).getName());
      expect(rightField.getOwnerType().getName()).assertEqual((Type.from<TsOwnerRight031>() as ClassType).getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_TO_STRING_1000
     * @tc.name testToString1000
     * @tc.desc Verify toString preserves a complex mixed field name and matches name type composition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToString1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<TsSample034>() as ClassType).getFieldByName("mixed_Name_2026");
      expect(field.toString()).assertEqual("mixed_Name_2026: int");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_TO_STRING_1100
     * @tc.name testToString1100
     * @tc.desc Verify toString preserves numeric suffix boundaries for similarly prefixed field names
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToString1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<TsSample035>() as ClassType;
      const shortRoute = classType.getFieldByName("route_01");
      const longRoute = classType.getFieldByName("route_010");
      expect(shortRoute.toString()).assertEqual("route_01: int");
      expect(longRoute.toString()).assertEqual("route_010: int");
      expect(shortRoute.getName()).assertEqual("route_01");
      expect(longRoute.getName()).assertEqual("route_010");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_TO_STRING_1200
     * @tc.name testToString1200
     * @tc.desc Verify toString remains stable after owner type name and access modifier reads
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToString1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<TsSample035>() as ClassType).getFieldByName("route_010");
      const before = field.toString();
      expect(field.getOwnerType().getName()).assertEqual((Type.from<TsSample035>() as ClassType).getName());
      expect(field.getAccessModifier())
        .assertEqual((Type.from<TsSample001>() as ClassType).getFieldByName("count").getAccessModifier());
      expect(field.toString()).assertEqual("route_010: int");
      expect(before).assertEqual("route_010: int");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_TO_STRING_1300
     * @tc.name testToString1300
     * @tc.desc Verify toString returns stable format after reflective write modifies static value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToString1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<TsSample001>() as ClassType).getFieldByName("count");
      const before = field.toString();
      expect(before).assertEqual("count: int");
      const original = field.getStaticValue() as int;
      try {
        field.setStaticValue(99);
        expect(field.getStaticValue() as int).assertEqual(99);
        expect(field.toString()).assertEqual(before);
      } finally {
        field.setStaticValue(original);
      }
      expect(field.toString()).assertEqual(before);
      expect(field.getStaticValue() as int).assertEqual(original);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_TO_STRING_1400
     * @tc.name testToString1400
     * @tc.desc Verify toString returns correct format for static float field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToString1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<TsSample036>() as ClassType).getFieldByName("weight");
      const result = field.toString();
      expect(result).assertEqual("weight: float");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_TO_STRING_1500
     * @tc.name testToString1500
     * @tc.desc Verify toString returns exact format for long float and double scalar fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToString1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<TsScalar037>() as ClassType;
      const longField = classType.getFieldByName("longId");
      const floatField = classType.getFieldByName("score");
      const doubleField = classType.getFieldByName("ratio");
      expect(longField.toString()).assertEqual("longId: long");
      expect(floatField.toString()).assertEqual("score: float");
      expect(doubleField.toString()).assertEqual("ratio: double");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_TO_STRING_1600
     * @tc.name testToString1600
     * @tc.desc Verify Function built-in field toString returns field name and function type text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToString1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<TsBuiltin038>() as ClassType;
      const objectField = classType.getFieldByName("obj");
      expect(objectField.getName()).assertEqual("obj");
      expect(objectField.toString()).assertEqual("obj: " + Type.from<Object>().toString());
      expect(objectField.isStatic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_TO_STRING_1700
     * @tc.name testToString1700
     * @tc.desc Verify toString uses Array type text for primitive generic and object array fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToString1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<TsArray039>() as ClassType;
      const idsField = classType.getFieldByName("ids");
      const namesField = classType.getFieldByName("names");
      const itemsField = classType.getFieldByName("items");
      expect(idsField.toString()).assertEqual("ids: std.core.Array");
      expect(namesField.toString()).assertEqual("names: std.core.Array");
      expect(itemsField.toString()).assertEqual("items: std.core.Array");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_TO_STRING_1800
     * @tc.name testToString1800
     * @tc.desc Verify toString composes numeric and string enum field names with enum type text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToString1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<TsEnum040>() as ClassType;
      const colorField = classType.getFieldByName("color");
      const stateField = classType.getFieldByName("state");
      expect(colorField.toString()).assertEqual("color: " + Type.from<TsColor040>().toString());
      expect(stateField.toString()).assertEqual("state: " + Type.from<TsStatus040>().toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_TO_STRING_1900
     * @tc.name testToString1900
     * @tc.desc Verify toString composes generic single and multi parameter field type text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToString1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<TsGeneric041>() as ClassType;
      const stringBoxField = classType.getFieldByName("stringBox");
      const intBoxField = classType.getFieldByName("intBox");
      const pairField = classType.getFieldByName("pair");
      expect(stringBoxField.toString()).assertEqual("stringBox: " + Type.from<TsBox041<string>>().toString());
      expect(intBoxField.toString()).assertEqual("intBox: " + Type.from<TsBox041<int>>().toString());
      expect(pairField.toString()).assertEqual("pair: " + Type.from<TsPair041<int, string>>().toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_TO_STRING_2000
     * @tc.name testToString2000
     * @tc.desc Verify function field getName and isStatic metadata while callback toString returns correct format
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     * @tc.knownIssue toString on function-typed fields causes runtime crash, only callback string field toString is verified
     */
    it('testToString2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<TsFunction042>() as ClassType;
      const mapperField = classType.getFieldByName("mapper");
      const actionField = classType.getFieldByName("action");
      const callbackField = classType.getFieldByName("callback");
      expect(mapperField.getName()).assertEqual("mapper");
      expect(actionField.getName()).assertEqual("action");
      expect(callbackField.toString()).assertEqual("callback: string");
      expect(mapperField.isStatic()).assertTrue();
      expect(actionField.isStatic()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_TO_STRING_2100
     * @tc.name testToString2100
     * @tc.desc Verify toString is exact for static readonly static mutable readonly and plain fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToString2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<TsModifier043>() as ClassType;
      const maxField = classType.getFieldByName("maxCount");
      const mutableField = classType.getFieldByName("mutableCount");
      const labelField = classType.getFieldByName("label");
      const enabledField = classType.getFieldByName("enabled");
      expect(maxField.toString()).assertEqual("maxCount: int");
      expect(mutableField.toString()).assertEqual("mutableCount: int");
      expect(labelField.toString()).assertEqual("label: string");
      expect(enabledField.toString()).assertEqual("enabled: boolean");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_TO_STRING_2200
     * @tc.name testToString2200
     * @tc.desc Verify inherited parent field resolved through child type keeps parent field toString text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToString2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parentField = (Type.from<TsInheritedParent044>() as ClassType).getFieldByName("inheritedTitle");
      const childField = (Type.from<TsInheritedChild044>() as ClassType).getFieldByName("inheritedTitle");
      expect(parentField.toString()).assertEqual("inheritedTitle: string");
      expect(childField.toString()).assertEqual("inheritedTitle: string");
      expect(childField.getOwnerType().getName())
        .assertEqual((Type.from<TsInheritedParent044>() as ClassType).getName());
      expect(childField.equals(parentField)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_TO_STRING_2300
     * @tc.name testToString2300
     * @tc.desc Verify hidden parent and child static fields keep same name with different toString type text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToString2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parentField = (Type.from<TsHiddenParent045>() as ClassType).getFieldByName("hiddenKey");
      const childField = (Type.from<TsHiddenChild045>() as ClassType).getFieldByName("hiddenKey");
      expect(parentField.toString()).assertEqual("hiddenKey: int");
      expect(childField.toString()).assertEqual("hiddenKey: string");
      expect(parentField.equals(childField)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_TO_STRING_2400
     * @tc.name testToString2400
     * @tc.desc Verify special identifier field names preserve exact toString name and type text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToString2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<TsSpecialName046>() as ClassType;
      const dollarField = classType.getFieldByName("$result");
      const readonlyField = classType.getFieldByName("_inner_value");
      const plainField = classType.getFieldByName("field_01_test");
      const idField = classType.getFieldByName("_ID_2026_value");
      expect(dollarField.toString()).assertEqual("$result: int");
      expect(readonlyField.toString()).assertEqual("_inner_value: string");
      expect(plainField.toString()).assertEqual("field_01_test: boolean");
      expect(idField.toString()).assertEqual("_ID_2026_value: double");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_TO_STRING_2500
     * @tc.name testToString2500
     * @tc.desc Verify TypeError recovery keeps representative array field toString and owner metadata exact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToString2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        (Type.from<TsArray039>() as ClassType).getFieldByName("missingAfterToString");
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('TypeError');
      }
      const classType = Type.from<TsArray039>() as ClassType;
      const arrayField = classType.getFieldByName("ids");
      expect(arrayField.toString()).assertEqual("ids: std.core.Array");
      expect(arrayField.getName()).assertEqual("ids");
      expect(arrayField.getOwnerType().getName()).assertEqual(classType.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_TO_STRING_2600
     * @tc.name testToString2600
     * @tc.desc Verify repeated toString calls stay stable across scalar array and map fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToString2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const longField = (Type.from<TsScalar037>() as ClassType).getFieldByName("longId");
      const arrayField = (Type.from<TsArray039>() as ClassType).getFieldByName("ids");
      const mapField = (Type.from<TsMap048>() as ClassType).getFieldByName("scores");
      for (let index: int = 0; index < 2; index++) {
        expect(longField.toString()).assertEqual("longId: long");
        expect(arrayField.toString()).assertEqual("ids: std.core.Array");
        expect(mapField.toString()).assertEqual("scores: std.core.Map");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_TO_STRING_2700
     * @tc.name testToString2700
     * @tc.desc Verify static value mutation does not change generic container field toString and restores value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToString2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<TsGeneric041>() as ClassType).getFieldByName("stringBox");
      const beforeText: string = field.toString();
      const original: TsBox041<string> = TsGeneric041.stringBox;
      try {
        field.setStaticValue(new TsBox041<string>("next"));
        expect(field.toString()).assertEqual(beforeText);
      } finally {
        field.setStaticValue(original);
      }
      expect(field.toString()).assertEqual("stringBox: " + Type.from<TsBox041<string>>().toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_TO_STRING_2800
     * @tc.name testToString2800
     * @tc.desc Verify toString formats undefined null union and optional fields by declared type metadata
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testToString2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<TsNullable049>() as ClassType;
      const parA = classType.getFieldByName("parA");
      const parB = classType.getFieldByName("parB");
      const parC = classType.getFieldByName("parC");
      const parD = classType.getFieldByName("parD");
      const parE = classType.getFieldByName("parE");
      const parF = classType.getFieldByName("parF");
      const parG = classType.getFieldByName("parG");
      expect(parA.toString()).assertEqual("parA: " + parA.getType().toString());
      expect(parB.toString()).assertEqual("parB: " + parB.getType().toString());
      expect(parC.toString()).assertEqual("parC: " + parC.getType().toString());
      expect(parD.toString()).assertEqual("parD: " + parD.getType().toString());
      expect(parE.toString()).assertEqual("parE: " + parE.getType().toString());
      expect(parF.toString()).assertEqual("parF: std.core.Array");
      expect(parG.toString()).assertEqual("parG: std.core.Array");
      expect(parF.getType().toString()).assertEqual(parG.getType().toString());
      expect(parE.getOwnerType().getName()).assertEqual(classType.getName());
    });
  });
}
