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

class IsSample001 {
  static count: int = 1;
}

class IsSample003 {
  static count: int = 1;
  name: string = "test";
}

class IsSample008 {
  static readonly MAX_VALUE: int = 100;
}

class IsSample009 {
  readonly id: int = 42;
}

class IsSample012 {
  static staticCount: int = 1;
  static staticName: string = "test";
  instanceValue: double = 3.14;
  instanceFlag: boolean = false;
}

class IsClassA014 {
  static count: int = 10;
}

class IsClassB014 {
  count: int = 20;
}

class IsSample017 {
  static version: string = "1.0";
  name: string = "test";
}

class IsParent023 {
  static token: int = 1;
}

class IsChild023 extends IsParent023 {
  token: string = "child";
}

class IsSample025 {
  static value: int = 1;
  static valueInstanceStatic: int = 3;
  valueInstance: int = 2;
}

class IsArrayMatrix018 {
  static ids: int[] = [1, 2, 3];
  static grid: int[][] = [[1, 2], [3, 4]];
  names: string[] = ["left", "right"];
}

enum IsNumericState019 {
  Ready, Done
}

enum IsStringState019 {
  Ready = "READY", Done = "DONE"
}

class IsEnumMatrix019 {
  static numericState: IsNumericState019 = IsNumericState019.Ready;
  stringState: IsStringState019 = IsStringState019.Ready;
}

class IsPayload020 {
  code: int = 1;
}

class IsObjectMatrix020 {
  static payload: IsPayload020 = new IsPayload020();
  instancePayload: IsPayload020 = new IsPayload020();
}

class IsBox021<T> {
  value: T;

  constructor(value: T) {
    this.value = value;
  }
}

class IsPair021<K, V> {
  key: K;
  value: V;

  constructor(key: K, value: V) {
    this.key = key;
    this.value = value;
  }
}

class IsGenericMatrix021 {
  static textBox: IsBox021<string> = new IsBox021<string>("box");
  pair: IsPair021<int, string> = new IsPair021<int, string>(21, "pair");
}

type IsMapper022 = (value: int) => string;

function isMap022(value: int): string {
  return value.toString();
}

class IsFunctionMatrix022 {
  static mapper: IsMapper022 = isMap022;
  action: IsMapper022 = isMap022;
}

class IsAccessMatrix024 {
  protected static guardedFlag: boolean = true;
  private static hiddenText: string = "hidden";
  private secret: int = 1;
}

class IsInheritedParent026 {
  static inheritedCount: int = 26;
}

class IsInheritedChild026 extends IsInheritedParent026 {
  childCount: int = 1;
}

class IsSpecialName027 {
  static $value: int = 1;
  static _type: string = "meta";
  field_01_test: boolean = true;
}

class IsUninitialized028 {
  static title: string = "init";
  count!: int;
}

class IsRepeatMatrix030 {
  static count: int = 30;
  label: string = "repeat";
}

class IsNullableMatrix031 {
  parA: undefined = undefined;
  parB: null = null;
  parC: string | undefined = undefined;
  parD: string | null = null;
  parE?: string;
  parF: Array<string> = new Array<string>();
  parG: string[] = [];
}

export default function FieldIsStaticTest(): void {
  describe('FieldIsStaticTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_IS_STATIC_0100
     * @tc.name testIsStatic0100
     * @tc.desc Verify isStatic returns true for a plain static field with exact toString metadata
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsStatic0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<IsSample001>() as ClassType;
      const field = classType.getFieldByName("count");
      let result: boolean = field.isStatic();
      expect(result).assertTrue();
      expect(field.toString()).assertEqual("count: int");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_IS_STATIC_0200
     * @tc.name testIsStatic0200
     * @tc.desc Verify isStatic returns false for instance field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsStatic0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<IsSample003>() as ClassType;
      const instanceField = classType.getFieldByName("name");
      let result: boolean = instanceField.isStatic();
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_IS_STATIC_0300
     * @tc.name testIsStatic0300
     * @tc.desc Verify readonly static field reports both static and readonly metadata
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsStatic0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<IsSample008>() as ClassType;
      const field = classType.getFieldByName("MAX_VALUE");
      let result: boolean = field.isStatic();
      expect(result).assertTrue();
      expect(field.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_IS_STATIC_0400
     * @tc.name testIsStatic0400
     * @tc.desc Verify isStatic returns false for non-static readonly field with owner and type metadata
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsStatic0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<IsSample009>() as ClassType;
      const field = classType.getFieldByName("id");
      let result: boolean = field.isStatic();
      expect(result).assertFalse();
      expect(field.getType().toString()).assertEqual("int");
      expect(field.getOwnerType().getName()).assertEqual((Type.from<IsSample009>() as ClassType).getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_IS_STATIC_0500
     * @tc.name testIsStatic0500
     * @tc.desc Verify isStatic results match field declarations for multiple fields in same class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsStatic0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<IsSample012>() as ClassType;
      expect(classType.getFieldByName("staticCount").isStatic()).assertTrue();
      expect(classType.getFieldByName("staticName").isStatic()).assertTrue();
      expect(classType.getFieldByName("instanceValue").isStatic()).assertFalse();
      expect(classType.getFieldByName("instanceFlag").isStatic()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_IS_STATIC_0600
     * @tc.name testIsStatic0600
     * @tc.desc Verify isStatic correctly identifies same-named fields in different classes with different static status
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsStatic0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const typeA = Type.from<IsClassA014>() as ClassType;
      const typeB = Type.from<IsClassB014>() as ClassType;
      expect(typeA.getFieldByName("count").isStatic()).assertTrue();
      expect(typeB.getFieldByName("count").isStatic()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_IS_STATIC_0700
     * @tc.name testIsStatic0700
     * @tc.desc Verify isStatic still works correctly after a missing-field TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsStatic0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<IsSample001>() as ClassType;
      try {
        classType.getFieldByName("nonExistentField");
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('TypeError');
      }
      const field = classType.getFieldByName("count");
      expect(field.isStatic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_IS_STATIC_0800
     * @tc.name testIsStatic0800
     * @tc.desc Verify isStatic and getName methods collaborate correctly on same Field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsStatic0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<IsSample017>() as ClassType;
      const staticField = classType.getFieldByName("version");
      expect(staticField.getName()).assertEqual("version");
      expect(staticField.isStatic()).assertTrue();

      const instanceField = classType.getFieldByName("name");
      expect(instanceField.getName()).assertEqual("name");
      expect(instanceField.isStatic()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_IS_STATIC_0900
     * @tc.name testIsStatic0900
     * @tc.desc Verify isStatic and getType methods do not interfere with each other on same Field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsStatic0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<IsSample001>() as ClassType;
      const field = classType.getFieldByName("count");
      let isStaticResult: boolean = field.isStatic();
      let typeResult = field.getType();
      expect(isStaticResult).assertTrue();
      expect(typeResult.toString()).assertEqual("int");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_IS_STATIC_1000
     * @tc.name testIsStatic1000
     * @tc.desc Verify static status agrees with owner and type metadata for one field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsStatic1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<IsSample001>() as ClassType).getFieldByName("count");
      expect(field.isStatic()).assertTrue();
      expect(field.getName()).assertEqual("count");
      expect(field.getOwnerType().getName()).assertEqual((Type.from<IsSample001>() as ClassType).getName());
      expect(field.getType().toString()).assertEqual("int");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_IS_STATIC_1100
     * @tc.name testIsStatic1100
     * @tc.desc Verify static and instance same-named fields expose different static states and owners
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsStatic1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const staticField = (Type.from<IsClassA014>() as ClassType).getFieldByName("count");
      const instanceField = (Type.from<IsClassB014>() as ClassType).getFieldByName("count");
      expect(staticField.isStatic()).assertTrue();
      expect(instanceField.isStatic()).assertFalse();
      expect(instanceField.getName()).assertEqual("count");
      expect(staticField.getOwnerType().getName()).assertEqual((Type.from<IsClassA014>() as ClassType).getName());
      expect(instanceField.getOwnerType().getName()).assertEqual((Type.from<IsClassB014>() as ClassType).getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_IS_STATIC_1200
     * @tc.name testIsStatic1200
     * @tc.desc Verify readonly instance field metadata stays independent from static metadata
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsStatic1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<IsSample009>() as ClassType).getFieldByName("id");
      expect(field.isReadonly()).assertTrue();
      expect(field.isStatic()).assertFalse();
      expect(field.getName()).assertEqual("id");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_IS_STATIC_1300
     * @tc.name testIsStatic1300
     * @tc.desc Verify similarly named static and instance fields do not leak static state across lookups
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsStatic1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<IsSample025>() as ClassType;
      const value = classType.getFieldByName("value");
      const instance = classType.getFieldByName("valueInstance");
      const staticNamed = classType.getFieldByName("valueInstanceStatic");
      expect(value.isStatic()).assertTrue();
      expect(instance.isStatic()).assertFalse();
      expect(staticNamed.isStatic()).assertTrue();
      expect(instance.getName()).assertEqual("valueInstance");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_IS_STATIC_1400
     * @tc.name testIsStatic1400
     * @tc.desc Verify parent and child hidden fields expose correct independent static states
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsStatic1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parentField = (Type.from<IsParent023>() as ClassType).getFieldByName("token");
      const childField = (Type.from<IsChild023>() as ClassType).getFieldByName("token");
      expect(parentField.isStatic()).assertTrue();
      expect(childField.isStatic()).assertFalse();
      expect(parentField.getName()).assertEqual(childField.getName());
      expect(parentField.getOwnerType().getName()).assertEqual((Type.from<IsParent023>() as ClassType).getName());
      expect(childField.getOwnerType().getName()).assertEqual((Type.from<IsChild023>() as ClassType).getName());
      expect(parentField.getType().toString()).assertEqual("int");
      expect(childField.getType().toString()).assertEqual("string");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_IS_STATIC_1500
     * @tc.name testIsStatic1500
     * @tc.desc Verify array typed fields keep static and instance status according to declarations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsStatic1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<IsArrayMatrix018>() as ClassType;
      const ids = classType.getFieldByName("ids");
      const names = classType.getFieldByName("names");
      const grid = classType.getFieldByName("grid");
      expect(ids.isStatic()).assertTrue();
      expect(names.isStatic()).assertFalse();
      expect(grid.isStatic()).assertTrue();
      expect(ids.getType().toString()).assertEqual("std.core.Array");
      expect(names.getType().toString()).assertEqual("std.core.Array");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_IS_STATIC_1600
     * @tc.name testIsStatic1600
     * @tc.desc Verify enum typed fields keep static and instance status independently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsStatic1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<IsEnumMatrix019>() as ClassType;
      const numericState = classType.getFieldByName("numericState");
      const stringState = classType.getFieldByName("stringState");
      expect(numericState.isStatic()).assertTrue();
      expect(stringState.isStatic()).assertFalse();
      expect(numericState.getType().toString()).assertEqual(Type.from<IsNumericState019>().toString());
      expect(stringState.getType().toString()).assertEqual(Type.from<IsStringState019>().toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_IS_STATIC_1700
     * @tc.name testIsStatic1700
     * @tc.desc Verify custom object fields distinguish static and instance declarations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsStatic1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<IsObjectMatrix020>() as ClassType;
      const payload = classType.getFieldByName("payload");
      const instancePayload = classType.getFieldByName("instancePayload");
      expect(payload.isStatic()).assertTrue();
      expect(instancePayload.isStatic()).assertFalse();
      expect(payload.getType().getName()).assertEqual((Type.from<IsPayload020>() as ClassType).getName());
      expect(instancePayload.getType().getName()).assertEqual((Type.from<IsPayload020>() as ClassType).getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_IS_STATIC_1800
     * @tc.name testIsStatic1800
     * @tc.desc Verify generic typed fields keep static status according to static and instance declarations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsStatic1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<IsGenericMatrix021>() as ClassType;
      const textBox = classType.getFieldByName("textBox");
      const pair = classType.getFieldByName("pair");
      expect(textBox.isStatic()).assertTrue();
      expect(pair.isStatic()).assertFalse();
      expect(textBox.getType().toString()).assertEqual(Type.from<IsBox021<string>>().toString());
      expect(pair.getType().toString()).assertEqual(Type.from<IsPair021<int, string>>().toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_IS_STATIC_1900
     * @tc.name testIsStatic1900
     * @tc.desc Verify function typed fields distinguish static and instance status
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsStatic1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<IsFunctionMatrix022>() as ClassType;
      const mapper = classType.getFieldByName("mapper");
      const action = classType.getFieldByName("action");
      expect(mapper.isStatic()).assertTrue();
      expect(action.isStatic()).assertFalse();
      expect(mapper.getName()).assertEqual("mapper");
      expect(action.getName()).assertEqual("action");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_IS_STATIC_2000
     * @tc.name testIsStatic2000
     * @tc.desc Verify readonly static and readonly instance fields expose independent static status
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsStatic2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const staticReadonly = (Type.from<IsSample008>() as ClassType).getFieldByName("MAX_VALUE");
      const instanceReadonly = (Type.from<IsSample009>() as ClassType).getFieldByName("id");
      expect(staticReadonly.isStatic()).assertTrue();
      expect(staticReadonly.isReadonly()).assertTrue();
      expect(instanceReadonly.isStatic()).assertFalse();
      expect(instanceReadonly.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_IS_STATIC_2100
     * @tc.name testIsStatic2100
     * @tc.desc Verify private and protected static fields report static status while private instance field does not
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsStatic2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<IsAccessMatrix024>() as ClassType;
      const hiddenText = classType.getFieldByName("hiddenText");
      const guardedFlag = classType.getFieldByName("guardedFlag");
      const secret = classType.getFieldByName("secret");
      expect(hiddenText.isStatic()).assertTrue();
      expect(guardedFlag.isStatic()).assertTrue();
      expect(secret.isStatic()).assertFalse();
      expect(hiddenText.getType().toString()).assertEqual("string");
      expect(guardedFlag.getType().toString()).assertEqual("boolean");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_IS_STATIC_2200
     * @tc.name testIsStatic2200
     * @tc.desc Verify inherited static field resolved through child type remains static and owned by parent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsStatic2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parentField = (Type.from<IsInheritedParent026>() as ClassType).getFieldByName("inheritedCount");
      const childField = (Type.from<IsInheritedChild026>() as ClassType).getFieldByName("inheritedCount");
      expect(parentField.isStatic()).assertTrue();
      expect(childField.isStatic()).assertTrue();
      expect(childField.getOwnerType().getName())
        .assertEqual((Type.from<IsInheritedParent026>() as ClassType).getName());
      expect(childField.getType().toString()).assertEqual("int");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_IS_STATIC_2300
     * @tc.name testIsStatic2300
     * @tc.desc Verify special identifier field names keep exact static status and type metadata
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsStatic2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<IsSpecialName027>() as ClassType;
      const valueField = classType.getFieldByName("$value");
      const typeField = classType.getFieldByName("_type");
      const instanceField = classType.getFieldByName("field_01_test");
      expect(valueField.isStatic()).assertTrue();
      expect(typeField.isStatic()).assertTrue();
      expect(instanceField.isStatic()).assertFalse();
      expect(valueField.getName()).assertEqual("$value");
      expect(instanceField.getType().toString()).assertEqual("boolean");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_IS_STATIC_2400
     * @tc.name testIsStatic2400
     * @tc.desc Verify initialized static and uninitialized instance fields report static status by declaration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     * @tc.knownIssue definite assignment int field count getType returns std.core.Int instead of declared int
     */
    it('testIsStatic2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<IsUninitialized028>() as ClassType;
      const title = classType.getFieldByName("title");
      const count = classType.getFieldByName("count");
      expect(title.isStatic()).assertTrue();
      expect(count.isStatic()).assertFalse();
      expect(title.getType().toString()).assertEqual("string");
      expect(count.getType().toString()).assertEqual("std.core.Int");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_IS_STATIC_2500
     * @tc.name testIsStatic2500
     * @tc.desc Verify static predicate remains stable after getStaticValue and setStaticValue recovery
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsStatic2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<IsSample001>() as ClassType).getFieldByName("count");
      const original = field.getStaticValue() as int;
      expect(field.isStatic()).assertTrue();
      try {
        field.setStaticValue(29);
        expect(field.getStaticValue() as int).assertEqual(29);
        expect(field.isStatic()).assertTrue();
      } finally {
        field.setStaticValue(original);
      }
      expect(field.isStatic()).assertTrue();
      expect(field.getStaticValue() as int).assertEqual(original);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_IS_STATIC_2600
     * @tc.name testIsStatic2600
     * @tc.desc Verify isStatic results on static and instance fields with exact metadata
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsStatic2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<IsRepeatMatrix030>() as ClassType;
      const count = classType.getFieldByName("count");
      const label = classType.getFieldByName("label");
      expect(count.isStatic()).assertTrue();
      expect(label.isStatic()).assertFalse();
      expect(count.getName()).assertEqual("count");
      expect(label.getName()).assertEqual("label");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_IS_STATIC_2700
     * @tc.name testIsStatic2700
     * @tc.desc Verify undefined null union and optional template fields report non-static state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsStatic2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<IsNullableMatrix031>() as ClassType;
      const parA = classType.getFieldByName("parA");
      const parB = classType.getFieldByName("parB");
      const parC = classType.getFieldByName("parC");
      const parD = classType.getFieldByName("parD");
      const parE = classType.getFieldByName("parE");
      const parF = classType.getFieldByName("parF");
      const parG = classType.getFieldByName("parG");
      expect(parA.isStatic()).assertFalse();
      expect(parB.isStatic()).assertFalse();
      expect(parC.isStatic()).assertFalse();
      expect(parD.isStatic()).assertFalse();
      expect(parE.isStatic()).assertFalse();
      expect(parF.isStatic()).assertFalse();
      expect(parG.isStatic()).assertFalse();
      expect(parF.getType().toString()).assertEqual("std.core.Array");
      expect(parG.getType().toString()).assertEqual("std.core.Array");
      expect(parE.isReadonly()).assertFalse();
    });

  });
}
