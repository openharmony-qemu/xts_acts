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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from './../Util.test';

class SvSample009 {
  static score: double = 3.14;
}

class SvSample012 {
  static count: int = 5;
}

class SvSample014 {
  static count: int = 0;
}

class SvSample015 {
  static count: int = -100;
}

class SvSample018 {
  static maxVal: int = 2147483647;
}

class SvSample023 {
  instanceField: int = 1;
}

class SvSample024 {
  value: string = "instance";
}

class SvSample027 {
  static staticCount: int = 50;
  instanceCount: int = 60;
}

class SvSample028 {
  fieldA: int = 1;
  fieldB: string = "hello";
  fieldC: boolean = true;
}

class SvSample029 {
  static left: int = 3;
  static right: int = 4;
}

class SvSample030 {
  static enabled: boolean = true;
}

class SvSample031 {
  static label: string = "test";
}

class SvArrayMatrix1300 {
  static ids: int[] = [1, 2, 3];
  static names: string[] = ["left", "right"];
  static grid: int[][] = [[1, 2], [3, 4]];
}

class SvPayload1400 {
  code: int;
  label: string;

  constructor(code: int, label: string) {
    this.code = code;
    this.label = label;
  }
}

class SvObjectMatrix1400 {
  static payload: SvPayload1400 = new SvPayload1400(14, "payload");
}

enum SvNumericState1500 {
  Ready,
  Done
}

class SvEnumMatrix1500 {
  static numericState: SvNumericState1500 = SvNumericState1500.Ready;
}

class SvBox1600<T> {
  value: T;

  constructor(value: T) {
    this.value = value;
  }
}

class SvPair1600<K, V> {
  key: K;
  value: V;

  constructor(key: K, value: V) {
    this.key = key;
    this.value = value;
  }
}

class SvGenericMatrix1600 {
  static textBox: SvBox1600<string> = new SvBox1600<string>("box");
  static pair: SvPair1600<int, string> = new SvPair1600<int, string>(16, "pair");
}

type SvMapper1700 = (value: int) => string;
type SvSupplier1700 = () => string;

function svMap1700(value: int): string {
  return "map-" + value.toString();
}

function svSupply1700(): string {
  return "supplied";
}

class SvFunctionMatrix1700 {
  static mapper: SvMapper1700 = svMap1700;
  static supplier: SvSupplier1700 = svSupply1700;
}

class SvReadonlyMatrix1800 {
  static readonly fixed: int = 7;
  static mutable: int = 2;
}

class SvSameNameLeft1900 {
  static shared: int = 19;
}

class SvSameNameRight1900 {
  static shared: double = 19.5;
}

class SvHiddenParent2000 {
  static token: int = 20;
}

class SvHiddenChild2000 extends SvHiddenParent2000 {
  static token: int = 21;
}

class SvInstanceMatrix2100 {
  static staticPayload: SvPayload1400 = new SvPayload1400(21, "static");
  payload: SvPayload1400 = new SvPayload1400(22, "instance");
}

class SvNumericMatrix2300 {
  static bigValue: long = 100;
  static ratio: float = 1.5f;
}

export default function FieldGetStaticValueTest(): void {
  describe('FieldGetStaticValueTest', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async () => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_STATIC_VALUE_0100
     * @tc.name testGetStaticValue0100
     * @tc.desc Verify getStaticValue returns zero for static int field with value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetStaticValue0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<SvSample014>() as ClassType;
      const field = classType.getFieldByName("count");
      let result = field.getStaticValue() as int;
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_STATIC_VALUE_0200
     * @tc.name testGetStaticValue0200
     * @tc.desc Verify getStaticValue throws TypeError for a string instance field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetStaticValue0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<SvSample024>() as ClassType;
      const field = classType.getFieldByName("value");
      try {
        field.getStaticValue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
      expect(field.isStatic()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_STATIC_VALUE_0300
     * @tc.name testGetStaticValue0300
     * @tc.desc Verify consecutive calls to getStaticValue on multiple instance fields all throw TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetStaticValue0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<SvSample028>() as ClassType;
      let errorCount: int = 0;
      const names: string[] = ["fieldA", "fieldB", "fieldC"];
      for (let i = 0; i < names.length; i++) {
        const field = classType.getFieldByName(names[i]);
        try {
          field.getStaticValue();
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
          errorCount++;
        }
      }
      expect(errorCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_STATIC_VALUE_0400
     * @tc.name testGetStaticValue0400
     * @tc.desc Verify negative static int fields read back with their declared current values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetStaticValue0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroField = (Type.from<SvSample014>() as ClassType).getFieldByName("count");
      const negativeField = (Type.from<SvSample015>() as ClassType).getFieldByName("count");
      const zeroValue = zeroField.getStaticValue() as int;
      const negativeValue = negativeField.getStaticValue() as int;
      expect(zeroValue).assertEqual(0);
      expect(negativeValue).assertEqual(-100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_STATIC_VALUE_0500
     * @tc.name testGetStaticValue0500
     * @tc.desc Verify setStaticValue followed by getStaticValue returns the assigned int value and restores original value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetStaticValue0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<SvSample012>() as ClassType).getFieldByName("count");
      const original: int = SvSample012.count;
      expect(field.getName()).assertEqual("count");
      expect(field.getType().toString()).assertEqual("int");
      try {
        field.setStaticValue(24);
        expect(field.getStaticValue() as int).assertEqual(24);
        expect(SvSample012.count).assertEqual(24);
      } finally {
        field.setStaticValue(original);
      }
      expect(SvSample012.count).assertEqual(original);
      expect(field.getStaticValue() as int).assertEqual(original);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_STATIC_VALUE_0600
     * @tc.name testGetStaticValue0600
     * @tc.desc Verify updating one int static field does not change a separate int static field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetStaticValue0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = (Type.from<SvSample012>() as ClassType).getFieldByName("count");
      const second = (Type.from<SvSample018>() as ClassType).getFieldByName("maxVal");
      const originalFirst: int = SvSample012.count;
      const originalSecond: int = SvSample018.maxVal;
      expect(first.getStaticValue() as int).assertEqual(originalFirst);
      expect(second.getStaticValue() as int).assertEqual(originalSecond);
      try {
        first.setStaticValue(77);
        expect(first.getStaticValue() as int).assertEqual(77);
        expect(SvSample012.count).assertEqual(77);
        expect(second.getStaticValue() as int).assertEqual(originalSecond);
        expect(SvSample018.maxVal).assertEqual(originalSecond);
      } finally {
        first.setStaticValue(originalFirst);
      }
      expect(first.getStaticValue() as int).assertEqual(originalFirst);
      expect(second.getStaticValue() as int).assertEqual(originalSecond);
      expect(SvSample012.count).assertEqual(originalFirst);
      expect(SvSample018.maxVal).assertEqual(originalSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_STATIC_VALUE_0700
     * @tc.name testGetStaticValue0700
     * @tc.desc Verify alternating reflective writes update getStaticValue independently for two static int fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetStaticValue0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<SvSample029>() as ClassType;
      const left = classType.getFieldByName("left");
      const right = classType.getFieldByName("right");
      const originalLeft: int = SvSample029.left;
      const originalRight: int = SvSample029.right;
      expect(left.getStaticValue() as int).assertEqual(originalLeft);
      expect(right.getStaticValue() as int).assertEqual(originalRight);
      try {
        left.setStaticValue(30);
        expect(SvSample029.left).assertEqual(30);
        expect(SvSample029.right).assertEqual(originalRight);
        right.setStaticValue(40);
        expect(left.getStaticValue() as int).assertEqual(30);
        expect(right.getStaticValue() as int).assertEqual(40);
        expect(SvSample029.left).assertEqual(30);
        expect(SvSample029.right).assertEqual(40);
      } finally {
        left.setStaticValue(originalLeft);
        right.setStaticValue(originalRight);
      }
      expect(left.getStaticValue() as int).assertEqual(originalLeft);
      expect(right.getStaticValue() as int).assertEqual(originalRight);
      expect(SvSample029.left).assertEqual(originalLeft);
      expect(SvSample029.right).assertEqual(originalRight);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_STATIC_VALUE_0800
     * @tc.name testGetStaticValue0800
     * @tc.desc Verify failed instance static read does not disturb later reflective static int writes and restore
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetStaticValue0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<SvSample027>() as ClassType;
      const instanceField = classType.getFieldByName("instanceCount");
      const staticField = classType.getFieldByName("staticCount");
      const original = SvSample027.staticCount;
      try {
        instanceField.getStaticValue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
      expect(instanceField.isStatic()).assertFalse();
      expect(SvSample027.staticCount).assertEqual(original);
      try {
        staticField.setStaticValue(61);
        expect(staticField.getStaticValue() as int).assertEqual(61);
        expect(SvSample027.staticCount).assertEqual(61);
      } finally {
        staticField.setStaticValue(original);
      }
      expect(staticField.getStaticValue() as int).assertEqual(original);
      expect(SvSample027.staticCount).assertEqual(original);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_STATIC_VALUE_0900
     * @tc.name testGetStaticValue0900
     * @tc.desc Verify double static values can be read after reflective double writes and recovery
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetStaticValue0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<SvSample009>() as ClassType).getFieldByName("score");
      const original: double = SvSample009.score;
      expect(field.getStaticValue() as double).assertEqual(original);
      try {
        field.setStaticValue(6.28);
        expect(field.getStaticValue() as double).assertEqual(6.28);
        expect(SvSample009.score).assertEqual(6.28);
      } finally {
        field.setStaticValue(original);
      }
      expect(field.getStaticValue() as double).assertEqual(original);
      expect(SvSample009.score).assertEqual(original);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_STATIC_VALUE_1000
     * @tc.name testGetStaticValue1000
     * @tc.desc Verify static boolean getStaticValue returns the declared current value while metadata remains correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetStaticValue1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<SvSample030>() as ClassType).getFieldByName("enabled");
      expect(field.isStatic()).assertTrue();
      expect(field.getType().toString()).assertEqual("boolean");
      expect(field.getStaticValue() as boolean).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_STATIC_VALUE_1100
     * @tc.name testGetStaticValue1100
     * @tc.desc Verify static string getStaticValue returns the declared current value while metadata remains correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetStaticValue1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<SvSample031>() as ClassType).getFieldByName("label");
      expect(field.isStatic()).assertTrue();
      expect(field.getType().toString()).assertEqual("string");
      const value = field.getStaticValue() as string;
      expect(value).assertEqual("test");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_STATIC_VALUE_1200
     * @tc.name testGetStaticValue1200
     * @tc.desc Verify static array values read back with declared length and elements while metadata remains correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetStaticValue1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<SvArrayMatrix1300>() as ClassType;
      const ids = classType.getFieldByName("ids");
      const names = classType.getFieldByName("names");
      const grid = classType.getFieldByName("grid");
      const idValues = ids.getStaticValue() as int[];
      const nameValues = names.getStaticValue() as string[];
      const gridValues = grid.getStaticValue() as int[][];
      expect(idValues.length).assertEqual(3);
      expect(idValues[0]).assertEqual(1);
      expect(idValues[2]).assertEqual(3);
      expect(nameValues.length).assertEqual(2);
      expect(nameValues[0]).assertEqual("left");
      expect(nameValues[1]).assertEqual("right");
      expect(gridValues.length).assertEqual(2);
      expect(gridValues[0][1]).assertEqual(2);
      expect(gridValues[1][0]).assertEqual(3);
      expect(ids.getType().toString()).assertEqual("std.core.Array");
      expect(grid.getType().toString()).assertEqual("std.core.Array");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_STATIC_VALUE_1300
     * @tc.name testGetStaticValue1300
     * @tc.desc Verify static object value reads back with declared fields while type metadata remains correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetStaticValue1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<SvObjectMatrix1400>() as ClassType).getFieldByName("payload");
      const payload = field.getStaticValue() as SvPayload1400;
      expect(payload.code).assertEqual(14);
      expect(payload.label).assertEqual("payload");
      expect(field.getType().getName()).assertEqual((Type.from<SvPayload1400>() as ClassType).getName());
      expect(field.isStatic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_STATIC_VALUE_1400
     * @tc.name testGetStaticValue1400
     * @tc.desc Verify static enum value reads back with declared value while type metadata remains correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetStaticValue1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<SvEnumMatrix1500>() as ClassType).getFieldByName("numericState");
      const state = field.getStaticValue() as SvNumericState1500;
      expect(state).assertEqual(SvNumericState1500.Ready);
      expect(field.getType().toString()).assertEqual(Type.from<SvNumericState1500>().toString());
      expect(field.getName()).assertEqual("numericState");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_STATIC_VALUE_1500
     * @tc.name testGetStaticValue1500
     * @tc.desc Verify static generic object values read back with declared contents while type text remains correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetStaticValue1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<SvGenericMatrix1600>() as ClassType;
      const textBox = classType.getFieldByName("textBox");
      const pair = classType.getFieldByName("pair");
      const textValue = textBox.getStaticValue() as SvBox1600<string>;
      const pairValue = pair.getStaticValue() as SvPair1600<int, string>;
      expect(textValue.value).assertEqual("box");
      expect(pairValue.key).assertEqual(16);
      expect(pairValue.value).assertEqual("pair");
      expect(textBox.getType().toString()).assertEqual(Type.from<SvBox1600<string>>().toString());
      expect(pair.getType().toString()).assertEqual(Type.from<SvPair1600<int, string>>().toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_STATIC_VALUE_1600
     * @tc.name testGetStaticValue1600
     * @tc.desc Verify static function values read back and remain callable while field metadata remains correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetStaticValue1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<SvFunctionMatrix1700>() as ClassType;
      const mapper = classType.getFieldByName("mapper");
      const supplier = classType.getFieldByName("supplier");
      const mapValue = mapper.getStaticValue() as SvMapper1700;
      const supplyValue = supplier.getStaticValue() as SvSupplier1700;
      expect(mapValue(17)).assertEqual("map-17");
      expect(supplyValue()).assertEqual("supplied");
      expect(mapper.getName()).assertEqual("mapper");
      expect(supplier.getName()).assertEqual("supplier");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_STATIC_VALUE_1700
     * @tc.name testGetStaticValue1700
     * @tc.desc Verify static readonly int value remains readable while a mutable peer is restored
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetStaticValue1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<SvReadonlyMatrix1800>() as ClassType;
      const fixed = classType.getFieldByName("fixed");
      const mutable = classType.getFieldByName("mutable");
      const originalMutable: int = SvReadonlyMatrix1800.mutable;
      expect(fixed.getStaticValue() as int).assertEqual(7);
      expect(fixed.isReadonly()).assertTrue();
      try {
        mutable.setStaticValue(18);
        expect(mutable.getStaticValue() as int).assertEqual(18);
        expect(SvReadonlyMatrix1800.mutable).assertEqual(18);
        expect(fixed.getStaticValue() as int).assertEqual(7);
      } finally {
        mutable.setStaticValue(originalMutable);
      }
      expect(mutable.getStaticValue() as int).assertEqual(originalMutable);
      expect(SvReadonlyMatrix1800.mutable).assertEqual(originalMutable);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_STATIC_VALUE_1800
     * @tc.name testGetStaticValue1800
     * @tc.desc Verify same named numeric static fields read their declared values and keep independent owners
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetStaticValue1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = (Type.from<SvSameNameLeft1900>() as ClassType).getFieldByName("shared");
      const right = (Type.from<SvSameNameRight1900>() as ClassType).getFieldByName("shared");
      expect(left.getStaticValue() as int).assertEqual(19);
      expect(right.getStaticValue() as double).assertEqual(19.5);
      expect(left.getName()).assertEqual("shared");
      expect(right.getName()).assertEqual("shared");
      expect(left.getOwnerType().getName()).assertEqual((Type.from<SvSameNameLeft1900>() as ClassType).getName());
      expect(right.getOwnerType().getName()).assertEqual((Type.from<SvSameNameRight1900>() as ClassType).getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_STATIC_VALUE_1900
     * @tc.name testGetStaticValue1900
     * @tc.desc Verify hidden numeric static fields read their declared values and keep owner metadata
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetStaticValue1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parentToken = (Type.from<SvHiddenParent2000>() as ClassType).getFieldByName("token");
      const childToken = (Type.from<SvHiddenChild2000>() as ClassType).getFieldByName("token");
      expect(parentToken.getStaticValue() as int).assertEqual(20);
      expect(childToken.getStaticValue() as int).assertEqual(21);
      expect(parentToken.getOwnerType().getName()).assertEqual((Type.from<SvHiddenParent2000>() as ClassType).getName());
      expect(childToken.getOwnerType().getName()).assertEqual((Type.from<SvHiddenChild2000>() as ClassType).getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_STATIC_VALUE_2000
     * @tc.name testGetStaticValue2000
     * @tc.desc Verify instance TypeError recovery preserves direct static object value and static field metadata
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetStaticValue2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<SvInstanceMatrix2100>() as ClassType;
      const instanceField = classType.getFieldByName("payload");
      try {
        instanceField.getStaticValue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
      expect(instanceField.isStatic()).assertFalse();
      expect(SvInstanceMatrix2100.staticPayload.code).assertEqual(21);
      expect(SvInstanceMatrix2100.staticPayload.label).assertEqual("static");
      const staticField = classType.getFieldByName("staticPayload");
      expect(staticField.isStatic()).assertTrue();
      expect(staticField.getType().getName()).assertEqual((Type.from<SvPayload1400>() as ClassType).getName());
      const reflectedPayload = staticField.getStaticValue() as SvPayload1400;
      expect(reflectedPayload.code).assertEqual(21);
      expect(reflectedPayload.label).assertEqual("static");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_STATIC_VALUE_2100
     * @tc.name testGetStaticValue2100
     * @tc.desc Verify repeated static int reads return the declared positive value consistently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetStaticValue2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<SvSample012>() as ClassType).getFieldByName("count");
      const first: int = field.getStaticValue() as int;
      const second: int = field.getStaticValue() as int;
      const third: int = field.getStaticValue() as int;
      expect(first).assertEqual(5);
      expect(second).assertEqual(5);
      expect(third).assertEqual(5);
      expect(second).assertEqual(first);
      expect(third).assertEqual(second);
      expect(field.getType().toString()).assertEqual("int");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_GET_STATIC_VALUE_2200
     * @tc.name testGetStaticValue2200
     * @tc.desc Verify long and float static fields read their declared values with exact type metadata
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testGetStaticValue2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<SvNumericMatrix2300>() as ClassType;
      const bigValue = classType.getFieldByName("bigValue");
      const ratio = classType.getFieldByName("ratio");
      expect(bigValue.getStaticValue() as long).assertEqual(100);
      expect(ratio.getStaticValue() as float).assertEqual(1.5f);
      expect(bigValue.getType().toString()).assertEqual("long");
      expect(ratio.getType().toString()).assertEqual("float");
    });
  });
}
