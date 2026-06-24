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

class GoSample001 {
  static count: int = 1;
}

class GoClassA010 {
  static valueA: int = 10;
}

class GoClassB010 {
  static valueB: string = "hello";
}

class GoMultiField011 {
  static field1: int = 1;
  static field2: string = "test";
  static field3: boolean = true;
}

class GoParent012 {
  static parentField: int = 0;
}

class GoChild012 extends GoParent012 {
  static childField: string = "child";
}

class GoInstanceSample013 {
  name: string = "test";
}

class GoEmptyClass017 {
}

class GoOwnerA020 {
  static shared: int = 1;
}

class GoOwnerB020 {
  static shared: int = 2;
}

class GoParent021 {
  static marker: int = 1;
}

class GoChild021 extends GoParent021 {
  static marker: int = 2;
}

class GoOwnerPrimitive017 {
  static count: int = 1;
  static total: long = 900719925;
  ratio: double = 2.5;
  score: float = 1.5f;
  enabled: boolean = true;
}

class GoOwnerPayload018 {
  code: int = 1;
}

class GoOwnerObject018 {
  static payload: GoOwnerPayload018 = new GoOwnerPayload018();
  obj: Object = new Object();
}

class GoOwnerArray019 {
  static ids: int[] = [1, 2, 3];
  labels: string[] = ["left", "right"];
}

enum GoOwnerNumericState020 {
  Ready, Done
}

enum GoOwnerStringState020 {
  Ready = "READY", Done = "DONE"
}

class GoOwnerEnum020 {
  static numericState: GoOwnerNumericState020 = GoOwnerNumericState020.Ready;
  stringState: GoOwnerStringState020 = GoOwnerStringState020.Ready;
}

class GoOwnerBox021<T> {
  value: T;

  constructor(value: T) {
    this.value = value;
  }
}

class GoOwnerGeneric021 {
  static textBox: GoOwnerBox021<string> = new GoOwnerBox021<string>("box");
  readonly intBox: GoOwnerBox021<int> = new GoOwnerBox021<int>(1);
}

class GoOwnerFunction022 {
  static mapper: string = "map";
  readonly callback: string = "cb";
  action: string = "act";
}

class GoOwnerModifier023 {
  static readonly fixedCount: int = 10;
  static mutableCount: int = 1;
  readonly label: string = "tag";
  enabled: boolean = true;
}

class GoOwnerParent024 {
  sharedText: string = "parent";
}

class GoOwnerChild024 extends GoOwnerParent024 {
  childFlag: boolean = true;
}

class GoOwnerHiddenParent025 {
  static token: int = 1;
}

class GoOwnerHiddenChild025 extends GoOwnerHiddenParent025 {
  static token: string = "child";
}

class GoOwnerSpecial026 {
  static classField: int = 1;
  readonly _type: string = "meta";
  field_01_test: boolean = true;
}

class GoOwnerUninitialized027 {
  title!: string;
  count!: int;
}

class GoOwnerNullable028 {
  parA: undefined = undefined;
  parB: null = null;
  parC: string | undefined = undefined;
  parD: string | null = null;
  parE?: string;
  parF: Array<string> = new Array<string>();
  parG: string[] = [];
}

export default function FieldGetOwnerTypeTest(): void {
  describe('FieldGetOwnerTypeTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_OWNER_TYPE_0100
     * @tc.name testGetOwnerType0100
     * @tc.desc Verify getOwnerType getName returns the declaring class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetOwnerType0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<GoSample001>() as ClassType).getFieldByName("count");
      const ownerType: Type = field.getOwnerType();
      expect(ownerType.getName()).assertEqual((Type.from<GoSample001>() as ClassType).getName());
      expect(field.getType().toString()).assertEqual("int");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_OWNER_TYPE_0200
     * @tc.name testGetOwnerType0200
     * @tc.desc Verify getOwnerType result exposes the field owner rather than field type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetOwnerType0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<GoClassB010>() as ClassType).getFieldByName("valueB");
      const ownerType: Type = field.getOwnerType();
      expect(ownerType.getName()).assertEqual((Type.from<GoClassB010>() as ClassType).getName());
      expect(field.getType().toString()).assertEqual("string");
      expect(field.getName()).assertEqual("valueB");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_OWNER_TYPE_0300
     * @tc.name testGetOwnerType0300
     * @tc.desc Verify getOwnerType for static fields of different classes returns corresponding owner types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetOwnerType0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fieldA = (Type.from<GoClassA010>() as ClassType).getFieldByName("valueA");
      const fieldB = (Type.from<GoClassB010>() as ClassType).getFieldByName("valueB");
      const ownerA: Type = fieldA.getOwnerType();
      const ownerB: Type = fieldB.getOwnerType();
      expect(ownerA.getName()).assertEqual((Type.from<GoClassA010>() as ClassType).getName());
      expect(ownerB.getName()).assertEqual((Type.from<GoClassB010>() as ClassType).getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_OWNER_TYPE_0400
     * @tc.name testGetOwnerType0400
     * @tc.desc Verify getOwnerType for an inherited field looked up through child type returns the declaring parent type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetOwnerType0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const childType = Type.from<GoChild012>() as ClassType;
      const inheritedField = childType.getFieldByName("parentField");
      const ownerName: string = inheritedField.getOwnerType().getName();
      expect(inheritedField.getName()).assertEqual("parentField");
      expect(ownerName).assertEqual((Type.from<GoParent012>() as ClassType).getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_OWNER_TYPE_0500
     * @tc.name testGetOwnerType0500
     * @tc.desc Verify getOwnerType for instance fields returns the declaring class type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetOwnerType0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GoInstanceSample013>() as ClassType;
      const field = classType.getFieldByName("name");
      const ownerType: Type = field.getOwnerType();
      expect(ownerType.getName()).assertEqual((Type.from<GoInstanceSample013>() as ClassType).getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_OWNER_TYPE_0600
     * @tc.name testGetOwnerType0600
     * @tc.desc Verify consecutive getOwnerType calls on the same Field return consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetOwnerType0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<GoSample001>() as ClassType).getFieldByName("count");
      const owner1: Type = field.getOwnerType();
      const owner2: Type = field.getOwnerType();
      const owner3: Type = field.getOwnerType();
      expect(owner1.getName()).assertEqual((Type.from<GoSample001>() as ClassType).getName());
      expect(owner2.getName()).assertEqual(owner1.getName());
      expect(owner3.getName()).assertEqual(owner1.getName());
      expect(owner1.getName() === (Type.from<GoClassA010>() as ClassType).getName()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_OWNER_TYPE_0700
     * @tc.name testGetOwnerType0700
     * @tc.desc Verify empty class missing lookup throws TypeError and valid owner lookup still works
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetOwnerType0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const classType = Type.from<GoEmptyClass017>() as ClassType;
        classType.getFieldByName("noField");
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('TypeError');
      }
      const validField = (Type.from<GoSample001>() as ClassType).getFieldByName("count");
      expect(validField.getOwnerType().getName()).assertEqual((Type.from<GoSample001>() as ClassType).getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_OWNER_TYPE_0800
     * @tc.name testGetOwnerType0800
     * @tc.desc Verify owner type remains consistent when combined with field toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetOwnerType0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<GoClassA010>() as ClassType).getFieldByName("valueA");
      const ownerName: string = field.getOwnerType().getName();
      expect(ownerName).assertEqual((Type.from<GoClassA010>() as ClassType).getName());
      expect(field.toString()).assertEqual("valueA: int");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_OWNER_TYPE_0900
     * @tc.name testGetOwnerType0900
     * @tc.desc Verify parent and child static fields report their own owner type names
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetOwnerType0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parentOwner: string =
        (Type.from<GoParent012>() as ClassType).getFieldByName("parentField").getOwnerType().getName();
      const childOwner: string =
        (Type.from<GoChild012>() as ClassType).getFieldByName("childField").getOwnerType().getName();
      expect(parentOwner).assertEqual((Type.from<GoParent012>() as ClassType).getName());
      expect(childOwner).assertEqual((Type.from<GoChild012>() as ClassType).getName());
      expect((Type.from<GoParent012>() as ClassType).getFieldByName("parentField").getName())
        .assertEqual("parentField");
      expect((Type.from<GoChild012>() as ClassType).getFieldByName("childField").getName()).assertEqual("childField");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_OWNER_TYPE_1000
     * @tc.name testGetOwnerType1000
     * @tc.desc Verify same-named fields from unrelated owner types keep different owner names
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetOwnerType1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = (Type.from<GoOwnerA020>() as ClassType).getFieldByName("shared");
      const right = (Type.from<GoOwnerB020>() as ClassType).getFieldByName("shared");
      expect(left.getName()).assertEqual(right.getName());
      expect(left.getOwnerType().getName()).assertEqual((Type.from<GoOwnerA020>() as ClassType).getName());
      expect(right.getOwnerType().getName()).assertEqual((Type.from<GoOwnerB020>() as ClassType).getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_OWNER_TYPE_1100
     * @tc.name testGetOwnerType1100
     * @tc.desc Verify hidden parent and child fields with matching metadata still report distinct owner types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetOwnerType1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parentField = (Type.from<GoParent021>() as ClassType).getFieldByName("marker");
      const childField = (Type.from<GoChild021>() as ClassType).getFieldByName("marker");
      expect(parentField.getName()).assertEqual(childField.getName());
      expect(parentField.getType().toString()).assertEqual(childField.getType().toString());
      expect(parentField.getOwnerType().getName()).assertEqual((Type.from<GoParent021>() as ClassType).getName());
      expect(childField.getOwnerType().getName()).assertEqual((Type.from<GoChild021>() as ClassType).getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_OWNER_TYPE_1200
     * @tc.name testGetOwnerType1200
     * @tc.desc Verify different fields from one class share owner type while keeping distinct field names
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetOwnerType1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GoMultiField011>() as ClassType;
      const first = classType.getFieldByName("field1");
      const second = classType.getFieldByName("field2");
      const firstTypeText: string = first.getType().toString();
      const secondTypeText: string = second.getType().toString();
      expect(first.getOwnerType().getName()).assertEqual((Type.from<GoMultiField011>() as ClassType).getName());
      expect(first.getOwnerType().getName()).assertEqual(second.getOwnerType().getName());
      expect(first.getName()).assertEqual("field1");
      expect(second.getName()).assertEqual("field2");
      expect(firstTypeText).assertEqual("int");
      expect(secondTypeText).assertEqual("string");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_OWNER_TYPE_1300
     * @tc.name testGetOwnerType1300
     * @tc.desc Verify owner type remains correct after getStaticValue read and read-only predicates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetOwnerType1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<GoClassA010>() as ClassType).getFieldByName("valueA");
      const ownerName: string = field.getOwnerType().getName();
      expect(ownerName).assertEqual((Type.from<GoClassA010>() as ClassType).getName());
      field.getStaticValue();
      expect(field.getType().toString()).assertEqual("int");
      expect(field.isReadonly()).assertFalse();
      expect(field.isStatic()).assertTrue();
      expect(field.getOwnerType().getName()).assertEqual(ownerName);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_OWNER_TYPE_1400
     * @tc.name testGetOwnerType1400
     * @tc.desc Verify hidden parent and child fields with the same name keep distinct owner types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetOwnerType1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parentType = Type.from<GoOwnerHiddenParent025>() as ClassType;
      const childType = Type.from<GoOwnerHiddenChild025>() as ClassType;
      const parentToken = parentType.getFieldByName("token");
      const childToken = childType.getFieldByName("token");
      expect(parentToken.getName()).assertEqual("token");
      expect(childToken.getName()).assertEqual("token");
      expect(parentToken.getOwnerType().getName()).assertEqual(parentType.getName());
      expect(childToken.getOwnerType().getName()).assertEqual(childType.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_OWNER_TYPE_1500
     * @tc.name testGetOwnerType1500
     * @tc.desc Verify primitive fields keep owner type and field metadata across long double float and boolean fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetOwnerType1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GoOwnerPrimitive017>() as ClassType;
      const count = classType.getFieldByName("count");
      const total = classType.getFieldByName("total");
      const ratio = classType.getFieldByName("ratio");
      const score = classType.getFieldByName("score");
      const enabled = classType.getFieldByName("enabled");
      const ownerName: string = classType.getName();
      expect(count.getOwnerType().getName()).assertEqual(ownerName);
      expect(count.getName()).assertEqual("count");
      expect(count.getType().toString()).assertEqual("int");
      expect(count.isStatic()).assertTrue();
      expect(count.isReadonly()).assertFalse();
      expect(total.getOwnerType().getName()).assertEqual(ownerName);
      expect(total.getName()).assertEqual("total");
      expect(total.getType().toString()).assertEqual("long");
      expect(total.isStatic()).assertTrue();
      expect(total.isReadonly()).assertFalse();
      expect(ratio.getOwnerType().getName()).assertEqual(ownerName);
      expect(ratio.getName()).assertEqual("ratio");
      expect(ratio.getType().toString()).assertEqual("double");
      expect(ratio.isStatic()).assertFalse();
      expect(ratio.isReadonly()).assertFalse();
      expect(score.getOwnerType().getName()).assertEqual(ownerName);
      expect(score.getName()).assertEqual("score");
      expect(score.getType().toString()).assertEqual("float");
      expect(score.isStatic()).assertFalse();
      expect(score.isReadonly()).assertFalse();
      expect(enabled.getOwnerType().getName()).assertEqual(ownerName);
      expect(enabled.getName()).assertEqual("enabled");
      expect(enabled.getType().toString()).assertEqual("boolean");
      expect(enabled.isStatic()).assertFalse();
      expect(enabled.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_OWNER_TYPE_1600
     * @tc.name testGetOwnerType1600
     * @tc.desc Verify custom class and Object typed fields keep exact owner and type metadata
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetOwnerType1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GoOwnerObject018>() as ClassType;
      const payload = classType.getFieldByName("payload");
      const obj = classType.getFieldByName("obj");
      expect(payload.getOwnerType().getName()).assertEqual(classType.getName());
      expect(payload.getName()).assertEqual("payload");
      expect(payload.getType().toString()).assertEqual(Type.from<GoOwnerPayload018>().toString());
      expect(payload.getType().getName()).assertEqual((Type.from<GoOwnerPayload018>() as ClassType).getName());
      expect(payload.isStatic()).assertTrue();
      expect(payload.isReadonly()).assertFalse();
      expect(obj.getOwnerType().getName()).assertEqual(classType.getName());
      expect(obj.getName()).assertEqual("obj");
      expect(obj.getType().toString()).assertEqual(Type.from<Object>().toString());
      expect(obj.getType().getName()).assertEqual("std.core.Object");
      expect(obj.isStatic()).assertFalse();
      expect(obj.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_OWNER_TYPE_1700
     * @tc.name testGetOwnerType1700
     * @tc.desc Verify array typed fields keep owner type and Array type text for static and instance fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetOwnerType1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GoOwnerArray019>() as ClassType;
      const ids = classType.getFieldByName("ids");
      const labels = classType.getFieldByName("labels");
      expect(ids.getOwnerType().getName()).assertEqual(classType.getName());
      expect(ids.getName()).assertEqual("ids");
      expect(ids.getType().toString()).assertEqual("std.core.Array");
      expect(ids.isStatic()).assertTrue();
      expect(ids.isReadonly()).assertFalse();
      expect(labels.getOwnerType().getName()).assertEqual(classType.getName());
      expect(labels.getName()).assertEqual("labels");
      expect(labels.getType().toString()).assertEqual("std.core.Array");
      expect(labels.isStatic()).assertFalse();
      expect(labels.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_OWNER_TYPE_1800
     * @tc.name testGetOwnerType1800
     * @tc.desc Verify enum typed fields keep owner type and enum type text for static and instance fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetOwnerType1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GoOwnerEnum020>() as ClassType;
      const numericState = classType.getFieldByName("numericState");
      const stringState = classType.getFieldByName("stringState");
      expect(numericState.getOwnerType().getName()).assertEqual(classType.getName());
      expect(numericState.getName()).assertEqual("numericState");
      expect(numericState.getType().toString()).assertEqual(Type.from<GoOwnerNumericState020>().toString());
      expect(numericState.isStatic()).assertTrue();
      expect(numericState.isReadonly()).assertFalse();
      expect(stringState.getOwnerType().getName()).assertEqual(classType.getName());
      expect(stringState.getName()).assertEqual("stringState");
      expect(stringState.getType().toString()).assertEqual(Type.from<GoOwnerStringState020>().toString());
      expect(stringState.isStatic()).assertFalse();
      expect(stringState.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_OWNER_TYPE_1900
     * @tc.name testGetOwnerType1900
     * @tc.desc Verify generic class typed fields keep owner type and generic type text for static and readonly fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetOwnerType1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GoOwnerGeneric021>() as ClassType;
      const textBox = classType.getFieldByName("textBox");
      const intBox = classType.getFieldByName("intBox");
      expect(textBox.getOwnerType().getName()).assertEqual(classType.getName());
      expect(textBox.getName()).assertEqual("textBox");
      expect(textBox.getType().toString()).assertEqual(Type.from<GoOwnerBox021<string>>().toString());
      expect(textBox.isStatic()).assertTrue();
      expect(textBox.isReadonly()).assertFalse();
      expect(intBox.getOwnerType().getName()).assertEqual(classType.getName());
      expect(intBox.getName()).assertEqual("intBox");
      expect(intBox.getType().toString()).assertEqual(Type.from<GoOwnerBox021<int>>().toString());
      expect(intBox.isStatic()).assertFalse();
      expect(intBox.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_OWNER_TYPE_2000
     * @tc.name testGetOwnerType2000
     * @tc.desc Verify string fields keep owner type and string type text for static readonly and plain fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetOwnerType2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GoOwnerFunction022>() as ClassType;
      const mapper = classType.getFieldByName("mapper");
      const callback = classType.getFieldByName("callback");
      const action = classType.getFieldByName("action");
      expect(mapper.getOwnerType().getName()).assertEqual(classType.getName());
      expect(mapper.getName()).assertEqual("mapper");
      expect(mapper.getType().toString()).assertEqual("string");
      expect(mapper.isStatic()).assertTrue();
      expect(mapper.isReadonly()).assertFalse();
      expect(callback.getOwnerType().getName()).assertEqual(classType.getName());
      expect(callback.getName()).assertEqual("callback");
      expect(callback.getType().toString()).assertEqual("string");
      expect(callback.isStatic()).assertFalse();
      expect(callback.isReadonly()).assertTrue();
      expect(action.getOwnerType().getName()).assertEqual(classType.getName());
      expect(action.getName()).assertEqual("action");
      expect(action.getType().toString()).assertEqual("string");
      expect(action.isStatic()).assertFalse();
      expect(action.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_OWNER_TYPE_2100
     * @tc.name testGetOwnerType2100
     * @tc.desc Verify static readonly and plain fields keep exact owner type and modifier metadata
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetOwnerType2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GoOwnerModifier023>() as ClassType;
      const fixedCount = classType.getFieldByName("fixedCount");
      const mutableCount = classType.getFieldByName("mutableCount");
      const label = classType.getFieldByName("label");
      const enabled = classType.getFieldByName("enabled");
      expect(fixedCount.getOwnerType().getName()).assertEqual(classType.getName());
      expect(fixedCount.getName()).assertEqual("fixedCount");
      expect(fixedCount.getType().toString()).assertEqual("int");
      expect(fixedCount.isStatic()).assertTrue();
      expect(fixedCount.isReadonly()).assertTrue();
      expect(mutableCount.getOwnerType().getName()).assertEqual(classType.getName());
      expect(mutableCount.getName()).assertEqual("mutableCount");
      expect(mutableCount.getType().toString()).assertEqual("int");
      expect(mutableCount.isStatic()).assertTrue();
      expect(mutableCount.isReadonly()).assertFalse();
      expect(label.getOwnerType().getName()).assertEqual(classType.getName());
      expect(label.getName()).assertEqual("label");
      expect(label.getType().toString()).assertEqual("string");
      expect(label.isStatic()).assertFalse();
      expect(label.isReadonly()).assertTrue();
      expect(enabled.getOwnerType().getName()).assertEqual(classType.getName());
      expect(enabled.getName()).assertEqual("enabled");
      expect(enabled.getType().toString()).assertEqual("boolean");
      expect(enabled.isStatic()).assertFalse();
      expect(enabled.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_OWNER_TYPE_2200
     * @tc.name testGetOwnerType2200
     * @tc.desc Verify inherited instance fields resolve to the declaring parent owner type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetOwnerType2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parentType = Type.from<GoOwnerParent024>() as ClassType;
      const childType = Type.from<GoOwnerChild024>() as ClassType;
      const sharedText = childType.getFieldByName("sharedText");
      const childFlag = childType.getFieldByName("childFlag");
      expect(sharedText.getOwnerType().getName()).assertEqual(parentType.getName());
      expect(sharedText.getName()).assertEqual("sharedText");
      expect(sharedText.getType().toString()).assertEqual("string");
      expect(sharedText.isStatic()).assertFalse();
      expect(sharedText.isReadonly()).assertFalse();
      expect(childFlag.getOwnerType().getName()).assertEqual(childType.getName());
      expect(childFlag.getName()).assertEqual("childFlag");
      expect(childFlag.getType().toString()).assertEqual("boolean");
      expect(childFlag.isStatic()).assertFalse();
      expect(childFlag.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_OWNER_TYPE_2300
     * @tc.name testGetOwnerType2300
     * @tc.desc Verify hidden static fields keep distinct owner type names and type text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetOwnerType2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parentType = Type.from<GoOwnerHiddenParent025>() as ClassType;
      const childType = Type.from<GoOwnerHiddenChild025>() as ClassType;
      const parentToken = parentType.getFieldByName("token");
      const childToken = childType.getFieldByName("token");
      expect(parentToken.getName()).assertEqual(childToken.getName());
      expect(parentToken.getOwnerType().getName()).assertEqual(parentType.getName());
      expect(childToken.getOwnerType().getName()).assertEqual(childType.getName());
      expect(parentToken.getType().toString()).assertEqual("int");
      expect(childToken.getType().toString()).assertEqual("string");
      expect(parentToken.isStatic()).assertTrue();
      expect(childToken.isStatic()).assertTrue();
      expect(parentToken.isReadonly()).assertFalse();
      expect(childToken.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_OWNER_TYPE_2400
     * @tc.name testGetOwnerType2400
     * @tc.desc Verify special identifier fields keep exact owner type and modifier metadata
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetOwnerType2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GoOwnerSpecial026>() as ClassType;
      const classField = classType.getFieldByName("classField");
      const typeField = classType.getFieldByName("_type");
      const field01Test = classType.getFieldByName("field_01_test");
      expect(classField.getOwnerType().getName()).assertEqual(classType.getName());
      expect(classField.getName()).assertEqual("classField");
      expect(classField.getType().toString()).assertEqual("int");
      expect(classField.isStatic()).assertTrue();
      expect(classField.isReadonly()).assertFalse();
      expect(typeField.getOwnerType().getName()).assertEqual(classType.getName());
      expect(typeField.getName()).assertEqual("_type");
      expect(typeField.getType().toString()).assertEqual("string");
      expect(typeField.isStatic()).assertFalse();
      expect(typeField.isReadonly()).assertTrue();
      expect(field01Test.getOwnerType().getName()).assertEqual(classType.getName());
      expect(field01Test.getName()).assertEqual("field_01_test");
      expect(field01Test.getType().toString()).assertEqual("boolean");
      expect(field01Test.isStatic()).assertFalse();
      expect(field01Test.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_OWNER_TYPE_2500
     * @tc.name testGetOwnerType2500
     * @tc.desc Verify definite assignment fields keep owner type name and modifier metadata without initialization
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetOwnerType2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GoOwnerUninitialized027>() as ClassType;
      const title = classType.getFieldByName("title");
      const count = classType.getFieldByName("count");
      expect(title.getOwnerType().getName()).assertEqual(classType.getName());
      expect(title.getName()).assertEqual("title");
      expect(title.getType().toString()).assertEqual("string");
      expect(title.isStatic()).assertFalse();
      expect(title.isReadonly()).assertFalse();
      expect(count.getOwnerType().getName()).assertEqual(classType.getName());
      expect(count.getName()).assertEqual("count");
      expect(count.isStatic()).assertFalse();
      expect(count.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_OWNER_TYPE_2600
     * @tc.name testGetOwnerType2600
     * @tc.desc Verify undefined null union and optional fields keep the declaring owner type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetOwnerType2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GoOwnerNullable028>() as ClassType;
      const parA = classType.getFieldByName("parA");
      const parB = classType.getFieldByName("parB");
      const parC = classType.getFieldByName("parC");
      const parD = classType.getFieldByName("parD");
      const parE = classType.getFieldByName("parE");
      const parF = classType.getFieldByName("parF");
      const parG = classType.getFieldByName("parG");
      expect(parA.getOwnerType().getName()).assertEqual(classType.getName());
      expect(parB.getOwnerType().getName()).assertEqual(classType.getName());
      expect(parC.getOwnerType().getName()).assertEqual(classType.getName());
      expect(parD.getOwnerType().getName()).assertEqual(classType.getName());
      expect(parE.getOwnerType().getName()).assertEqual(classType.getName());
      expect(parF.getOwnerType().getName()).assertEqual(classType.getName());
      expect(parG.getOwnerType().getName()).assertEqual(classType.getName());
      expect(parF.getType().toString()).assertEqual("std.core.Array");
      expect(parG.getType().toString()).assertEqual("std.core.Array");
      expect(parF.toString()).assertEqual("parF: std.core.Array");
      expect(parG.toString()).assertEqual("parG: std.core.Array");
      expect(parA.isStatic()).assertFalse();
      expect(parE.isReadonly()).assertFalse();
    });

  });
}
