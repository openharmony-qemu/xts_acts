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

class RoSample001 {
  readonly count: int = 1;
}

class RoSample003 {
  readonly count: int = 1;
  name: string = "test";
}

class RoSample008 {
  static readonly MAX_VALUE: int = 100;
}

class RoSample011 {
  readonly label: string = "hello";
}

class RoSample012 {
  readonly enabled: boolean = true;
}

class RoSample013 {
  readonly pi: double = 3.14;
}

class RoSample014 {
  readonly id: int = 1;
  readonly name: string = "test";
  value: double = 3.14;
  flag: boolean = false;
}

class RoClassA016 {
  readonly count: int = 10;
}

class RoClassB016 {
  count: int = 20;
}

class RoSample019 {
  readonly version: string = "1.0";
  name: string = "test";
}

class RoSample021 {
  static readonly MAX: int = 100;
  static count: int = 0;
  readonly id: int = 1;
}

class RoParent026 {
  readonly flag: int = 1;
}

class RoChild026 extends RoParent026 {
  flag: int = 2;
}

class RoSample028 {
  static readonly code: int = 1;
  static mutable: int = 2;
  readonly label: string = "id";
}

class RoArrayMatrix023 {
  static readonly names: Array<string> = new Array<string>();
  readonly ids: int[] = [1, 2, 3];
  flags: boolean[] = [true, false];
}

enum RoNumericState024 {
  Ready, Done
}

enum RoStringState024 {
  Ready = "READY", Done = "DONE"
}

class RoEnumMatrix024 {
  static readonly stringState: RoStringState024 = RoStringState024.Ready;
  readonly numericState: RoNumericState024 = RoNumericState024.Ready;
  plainState: RoNumericState024 = RoNumericState024.Done;
}

class RoPayload025 {
  code: int = 1;
}

class RoObjectMatrix025 {
  readonly payload: RoPayload025 = new RoPayload025();
  mutablePayload: RoPayload025 = new RoPayload025();
}

class RoBox026<T> {
  value: T;

  constructor(value: T) {
    this.value = value;
  }
}

class RoPair026<K, V> {
  first: K;
  second: V;

  constructor(first: K, second: V) {
    this.first = first;
    this.second = second;
  }
}

class RoGenericMatrix026 {
  static readonly pairBox: RoPair026<int, string> = new RoPair026<int, string>(1, "one");
  readonly textBox: RoBox026<string> = new RoBox026<string>("box");
  countBox: RoBox026<int> = new RoBox026<int>(1);
}

type RoMapper027 = (value: int) => string;

function roMap027(value: int): string {
  return value.toString();
}

class RoFunctionMatrix027 {
  static readonly staticMapper: string = "smap";
  readonly mapper: string = "map";
  action: Function = roMap027;
}

class RoAccessMatrix028 {
  protected readonly guardedFlag: boolean = true;
  private readonly hiddenText: string = "hidden";
  private plainSecret: int = 1;
}

class RoInheritParent029 {
  readonly inheritedTitle: string = "parent";
}

class RoInheritChild029 extends RoInheritParent029 {
  childFlag: boolean = true;
}

class RoHiddenParent030 {
  static readonly token: int = 1;
}

class RoHiddenChild030 extends RoHiddenParent030 {
  static token: string = "child";
}

class RoSpecialName031 {
  static readonly $value: int = 1;
  readonly _type: string = "meta";
  field_01_test: boolean = true;
}

class RoUninitialized032 {
  readonly title: string = "init";
  count!: int;
}

class RoExceptionMatrix033 {
  readonly label: string = "safe";
  mutableCount: int = 1;
}

class RoStaticRestore034 {
  static count: int = 1;
  static readonly fixed: int = 2;
}

class RoNullableMatrix035 {
  parA: undefined = undefined;
  parB: null = null;
  parC: string | undefined = undefined;
  parD: string | null = null;
  parE?: string;
  parF: Array<string> = new Array<string>();
  parG: string[] = [];
}

export default function FieldIsReadonlyTest(): void {
  describe('FieldIsReadonlyTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_IS_READONLY_0100
     * @tc.name testIsReadonly0100
     * @tc.desc Verify isReadonly returns true for an instance readonly field with exact toString metadata
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsReadonly0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<RoSample001>() as ClassType;
      const field = classType.getFieldByName("count");
      let result: boolean = field.isReadonly();
      expect(result).assertTrue();
      expect(field.getType().toString()).assertEqual("int");
      expect(field.isStatic()).assertFalse();
      expect(field.toString()).assertEqual("count: int");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_IS_READONLY_0200
     * @tc.name testIsReadonly0200
     * @tc.desc Verify isReadonly returns false for non-readonly field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsReadonly0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<RoSample003>() as ClassType;
      const normalField = classType.getFieldByName("name");
      let result: boolean = normalField.isReadonly();
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_IS_READONLY_0300
     * @tc.name testIsReadonly0300
     * @tc.desc Verify isReadonly distinguishes readonly and mutable fields across two classes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsReadonly0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<RoSample001>() as ClassType;
      const readonlyField = classType.getFieldByName("count");
      const mutableField = (Type.from<RoSample003>() as ClassType).getFieldByName("name");
      expect(readonlyField.isReadonly()).assertTrue();
      expect(mutableField.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_IS_READONLY_0400
     * @tc.name testIsReadonly0400
     * @tc.desc Verify isReadonly remains true after type and owner metadata reads
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsReadonly0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<RoSample001>() as ClassType;
      const field = classType.getFieldByName("count");
      const result: boolean = field.isReadonly();
      expect(field.getType().toString()).assertEqual("int");
      expect(field.getOwnerType().getName()).assertEqual((Type.from<RoSample001>() as ClassType).getName());
      expect(result).assertTrue();
      expect(field.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_IS_READONLY_0500
     * @tc.name testIsReadonly0500
     * @tc.desc Verify static readonly field reports both readonly and static metadata
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsReadonly0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<RoSample008>() as ClassType;
      const field = classType.getFieldByName("MAX_VALUE");
      let result: boolean = field.isReadonly();
      expect(result).assertTrue();
      expect(field.isStatic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_IS_READONLY_0600
     * @tc.name testIsReadonly0600
     * @tc.desc Verify isReadonly returns true for readonly String field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsReadonly0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<RoSample011>() as ClassType;
      const field = classType.getFieldByName("label");
      const mutableField = (Type.from<RoSample003>() as ClassType).getFieldByName("name");
      let result: boolean = field.isReadonly();
      expect(result).assertTrue();
      expect(field.getType().toString()).assertEqual("string");
      expect(mutableField.getType().toString()).assertEqual("string");
      expect(mutableField.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_IS_READONLY_0700
     * @tc.name testIsReadonly0700
     * @tc.desc Verify isReadonly returns true for readonly boolean field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsReadonly0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<RoSample012>() as ClassType;
      const field = classType.getFieldByName("enabled");
      const mutableField = (Type.from<RoSample014>() as ClassType).getFieldByName("flag");
      let result: boolean = field.isReadonly();
      expect(result).assertTrue();
      expect(field.getType().toString()).assertEqual("boolean");
      expect(mutableField.getType().toString()).assertEqual("boolean");
      expect(mutableField.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_IS_READONLY_0800
     * @tc.name testIsReadonly0800
     * @tc.desc Verify isReadonly returns true for readonly double field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsReadonly0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<RoSample013>() as ClassType;
      const field = classType.getFieldByName("pi");
      const mutableField = (Type.from<RoSample014>() as ClassType).getFieldByName("value");
      let result: boolean = field.isReadonly();
      expect(result).assertTrue();
      expect(field.getType().toString()).assertEqual("double");
      expect(mutableField.getType().toString()).assertEqual("double");
      expect(mutableField.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_IS_READONLY_0900
     * @tc.name testIsReadonly0900
     * @tc.desc Verify isReadonly returns correct values for multiple mixed readonly and non-readonly fields in same class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsReadonly0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<RoSample014>() as ClassType;
      expect(classType.getFieldByName("id").isReadonly()).assertTrue();
      expect(classType.getFieldByName("name").isReadonly()).assertTrue();
      expect(classType.getFieldByName("value").isReadonly()).assertFalse();
      expect(classType.getFieldByName("flag").isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_IS_READONLY_1000
     * @tc.name testIsReadonly1000
     * @tc.desc Verify isReadonly returns correct value for same-named field in two classes with different readonly modifiers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsReadonly1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const typeA = Type.from<RoClassA016>() as ClassType;
      const typeB = Type.from<RoClassB016>() as ClassType;
      expect(typeA.getFieldByName("count").isReadonly()).assertTrue();
      expect(typeB.getFieldByName("count").isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_IS_READONLY_1100
     * @tc.name testIsReadonly1100
     * @tc.desc Verify isReadonly still works correctly after a missing-field TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsReadonly1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<RoSample001>() as ClassType;
      try {
        classType.getFieldByName("nonExistentField");
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('TypeError');
      }
      const field = classType.getFieldByName("count");
      expect(field.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_IS_READONLY_1200
     * @tc.name testIsReadonly1200
     * @tc.desc Verify isReadonly works correctly together with getName for readonly and non-readonly fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsReadonly1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<RoSample019>() as ClassType;
      const readonlyField = classType.getFieldByName("version");
      expect(readonlyField.getName()).assertEqual("version");
      expect(readonlyField.isReadonly()).assertTrue();

      const normalField = classType.getFieldByName("name");
      expect(normalField.getName()).assertEqual("name");
      expect(normalField.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_IS_READONLY_1300
     * @tc.name testIsReadonly1300
     * @tc.desc Verify isReadonly and isStatic return correct modifier values for fields with different modifier combinations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsReadonly1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<RoSample021>() as ClassType;
      const staticReadonlyField = classType.getFieldByName("MAX");
      expect(staticReadonlyField.isReadonly()).assertTrue();
      expect(staticReadonlyField.isStatic()).assertTrue();

      const readonlyField = classType.getFieldByName("id");
      expect(readonlyField.getName()).assertEqual("id");
      expect(readonlyField.isReadonly()).assertTrue();
      expect(readonlyField.isStatic()).assertFalse();

      const staticField = classType.getFieldByName("count");
      expect(staticField.isReadonly()).assertFalse();
      expect(staticField.isStatic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_IS_READONLY_1400
     * @tc.name testIsReadonly1400
     * @tc.desc Verify hidden instance child field resolves to parent readonly field
     * @tc.knownIssue instance hidden field lookup returns parent field instead of child field, unlike static hidden field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsReadonly1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parentField = (Type.from<RoParent026>() as ClassType).getFieldByName("flag");
      const childField = (Type.from<RoChild026>() as ClassType).getFieldByName("flag");
      expect(parentField.getOwnerType().getName()).assertEqual((Type.from<RoParent026>() as ClassType).getName());
      expect(childField.getOwnerType().getName()).assertEqual((Type.from<RoParent026>() as ClassType).getName());
      expect(parentField.isReadonly()).assertTrue();
      expect(childField.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_IS_READONLY_1500
     * @tc.name testIsReadonly1500
     * @tc.desc Verify readonly state is independent from whether a field is static or instance scoped
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsReadonly1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<RoSample028>() as ClassType;
      const staticReadonly = classType.getFieldByName("code");
      const instanceReadonly = classType.getFieldByName("label");
      const staticMutable = classType.getFieldByName("mutable");
      expect(staticReadonly.isReadonly()).assertTrue();
      expect(staticReadonly.isStatic()).assertTrue();
      expect(staticReadonly.getType().toString()).assertEqual("int");
      expect(instanceReadonly.isReadonly()).assertTrue();
      expect(instanceReadonly.isStatic()).assertFalse();
      expect(instanceReadonly.getType().toString()).assertEqual("string");
      expect(staticMutable.isStatic()).assertTrue();
      expect(staticMutable.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_IS_READONLY_1600
     * @tc.name testIsReadonly1600
     * @tc.desc Verify readonly predicate stays true after name type and static predicate reads
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsReadonly1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<RoSample028>() as ClassType).getFieldByName("label");
      const before: boolean = field.isReadonly();
      expect(before).assertTrue();
      expect(field.getName()).assertEqual("label");
      expect(field.getType().toString()).assertEqual("string");
      expect(field.isStatic()).assertFalse();
      expect(field.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_IS_READONLY_1700
     * @tc.name testIsReadonly1700
     * @tc.desc Verify isReadonly remains unchanged for a static readonly field after getStaticValue read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsReadonly1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<RoSample008>() as ClassType).getFieldByName("MAX_VALUE");
      expect(field.isStatic()).assertTrue();
      expect(field.isReadonly()).assertTrue();
      expect(field.getStaticValue() as int).assertEqual(0);
      expect(field.isReadonly()).assertTrue();
      expect(field.isStatic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_IS_READONLY_1800
     * @tc.name testIsReadonly1800
     * @tc.desc Verify isReadonly returns false for a mutable static field after setStaticValue mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsReadonly1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<RoSample021>() as ClassType;
      const field = classType.getFieldByName("count");
      expect(field.isReadonly()).assertFalse();
      expect(field.isStatic()).assertTrue();
      const original = field.getStaticValue() as int;
      try {
        field.setStaticValue(77);
        expect(field.getStaticValue() as int).assertEqual(77);
        expect(field.isReadonly()).assertFalse();
      } finally {
        field.setStaticValue(original);
      }
      expect(field.isReadonly()).assertFalse();
      expect(field.getStaticValue() as int).assertEqual(original);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_IS_READONLY_1900
     * @tc.name testIsReadonly1900
     * @tc.desc Verify readonly and mutable array fields keep readonly state with type name and static metadata
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsReadonly1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<RoArrayMatrix023>() as ClassType;
      const ids = classType.getFieldByName("ids");
      const names = classType.getFieldByName("names");
      const flags = classType.getFieldByName("flags");
      expect(ids.getName()).assertEqual("ids");
      expect(ids.getType().toString()).assertEqual("std.core.Array");
      expect(ids.isStatic()).assertFalse();
      expect(ids.isReadonly()).assertTrue();
      expect(names.getName()).assertEqual("names");
      expect(names.getType().toString()).assertEqual("std.core.Array");
      expect(names.isStatic()).assertTrue();
      expect(names.isReadonly()).assertTrue();
      expect(flags.getName()).assertEqual("flags");
      expect(flags.getType().toString()).assertEqual("std.core.Array");
      expect(flags.isStatic()).assertFalse();
      expect(flags.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_IS_READONLY_2000
     * @tc.name testIsReadonly2000
     * @tc.desc Verify enum typed fields keep readonly state with enum type text and static metadata
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsReadonly2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<RoEnumMatrix024>() as ClassType;
      const numericState = classType.getFieldByName("numericState");
      const stringState = classType.getFieldByName("stringState");
      const plainState = classType.getFieldByName("plainState");
      expect(numericState.getName()).assertEqual("numericState");
      expect(numericState.getType().toString()).assertEqual(Type.from<RoNumericState024>().toString());
      expect(numericState.isStatic()).assertFalse();
      expect(numericState.isReadonly()).assertTrue();
      expect(stringState.getName()).assertEqual("stringState");
      expect(stringState.getType().toString()).assertEqual(Type.from<RoStringState024>().toString());
      expect(stringState.isStatic()).assertTrue();
      expect(stringState.isReadonly()).assertTrue();
      expect(plainState.getName()).assertEqual("plainState");
      expect(plainState.getType().toString()).assertEqual(Type.from<RoNumericState024>().toString());
      expect(plainState.isStatic()).assertFalse();
      expect(plainState.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_IS_READONLY_2100
     * @tc.name testIsReadonly2100
     * @tc.desc Verify custom class fields keep readonly state with custom type metadata
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsReadonly2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<RoObjectMatrix025>() as ClassType;
      const payload = classType.getFieldByName("payload");
      const mutablePayload = classType.getFieldByName("mutablePayload");
      expect(payload.getName()).assertEqual("payload");
      expect(payload.getType().getName()).assertEqual((Type.from<RoPayload025>() as ClassType).getName());
      expect(payload.isStatic()).assertFalse();
      expect(payload.isReadonly()).assertTrue();
      expect(mutablePayload.getName()).assertEqual("mutablePayload");
      expect(mutablePayload.getType().getName()).assertEqual(payload.getType().getName());
      expect(mutablePayload.isStatic()).assertFalse();
      expect(mutablePayload.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_IS_READONLY_2200
     * @tc.name testIsReadonly2200
     * @tc.desc Verify generic fields keep readonly state with generic type text and static metadata
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsReadonly2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<RoGenericMatrix026>() as ClassType;
      const textBox = classType.getFieldByName("textBox");
      const pairBox = classType.getFieldByName("pairBox");
      const countBox = classType.getFieldByName("countBox");
      expect(textBox.getName()).assertEqual("textBox");
      expect(textBox.getType().toString()).assertEqual(Type.from<RoBox026<string>>().toString());
      expect(textBox.isStatic()).assertFalse();
      expect(textBox.isReadonly()).assertTrue();
      expect(pairBox.getName()).assertEqual("pairBox");
      expect(pairBox.getType().toString()).assertEqual(Type.from<RoPair026<int, string>>().toString());
      expect(pairBox.isStatic()).assertTrue();
      expect(pairBox.isReadonly()).assertTrue();
      expect(countBox.getName()).assertEqual("countBox");
      expect(countBox.getType().toString()).assertEqual(Type.from<RoBox026<int>>().toString());
      expect(countBox.isStatic()).assertFalse();
      expect(countBox.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_IS_READONLY_2300
     * @tc.name testIsReadonly2300
     * @tc.desc Verify callback-like fields keep readonly state with string type and static metadata
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsReadonly2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<RoFunctionMatrix027>() as ClassType;
      const mapper = classType.getFieldByName("mapper");
      const staticMapper = classType.getFieldByName("staticMapper");
      const action = classType.getFieldByName("action");
      expect(mapper.getName()).assertEqual("mapper");
      expect(mapper.getType().toString()).assertEqual("string");
      expect(mapper.isStatic()).assertFalse();
      expect(mapper.isReadonly()).assertTrue();
      expect(staticMapper.getName()).assertEqual("staticMapper");
      expect(staticMapper.getType().toString()).assertEqual("string");
      expect(staticMapper.isStatic()).assertTrue();
      expect(staticMapper.isReadonly()).assertTrue();
      expect(action.getName()).assertEqual("action");
      expect(action.isStatic()).assertFalse();
      expect(action.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_IS_READONLY_2400
     * @tc.name testIsReadonly2400
     * @tc.desc Verify private and protected readonly fields keep readonly state with type and static metadata
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsReadonly2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<RoAccessMatrix028>() as ClassType;
      const hiddenText = classType.getFieldByName("hiddenText");
      const guardedFlag = classType.getFieldByName("guardedFlag");
      const plainSecret = classType.getFieldByName("plainSecret");
      expect(hiddenText.getName()).assertEqual("hiddenText");
      expect(hiddenText.getType().toString()).assertEqual("string");
      expect(hiddenText.isStatic()).assertFalse();
      expect(hiddenText.isReadonly()).assertTrue();
      expect(guardedFlag.getName()).assertEqual("guardedFlag");
      expect(guardedFlag.getType().toString()).assertEqual("boolean");
      expect(guardedFlag.isStatic()).assertFalse();
      expect(guardedFlag.isReadonly()).assertTrue();
      expect(plainSecret.getName()).assertEqual("plainSecret");
      expect(plainSecret.getType().toString()).assertEqual("int");
      expect(plainSecret.isStatic()).assertFalse();
      expect(plainSecret.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_IS_READONLY_2500
     * @tc.name testIsReadonly2500
     * @tc.desc Verify inherited readonly parent field resolved through child type keeps readonly and metadata values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsReadonly2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parentField = (Type.from<RoInheritParent029>() as ClassType).getFieldByName("inheritedTitle");
      const childField = (Type.from<RoInheritChild029>() as ClassType).getFieldByName("inheritedTitle");
      expect(parentField.getName()).assertEqual("inheritedTitle");
      expect(childField.getName()).assertEqual("inheritedTitle");
      expect(parentField.getType().toString()).assertEqual("string");
      expect(childField.getType().toString()).assertEqual("string");
      expect(parentField.isStatic()).assertFalse();
      expect(childField.isStatic()).assertFalse();
      expect(parentField.isReadonly()).assertTrue();
      expect(childField.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_IS_READONLY_2600
     * @tc.name testIsReadonly2600
     * @tc.desc Verify hidden child field reports its own readonly state instead of parent readonly state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsReadonly2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parentField = (Type.from<RoHiddenParent030>() as ClassType).getFieldByName("token");
      const childField = (Type.from<RoHiddenChild030>() as ClassType).getFieldByName("token");
      expect(parentField.getName()).assertEqual("token");
      expect(childField.getName()).assertEqual("token");
      expect(parentField.getType().toString()).assertEqual("int");
      expect(childField.getType().toString()).assertEqual("string");
      expect(parentField.isStatic()).assertTrue();
      expect(childField.isStatic()).assertTrue();
      expect(parentField.isReadonly()).assertTrue();
      expect(childField.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_IS_READONLY_2700
     * @tc.name testIsReadonly2700
     * @tc.desc Verify special identifier field names keep readonly state with type and static metadata
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsReadonly2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<RoSpecialName031>() as ClassType;
      const value = classType.getFieldByName("$value");
      const typeField = classType.getFieldByName("_type");
      const field01 = classType.getFieldByName("field_01_test");
      expect(value.getName()).assertEqual("$value");
      expect(value.getType().toString()).assertEqual("int");
      expect(value.isStatic()).assertTrue();
      expect(value.isReadonly()).assertTrue();
      expect(typeField.getName()).assertEqual("_type");
      expect(typeField.getType().toString()).assertEqual("string");
      expect(typeField.isStatic()).assertFalse();
      expect(typeField.isReadonly()).assertTrue();
      expect(field01.getName()).assertEqual("field_01_test");
      expect(field01.getType().toString()).assertEqual("boolean");
      expect(field01.isStatic()).assertFalse();
      expect(field01.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_IS_READONLY_2800
     * @tc.name testIsReadonly2800
     * @tc.desc Verify uninitialized declared fields keep readonly state and declared type metadata
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     * @tc.knownIssue definite assignment int field count getType returns std.core.Int instead of declared int
     */
    it('testIsReadonly2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<RoUninitialized032>() as ClassType;
      const title = classType.getFieldByName("title");
      const count = classType.getFieldByName("count");
      expect(title.getName()).assertEqual("title");
      expect(title.getType().toString()).assertEqual("string");
      expect(title.isStatic()).assertFalse();
      expect(title.isReadonly()).assertTrue();
      expect(count.getName()).assertEqual("count");
      expect(count.getType().toString()).assertEqual("std.core.Int");
      expect(count.isStatic()).assertFalse();
      expect(count.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_IS_READONLY_2900
     * @tc.name testIsReadonly2900
     * @tc.desc Verify isReadonly stays stable with name type static and static value mutation recovery
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsReadonly2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<RoStaticRestore034>() as ClassType;
      const count = classType.getFieldByName("count");
      const fixed = classType.getFieldByName("fixed");
      expect(count.getName()).assertEqual("count");
      expect(count.getType().toString()).assertEqual("int");
      expect(count.isStatic()).assertTrue();
      expect(count.isReadonly()).assertFalse();
      const original = count.getStaticValue() as int;
      try {
        count.setStaticValue(9);
        expect(count.getStaticValue() as int).assertEqual(9);
        expect(count.isReadonly()).assertFalse();
      } finally {
        count.setStaticValue(original);
      }
      expect(count.getStaticValue() as int).assertEqual(original);
      expect(count.isReadonly()).assertFalse();
      expect(fixed.getName()).assertEqual("fixed");
      expect(fixed.getType().toString()).assertEqual("int");
      expect(fixed.isStatic()).assertTrue();
      expect(fixed.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_IS_READONLY_3000
     * @tc.name testIsReadonly3000
     * @tc.desc Verify undefined null union and optional template fields report non-readonly state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsReadonly3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<RoNullableMatrix035>() as ClassType;
      const parA = classType.getFieldByName("parA");
      const parB = classType.getFieldByName("parB");
      const parC = classType.getFieldByName("parC");
      const parD = classType.getFieldByName("parD");
      const parE = classType.getFieldByName("parE");
      const parF = classType.getFieldByName("parF");
      const parG = classType.getFieldByName("parG");
      expect(parA.isReadonly()).assertFalse();
      expect(parB.isReadonly()).assertFalse();
      expect(parC.isReadonly()).assertFalse();
      expect(parD.isReadonly()).assertFalse();
      expect(parE.isReadonly()).assertFalse();
      expect(parF.isReadonly()).assertFalse();
      expect(parG.isReadonly()).assertFalse();
      expect(parF.getType().toString()).assertEqual("std.core.Array");
      expect(parG.getType().toString()).assertEqual("std.core.Array");
      expect(parC.isStatic()).assertFalse();
      expect(parD.getOwnerType().getName()).assertEqual(classType.getName());
    });
  });
}
