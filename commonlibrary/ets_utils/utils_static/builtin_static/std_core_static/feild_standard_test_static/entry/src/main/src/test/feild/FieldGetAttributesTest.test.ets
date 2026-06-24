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

class GxSample001 {
  static count: int = 1;
}

class GxSample005 {
  name: string = "test";
}

class GxSample008 {
  static staticField: int = 10;
  instanceField: int = 20;
}

class GxSample009 {
  readonly fixedValue: int = 100;
}

class GxSample012 {
  intField: int = 0;
  strField: string = "";
  boolField: boolean = false;
}

class GxSample016 {
  static readonly fixedCount: int = 1;
}

class GxSample020 {
  static readonly fixed: int = 1;
  static mutable: int = 2;
  plain: int = 3;
}

class GxAttrNumeric021 {
  static longValue: long = 99999999999;
  static doubleValue: double = 3.14;
  static floatValue: float = 1.5f;
}

class GxAttrArray022 {
  static intValues: int[] = [1, 2, 3];
  textValues: string[] = ["a", "b"];
}

class GxAttrInner023 {
}

class GxAttrObject023 {
  static staticInner: GxAttrInner023 = new GxAttrInner023();
  plainInner: GxAttrInner023 = new GxAttrInner023();
}

enum GxAttrColor024 {
  Red, Blue
}

enum GxAttrState024 {
  Ready = "ready", Done = "done"
}

class GxAttrEnum024 {
  static color: GxAttrColor024 = GxAttrColor024.Red;
  state: GxAttrState024 = GxAttrState024.Ready;
}

class GxAttrBox025<T> {
  value: T;

  constructor(value: T) {
    this.value = value;
  }
}

class GxAttrGeneric025 {
  static stringBox: GxAttrBox025<string> = new GxAttrBox025<string>("box");
  intBox: GxAttrBox025<int> = new GxAttrBox025<int>(1);
}

type GxAttrTransformer026 = (value: int) => string;

function gxAttrTransform026(value: int): string {
  if (value > 0) {
    return "positive";
  }
  return "zero";
}

class GxAttrFunction026 {
  static formatter: GxAttrTransformer026 = gxAttrTransform026;
  readonly callback: string = "cb";
}

class GxAttrParent027 {
  static token: int = 1;
  static parentOnly: int = 2;
}

class GxAttrChild027 extends GxAttrParent027 {
  static token: string = "child";
}

class GxAttrNames028 {
  static $result: int = 1;
  readonly _inner_value: string = "inner";
  field_01_test: boolean = true;
}

class GxAttrMatrix029 {
  static readonly staticCode: string = "A";
  static mutableCode: string = "B";
  readonly readonlyLabel: string = "C";
  plainLabel: string = "D";
}

class GxAttrMap030 {
  static scores: Map<string, int> = new Map<string, int>();
  names: Array<string> = new Array<string>();
}

class GxAttrEmpty031 {
}

class GxAttrNullable032 {
  parA: undefined = undefined;
  parB: null = null;
  parC: string | undefined = undefined;
  parD: string | null = null;
  parE?: string;
  parF: Array<string> = new Array<string>();
  parG: string[] = [];
}

export default function FieldGetAttributesTest(): void {
  describe('FieldGetAttributesTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_ATTRIBUTES_0100
     * @tc.name testGetAttributes0100
     * @tc.desc Verify getAttributes called with no arguments returns int value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetAttributes0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<GxSample001>() as ClassType).getFieldByName("count");
      const attrs: int = field.getAttributes();
      const sameStaticAttrs: int =
        (Type.from<GxSample008>() as ClassType).getFieldByName("staticField").getAttributes();
      const instanceAttrs: int = (Type.from<GxSample005>() as ClassType).getFieldByName("name").getAttributes();
      expect(attrs).assertEqual(sameStaticAttrs);
      expect(attrs === instanceAttrs).assertFalse();
      expect(field.isStatic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_ATTRIBUTES_0200
     * @tc.name testGetAttributes0200
     * @tc.desc Verify getAttributes returns consistent value on repeated calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetAttributes0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<GxSample001>() as ClassType).getFieldByName("count");
      const attrs1: int = field.getAttributes();
      const attrs2: int = field.getAttributes();
      const sameStaticAttrs: int =
        (Type.from<GxSample008>() as ClassType).getFieldByName("staticField").getAttributes();
      expect(attrs1).assertEqual(attrs2);
      expect(attrs1).assertEqual(sameStaticAttrs);
      expect(field.getType().toString()).assertEqual("int");
      expect(field.isStatic()).assertTrue();
      expect(field.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_ATTRIBUTES_0300
     * @tc.name testGetAttributes0300
     * @tc.desc Verify getAttributes remains stable after reading field metadata
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetAttributes0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<GxSample001>() as ClassType).getFieldByName("count");
      const attrs: int = field.getAttributes();
      expect(field.getName()).assertEqual("count");
      expect(field.isStatic()).assertTrue();
      expect(attrs).assertEqual(field.getAttributes());
      expect(attrs).assertEqual((Type.from<GxSample008>() as ClassType).getFieldByName("staticField").getAttributes());
      expect(attrs === (Type.from<GxSample008>() as ClassType).getFieldByName("instanceField").getAttributes())
        .assertFalse();
      expect(attrs === (Type.from<GxSample009>() as ClassType).getFieldByName("fixedValue").getAttributes())
        .assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_ATTRIBUTES_0400
     * @tc.name testGetAttributes0400
     * @tc.desc Verify getAttributes returns attribute bits for instance field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetAttributes0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<GxSample005>() as ClassType).getFieldByName("name");
      const attrs: int = field.getAttributes();
      const sameInstanceAttrs: int =
        (Type.from<GxSample008>() as ClassType).getFieldByName("instanceField").getAttributes();
      expect(field.isStatic()).assertFalse();
      expect(attrs).assertEqual(sameInstanceAttrs);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_ATTRIBUTES_0500
     * @tc.name testGetAttributes0500
     * @tc.desc Verify getAttributes stays unchanged after toString reads
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetAttributes0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<GxSample001>() as ClassType).getFieldByName("count");
      const attrs: int = field.getAttributes();
      expect(field.toString()).assertEqual("count: int");
      expect(field.getAttributes()).assertEqual(attrs);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_ATTRIBUTES_0600
     * @tc.name testGetAttributes0600
     * @tc.desc Verify attribute bits differ between static and instance fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetAttributes0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const staticFieldObj = (Type.from<GxSample008>() as ClassType).getFieldByName("staticField");
      const instanceFieldObj = (Type.from<GxSample008>() as ClassType).getFieldByName("instanceField");
      const staticAttrs: int = staticFieldObj.getAttributes();
      const instanceAttrs: int = instanceFieldObj.getAttributes();
      const staticBaselineAttrs: int = (Type.from<GxSample001>() as ClassType).getFieldByName("count").getAttributes();
      const instanceBaselineAttrs: int = (Type.from<GxSample005>() as ClassType).getFieldByName("name").getAttributes();
      expect(staticFieldObj.getName()).assertEqual("staticField");
      expect(instanceFieldObj.getName()).assertEqual("instanceField");
      expect(staticFieldObj.isStatic()).assertTrue();
      expect(instanceFieldObj.isStatic()).assertFalse();
      expect(staticAttrs).assertEqual(staticBaselineAttrs);
      expect(instanceAttrs).assertEqual(instanceBaselineAttrs);
      expect(staticAttrs !== instanceAttrs).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_ATTRIBUTES_0700
     * @tc.name testGetAttributes0700
     * @tc.desc Verify getAttributes distinguishes readonly field attributes from plain field attributes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetAttributes0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<GxSample009>() as ClassType).getFieldByName("fixedValue");
      const attrs: int = field.getAttributes();
      const plainAttrs: int = (Type.from<GxSample012>() as ClassType).getFieldByName("intField").getAttributes();
      const readonlyBaselineAttrs: int =
        (Type.from<GxAttrMatrix029>() as ClassType).getFieldByName("readonlyLabel").getAttributes();
      const plainBaselineAttrs: int =
        (Type.from<GxAttrMatrix029>() as ClassType).getFieldByName("plainLabel").getAttributes();
      expect(field.getName()).assertEqual("fixedValue");
      expect(field.isStatic()).assertFalse();
      expect(field.isReadonly()).assertTrue();
      expect(attrs).assertEqual(readonlyBaselineAttrs);
      expect(plainAttrs).assertEqual(plainBaselineAttrs);
      expect(attrs === plainAttrs).assertFalse();
      expect(field.getAttributes()).assertEqual(attrs);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_ATTRIBUTES_0800
     * @tc.name testGetAttributes0800
     * @tc.desc Verify getAttributes returns attribute bits for fields of different types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetAttributes0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GxSample012>() as ClassType;
      const intAttrs: int = classType.getFieldByName("intField").getAttributes();
      const strAttrs: int = classType.getFieldByName("strField").getAttributes();
      const boolAttrs: int = classType.getFieldByName("boolField").getAttributes();
      expect(intAttrs).assertEqual(strAttrs);
      expect(intAttrs).assertEqual(boolAttrs);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_ATTRIBUTES_0900
     * @tc.name testGetAttributes0900
     * @tc.desc Verify missing field lookup throws TypeError and valid getAttributes remains stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetAttributes0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GxSample001>() as ClassType;
      try {
        classType.getFieldByName("nonExistentField");
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('TypeError');
      }
      const field = classType.getFieldByName("count");
      const attrs: int = field.getAttributes();
      const sameStaticAttrs: int =
        (Type.from<GxSample008>() as ClassType).getFieldByName("staticField").getAttributes();
      expect(field.getName()).assertEqual("count");
      expect(field.isStatic()).assertTrue();
      expect(attrs).assertEqual(sameStaticAttrs);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_ATTRIBUTES_1000
     * @tc.name testGetAttributes1000
     * @tc.desc Verify getAttributes remains stable when combined with isStatic on static and instance fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetAttributes1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GxSample008>() as ClassType;
      const staticField = classType.getFieldByName("staticField");
      const instanceField = classType.getFieldByName("instanceField");
      const staticAttrs: int = staticField.getAttributes();
      const instanceAttrs: int = instanceField.getAttributes();
      expect(staticAttrs).assertEqual(staticField.getAttributes());
      expect(instanceAttrs).assertEqual(instanceField.getAttributes());
      expect(staticField.isStatic()).assertTrue();
      expect(instanceField.isStatic()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_ATTRIBUTES_1100
     * @tc.name testGetAttributes1100
     * @tc.desc Verify getAttributes remains independent from getName and getType calls on one Field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetAttributes1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<GxSample012>() as ClassType).getFieldByName("boolField");
      const beforeAttrs: int = field.getAttributes();
      expect(field.getName()).assertEqual("boolField");
      expect(field.getType().toString()).assertEqual("boolean");
      const afterAttrs: int = field.getAttributes();
      expect(afterAttrs).assertEqual(beforeAttrs);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_ATTRIBUTES_1200
     * @tc.name testGetAttributes1200
     * @tc.desc Verify attributes for static, readonly, and plain fields stay isolated across alternating reads
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetAttributes1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const staticField = (Type.from<GxSample008>() as ClassType).getFieldByName("staticField");
      const readonlyField = (Type.from<GxSample009>() as ClassType).getFieldByName("fixedValue");
      const plainField = (Type.from<GxSample012>() as ClassType).getFieldByName("intField");
      const staticAttrs: int = staticField.getAttributes();
      const readonlyAttrs: int = readonlyField.getAttributes();
      const plainAttrs: int = plainField.getAttributes();
      const expectedStaticAttrs: int = (Type.from<GxSample001>() as ClassType).getFieldByName("count").getAttributes();
      const expectedReadonlyAttrs: int =
        (Type.from<GxAttrMatrix029>() as ClassType).getFieldByName("readonlyLabel").getAttributes();
      const expectedPlainAttrs: int =
        (Type.from<GxAttrMatrix029>() as ClassType).getFieldByName("plainLabel").getAttributes();
      expect(staticField.isStatic()).assertTrue();
      expect(staticField.isReadonly()).assertFalse();
      expect(readonlyField.isReadonly()).assertTrue();
      expect(plainField.isStatic()).assertFalse();
      expect(plainField.isReadonly()).assertFalse();
      expect(staticAttrs).assertEqual(expectedStaticAttrs);
      expect(readonlyAttrs).assertEqual(expectedReadonlyAttrs);
      expect(plainAttrs).assertEqual(expectedPlainAttrs);
      expect(staticAttrs === readonlyAttrs).assertFalse();
      expect(staticAttrs === plainAttrs).assertFalse();
      expect(readonlyAttrs === plainAttrs).assertFalse();
      expect(staticField.getAttributes()).assertEqual(staticAttrs);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_ATTRIBUTES_1300
     * @tc.name testGetAttributes1300
     * @tc.desc Verify attributes remain stable while access modifier static readonly and type metadata are interleaved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetAttributes1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<GxSample016>() as ClassType).getFieldByName("fixedCount");
      const before: int = field.getAttributes();
      const publicModifier: int = (Type.from<GxSample001>() as ClassType).getFieldByName("count").getAccessModifier();
      expect(field.getType().toString()).assertEqual("int");
      expect(field.isStatic()).assertTrue();
      expect(field.isReadonly()).assertTrue();
      expect(field.getAccessModifier()).assertEqual(publicModifier);
      expect(field.getAttributes()).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_ATTRIBUTES_1400
     * @tc.name testGetAttributes1400
     * @tc.desc Verify attributes distinguish static readonly static mutable and plain fields without disturbing predicates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetAttributes1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GxSample020>() as ClassType;
      const fixed = classType.getFieldByName("fixed");
      const mutable = classType.getFieldByName("mutable");
      const plain = classType.getFieldByName("plain");
      const fixedAttrs: int = fixed.getAttributes();
      const mutableAttrs: int = mutable.getAttributes();
      const plainAttrs: int = plain.getAttributes();
      expect(fixed.isStatic() && fixed.isReadonly()).assertTrue();
      expect(mutable.isReadonly()).assertFalse();
      expect(plain.isStatic()).assertFalse();
      expect(fixedAttrs === mutableAttrs).assertFalse();
      expect(mutableAttrs === plainAttrs).assertFalse();
      expect(fixedAttrs === plainAttrs).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_ATTRIBUTES_1500
     * @tc.name testGetAttributes1500
     * @tc.desc Verify attributes are stable after alternating predicate and string reads across one class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetAttributes1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GxSample020>() as ClassType;
      const fixed = classType.getFieldByName("fixed");
      const mutable = classType.getFieldByName("mutable");
      const fixedAttrs: int = fixed.getAttributes();
      const mutableAttrs: int = mutable.getAttributes();
      expect(fixed.getName()).assertEqual("fixed");
      expect(mutable.isStatic()).assertTrue();
      expect(fixed.getAttributes()).assertEqual(fixedAttrs);
      expect(mutable.getAttributes()).assertEqual(mutableAttrs);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_ATTRIBUTES_1600
     * @tc.name testGetAttributes1600
     * @tc.desc Verify getAttributes composes with static readonly access modifier and toString reads
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetAttributes1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GxSample020>() as ClassType;
      const fixed = classType.getFieldByName("fixed");
      const attrs: int = fixed.getAttributes();
      const publicModifier: int = (Type.from<GxSample001>() as ClassType).getFieldByName("count").getAccessModifier();
      expect(fixed.isStatic()).assertTrue();
      expect(fixed.isReadonly()).assertTrue();
      expect(fixed.getAccessModifier()).assertEqual(publicModifier);
      expect(fixed.toString()).assertEqual("fixed: int");
      expect(fixed.getAttributes()).assertEqual(attrs);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_ATTRIBUTES_1700
     * @tc.name testGetAttributes1700
     * @tc.desc Verify attributes stay unchanged after a setStaticValue mutation cycle on a mutable static field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetAttributes1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<GxSample020>() as ClassType).getFieldByName("mutable");
      const beforeAttrs: int = field.getAttributes();
      const original = GxSample020.mutable;
      try {
        field.setStaticValue(99);
        expect(GxSample020.mutable).assertEqual(99);
        expect(field.getAttributes()).assertEqual(beforeAttrs);
      } finally {
        field.setStaticValue(original);
      }
      expect(field.getAttributes()).assertEqual(beforeAttrs);
      expect(GxSample020.mutable).assertEqual(original);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_ATTRIBUTES_1800
     * @tc.name testGetAttributes1800
     * @tc.desc Verify attributes remain stable after getStaticValue read on a static field without mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetAttributes1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<GxSample016>() as ClassType).getFieldByName("fixedCount");
      const before: int = field.getAttributes();
      field.getStaticValue();
      expect(field.isStatic()).assertTrue();
      expect(field.getAttributes()).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_ATTRIBUTES_1900
     * @tc.name testGetAttributes1900
     * @tc.desc Verify static numeric fields of long double and float types share static attributes with int field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetAttributes1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GxAttrNumeric021>() as ClassType;
      const longField = classType.getFieldByName("longValue");
      const doubleField = classType.getFieldByName("doubleValue");
      const floatField = classType.getFieldByName("floatValue");
      const staticAttrs: int = (Type.from<GxSample001>() as ClassType).getFieldByName("count").getAttributes();
      expect(longField.getName()).assertEqual("longValue");
      expect(longField.getType().toString()).assertEqual("long");
      expect(doubleField.getType().toString()).assertEqual("double");
      expect(floatField.getType().toString()).assertEqual("float");
      expect(longField.isStatic()).assertTrue();
      expect(longField.isReadonly()).assertFalse();
      expect(longField.getAttributes()).assertEqual(staticAttrs);
      expect(doubleField.getAttributes()).assertEqual(staticAttrs);
      expect(floatField.getAttributes()).assertEqual(staticAttrs);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_ATTRIBUTES_2000
     * @tc.name testGetAttributes2000
     * @tc.desc Verify array field attributes follow static or instance modifiers while getType reports Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetAttributes2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GxAttrArray022>() as ClassType;
      const staticArray = classType.getFieldByName("intValues");
      const instanceArray = classType.getFieldByName("textValues");
      const staticAttrs: int = (Type.from<GxSample001>() as ClassType).getFieldByName("count").getAttributes();
      const plainAttrs: int = (Type.from<GxSample012>() as ClassType).getFieldByName("strField").getAttributes();
      expect(staticArray.getType().toString()).assertEqual("std.core.Array");
      expect(instanceArray.getType().toString()).assertEqual("std.core.Array");
      expect(staticArray.getName()).assertEqual("intValues");
      expect(instanceArray.getName()).assertEqual("textValues");
      expect(staticArray.isStatic()).assertTrue();
      expect(instanceArray.isStatic()).assertFalse();
      expect(staticArray.getAttributes()).assertEqual(staticAttrs);
      expect(instanceArray.getAttributes()).assertEqual(plainAttrs);
      expect(staticArray.getAttributes() === instanceArray.getAttributes()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_ATTRIBUTES_2100
     * @tc.name testGetAttributes2100
     * @tc.desc Verify custom class typed fields keep attributes separated by static and instance modifiers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetAttributes2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GxAttrObject023>() as ClassType;
      const staticInner = classType.getFieldByName("staticInner");
      const plainInner = classType.getFieldByName("plainInner");
      const staticAttrs: int = (Type.from<GxSample008>() as ClassType).getFieldByName("staticField").getAttributes();
      const plainAttrs: int = (Type.from<GxSample012>() as ClassType).getFieldByName("intField").getAttributes();
      const innerName: string = (Type.from<GxAttrInner023>() as ClassType).getName();
      expect(staticInner.getType().getName()).assertEqual(innerName);
      expect(plainInner.getType().getName()).assertEqual(innerName);
      expect(staticInner.getName()).assertEqual("staticInner");
      expect(plainInner.getName()).assertEqual("plainInner");
      expect(staticInner.isStatic()).assertTrue();
      expect(plainInner.isStatic()).assertFalse();
      expect(staticInner.getAttributes()).assertEqual(staticAttrs);
      expect(plainInner.getAttributes()).assertEqual(plainAttrs);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_ATTRIBUTES_2200
     * @tc.name testGetAttributes2200
     * @tc.desc Verify enum typed fields keep attributes according to static and instance declarations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetAttributes2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GxAttrEnum024>() as ClassType;
      const color = classType.getFieldByName("color");
      const state = classType.getFieldByName("state");
      const staticAttrs: int = (Type.from<GxSample001>() as ClassType).getFieldByName("count").getAttributes();
      const plainAttrs: int = (Type.from<GxSample012>() as ClassType).getFieldByName("boolField").getAttributes();
      expect(color.getName()).assertEqual("color");
      expect(state.getName()).assertEqual("state");
      expect(color.toString()).assertEqual("color: " + color.getType().toString());
      expect(state.toString()).assertEqual("state: " + state.getType().toString());
      expect(color.isStatic()).assertTrue();
      expect(state.isStatic()).assertFalse();
      expect(color.isReadonly()).assertFalse();
      expect(state.isReadonly()).assertFalse();
      expect(color.getAttributes()).assertEqual(staticAttrs);
      expect(state.getAttributes()).assertEqual(plainAttrs);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_ATTRIBUTES_2300
     * @tc.name testGetAttributes2300
     * @tc.desc Verify generic class instance field attributes remain tied to declaration modifiers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetAttributes2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GxAttrGeneric025>() as ClassType;
      const stringBox = classType.getFieldByName("stringBox");
      const intBox = classType.getFieldByName("intBox");
      const staticAttrs: int = (Type.from<GxSample008>() as ClassType).getFieldByName("staticField").getAttributes();
      const plainAttrs: int = (Type.from<GxSample012>() as ClassType).getFieldByName("intField").getAttributes();
      expect(stringBox.getName()).assertEqual("stringBox");
      expect(intBox.getName()).assertEqual("intBox");
      expect(stringBox.toString()).assertEqual("stringBox: " + stringBox.getType().toString());
      expect(intBox.toString()).assertEqual("intBox: " + intBox.getType().toString());
      expect(stringBox.isStatic()).assertTrue();
      expect(intBox.isStatic()).assertFalse();
      expect(stringBox.isReadonly()).assertFalse();
      expect(intBox.isReadonly()).assertFalse();
      expect(stringBox.getAttributes()).assertEqual(staticAttrs);
      expect(intBox.getAttributes()).assertEqual(plainAttrs);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_ATTRIBUTES_2400
     * @tc.name testGetAttributes2400
     * @tc.desc Verify Function typed fields combine type metadata with static and readonly attribute bits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetAttributes2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GxAttrFunction026>() as ClassType;
      const formatter = classType.getFieldByName("formatter");
      const callback = classType.getFieldByName("callback");
      const staticAttrs: int = (Type.from<GxSample001>() as ClassType).getFieldByName("count").getAttributes();
      const readonlyAttrs: int = (Type.from<GxSample009>() as ClassType).getFieldByName("fixedValue").getAttributes();
      expect(formatter.getName()).assertEqual("formatter");
      expect(callback.getName()).assertEqual("callback");
      expect(formatter.isStatic()).assertTrue();
      expect(formatter.isReadonly()).assertFalse();
      expect(callback.isStatic()).assertFalse();
      expect(callback.isReadonly()).assertTrue();
      expect(callback.getType().toString()).assertEqual("string");
      expect(formatter.getAttributes()).assertEqual(staticAttrs);
      expect(callback.getAttributes()).assertEqual(readonlyAttrs);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_ATTRIBUTES_2500
     * @tc.name testGetAttributes2500
     * @tc.desc Verify inherited and hidden fields keep attributes stable with owner and type cross checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetAttributes2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parentType = Type.from<GxAttrParent027>() as ClassType;
      const childType = Type.from<GxAttrChild027>() as ClassType;
      const parentToken = parentType.getFieldByName("token");
      const childToken = childType.getFieldByName("token");
      const inherited = childType.getFieldByName("parentOnly");
      expect(parentToken.getName()).assertEqual(childToken.getName());
      expect(parentToken.getType().toString()).assertEqual("int");
      expect(childToken.getType().toString()).assertEqual("string");
      expect(parentToken.getOwnerType().getName()).assertEqual((Type.from<GxAttrParent027>() as ClassType).getName());
      expect(childToken.getOwnerType().getName()).assertEqual((Type.from<GxAttrChild027>() as ClassType).getName());
      expect(parentToken.isStatic()).assertTrue();
      expect(childToken.isStatic()).assertTrue();
      expect(parentToken.getAttributes()).assertEqual(childToken.getAttributes());
      expect(inherited.getAttributes()).assertEqual(parentType.getFieldByName("parentOnly").getAttributes());
      expect(inherited.getOwnerType().getName()).assertEqual((Type.from<GxAttrParent027>() as ClassType).getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_ATTRIBUTES_2600
     * @tc.name testGetAttributes2600
     * @tc.desc Verify special identifier field names preserve attributes by static readonly and plain categories
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetAttributes2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GxAttrNames028>() as ClassType;
      const dollarField = classType.getFieldByName("$result");
      const readonlyField = classType.getFieldByName("_inner_value");
      const plainField = classType.getFieldByName("field_01_test");
      const staticAttrs: int = (Type.from<GxSample001>() as ClassType).getFieldByName("count").getAttributes();
      const readonlyAttrs: int = (Type.from<GxSample009>() as ClassType).getFieldByName("fixedValue").getAttributes();
      const plainAttrs: int = (Type.from<GxSample012>() as ClassType).getFieldByName("boolField").getAttributes();
      expect(dollarField.getName()).assertEqual("$result");
      expect(readonlyField.getName()).assertEqual("_inner_value");
      expect(plainField.getName()).assertEqual("field_01_test");
      expect(dollarField.getType().toString()).assertEqual("int");
      expect(readonlyField.getType().toString()).assertEqual("string");
      expect(plainField.getType().toString()).assertEqual("boolean");
      expect(dollarField.getAttributes()).assertEqual(staticAttrs);
      expect(readonlyField.getAttributes()).assertEqual(readonlyAttrs);
      expect(plainField.getAttributes()).assertEqual(plainAttrs);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_ATTRIBUTES_2700
     * @tc.name testGetAttributes2700
     * @tc.desc Verify string fields distinguish static readonly static mutable readonly and plain attribute combinations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetAttributes2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GxAttrMatrix029>() as ClassType;
      const staticCode = classType.getFieldByName("staticCode");
      const mutableCode = classType.getFieldByName("mutableCode");
      const readonlyLabel = classType.getFieldByName("readonlyLabel");
      const plainLabel = classType.getFieldByName("plainLabel");
      const staticReadonlyAttrs: int = staticCode.getAttributes();
      const staticAttrs: int = mutableCode.getAttributes();
      const readonlyAttrs: int = readonlyLabel.getAttributes();
      const plainAttrs: int = plainLabel.getAttributes();
      const expectedStaticReadonlyAttrs: int =
        (Type.from<GxSample016>() as ClassType).getFieldByName("fixedCount").getAttributes();
      const expectedStaticAttrs: int = (Type.from<GxSample001>() as ClassType).getFieldByName("count").getAttributes();
      const expectedReadonlyAttrs: int =
        (Type.from<GxSample009>() as ClassType).getFieldByName("fixedValue").getAttributes();
      const expectedPlainAttrs: int =
        (Type.from<GxSample012>() as ClassType).getFieldByName("strField").getAttributes();
      expect(staticCode.getType().toString()).assertEqual("string");
      expect(mutableCode.getType().toString()).assertEqual("string");
      expect(readonlyLabel.getType().toString()).assertEqual("string");
      expect(plainLabel.getType().toString()).assertEqual("string");
      expect(staticCode.isStatic() && staticCode.isReadonly()).assertTrue();
      expect(mutableCode.isStatic()).assertTrue();
      expect(mutableCode.isReadonly()).assertFalse();
      expect(readonlyLabel.isStatic()).assertFalse();
      expect(readonlyLabel.isReadonly()).assertTrue();
      expect(plainLabel.isStatic()).assertFalse();
      expect(plainLabel.isReadonly()).assertFalse();
      expect(staticReadonlyAttrs).assertEqual(expectedStaticReadonlyAttrs);
      expect(staticAttrs).assertEqual(expectedStaticAttrs);
      expect(readonlyAttrs).assertEqual(expectedReadonlyAttrs);
      expect(plainAttrs).assertEqual(expectedPlainAttrs);
      expect(staticReadonlyAttrs === staticAttrs).assertFalse();
      expect(staticReadonlyAttrs === readonlyAttrs).assertFalse();
      expect(staticReadonlyAttrs === plainAttrs).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_ATTRIBUTES_2800
     * @tc.name testGetAttributes2800
     * @tc.desc Verify built-in generic container fields keep attributes aligned with static and instance categories
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetAttributes2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GxAttrMap030>() as ClassType;
      const scores = classType.getFieldByName("scores");
      const names = classType.getFieldByName("names");
      const staticAttrs: int = (Type.from<GxSample008>() as ClassType).getFieldByName("staticField").getAttributes();
      const plainAttrs: int = (Type.from<GxSample012>() as ClassType).getFieldByName("strField").getAttributes();
      expect(scores.getName()).assertEqual("scores");
      expect(names.getName()).assertEqual("names");
      expect(scores.toString()).assertEqual("scores: " + scores.getType().toString());
      expect(names.getType().toString()).assertEqual("std.core.Array");
      expect(scores.isStatic()).assertTrue();
      expect(names.isStatic()).assertFalse();
      expect(scores.isReadonly()).assertFalse();
      expect(names.isReadonly()).assertFalse();
      expect(scores.getAttributes()).assertEqual(staticAttrs);
      expect(names.getAttributes()).assertEqual(plainAttrs);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_ATTRIBUTES_2900
     * @tc.name testGetAttributes2900
     * @tc.desc Verify repeated getAttributes calls stay stable across static readonly and generic fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetAttributes2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const staticArray = (Type.from<GxAttrArray022>() as ClassType).getFieldByName("intValues");
      const staticBox = (Type.from<GxAttrGeneric025>() as ClassType).getFieldByName("stringBox");
      const readonlyLabel = (Type.from<GxAttrMatrix029>() as ClassType).getFieldByName("readonlyLabel");
      const staticAttrs: int = (Type.from<GxSample001>() as ClassType).getFieldByName("count").getAttributes();
      const readonlyAttrs: int = (Type.from<GxSample009>() as ClassType).getFieldByName("fixedValue").getAttributes();
      for (let index: int = 0; index < 2; index++) {
        expect(staticArray.getAttributes()).assertEqual(staticAttrs);
        expect(staticBox.getAttributes()).assertEqual(staticAttrs);
        expect(readonlyLabel.getAttributes()).assertEqual(readonlyAttrs);
      }
      expect(staticArray.getType().toString()).assertEqual("std.core.Array");
      expect(staticBox.getName()).assertEqual("stringBox");
      expect(readonlyLabel.getType().toString()).assertEqual("string");
      expect(staticArray.isStatic()).assertTrue();
      expect(readonlyLabel.isReadonly()).assertTrue();
      expect(staticArray.getAttributes() === readonlyLabel.getAttributes()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_ATTRIBUTES_3000
     * @tc.name testGetAttributes3000
     * @tc.desc Verify undefined null union and optional template fields keep plain instance attributes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetAttributes3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GxAttrNullable032>() as ClassType;
      const parA = classType.getFieldByName("parA");
      const parB = classType.getFieldByName("parB");
      const parC = classType.getFieldByName("parC");
      const parD = classType.getFieldByName("parD");
      const parE = classType.getFieldByName("parE");
      const parF = classType.getFieldByName("parF");
      const parG = classType.getFieldByName("parG");
      const plainAttrs: int = (Type.from<GxSample012>() as ClassType).getFieldByName("strField").getAttributes();
      expect(parA.getAttributes()).assertEqual(plainAttrs);
      expect(parB.getAttributes()).assertEqual(plainAttrs);
      expect(parC.getAttributes()).assertEqual(plainAttrs);
      expect(parD.getAttributes()).assertEqual(plainAttrs);
      expect(parE.getAttributes()).assertEqual(plainAttrs);
      expect(parF.getAttributes()).assertEqual(plainAttrs);
      expect(parG.getAttributes()).assertEqual(plainAttrs);
      expect(parF.getType().toString()).assertEqual("std.core.Array");
      expect(parG.getType().toString()).assertEqual("std.core.Array");
      expect(parA.isStatic()).assertFalse();
      expect(parE.isReadonly()).assertFalse();
    });
  });
}
