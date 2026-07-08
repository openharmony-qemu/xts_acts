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

class GaSample001 {
  public value: int = 10;
}

class GaSample007 {
  public pubField: int = 1;
}

class GaSample008 {
  private priField: int = 2;
}

class GaSample009 {
  protected proField: int = 3;
}

class GaSample010 {
  public pubField: int = 1;
  protected proField: int = 3;
  private priField: int = 2;
}

class GaSample011 {
  static count: int = 1;
}

class GaSample022 {
  public static readonly fixed: int = 1;
  private static hidden: int = 2;
}

class GaSample024 {
  public visible: int = 1;
  protected guarded: int = 3;
  private hidden: int = 2;
}

class GaAccessScalar021 {
  public count: int = 1;
  protected enabled: boolean = true;
  private title: string = "tag";
}

class GaAccessArray022 {
  public static ids: int[] = [1, 2, 3];
  protected flags: boolean[] = [true, false];
  private names: string[] = ["a", "b"];
}

class GaAccessPayload023 {
}

class GaAccessObject023 {
  public payload: GaAccessPayload023 = new GaAccessPayload023();
  protected backup: GaAccessPayload023 = new GaAccessPayload023();
  private obj: Object = new Object();
}

class GaAccessModifier024 {
  public static readonly maxCount: int = 10;
  private static hiddenText: string = "hidden";
  public mutableText: string = "text";
  protected readonly guardedFlag: boolean = true;
}

class GaAccessBox025<T> {
  value: T;

  constructor(value: T) {
    this.value = value;
  }
}

class GaAccessPair025<K, V> {
  first: K;
  second: V;

  constructor(first: K, second: V) {
    this.first = first;
    this.second = second;
  }
}

class GaAccessGeneric025 {
  public static textBox: GaAccessBox025<string> = new GaAccessBox025<string>("box");
  protected pair: GaAccessPair025<int, string> = new GaAccessPair025<int, string>(1, "one");
  private intBox: GaAccessBox025<int> = new GaAccessBox025<int>(1);
}

type GaAccessMapper026 = (value: int) => string;

function gaAccessMap026(value: int): string {
  return value.toString();
}

class GaAccessFunction026 {
  public static mapper: GaAccessMapper026 = gaAccessMap026;
  public action: GaAccessMapper026 = gaAccessMap026;
  public readonly callback: string = "cb";
}

class GaAccessParent027 {
  public inheritedTitle: string = "parent";
}

class GaAccessChild027 extends GaAccessParent027 {
  public childFlag: boolean = true;
}

class GaAccessHiddenParent028 {
  public static token: int = 1;
}

class GaAccessHiddenChild028 extends GaAccessHiddenParent028 {
  public static token: string = "child";
}

class GaAccessSpecial029 {
  public static $value: int = 1;
  protected field_01_test: boolean = true;
  private _type: string = "meta";
}

class GaAccessEmpty030 {
}

class GaAccessNullable031 {
  parA: undefined = undefined;
  parB: null = null;
  parC: string | undefined = undefined;
  parD: string | null = null;
  parE?: string;
  parF: Array<string> = new Array<string>();
  parG: string[] = [];
}

export default function FieldGetAccessModifierTest(): void {

  describe('FieldGetAccessModifierTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_ACCESS_MODIFIER_0100
     * @tc.name testGetAccessModifier0100
     * @tc.desc Verify getAccessModifier called with no args returns int value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetAccessModifier0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<GaSample001>() as ClassType).getFieldByName("value");
      const modifier: int = field.getAccessModifier();
      expect(modifier)
        .assertEqual((Type.from<GaSample007>() as ClassType).getFieldByName("pubField").getAccessModifier());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_ACCESS_MODIFIER_0200
     * @tc.name testGetAccessModifier0200
     * @tc.desc getAccessModifier returns consistent value on repeated calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetAccessModifier0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<GaSample001>() as ClassType).getFieldByName("value");
      const m1: int = field.getAccessModifier();
      const m2: int = field.getAccessModifier();
      const privateModifier: int = (Type.from<GaSample008>() as ClassType).getFieldByName("priField").getAccessModifier();
      const protectedModifier: int =
        (Type.from<GaSample009>() as ClassType).getFieldByName("proField").getAccessModifier();
      expect(m1).assertEqual(m2);
      expect(m1).assertEqual((Type.from<GaSample007>() as ClassType).getFieldByName("pubField").getAccessModifier());
      expect(m1 === privateModifier).assertFalse();
      expect(m1 === protectedModifier).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_ACCESS_MODIFIER_0300
     * @tc.name testGetAccessModifier0300
     * @tc.desc Verify public access modifier is independent from field name metadata
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetAccessModifier0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<GaSample001>() as ClassType).getFieldByName("value");
      const modifier: int = field.getAccessModifier();
      const publicModifier: int =
        (Type.from<GaSample007>() as ClassType).getFieldByName("pubField").getAccessModifier();
      expect(field.getName()).assertEqual("value");
      expect(modifier).assertEqual(publicModifier);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_ACCESS_MODIFIER_0400
     * @tc.name testGetAccessModifier0400
     * @tc.desc Verify getAccessModifier result is stable when combined with getName on static field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetAccessModifier0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<GaSample011>() as ClassType).getFieldByName("count");
      const modifier: int = field.getAccessModifier();
      const publicModifier: int =
        (Type.from<GaSample007>() as ClassType).getFieldByName("pubField").getAccessModifier();
      expect(field.getName()).assertEqual("count");
      expect(modifier).assertEqual(publicModifier);
      expect(field.isStatic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_ACCESS_MODIFIER_0500
     * @tc.name testGetAccessModifier0500
     * @tc.desc Verify getAccessModifier returns stable result after getOwnerType read on the same field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetAccessModifier0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<GaSample001>() as ClassType).getFieldByName("value");
      const modifier: int = field.getAccessModifier();
      expect(field.getOwnerType().getName()).assertEqual((Type.from<GaSample001>() as ClassType).getName());
      expect(field.getAccessModifier()).assertEqual(modifier);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_ACCESS_MODIFIER_0600
     * @tc.name testGetAccessModifier0600
     * @tc.desc Verify getAccessModifier on public field returns public modifier value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetAccessModifier0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<GaSample007>() as ClassType).getFieldByName("pubField");
      const modifier: int = field.getAccessModifier();
      const sameModifier: int = (Type.from<GaSample010>() as ClassType).getFieldByName("pubField").getAccessModifier();
      expect(modifier).assertEqual(sameModifier);
      expect(field.getOwnerType().getName()).assertEqual((Type.from<GaSample007>() as ClassType).getName());
      expect(field.isStatic()).assertFalse();
      expect(field.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_ACCESS_MODIFIER_0700
     * @tc.name testGetAccessModifier0700
     * @tc.desc Verify getAccessModifier on private field returns private modifier value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetAccessModifier0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<GaSample008>() as ClassType).getFieldByName("priField");
      const modifier: int = field.getAccessModifier();
      const sameModifier: int = (Type.from<GaSample010>() as ClassType).getFieldByName("priField").getAccessModifier();
      expect(modifier).assertEqual(sameModifier);
      expect(field.getOwnerType().getName()).assertEqual((Type.from<GaSample008>() as ClassType).getName());
      expect(field.isStatic()).assertFalse();
      expect(field.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_ACCESS_MODIFIER_0800
     * @tc.name testGetAccessModifier0800
     * @tc.desc Verify getAccessModifier on protected field returns protected modifier value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetAccessModifier0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<GaSample009>() as ClassType).getFieldByName("proField");
      const modifier: int = field.getAccessModifier();
      const sameModifier: int = (Type.from<GaSample010>() as ClassType).getFieldByName("proField").getAccessModifier();
      expect(modifier).assertEqual(sameModifier);
      expect(field.getOwnerType().getName()).assertEqual((Type.from<GaSample009>() as ClassType).getName());
      expect(field.isStatic()).assertFalse();
      expect(field.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_ACCESS_MODIFIER_0900
     * @tc.name testGetAccessModifier0900
     * @tc.desc Verify getAccessModifier returns the baseline values for public private and protected fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetAccessModifier0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GaSample010>() as ClassType;
      const pubField = classType.getFieldByName("pubField");
      const priField = classType.getFieldByName("priField");
      const proField = classType.getFieldByName("proField");
      const pubModifier: int = pubField.getAccessModifier();
      const priModifier: int = priField.getAccessModifier();
      const proModifier: int = proField.getAccessModifier();
      expect(pubField.getName()).assertEqual("pubField");
      expect(priField.getName()).assertEqual("priField");
      expect(proField.getName()).assertEqual("proField");
      expect(pubField.getType().toString()).assertEqual("int");
      expect(priField.getType().toString()).assertEqual("int");
      expect(proField.getType().toString()).assertEqual("int");
      expect(pubModifier)
        .assertEqual((Type.from<GaSample007>() as ClassType).getFieldByName("pubField").getAccessModifier());
      expect(priModifier)
        .assertEqual((Type.from<GaSample008>() as ClassType).getFieldByName("priField").getAccessModifier());
      expect(proModifier)
        .assertEqual((Type.from<GaSample009>() as ClassType).getFieldByName("proField").getAccessModifier());
      expect(pubModifier === priModifier).assertFalse();
      expect(pubModifier === proModifier).assertFalse();
      expect(priModifier === proModifier).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_ACCESS_MODIFIER_1000
     * @tc.name testGetAccessModifier1000
     * @tc.desc Verify getAccessModifier on static field returns normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetAccessModifier1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<GaSample011>() as ClassType).getFieldByName("count");
      const modifier: int = field.getAccessModifier();
      const publicModifier: int =
        (Type.from<GaSample007>() as ClassType).getFieldByName("pubField").getAccessModifier();
      expect(field.isStatic()).assertTrue();
      expect(field.getName()).assertEqual("count");
      expect(modifier).assertEqual(publicModifier);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_ACCESS_MODIFIER_1100
     * @tc.name testGetAccessModifier1100
     * @tc.desc Verify getAccessModifier returns same value for same field via different Field instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetAccessModifier1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field1 = (Type.from<GaSample001>() as ClassType).getFieldByName("value");
      const field2 = (Type.from<GaSample001>() as ClassType).getFieldByName("value");
      const m1: int = field1.getAccessModifier();
      const m2: int = field2.getAccessModifier();
      const publicModifier: int =
        (Type.from<GaSample007>() as ClassType).getFieldByName("pubField").getAccessModifier();
      const privateModifier: int =
        (Type.from<GaSample008>() as ClassType).getFieldByName("priField").getAccessModifier();
      const protectedModifier: int =
        (Type.from<GaSample009>() as ClassType).getFieldByName("proField").getAccessModifier();
      expect(m1).assertEqual(m2);
      expect(m1).assertEqual(publicModifier);
      expect(m1 === privateModifier).assertFalse();
      expect(m1 === protectedModifier).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_ACCESS_MODIFIER_1200
     * @tc.name testGetAccessModifier1200
     * @tc.desc Verify getAccessModifier behavior when field name lookup throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetAccessModifier1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GaSample001>() as ClassType;
      try {
        classType.getFieldByName("notExistField");
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('TypeError');
      }
      const field = classType.getFieldByName("value");
      const modifier: int = field.getAccessModifier();
      expect(field.getAccessModifier()).assertEqual(modifier);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_ACCESS_MODIFIER_1300
     * @tc.name testGetAccessModifier1300
     * @tc.desc Verify getAccessModifier returns consistent value across chained and non-chained calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetAccessModifier1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const modifier: int = (Type.from<GaSample001>() as ClassType).getFieldByName("value").getAccessModifier();
      const privateModifier: int = (Type.from<GaSample010>() as ClassType).getFieldByName("priField").getAccessModifier();
      const protectedModifier: int =
        (Type.from<GaSample010>() as ClassType).getFieldByName("proField").getAccessModifier();
      expect(modifier).assertEqual((Type.from<GaSample001>() as ClassType).getFieldByName("value").getAccessModifier());
      expect(modifier)
        .assertEqual((Type.from<GaSample010>() as ClassType).getFieldByName("pubField").getAccessModifier());
      expect(modifier === privateModifier).assertFalse();
      expect(modifier === protectedModifier).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_ACCESS_MODIFIER_1400
     * @tc.name testGetAccessModifier1400
     * @tc.desc Verify public private and protected access modifiers remain distinct across repeated reads
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetAccessModifier1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GaSample010>() as ClassType;
      const pubModifier: int = classType.getFieldByName("pubField").getAccessModifier();
      const privateModifier: int = classType.getFieldByName("priField").getAccessModifier();
      const protectedModifier: int = classType.getFieldByName("proField").getAccessModifier();
      expect(classType.getFieldByName("pubField").getAccessModifier()).assertEqual(pubModifier);
      expect(classType.getFieldByName("priField").getAccessModifier()).assertEqual(privateModifier);
      expect(classType.getFieldByName("proField").getAccessModifier()).assertEqual(protectedModifier);
      expect(pubModifier)
        .assertEqual((Type.from<GaSample007>() as ClassType).getFieldByName("pubField").getAccessModifier());
      expect(privateModifier)
        .assertEqual((Type.from<GaSample008>() as ClassType).getFieldByName("priField").getAccessModifier());
      expect(protectedModifier)
        .assertEqual((Type.from<GaSample009>() as ClassType).getFieldByName("proField").getAccessModifier());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_ACCESS_MODIFIER_1500
     * @tc.name testGetAccessModifier1500
     * @tc.desc Verify public static and public instance fields expose the same access modifier category
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetAccessModifier1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const instanceField = (Type.from<GaSample001>() as ClassType).getFieldByName("value");
      const staticField = (Type.from<GaSample011>() as ClassType).getFieldByName("count");
      const instanceModifier: int = instanceField.getAccessModifier();
      const staticModifier: int = staticField.getAccessModifier();
      expect(instanceModifier).assertEqual(staticModifier);
      expect(staticField.isStatic()).assertTrue();
      expect(instanceField.isStatic()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_ACCESS_MODIFIER_1600
     * @tc.name testGetAccessModifier1600
     * @tc.desc Verify protected field modifier stays stable across independent lookups
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetAccessModifier1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GaSample009>() as ClassType;
      const first = classType.getFieldByName("proField");
      const second = classType.getFieldByName("proField");
      expect(first.getAccessModifier()).assertEqual(second.getAccessModifier());
      expect(first.getName()).assertEqual("proField");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_ACCESS_MODIFIER_1700
     * @tc.name testGetAccessModifier1700
     * @tc.desc Verify access modifier remains independent from static and readonly metadata
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetAccessModifier1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GaSample022>() as ClassType;
      const fixedField = classType.getFieldByName("fixed");
      const hiddenField = classType.getFieldByName("hidden");
      const fixedModifier: int = fixedField.getAccessModifier();
      const hiddenModifier: int = hiddenField.getAccessModifier();
      expect(fixedField.isStatic()).assertTrue();
      expect(fixedField.isReadonly()).assertTrue();
      expect(fixedModifier === hiddenModifier).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_ACCESS_MODIFIER_1800
     * @tc.name testGetAccessModifier1800
     * @tc.desc Verify public private and protected access modifiers stay distinct after name and type reads
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetAccessModifier1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GaSample024>() as ClassType;
      const visible = classType.getFieldByName("visible");
      const hidden = classType.getFieldByName("hidden");
      const guarded = classType.getFieldByName("guarded");
      const visibleModifier: int = visible.getAccessModifier();
      const hiddenModifier: int = hidden.getAccessModifier();
      const guardedModifier: int = guarded.getAccessModifier();
      expect(visible.getName()).assertEqual("visible");
      expect(hidden.getType().toString()).assertEqual("int");
      expect(hiddenModifier === visibleModifier).assertFalse();
      expect(guardedModifier === visibleModifier).assertFalse();
      expect(hiddenModifier === guardedModifier).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_ACCESS_MODIFIER_1900
     * @tc.name testGetAccessModifier1900
     * @tc.desc Verify public int field modifier differs from private field modifier in the same class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetAccessModifier1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GaSample010>() as ClassType;
      const pubModifier: int = classType.getFieldByName("pubField").getAccessModifier();
      const priModifier: int = classType.getFieldByName("priField").getAccessModifier();
      expect(pubModifier).assertEqual(classType.getFieldByName("pubField").getAccessModifier());
      expect(priModifier)
        .assertEqual((Type.from<GaSample008>() as ClassType).getFieldByName("priField").getAccessModifier());
      expect(pubModifier === priModifier).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_ACCESS_MODIFIER_2000
     * @tc.name testGetAccessModifier2000
     * @tc.desc Verify public static readonly field access modifier matches public instance field modifier
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetAccessModifier2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const staticReadonlyField = (Type.from<GaSample022>() as ClassType).getFieldByName("fixed");
      const instanceField = (Type.from<GaSample001>() as ClassType).getFieldByName("value");
      expect(staticReadonlyField.getAccessModifier()).assertEqual(instanceField.getAccessModifier());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_ACCESS_MODIFIER_2100
     * @tc.name testGetAccessModifier2100
     * @tc.desc Verify scalar int string and boolean fields keep exact public private and protected modifiers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetAccessModifier2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GaAccessScalar021>() as ClassType;
      const count = classType.getFieldByName("count");
      const title = classType.getFieldByName("title");
      const enabled = classType.getFieldByName("enabled");
      const publicModifier: int =
        (Type.from<GaSample010>() as ClassType).getFieldByName("pubField").getAccessModifier();
      const privateModifier: int =
        (Type.from<GaSample010>() as ClassType).getFieldByName("priField").getAccessModifier();
      const protectedModifier: int =
        (Type.from<GaSample010>() as ClassType).getFieldByName("proField").getAccessModifier();
      expect(count.getName()).assertEqual("count");
      expect(count.getType().toString()).assertEqual("int");
      expect(count.isStatic()).assertFalse();
      expect(count.isReadonly()).assertFalse();
      expect(count.getAccessModifier()).assertEqual(publicModifier);
      expect(title.getName()).assertEqual("title");
      expect(title.getType().toString()).assertEqual("string");
      expect(title.getAccessModifier()).assertEqual(privateModifier);
      expect(enabled.getName()).assertEqual("enabled");
      expect(enabled.getType().toString()).assertEqual("boolean");
      expect(enabled.getAccessModifier()).assertEqual(protectedModifier);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_ACCESS_MODIFIER_2200
     * @tc.name testGetAccessModifier2200
     * @tc.desc Verify array fields keep access modifiers independent from static and element type metadata
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetAccessModifier2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GaAccessArray022>() as ClassType;
      const ids = classType.getFieldByName("ids");
      const names = classType.getFieldByName("names");
      const flags = classType.getFieldByName("flags");
      const publicModifier: int =
        (Type.from<GaSample010>() as ClassType).getFieldByName("pubField").getAccessModifier();
      const privateModifier: int =
        (Type.from<GaSample010>() as ClassType).getFieldByName("priField").getAccessModifier();
      const protectedModifier: int =
        (Type.from<GaSample010>() as ClassType).getFieldByName("proField").getAccessModifier();
      expect(ids.getName()).assertEqual("ids");
      expect(ids.getType().toString()).assertEqual("std.core.Array");
      expect(ids.isStatic()).assertTrue();
      expect(ids.isReadonly()).assertFalse();
      expect(ids.getAccessModifier()).assertEqual(publicModifier);
      expect(names.getName()).assertEqual("names");
      expect(names.getType().toString()).assertEqual("std.core.Array");
      expect(names.isStatic()).assertFalse();
      expect(names.getAccessModifier()).assertEqual(privateModifier);
      expect(flags.getName()).assertEqual("flags");
      expect(flags.getType().toString()).assertEqual("std.core.Array");
      expect(flags.getAccessModifier()).assertEqual(protectedModifier);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_ACCESS_MODIFIER_2300
     * @tc.name testGetAccessModifier2300
     * @tc.desc Verify custom class and Object fields keep access modifiers with type metadata cross-checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetAccessModifier2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GaAccessObject023>() as ClassType;
      const payload = classType.getFieldByName("payload");
      const obj = classType.getFieldByName("obj");
      const backup = classType.getFieldByName("backup");
      const publicModifier: int =
        (Type.from<GaSample010>() as ClassType).getFieldByName("pubField").getAccessModifier();
      const privateModifier: int =
        (Type.from<GaSample010>() as ClassType).getFieldByName("priField").getAccessModifier();
      const protectedModifier: int =
        (Type.from<GaSample010>() as ClassType).getFieldByName("proField").getAccessModifier();
      expect(payload.getName()).assertEqual("payload");
      expect(payload.getType().getName()).assertEqual((Type.from<GaAccessPayload023>() as ClassType).getName());
      expect(payload.getAccessModifier()).assertEqual(publicModifier);
      expect(obj.getName()).assertEqual("obj");
      expect(obj.getType().toString()).assertEqual(Type.from<Object>().toString());
      expect(obj.getAccessModifier()).assertEqual(privateModifier);
      expect(backup.getName()).assertEqual("backup");
      expect(backup.getType().getName()).assertEqual(payload.getType().getName());
      expect(backup.isStatic()).assertFalse();
      expect(backup.isReadonly()).assertFalse();
      expect(backup.getAccessModifier()).assertEqual(protectedModifier);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_ACCESS_MODIFIER_2400
     * @tc.name testGetAccessModifier2400
     * @tc.desc Verify static readonly private static protected readonly and public mutable fields keep modifier categories
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetAccessModifier2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GaAccessModifier024>() as ClassType;
      const maxCount = classType.getFieldByName("maxCount");
      const hiddenText = classType.getFieldByName("hiddenText");
      const guardedFlag = classType.getFieldByName("guardedFlag");
      const mutableText = classType.getFieldByName("mutableText");
      const publicModifier: int =
        (Type.from<GaSample010>() as ClassType).getFieldByName("pubField").getAccessModifier();
      const privateModifier: int =
        (Type.from<GaSample010>() as ClassType).getFieldByName("priField").getAccessModifier();
      const protectedModifier: int =
        (Type.from<GaSample010>() as ClassType).getFieldByName("proField").getAccessModifier();
      expect(maxCount.getName()).assertEqual("maxCount");
      expect(maxCount.getType().toString()).assertEqual("int");
      expect(maxCount.isStatic()).assertTrue();
      expect(maxCount.isReadonly()).assertTrue();
      expect(maxCount.getAccessModifier()).assertEqual(publicModifier);
      expect(hiddenText.getType().toString()).assertEqual("string");
      expect(hiddenText.isStatic()).assertTrue();
      expect(hiddenText.isReadonly()).assertFalse();
      expect(hiddenText.getAccessModifier()).assertEqual(privateModifier);
      expect(guardedFlag.getType().toString()).assertEqual("boolean");
      expect(guardedFlag.isStatic()).assertFalse();
      expect(guardedFlag.isReadonly()).assertTrue();
      expect(guardedFlag.getAccessModifier()).assertEqual(protectedModifier);
      expect(mutableText.getName()).assertEqual("mutableText");
      expect(mutableText.getAccessModifier()).assertEqual(publicModifier);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_ACCESS_MODIFIER_2500
     * @tc.name testGetAccessModifier2500
     * @tc.desc Verify generic class fields keep exact access modifiers with generic type text cross-checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetAccessModifier2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GaAccessGeneric025>() as ClassType;
      const textBox = classType.getFieldByName("textBox");
      const intBox = classType.getFieldByName("intBox");
      const pair = classType.getFieldByName("pair");
      const publicModifier: int =
        (Type.from<GaSample010>() as ClassType).getFieldByName("pubField").getAccessModifier();
      const privateModifier: int =
        (Type.from<GaSample010>() as ClassType).getFieldByName("priField").getAccessModifier();
      const protectedModifier: int =
        (Type.from<GaSample010>() as ClassType).getFieldByName("proField").getAccessModifier();
      expect(textBox.getName()).assertEqual("textBox");
      expect(textBox.getType().toString()).assertEqual(Type.from<GaAccessBox025<string>>().toString());
      expect(textBox.isStatic()).assertTrue();
      expect(textBox.isReadonly()).assertFalse();
      expect(textBox.getAccessModifier()).assertEqual(publicModifier);
      expect(intBox.getName()).assertEqual("intBox");
      expect(intBox.getType().toString()).assertEqual(Type.from<GaAccessBox025<int>>().toString());
      expect(intBox.getAccessModifier()).assertEqual(privateModifier);
      expect(pair.getName()).assertEqual("pair");
      expect(pair.getType().toString()).assertEqual(Type.from<GaAccessPair025<int, string>>().toString());
      expect(pair.getAccessModifier()).assertEqual(protectedModifier);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_ACCESS_MODIFIER_2600
     * @tc.name testGetAccessModifier2600
     * @tc.desc Verify Function typed fields keep access modifiers with name and static metadata cross-checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetAccessModifier2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GaAccessFunction026>() as ClassType;
      const mapper = classType.getFieldByName("mapper");
      const action = classType.getFieldByName("action");
      const publicModifier: int =
        (Type.from<GaSample010>() as ClassType).getFieldByName("pubField").getAccessModifier();
      expect(mapper.getName()).assertEqual("mapper");
      expect(mapper.isStatic()).assertTrue();
      expect(mapper.getAccessModifier()).assertEqual(publicModifier);
      expect(action.getName()).assertEqual("action");
      expect(action.isStatic()).assertFalse();
      expect(action.getAccessModifier()).assertEqual(publicModifier);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_ACCESS_MODIFIER_2700
     * @tc.name testGetAccessModifier2700
     * @tc.desc Verify inherited parent field resolved through child type keeps parent access modifier metadata
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetAccessModifier2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parentField = (Type.from<GaAccessParent027>() as ClassType).getFieldByName("inheritedTitle");
      const childField = (Type.from<GaAccessChild027>() as ClassType).getFieldByName("inheritedTitle");
      const publicModifier: int =
        (Type.from<GaSample010>() as ClassType).getFieldByName("pubField").getAccessModifier();
      expect(parentField.getName()).assertEqual("inheritedTitle");
      expect(childField.getName()).assertEqual("inheritedTitle");
      expect(parentField.getType().toString()).assertEqual("string");
      expect(childField.getType().toString()).assertEqual("string");
      expect(childField.isStatic()).assertFalse();
      expect(childField.isReadonly()).assertFalse();
      expect(parentField.getAccessModifier()).assertEqual(publicModifier);
      expect(childField.getAccessModifier()).assertEqual(parentField.getAccessModifier());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_ACCESS_MODIFIER_2800
     * @tc.name testGetAccessModifier2800
     * @tc.desc Verify child hidden static field keeps public modifier while type text differs from parent field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetAccessModifier2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parentField = (Type.from<GaAccessHiddenParent028>() as ClassType).getFieldByName("token");
      const childField = (Type.from<GaAccessHiddenChild028>() as ClassType).getFieldByName("token");
      const publicModifier: int =
        (Type.from<GaSample010>() as ClassType).getFieldByName("pubField").getAccessModifier();
      expect(parentField.getName()).assertEqual(childField.getName());
      expect(parentField.getType().toString()).assertEqual("int");
      expect(childField.getType().toString()).assertEqual("string");
      expect(parentField.isStatic()).assertTrue();
      expect(childField.isStatic()).assertTrue();
      expect(parentField.getAccessModifier()).assertEqual(publicModifier);
      expect(childField.getAccessModifier()).assertEqual(publicModifier);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_ACCESS_MODIFIER_2900
     * @tc.name testGetAccessModifier2900
     * @tc.desc Verify special identifier field names keep exact access modifiers and type metadata
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetAccessModifier2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GaAccessSpecial029>() as ClassType;
      const value = classType.getFieldByName("$value");
      const typeField = classType.getFieldByName("_type");
      const field01 = classType.getFieldByName("field_01_test");
      const publicModifier: int =
        (Type.from<GaSample010>() as ClassType).getFieldByName("pubField").getAccessModifier();
      const privateModifier: int =
        (Type.from<GaSample010>() as ClassType).getFieldByName("priField").getAccessModifier();
      const protectedModifier: int =
        (Type.from<GaSample010>() as ClassType).getFieldByName("proField").getAccessModifier();
      expect(value.getName()).assertEqual("$value");
      expect(value.getType().toString()).assertEqual("int");
      expect(value.isStatic()).assertTrue();
      expect(value.getAccessModifier()).assertEqual(publicModifier);
      expect(typeField.getName()).assertEqual("_type");
      expect(typeField.getType().toString()).assertEqual("string");
      expect(typeField.getAccessModifier()).assertEqual(privateModifier);
      expect(field01.getName()).assertEqual("field_01_test");
      expect(field01.getType().toString()).assertEqual("boolean");
      expect(field01.getAccessModifier()).assertEqual(protectedModifier);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_ACCESS_MODIFIER_3000
     * @tc.name testGetAccessModifier3000
     * @tc.desc Verify repeated getAccessModifier calls stay stable across public private and protected fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetAccessModifier3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GaAccessScalar021>() as ClassType;
      const count = classType.getFieldByName("count");
      const title = classType.getFieldByName("title");
      const enabled = classType.getFieldByName("enabled");
      const publicModifier: int =
        (Type.from<GaSample010>() as ClassType).getFieldByName("pubField").getAccessModifier();
      const privateModifier: int =
        (Type.from<GaSample010>() as ClassType).getFieldByName("priField").getAccessModifier();
      const protectedModifier: int =
        (Type.from<GaSample010>() as ClassType).getFieldByName("proField").getAccessModifier();
      for (let index: int = 0; index < 2; index++) {
        expect(count.getAccessModifier()).assertEqual(publicModifier);
        expect(title.getAccessModifier()).assertEqual(privateModifier);
        expect(enabled.getAccessModifier()).assertEqual(protectedModifier);
      }
      expect(count.getType().toString()).assertEqual("int");
      expect(title.getType().toString()).assertEqual("string");
      expect(enabled.getType().toString()).assertEqual("boolean");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_ACCESS_MODIFIER_3100
     * @tc.name testGetAccessModifier3100
     * @tc.desc Verify undefined null union and optional template fields keep public access modifier metadata
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetAccessModifier3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<GaAccessNullable031>() as ClassType;
      const parA = classType.getFieldByName("parA");
      const parB = classType.getFieldByName("parB");
      const parC = classType.getFieldByName("parC");
      const parD = classType.getFieldByName("parD");
      const parE = classType.getFieldByName("parE");
      const parF = classType.getFieldByName("parF");
      const parG = classType.getFieldByName("parG");
      const publicModifier: int =
        (Type.from<GaSample010>() as ClassType).getFieldByName("pubField").getAccessModifier();
      expect(parA.getAccessModifier()).assertEqual(publicModifier);
      expect(parB.getAccessModifier()).assertEqual(publicModifier);
      expect(parC.getAccessModifier()).assertEqual(publicModifier);
      expect(parD.getAccessModifier()).assertEqual(publicModifier);
      expect(parE.getAccessModifier()).assertEqual(publicModifier);
      expect(parF.getAccessModifier()).assertEqual(publicModifier);
      expect(parG.getAccessModifier()).assertEqual(publicModifier);
      expect(parF.getType().toString()).assertEqual("std.core.Array");
      expect(parG.getType().toString()).assertEqual("std.core.Array");
      expect(parA.isStatic()).assertFalse();
      expect(parE.isReadonly()).assertFalse();
    });
  });
}
