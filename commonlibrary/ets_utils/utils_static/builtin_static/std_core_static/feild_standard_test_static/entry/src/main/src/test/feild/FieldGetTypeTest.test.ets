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

class GtSample001 {
  static count: int = 1;
}

class GtSample004 {
  static name: string = "test";
}

class GtSample005 {
  static flag: boolean = true;
}

class GtInner006 {
}

class GtSample006 {
  static inner: GtInner006 = new GtInner006();
}

class GtSample007 {
  static items: int[] = [1, 2, 3];
}

class GtSample012 {
  static value: double = 3.14;
}

class GtSample013 {
  static bigNum: long = 99999999999;
}

class GtSample014 {
  static score: float = 1.5f;
}

class GtParent020 {
  static typed: int = 1;
}

class GtChild020 extends GtParent020 {
  static typed: string = "child";
}

class GtSample022 {
  static readonly fixed: int = 1;
  value: int = 2;
}

class GtTypeA023 {
  static shared: int = 1;
}

class GtTypeB023 {
  static shared: boolean = true;
}

class GtSample024 {
  static id: int = 1;
  static ids: int[] = [1, 2];
}

class GtParent025 {
  static count: int = 1;
}

class GtChild025 extends GtParent025 {
}

class GtScalar021 {
  static count: int = 1;
  static title: string = "type";
  static enabled: boolean = true;
  static ratio: double = 2.5;
  static total: long = 10000000000;
  static score: float = 3.5f;
}

class GtObjectPayload022 {
  code: int = 1;
}

class GtObjectMatrix022 {
  static obj: Object = new Object();
  static payload: GtObjectPayload022 = new GtObjectPayload022();
}

class GtArrayMatrix023 {
  static ids: int[] = [1, 2, 3];
  static matrix: int[][] = [[1, 2], [3, 4]];
  static payloads: GtObjectPayload022[] = [new GtObjectPayload022()];
  names: Array<string> = new Array<string>();
}

enum GtColor024 {
  Red, Blue
}

enum GtStatus024 {
  Ready = "ready", Done = "done"
}

class GtEnumMatrix024 {
  static color: GtColor024 = GtColor024.Red;
  status: GtStatus024 = GtStatus024.Ready;
}

type GtTextAlias025 = string;
type GtPayloadAlias025 = GtObjectPayload022;
type GtIdsAlias025 = int[];

class GtAliasMatrix025 {
  static title: GtTextAlias025 = "alias";
  static payload: GtPayloadAlias025 = new GtObjectPayload022();
  ids: GtIdsAlias025 = [1, 2];
}

interface GtReadable026 {
  read(): string;
}

class GtReadableImpl026 implements GtReadable026 {
  read(): string {
    return "read";
  }
}

class GtInterfaceMatrix026 {
  static readable: GtReadable026 = new GtReadableImpl026();
}

abstract class GtAbstractBase027 {
  id: int = 1;

  label(): string {
    return "base";
  }
}

class GtAbstractImpl027 extends GtAbstractBase027 {
  label(): string {
    return "impl";
  }
}

class GtAbstractMatrix027 {
  static base: GtAbstractBase027 = new GtAbstractImpl027();
}

class GtSelfRef028 {
  name: string = "node";
  next!: GtSelfRef028;
}

class GtModifierMatrix029 {
  static readonly maxCount: int = 10;
  readonly label: string = "label";
  title!: string;
  protected guardedFlag: boolean = true;
  private hiddenText: string = "hidden";
}

class GtInstanceParent030 {
  static token: int = 1;
  parentOnly: string = "parent";
}

class GtInstanceChild030 extends GtInstanceParent030 {
  static token: string = "child";
  childOnly: boolean = true;
}

class GtBox031<T> {
  value: T;

  constructor(value: T) {
    this.value = value;
  }
}

class GtPair031<K, V> {
  first: K;
  second: V;

  constructor(first: K, second: V) {
    this.first = first;
    this.second = second;
  }
}

class GtGenericMatrix031 {
  static stringBox: GtBox031<string> = new GtBox031<string>("box");
  intBox: GtBox031<int> = new GtBox031<int>(1);
  pair: GtPair031<int, string> = new GtPair031<int, string>(1, "one");
}

class GtGenericMember032<T> {
  value: T;
  values: T[];

  constructor(value: T, values: T[]) {
    this.value = value;
    this.values = values;
  }
}

class GtGenericMemberMatrix032 {
  static stringMember: GtGenericMember032<string> = new GtGenericMember032<string>("one", ["one"]);
  static intMemberArray: GtGenericMember032<int>[] = [new GtGenericMember032<int>(1, [1, 2])];
}

type GtMapperFunction033 = (value: int) => string;
type GtNoArgFunction033 = () => void;
type GtOptionalFunction033 = (value?: int) => string;
type GtRestFunction033 = (...values: int[]) => int;

function gtMapFunction033(value: int): string {
  return value.toString();
}

function gtNoArgFunction033(): void {
}

function gtOptionalFunction033(value?: int): string {
  if (value !== undefined) {
    return value.toString();
  }
  return "empty";
}

function gtRestFunction033(...values: int[]): int {
  return values.length;
}

class GtFunctionMatrix033 {
  static mapper: GtMapperFunction033 = gtMapFunction033;
  noArg: GtNoArgFunction033 = gtNoArgFunction033;
  optional: GtOptionalFunction033 = gtOptionalFunction033;
  rest: GtRestFunction033 = gtRestFunction033;
  direct: GtMapperFunction033 = gtMapFunction033;
}

class GtSpecialNames034 {
  static $value: int = 1;
  static _type: string = "meta";
  field_01_test: boolean = true;
  _ID_2026_value: double = 1.25;
}

class GtBuiltInGeneric035 {
  static scores: Map<string, int> = new Map<string, int>();
  names: Array<string> = new Array<string>();
}

class GtNullableMatrix036 {
  parA: undefined = undefined;
  parB: null = null;
  parC: string | undefined = undefined;
  parD: string | null = null;
  parE?: string;
  parF: Array<string> = new Array<string>();
  parG: string[] = [];
}

class GtUnionMatrix037 {
  unionA: int | string = 1;
  unionB: boolean | string = true;
  unionC: GtObjectPayload022 | string = new GtObjectPayload022();
  unionD: int[] | string[] = [1, 2];
}

export default function FieldGetTypeTest(): void {
  describe('FieldGetTypeTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_TYPE_0100
     * @tc.name testGetType0100
     * @tc.desc Verify getType called with no arguments returns int type text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetType0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<GtSample001>() as ClassType).getFieldByName("count");
      const result: Type = field.getType();
      expect(result.toString()).assertEqual("int");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_TYPE_0200
     * @tc.name testGetType0200
     * @tc.desc getType returns correct type name for long field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetType0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<GtSample013>() as ClassType).getFieldByName("bigNum");
      let result: Type = field.getType();
      expect(result.toString()).assertEqual("long");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_TYPE_0300
     * @tc.name testGetType0300
     * @tc.desc Verify getType returns correct Type for string type field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetType0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<GtSample004>() as ClassType).getFieldByName("name");
      let result: Type = field.getType();
      expect(result.toString()).assertEqual("string");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_TYPE_0400
     * @tc.name testGetType0400
     * @tc.desc Verify getType returns correct Type for boolean type field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetType0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<GtSample005>() as ClassType).getFieldByName("flag");
      let result: Type = field.getType();
      expect(result.toString()).assertEqual("boolean");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_TYPE_0500
     * @tc.name testGetType0500
     * @tc.desc Verify getType returns correct Type for custom class type field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetType0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<GtSample006>() as ClassType).getFieldByName("inner");
      let result: Type = field.getType();
      expect(field.getName()).assertEqual("inner");
      expect(result.getName()).assertEqual((Type.from<GtInner006>() as ClassType).getName());
      expect(field.toString()).assertEqual("inner: " + result.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_TYPE_0600
     * @tc.name testGetType0600
     * @tc.desc Verify getType returns correct Type for array type field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetType0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<GtSample007>() as ClassType).getFieldByName("items");
      let result: Type = field.getType();
      expect(result.toString()).assertEqual("std.core.Array");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_TYPE_0700
     * @tc.name testGetType0700
     * @tc.desc Verify getType remains stable after name and string metadata reads
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetType0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<GtSample001>() as ClassType).getFieldByName("count");
      expect(field.getName()).assertEqual("count");
      expect(field.toString()).assertEqual("count: int");
      const result: Type = field.getType();
      const secondResult: Type = field.getType();
      expect(result.toString()).assertEqual("int");
      expect(secondResult.toString()).assertEqual("int");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_TYPE_0800
     * @tc.name testGetType0800
     * @tc.desc Verify getType on double field returns Type with correct name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetType0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<GtSample012>() as ClassType).getFieldByName("value");
      let result: Type = field.getType();
      expect(result.toString()).assertEqual("double");
      expect(field.toString()).assertEqual("value: double");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_TYPE_0900
     * @tc.name testGetType0900
     * @tc.desc Verify getType remains stable after a missing-field TypeError is handled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetType0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GtSample001>() as ClassType;
      try {
        classType.getFieldByName("missingForType");
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('TypeError');
      }
      const field = classType.getFieldByName("count");
      const firstType: Type = field.getType();
      const secondType: Type = field.getType();
      expect(firstType.toString()).assertEqual("int");
      expect(secondType.toString()).assertEqual("int");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_TYPE_1000
     * @tc.name testGetType1000
     * @tc.desc Verify getType string agrees with the type portion of Field.toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetType1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<GtSample004>() as ClassType).getFieldByName("name");
      const typeName: string = field.getType().toString();
      expect(typeName).assertEqual("string");
      expect(field.toString()).assertEqual("name: string");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_TYPE_1100
     * @tc.name testGetType1100
     * @tc.desc Verify hidden parent and child fields with one name expose different type strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetType1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parentType: string = (Type.from<GtParent020>() as ClassType).getFieldByName("typed").getType().toString();
      const childType: string = (Type.from<GtChild020>() as ClassType).getFieldByName("typed").getType().toString();
      expect(parentType).assertEqual("int");
      expect(childType).assertEqual("string");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_TYPE_1200
     * @tc.name testGetType1200
     * @tc.desc Verify static readonly and plain int fields report the same type while metadata differs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetType1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GtSample022>() as ClassType;
      const fixedField = classType.getFieldByName("fixed");
      const valueField = classType.getFieldByName("value");
      expect(fixedField.getType().toString()).assertEqual("int");
      expect(valueField.getType().toString()).assertEqual("int");
      expect(fixedField.isStatic()).assertTrue();
      expect(fixedField.isReadonly()).assertTrue();
      expect(valueField.isStatic()).assertFalse();
      expect(valueField.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_TYPE_1300
     * @tc.name testGetType1300
     * @tc.desc Verify same-named fields from unrelated classes keep independent type strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetType1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const intField = (Type.from<GtTypeA023>() as ClassType).getFieldByName("shared");
      const boolField = (Type.from<GtTypeB023>() as ClassType).getFieldByName("shared");
      expect(intField.getName()).assertEqual(boolField.getName());
      expect(intField.getType().toString()).assertEqual("int");
      expect(boolField.getType().toString()).assertEqual("boolean");
      expect(boolField.toString()).assertEqual("shared: boolean");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_TYPE_1400
     * @tc.name testGetType1400
     * @tc.desc Verify scalar and array fields with similar names keep distinct type text and toString values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetType1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GtSample024>() as ClassType;
      const scalar = classType.getFieldByName("id");
      const array = classType.getFieldByName("ids");
      const scalarTypeText: string = scalar.getType().toString();
      const arrayTypeText: string = array.getType().toString();
      const scalarText: string = scalar.toString();
      const arrayText: string = array.toString();
      expect(scalarTypeText).assertEqual("int");
      expect(arrayTypeText).assertEqual("std.core.Array");
      expect(scalarText).assertEqual("id: int");
      expect(arrayText).assertEqual("ids: std.core.Array");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_TYPE_1500
     * @tc.name testGetType1500
     * @tc.desc Verify inherited field resolved through parent and child types returns the same type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetType1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parentField = (Type.from<GtParent025>() as ClassType).getFieldByName("count");
      const childField = (Type.from<GtChild025>() as ClassType).getFieldByName("count");
      expect(parentField.getType().toString()).assertEqual("int");
      expect(parentField.getType().toString()).assertEqual(childField.getType().toString());
      expect(parentField.getName()).assertEqual(childField.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_TYPE_1600
     * @tc.name testGetType1600
     * @tc.desc Verify getType returns correct type text for static float field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetType1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<GtSample014>() as ClassType).getFieldByName("score");
      expect(field.getType().toString()).assertEqual("float");
      expect(field.toString()).assertEqual("score: float");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_TYPE_1700
     * @tc.name testGetType1700
     * @tc.desc Verify getType returns exact type text for scalar primitive fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetType1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GtScalar021>() as ClassType;
      expect(classType.getFieldByName("count").getType().toString()).assertEqual("int");
      expect(classType.getFieldByName("title").getType().toString()).assertEqual("string");
      expect(classType.getFieldByName("enabled").getType().toString()).assertEqual("boolean");
      expect(classType.getFieldByName("ratio").getType().toString()).assertEqual("double");
      expect(classType.getFieldByName("total").getType().toString()).assertEqual("long");
      expect(classType.getFieldByName("score").getType().toString()).assertEqual("float");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_TYPE_1800
     * @tc.name testGetType1800
     * @tc.desc Verify getType for Object and custom class fields keeps declared type metadata
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetType1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GtObjectMatrix022>() as ClassType;
      const objectField = classType.getFieldByName("obj");
      const payloadField = classType.getFieldByName("payload");
      expect(objectField.getType().toString()).assertEqual(Type.from<Object>().toString());
      expect(payloadField.getType().getName()).assertEqual((Type.from<GtObjectPayload022>() as ClassType).getName());
      expect(payloadField.toString()).assertEqual("payload: " + payloadField.getType().toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_TYPE_1900
     * @tc.name testGetType1900
     * @tc.desc Verify getType returns Array type for one dimensional two dimensional and object arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetType1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GtArrayMatrix023>() as ClassType;
      const ids = classType.getFieldByName("ids");
      const matrix = classType.getFieldByName("matrix");
      const payloads = classType.getFieldByName("payloads");
      const names = classType.getFieldByName("names");
      expect(ids.getType().toString()).assertEqual("std.core.Array");
      expect(matrix.getType().toString()).assertEqual("std.core.Array");
      expect(payloads.getType().toString()).assertEqual("std.core.Array");
      expect(names.getType().toString()).assertEqual("std.core.Array");
      expect(matrix.toString()).assertEqual("matrix: std.core.Array");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_TYPE_2000
     * @tc.name testGetType2000
     * @tc.desc Verify getType reflects numeric and string enum fields as their enum types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetType2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GtEnumMatrix024>() as ClassType;
      const colorField = classType.getFieldByName("color");
      const statusField = classType.getFieldByName("status");
      expect(colorField.getType().toString()).assertEqual(Type.from<GtColor024>().toString());
      expect(statusField.getType().toString()).assertEqual(Type.from<GtStatus024>().toString());
      expect(colorField.isStatic()).assertTrue();
      expect(statusField.isStatic()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_TYPE_2100
     * @tc.name testGetType2100
     * @tc.desc Verify getType resolves type aliases for primitive custom class and array declarations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetType2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GtAliasMatrix025>() as ClassType;
      const titleField = classType.getFieldByName("title");
      const payloadField = classType.getFieldByName("payload");
      const idsField = classType.getFieldByName("ids");
      expect(titleField.getType().toString()).assertEqual("string");
      expect(payloadField.getType().getName()).assertEqual((Type.from<GtObjectPayload022>() as ClassType).getName());
      expect(idsField.getType().toString()).assertEqual("std.core.Array");
      expect(idsField.toString()).assertEqual("ids: std.core.Array");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_TYPE_2200
     * @tc.name testGetType2200
     * @tc.desc Verify getType for interface typed field keeps declared interface metadata
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetType2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<GtInterfaceMatrix026>() as ClassType).getFieldByName("readable");
      const expectedType = Type.from<GtReadable026>();
      expect(field.getName()).assertEqual("readable");
      expect(field.getType().getName()).assertEqual(expectedType.getName());
      expect(field.toString()).assertEqual("readable: " + field.getType().toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_TYPE_2300
     * @tc.name testGetType2300
     * @tc.desc Verify getType for abstract class typed field keeps abstract base metadata
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetType2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<GtAbstractMatrix027>() as ClassType).getFieldByName("base");
      expect(field.getName()).assertEqual("base");
      expect(field.getType().getName()).assertEqual((Type.from<GtAbstractBase027>() as ClassType).getName());
      expect(field.toString()).assertEqual("base: " + field.getType().toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_TYPE_2400
     * @tc.name testGetType2400
     * @tc.desc Verify getType for self reference field returns current class metadata without recursion issues
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetType2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GtSelfRef028>() as ClassType;
      const nextField = classType.getFieldByName("next");
      const nameField = classType.getFieldByName("name");
      expect(nextField.getType().getName()).assertEqual((Type.from<GtSelfRef028>() as ClassType).getName());
      expect(nextField.toString()).assertEqual("next: " + nextField.getType().toString());
      expect(nameField.getType().toString()).assertEqual("string");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_TYPE_2500
     * @tc.name testGetType2500
     * @tc.desc Verify getType is independent from static private protected readonly and uninitialized modifiers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetType2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GtModifierMatrix029>() as ClassType;
      const maxCount = classType.getFieldByName("maxCount");
      const hiddenText = classType.getFieldByName("hiddenText");
      const guardedFlag = classType.getFieldByName("guardedFlag");
      const label = classType.getFieldByName("label");
      const title = classType.getFieldByName("title");
      expect(maxCount.getType().toString()).assertEqual("int");
      expect(hiddenText.getType().toString()).assertEqual("string");
      expect(guardedFlag.getType().toString()).assertEqual("boolean");
      expect(label.getType().toString()).assertEqual("string");
      expect(title.getType().toString()).assertEqual("string");
      expect(maxCount.isStatic()).assertTrue();
      expect(label.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_TYPE_2600
     * @tc.name testGetType2600
     * @tc.desc Verify getType distinguishes hidden child field while inherited parent field keeps parent type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetType2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parentType = Type.from<GtInstanceParent030>() as ClassType;
      const childType = Type.from<GtInstanceChild030>() as ClassType;
      const parentToken = parentType.getFieldByName("token");
      const childToken = childType.getFieldByName("token");
      const inherited = childType.getFieldByName("parentOnly");
      expect(parentToken.getType().toString()).assertEqual("int");
      expect(childToken.getType().toString()).assertEqual("string");
      expect(inherited.getType().toString()).assertEqual("string");
      expect(inherited.getOwnerType().getName()).assertEqual(parentType.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_TYPE_2700
     * @tc.name testGetType2700
     * @tc.desc Verify getType keeps exact generic class instance metadata for single and multiple type arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetType2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GtGenericMatrix031>() as ClassType;
      const stringBox = classType.getFieldByName("stringBox");
      const intBox = classType.getFieldByName("intBox");
      const pair = classType.getFieldByName("pair");
      expect(stringBox.getType().toString()).assertEqual(Type.from<GtBox031<string>>().toString());
      expect(intBox.getType().toString()).assertEqual(Type.from<GtBox031<int>>().toString());
      expect(pair.getType().toString()).assertEqual(Type.from<GtPair031<int, string>>().toString());
      expect(stringBox.isStatic()).assertTrue();
      expect(intBox.isStatic()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_TYPE_2800
     * @tc.name testGetType2800
     * @tc.desc Verify getType for generic field holders and generic arrays remains stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetType2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GtGenericMemberMatrix032>() as ClassType;
      const stringMember = classType.getFieldByName("stringMember");
      const intMemberArray = classType.getFieldByName("intMemberArray");
      const valueField = (Type.from<GtGenericMember032<string>>() as ClassType).getFieldByName("value");
      const valuesField = (Type.from<GtGenericMember032<string>>() as ClassType).getFieldByName("values");
      expect(stringMember.getType().toString()).assertEqual(Type.from<GtGenericMember032<string>>().toString());
      expect(intMemberArray.getType().toString()).assertEqual("std.core.Array");
      expect(valueField.getName()).assertEqual("value");
      expect(valueField.toString()).assertEqual("value: " + valueField.getType().toString());
      expect(valuesField.getType().toString()).assertEqual("std.core.Array");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_TYPE_2900
     * @tc.name testGetType2900
     * @tc.desc Verify Function typed field getType returns exact function type metadata
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetType2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GtFunctionMatrix033>() as ClassType;
      const mapper = classType.getFieldByName("mapper");
      const noArg = classType.getFieldByName("noArg");
      const optional = classType.getFieldByName("optional");
      const rest = classType.getFieldByName("rest");
      expect(mapper.getName()).assertEqual("mapper");
      expect(mapper.getType().equals(Type.from<GtMapperFunction033>())).assertTrue();
      expect(noArg.getName()).assertEqual("noArg");
      expect(noArg.getType().equals(Type.from<GtNoArgFunction033>())).assertTrue();
      expect(optional.getName()).assertEqual("optional");
      expect(optional.getType().equals(Type.from<GtOptionalFunction033>())).assertTrue();
      expect(rest.getName()).assertEqual("rest");
      expect(rest.getType().equals(Type.from<GtRestFunction033>())).assertTrue();
      expect(mapper.isStatic()).assertTrue();
      expect(noArg.isStatic()).assertFalse();
      expect(optional.isStatic()).assertFalse();
      expect(rest.isStatic()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_TYPE_3000
     * @tc.name testGetType3000
     * @tc.desc Verify Function typed field getType returns matching metadata for direct and mapper declarations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetType3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GtFunctionMatrix033>() as ClassType;
      const direct = classType.getFieldByName("direct");
      const mapper = classType.getFieldByName("mapper");
      expect(direct.getName()).assertEqual("direct");
      expect(direct.getType().equals(Type.from<GtMapperFunction033>())).assertTrue();
      expect(mapper.getName()).assertEqual("mapper");
      expect(mapper.getType().equals(Type.from<GtMapperFunction033>())).assertTrue();
      expect(direct.isStatic()).assertFalse();
      expect(mapper.isStatic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_TYPE_3100
     * @tc.name testGetType3100
     * @tc.desc Verify getType preserves special identifier field names with exact scalar types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetType3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GtSpecialNames034>() as ClassType;
      const dollarField = classType.getFieldByName("$value");
      const typeField = classType.getFieldByName("_type");
      const field01 = classType.getFieldByName("field_01_test");
      const idField = classType.getFieldByName("_ID_2026_value");
      expect(dollarField.getName()).assertEqual("$value");
      expect(dollarField.getType().toString()).assertEqual("int");
      expect(typeField.getType().toString()).assertEqual("string");
      expect(field01.getType().toString()).assertEqual("boolean");
      expect(idField.getType().toString()).assertEqual("double");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_TYPE_3200
     * @tc.name testGetType3200
     * @tc.desc Verify getType for built in generic containers uses stable metadata with Array exact text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetType3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GtBuiltInGeneric035>() as ClassType;
      const scores = classType.getFieldByName("scores");
      const names = classType.getFieldByName("names");
      expect(scores.getName()).assertEqual("scores");
      expect(scores.getType().toString()).assertEqual("std.core.Map");
      expect(scores.toString()).assertEqual("scores: std.core.Map");
      expect(scores.isStatic()).assertTrue();
      expect(names.getType().toString()).assertEqual("std.core.Array");
      expect(names.toString()).assertEqual("names: std.core.Array");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_TYPE_3300
     * @tc.name testGetType3300
     * @tc.desc Verify repeated getType calls on same generic field remain stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetType3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<GtGenericMatrix031>() as ClassType).getFieldByName("stringBox");
      const expectedTypeText: string = Type.from<GtBox031<string>>().toString();
      for (let index: int = 0; index < 3; index++) {
        expect(field.getType().toString()).assertEqual(expectedTypeText);
      }
      expect(field.toString()).assertEqual("stringBox: " + expectedTypeText);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_TYPE_3400
     * @tc.name testGetType3400
     * @tc.desc Verify getType stays stable after getName toString owner type and modifier reads
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetType3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<GtModifierMatrix029>() as ClassType).getFieldByName("maxCount");
      expect(field.getName()).assertEqual("maxCount");
      expect(field.toString()).assertEqual("maxCount: int");
      expect(field.getOwnerType().getName()).assertEqual((Type.from<GtModifierMatrix029>() as ClassType).getName());
      expect(field.isStatic()).assertTrue();
      expect(field.isReadonly()).assertTrue();
      expect(field.getType().toString()).assertEqual("int");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_TYPE_3500
     * @tc.name testGetType3500
     * @tc.desc Verify duplicate field lookups return the same getType text for alias and custom class fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetType3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GtAliasMatrix025>() as ClassType;
      const firstPayload = classType.getFieldByName("payload");
      const secondPayload = classType.getFieldByName("payload");
      const title = classType.getFieldByName("title");
      expect(firstPayload.getName()).assertEqual("payload");
      expect(secondPayload.getType().getName()).assertEqual((Type.from<GtObjectPayload022>() as ClassType).getName());
      expect(firstPayload.getType().getName()).assertEqual((Type.from<GtObjectPayload022>() as ClassType).getName());
      expect(title.getType().toString()).assertEqual("string");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_TYPE_3600
     * @tc.name testGetType3600
     * @tc.desc Verify static and instance fields with same Array type keep getType text while metadata differs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetType3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GtArrayMatrix023>() as ClassType;
      const ids = classType.getFieldByName("ids");
      const names = classType.getFieldByName("names");
      expect(ids.getType().toString()).assertEqual("std.core.Array");
      expect(names.getType().toString()).assertEqual("std.core.Array");
      expect(ids.isStatic()).assertTrue();
      expect(names.isStatic()).assertFalse();
      expect(ids.getName()).assertEqual("ids");
      expect(names.getName()).assertEqual("names");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_TYPE_3700
     * @tc.name testGetType3700
     * @tc.desc Verify getType reflects undefined null union and optional field declarations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetType3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GtNullableMatrix036>() as ClassType;
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
      expect(parF.getType().toString()).assertEqual("std.core.Array");
      expect(parG.getType().toString()).assertEqual("std.core.Array");
      expect(parF.toString()).assertEqual("parF: std.core.Array");
      expect(parG.toString()).assertEqual("parG: std.core.Array");
      expect(parE.isStatic()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_TYPE_3800
     * @tc.name testGetType3800
     * @tc.desc Verify getType handles union declarations without Type.from union acquisition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetType3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GtUnionMatrix037>() as ClassType;
      const unionA = classType.getFieldByName("unionA");
      const unionB = classType.getFieldByName("unionB");
      const unionC = classType.getFieldByName("unionC");
      const unionD = classType.getFieldByName("unionD");
      expect(unionA.toString()).assertEqual("unionA: " + unionA.getType().toString());
      expect(unionB.toString()).assertEqual("unionB: " + unionB.getType().toString());
      expect(unionC.toString()).assertEqual("unionC: " + unionC.getType().toString());
      expect(unionD.toString()).assertEqual("unionD: " + unionD.getType().toString());
      expect(unionA.getOwnerType().getName()).assertEqual(classType.getName());
      expect(unionB.getOwnerType().getName()).assertEqual(classType.getName());
      expect(unionC.isStatic()).assertFalse();
      expect(unionD.isReadonly()).assertFalse();
    });

  });
}
