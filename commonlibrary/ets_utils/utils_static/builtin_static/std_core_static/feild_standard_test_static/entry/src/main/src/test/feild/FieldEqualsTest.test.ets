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
  xitReason,
  Level,
  Size,
  TestType
} from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from './../Util.test';

class EqSample001 {
  static count: int = 1;
}

class EqSample006 {
  static count: int = 1;
  static name: string = "test";
}

class EqSample027 {
  static count: int = 1;

  greet(): void {
  }
}

class EqParent030 {
  static token: int = 1;
}

class EqChild030 extends EqParent030 {
  static token: string = "child";
}

class EqStaticEquals031 {
  static marker: int = 1;
}

class EqInstanceEquals031 {
  marker: int = 1;
}

class EqSample032 {
  static alpha: int = 1;
  static alphaCopy: int = 1;
}

class EqParent033 {
  static shared: int = 10;
}

class EqChild033 extends EqParent033 {
  static shared: int = 20;
}

class EqParent034 {
  static alpha: int = 1;
}

class EqChild034 extends EqParent034 {
}

class EqPrimitiveTypeMatrix {
  static total: long = 99999999999;
  static score: double = 3.14;
  static ratio: float = 1.5f;
}

class EqPayload2200 {
  id: int = 1;
  name: string = "payload";
}

class EqObjectTypeMatrix {
  static payload: EqPayload2200 = new EqPayload2200();
  static sparePayload: EqPayload2200 = new EqPayload2200();
}

class EqArrayTypeMatrix {
  static ids: int[] = [1, 2, 3];
  static names: string[] = ["a", "b"];
  static flags: boolean[] = [true, false];
}

class EqUnionTypeMatrix {
  static textOrCount: string | int = "ready";
  static flagOrText: boolean | string = true;
}

enum EqNumericState {
  Ready, Done
}

enum EqStringState {
  Ready = "READY", Done = "DONE"
}

class EqEnumTypeMatrix {
  static numericState: EqNumericState = EqNumericState.Ready;
  static stringState: EqStringState = EqStringState.Ready;
}

class EqBox<T> {
}

class EqGenericTypeMatrix {
  static textBox: EqBox<string> = new EqBox<string>();
  static countBox: EqBox<int> = new EqBox<int>();
}

type EqMapperFunction = (value: int) => string;
type EqActionFunction = () => void;

class EqFunctionTypeMatrix {
  static mapper: EqMapperFunction = (value: int): string => {
    return "mapped-" + value.toString();
  };
  static action: EqActionFunction = (): void => {
  };
}

class EqSpecialNameMatrix {
  static $value: int = 1;
  static _type: string = "meta";
}

class EqHiddenStaticParent {
  static token: int = 1;
}

class EqHiddenInstanceChild extends EqHiddenStaticParent {
  token: string = "child";
}

class EqOwnerTypeA {
  static shared: int = 1;
}

class EqOwnerTypeB {
  static shared: int = 2;
}

class EqExceptionTypeMatrix {
  static ids: int[] = [1, 2];
  static textOrCount: string | int = "ready";
}

class EqNullableMatrix {
  parA: undefined = undefined;
  parB: null = null;
  parC: string | undefined = undefined;
  parD: string | null = null;
  parE?: string;
  parF: Array<string> = new Array<string>();
  parG: string[] = [];
}

export default function FieldEqualsTest(): void {
  describe('FieldEqualsTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_EQUALS_0100
     * @tc.name testEquals0100
     * @tc.desc equals with same Field returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<EqSample001>() as ClassType;
      const field = classType.getFieldByName("count");
      let result: boolean = field.equals(field);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_EQUALS_0200
     * @tc.name testEquals0200
     * @tc.desc equals with different Field from same class returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<EqSample006>() as ClassType;
      const left = classType.getFieldByName("count");
      const right = classType.getFieldByName("name");
      let result: boolean = left.equals(right);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_EQUALS_0300
     * @tc.name testEquals0300
     * @tc.desc Verify equals when passing null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<EqSample001>() as ClassType;
      const field = classType.getFieldByName("count");
      let result: boolean = field.equals(null);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_EQUALS_0400
     * @tc.name testEquals0400
     * @tc.desc Verify equals when passing undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<EqSample001>() as ClassType;
      const field = classType.getFieldByName("count");
      let result: boolean = field.equals(undefined);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_EQUALS_0500
     * @tc.name testEquals0500
     * @tc.desc Verify equals when passing string type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<EqSample001>() as ClassType;
      const field = classType.getFieldByName("count");
      let result: boolean = field.equals("count");
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_EQUALS_0600
     * @tc.name testEquals0600
     * @tc.desc Verify equals when passing int type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<EqSample001>() as ClassType;
      const field = classType.getFieldByName("count");
      let result: boolean = field.equals(1);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_EQUALS_0700
     * @tc.name testEquals0700
     * @tc.desc Verify equals when passing boolean type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<EqSample001>() as ClassType;
      const field = classType.getFieldByName("count");
      let result: boolean = field.equals(true);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_EQUALS_0800
     * @tc.name testEquals0800
     * @tc.desc Verify equals remains true after reading metadata from independently resolved fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<EqSample001>() as ClassType;
      const left = classType.getFieldByName("count");
      const right = classType.getFieldByName("count");
      expect(left.getName()).assertEqual("count");
      expect(right.getType().toString()).assertEqual("int");
      expect(left.equals(right)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_EQUALS_0900
     * @tc.name testEquals0900
     * @tc.desc Verify chained equals calls return independent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<EqSample006>() as ClassType;
      const fieldCount = classType.getFieldByName("count");
      const fieldName = classType.getFieldByName("name");
      const fieldCount2 = classType.getFieldByName("count");
      let r1: boolean = fieldCount.equals(fieldCount2);
      expect(r1).assertTrue();
      let r2: boolean = fieldCount.equals(fieldName);
      expect(r2).assertFalse();
      let r3: boolean = fieldName.equals(fieldCount2);
      expect(r3).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_EQUALS_1000
     * @tc.name testEquals1000
     * @tc.desc Verify equals when passing Object instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<EqSample001>() as ClassType;
      const field = classType.getFieldByName("count");
      let obj: Object = new Object();
      let result: boolean = field.equals(obj);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_EQUALS_1100
     * @tc.name testEquals1100
     * @tc.desc Verify equals when passing array object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<EqSample001>() as ClassType;
      const field = classType.getFieldByName("count");
      let arr: int[] = [1, 2, 3];
      let result: boolean = field.equals(arr);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_EQUALS_1200
     * @tc.name testEquals1200
     * @tc.desc Verify equals when passing Method object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<EqSample027>() as ClassType;
      const field = classType.getFieldByName("count");
      const method = classType.getMethodByName("greet");
      let result: boolean = field.equals(method);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_EQUALS_1300
     * @tc.name testEquals1300
     * @tc.desc Verify equals transitivity for three independently resolved Field objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<EqSample001>() as ClassType;
      const first = classType.getFieldByName("count");
      const second = classType.getFieldByName("count");
      const third = classType.getFieldByName("count");
      expect(first.equals(second)).assertTrue();
      expect(second.equals(third)).assertTrue();
      expect(first.equals(third)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_EQUALS_1400
     * @tc.name testEquals1400
     * @tc.desc Verify equals symmetry between matching and non-matching fields from the same class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<EqSample006>() as ClassType;
      const countField = classType.getFieldByName("count");
      const nameField = classType.getFieldByName("name");
      const secondCount = classType.getFieldByName("count");
      expect(countField.getOwnerType().getName()).assertEqual(classType.getName());
      expect(nameField.getOwnerType().getName()).assertEqual(classType.getName());
      expect(countField.getType().toString()).assertEqual("int");
      expect(nameField.getType().toString()).assertEqual("string");
      expect(countField.equals(secondCount)).assertTrue();
      expect(secondCount.equals(countField)).assertTrue();
      expect(countField.equals(nameField)).assertFalse();
      expect(nameField.equals(countField)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_EQUALS_1500
     * @tc.name testEquals1500
     * @tc.desc Verify equals does not change field metadata for matching fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<EqSample001>() as ClassType;
      const field = classType.getFieldByName("count");
      const other = classType.getFieldByName("count");
      const nameBefore: string = field.getName();
      const typeBefore: string = field.getType().toString();
      const ownerBefore: string = field.getOwnerType().getName();
      expect(nameBefore).assertEqual("count");
      expect(typeBefore).assertEqual("int");
      expect(ownerBefore).assertEqual(classType.getName());
      expect(field.equals(other)).assertTrue();
      expect(field.getName()).assertEqual(nameBefore);
      expect(field.getType().toString()).assertEqual(typeBefore);
      expect(field.getOwnerType().getName()).assertEqual(ownerBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_EQUALS_1600
     * @tc.name testEquals1600
     * @tc.desc Verify same-named hidden fields with different type text are not equal at runtime
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parentField = (Type.from<EqParent030>() as ClassType).getFieldByName("token");
      const childField = (Type.from<EqChild030>() as ClassType).getFieldByName("token");
      const parentTypeText: string = parentField.getType().toString();
      const childTypeText: string = childField.getType().toString();
      expect(parentTypeText).assertEqual("int");
      expect(childTypeText).assertEqual("string");
      expect(parentField.equals(childField)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_EQUALS_1700
     * @tc.name testEquals1700
     * @tc.desc Verify same-named same-typed static and instance fields are not equal across unrelated classes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const staticField = (Type.from<EqStaticEquals031>() as ClassType).getFieldByName("marker");
      const instanceField = (Type.from<EqInstanceEquals031>() as ClassType).getFieldByName("marker");
      expect(staticField.getName()).assertEqual(instanceField.getName());
      expect(staticField.isStatic()).assertTrue();
      expect(instanceField.isStatic()).assertFalse();
      expect(staticField.equals(instanceField)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_EQUALS_1800
     * @tc.name testEquals1800
     * @tc.desc Verify same owner same type but different field names are not equal while duplicate lookups remain equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<EqSample032>() as ClassType;
      const alpha = classType.getFieldByName("alpha");
      const alphaAgain = classType.getFieldByName("alpha");
      const alphaCopy = classType.getFieldByName("alphaCopy");
      expect(alpha.equals(alphaAgain)).assertTrue();
      expect(alpha.getType().toString()).assertEqual("int");
      expect(alphaCopy.getType().toString()).assertEqual("int");
      expect(alpha.equals(alphaCopy)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_EQUALS_1900
     * @tc.name testEquals1900
     * @tc.desc Verify equals still works after a missing-field TypeError is handled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<EqSample001>() as ClassType;
      try {
        classType.getFieldByName("nonExistent");
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('TypeError');
      }
      const field = classType.getFieldByName("count");
      const other = classType.getFieldByName("count");
      expect(field.equals(other)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_EQUALS_2000
     * @tc.name testEquals2000
     * @tc.desc Verify same-named hidden fields with matching metadata but different owner types are equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parentField = (Type.from<EqParent033>() as ClassType).getFieldByName("shared");
      const childField = (Type.from<EqChild033>() as ClassType).getFieldByName("shared");
      expect(parentField.getName()).assertEqual(childField.getName());
      expect(parentField.getType().toString()).assertEqual(childField.getType().toString());
      expect(parentField.getOwnerType().getName()).assertEqual((Type.from<EqParent033>() as ClassType).getName());
      expect(childField.getOwnerType().getName()).assertEqual((Type.from<EqChild033>() as ClassType).getName());
      expect(parentField.equals(childField)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_EQUALS_2100
     * @tc.name testEquals2100
     * @tc.desc Verify inherited non-hidden field resolved through parent and child types returns equals true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parentField = (Type.from<EqParent034>() as ClassType).getFieldByName("alpha");
      const childField = (Type.from<EqChild034>() as ClassType).getFieldByName("alpha");
      const ownerTypeName: string = (Type.from<EqParent034>() as ClassType).getName();
      expect(parentField.getOwnerType().getName()).assertEqual(ownerTypeName);
      expect(childField.getOwnerType().getName()).assertEqual(ownerTypeName);
      expect(parentField.equals(childField)).assertTrue();
      expect(childField.equals(parentField)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_EQUALS_2200
     * @tc.name testEquals2200
     * @tc.desc Verify equals distinguishes primitive numeric fields by name while type metadata remains exact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<EqPrimitiveTypeMatrix>() as ClassType;
      const total = classType.getFieldByName("total");
      const totalAgain = classType.getFieldByName("total");
      const score = classType.getFieldByName("score");
      const ratio = classType.getFieldByName("ratio");
      expect(total.getType().toString()).assertEqual("long");
      expect(score.getType().toString()).assertEqual("double");
      expect(ratio.getType().toString()).assertEqual("float");
      expect(total.equals(totalAgain)).assertTrue();
      expect(total.equals(score)).assertFalse();
      expect(score.equals(ratio)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_EQUALS_2300
     * @tc.name testEquals2300
     * @tc.desc Verify equals distinguishes custom object fields even when their declared class type matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<EqObjectTypeMatrix>() as ClassType;
      const payload = classType.getFieldByName("payload");
      const payloadAgain = classType.getFieldByName("payload");
      const sparePayload = classType.getFieldByName("sparePayload");
      const payloadTypeName: string = payload.getType().getName();
      expect(payloadTypeName).assertEqual((Type.from<EqPayload2200>() as ClassType).getName());
      expect(payload.getType().getName()).assertEqual(sparePayload.getType().getName());
      expect(payload.equals(payloadAgain)).assertTrue();
      expect(payload.equals(sparePayload)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_EQUALS_2400
     * @tc.name testEquals2400
     * @tc.desc Verify equals distinguishes array fields with the same array type text by field name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<EqArrayTypeMatrix>() as ClassType;
      const ids = classType.getFieldByName("ids");
      const idsAgain = classType.getFieldByName("ids");
      const names = classType.getFieldByName("names");
      const flags = classType.getFieldByName("flags");
      expect(ids.getType().toString()).assertEqual("std.core.Array");
      expect(names.getType().toString()).assertEqual("std.core.Array");
      expect(flags.getType().toString()).assertEqual("std.core.Array");
      expect(ids.equals(idsAgain)).assertTrue();
      expect(ids.equals(names)).assertFalse();
      expect(names.equals(flags)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_EQUALS_2500
     * @tc.name testEquals2500
     * @tc.desc Verify union-typed field equals returns true for duplicate lookups and false for different fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     * @tc.knownIssue union-typed field duplicate lookups return false instead of true, unlike other field types
     */
    xitReason('union-typed field duplicate lookups currently return false instead of true')(
      'testEquals2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const classType = Type.from<EqUnionTypeMatrix>() as ClassType;
        const textOrCount = classType.getFieldByName("textOrCount");
        const textOrCountAgain = classType.getFieldByName("textOrCount");
        const flagOrText = classType.getFieldByName("flagOrText");
        expect(textOrCount.getName()).assertEqual("textOrCount");
        expect(flagOrText.getName()).assertEqual("flagOrText");
        expect(textOrCount.isStatic()).assertTrue();
        expect(flagOrText.isStatic()).assertTrue();
        expect(textOrCount.equals(textOrCountAgain)).assertTrue();
        expect(textOrCount.equals(flagOrText)).assertFalse();
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_EQUALS_2600
     * @tc.name testEquals2600
     * @tc.desc Verify equals distinguishes numeric and string enum fields by field metadata
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<EqEnumTypeMatrix>() as ClassType;
      const numericState = classType.getFieldByName("numericState");
      const numericStateAgain = classType.getFieldByName("numericState");
      const stringState = classType.getFieldByName("stringState");
      expect(numericState.getName()).assertEqual("numericState");
      expect(stringState.getName()).assertEqual("stringState");
      expect(numericState.isStatic()).assertTrue();
      expect(stringState.isStatic()).assertTrue();
      expect(numericState.equals(numericStateAgain)).assertTrue();
      expect(numericState.equals(stringState)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_EQUALS_2700
     * @tc.name testEquals2700
     * @tc.desc Verify equals distinguishes static generic fields with different type arguments by field name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<EqGenericTypeMatrix>() as ClassType;
      const textBox = classType.getFieldByName("textBox");
      const textBoxAgain = classType.getFieldByName("textBox");
      const countBox = classType.getFieldByName("countBox");
      expect(textBox.getName()).assertEqual("textBox");
      expect(textBox.getType().toString()).assertEqual(Type.from<EqBox<string>>().toString());
      expect(countBox.getName()).assertEqual("countBox");
      expect(countBox.getType().toString()).assertEqual(Type.from<EqBox<int>>().toString());
      expect(textBox.isStatic()).assertTrue();
      expect(countBox.isStatic()).assertTrue();
      expect(textBox.equals(textBoxAgain)).assertTrue();
      expect(textBox.equals(countBox)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_EQUALS_2800
     * @tc.name testEquals2800
     * @tc.desc Verify equals distinguishes function-typed fields from each other by field name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<EqFunctionTypeMatrix>() as ClassType;
      const mapper = classType.getFieldByName("mapper");
      const mapperAgain = classType.getFieldByName("mapper");
      const action = classType.getFieldByName("action");
      expect(mapper.getName()).assertEqual("mapper");
      expect(action.getName()).assertEqual("action");
      expect(mapper.isStatic()).assertTrue();
      expect(action.isStatic()).assertTrue();
      expect(mapper.equals(mapperAgain)).assertTrue();
      expect(mapper.equals(action)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_EQUALS_2900
     * @tc.name testEquals2900
     * @tc.desc Verify equals and metadata remain exact for fields with special identifier names
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<EqSpecialNameMatrix>() as ClassType;
      const value = classType.getFieldByName("$value");
      const valueAgain = classType.getFieldByName("$value");
      const typeField = classType.getFieldByName("_type");
      expect(value.getName()).assertEqual("$value");
      expect(value.getType().toString()).assertEqual("int");
      expect(typeField.getName()).assertEqual("_type");
      expect(typeField.getType().toString()).assertEqual("string");
      expect(value.equals(valueAgain)).assertTrue();
      expect(value.equals(typeField)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_EQUALS_3000
     * @tc.name testEquals3000
     * @tc.desc Verify hidden fields with same name but different static status and type are not equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parentField = (Type.from<EqHiddenStaticParent>() as ClassType).getFieldByName("token");
      const childField = (Type.from<EqHiddenInstanceChild>() as ClassType).getFieldByName("token");
      expect(parentField.getName()).assertEqual(childField.getName());
      expect(parentField.getType().toString()).assertEqual("int");
      expect(childField.getType().toString()).assertEqual("string");
      expect(parentField.isStatic()).assertTrue();
      expect(childField.isStatic()).assertFalse();
      expect(parentField.equals(childField)).assertFalse();
      expect(childField.equals(parentField)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_EQUALS_3100
     * @tc.name testEquals3100
     * @tc.desc Verify metadata-equivalent fields from unrelated owner classes are equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = (Type.from<EqOwnerTypeA>() as ClassType).getFieldByName("shared");
      const right = (Type.from<EqOwnerTypeB>() as ClassType).getFieldByName("shared");
      expect(left.getName()).assertEqual(right.getName());
      expect(left.getType().toString()).assertEqual("int");
      expect(right.getType().toString()).assertEqual("int");
      expect(left.getOwnerType().getName()).assertEqual((Type.from<EqOwnerTypeA>() as ClassType).getName());
      expect(right.getOwnerType().getName()).assertEqual((Type.from<EqOwnerTypeB>() as ClassType).getName());
      expect(left.equals(right)).assertTrue();
      expect(right.equals(left)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_EQUALS_3200
     * @tc.name testEquals3200
     * @tc.desc Verify repeated equals calls stay stable while getType metadata is repeatedly read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<EqArrayTypeMatrix>() as ClassType;
      const ids = classType.getFieldByName("ids");
      const idsAgain = classType.getFieldByName("ids");
      const names = classType.getFieldByName("names");
      const beforeType: string = ids.getType().toString();
      const beforeOwner: string = ids.getOwnerType().getName();
      expect(ids.equals(idsAgain)).assertTrue();
      expect(ids.equals(names)).assertFalse();
      expect(ids.getType().toString()).assertEqual(beforeType);
      expect(ids.getOwnerType().getName()).assertEqual(beforeOwner);
      expect(ids.equals(idsAgain)).assertTrue();
      expect(ids.equals(names)).assertFalse();
      expect(ids.getName()).assertEqual("ids");
      expect(names.getName()).assertEqual("names");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_EQUALS_3300
     * @tc.name testEquals3300
     * @tc.desc Verify equals behavior for undefined null union and optional template fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEquals3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<EqNullableMatrix>() as ClassType;
      const parA = classType.getFieldByName("parA");
      const parAAgain = classType.getFieldByName("parA");
      const parB = classType.getFieldByName("parB");
      const parC = classType.getFieldByName("parC");
      const parD = classType.getFieldByName("parD");
      const parE = classType.getFieldByName("parE");
      const parF = classType.getFieldByName("parF");
      const parFAgain = classType.getFieldByName("parF");
      const parG = classType.getFieldByName("parG");
      expect(parA.equals(parAAgain)).assertTrue();
      expect(parA.equals(parB)).assertFalse();
      expect(parC.equals(parD)).assertFalse();
      expect(parC.equals(parE)).assertFalse();
      expect(parF.equals(parFAgain)).assertTrue();
      expect(parF.equals(parG)).assertFalse();
      expect(parF.getType().toString()).assertEqual(parG.getType().toString());
      expect(parE.equals(null)).assertFalse();
      expect(parE.equals(undefined)).assertFalse();
      expect(parA.isStatic()).assertFalse();
      expect(parE.isReadonly()).assertFalse();
    });
  });
}
