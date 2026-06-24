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

class SsSample001 {
  static count: int = 1;
}

class SsSample006 {
  static flag: boolean = false;
}

class SsSample008 {
  static count: int = 5;
}

class SsSample010 {
  static count: int = 0;
}

class SsSample018 {
  static name: string = "old";
}

class SsSample021 {
  static staticCount: int = 1;
  count: int = 1;
}

class SsSample023 {
  static price: double = 1.0;
}

class SsSample023Pair {
  static left: int = 1;
  static right: int = 2;
}

class SsSample024Pair {
  static flag: boolean = false;
  static count: int = 7;
}

class SsSample026 {
  static bigValue: long = 100;
}

class SsSample027 {
  static ratio: float = 1.0f;
}

class SsPrimitiveMatrix2100 {
  static count: int = 1;
  static price: double = 1.25;
  static bigValue: long = 100;
  static ratio: float = 1.5f;
  static title: string = "old";
  static enabled: boolean = false;
}

class SsArrayMatrix2200 {
  static ids: int[] = [1, 2];
  static names: string[] = ["left", "right"];
  static grid: int[][] = [[1, 2], [3, 4]];
}

class SsPayload2300 {
  code: int;
  label: string;

  constructor(code: int, label: string) {
    this.code = code;
    this.label = label;
  }
}

class SsObjectMatrix2300 {
  static payload: SsPayload2300 = new SsPayload2300(1, "old");
}

enum SsNumericState2400 {
  Ready, Done
}

enum SsStringState2400 {
  Ready = "READY", Done = "DONE"
}

class SsEnumMatrix2400 {
  static numericState: SsNumericState2400 = SsNumericState2400.Ready;
  static stringState: SsStringState2400 = SsStringState2400.Ready;
}

class SsBox2500<T> {
  value: T;

  constructor(value: T) {
    this.value = value;
  }
}

class SsPair2500<K, V> {
  key: K;
  value: V;

  constructor(key: K, value: V) {
    this.key = key;
    this.value = value;
  }
}

class SsGenericMatrix2500 {
  static textBox: SsBox2500<string> = new SsBox2500<string>("old");
  static pair: SsPair2500<int, string> = new SsPair2500<int, string>(1, "one");
}

type SsMapper2600 = (value: int) => string;
type SsSupplier2600 = () => string;

function ssMapOld2600(value: int): string {
  return "old-" + value.toString();
}

function ssMapNew2600(value: int): string {
  return "new-" + value.toString();
}

function ssSupplyOld2600(): string {
  return "old";
}

function ssSupplyNew2600(): string {
  return "new";
}

class SsFunctionMatrix2600 {
  static mapper: SsMapper2600 = ssMapOld2600;
  static supplier: SsSupplier2600 = ssSupplyOld2600;
}

class SsReadonlyMatrix2700 {
  static readonly fixed: int = 7;
  static mutable: int = 2;
}

class SsSameNameLeft2800 {
  static shared: int = 1;
}

class SsSameNameRight2800 {
  static shared: string = "right";
}

class SsHiddenParent2900 {
  static token: int = 1;
}

class SsHiddenChild2900 extends SsHiddenParent2900 {
  static token: string = "child";
}

class SsInheritedParent3000 {
  static inheritedCount: int = 5;
}

class SsInheritedChild3000 extends SsInheritedParent3000 {
}

class SsInstanceMatrix3100 {
  static staticPayload: SsPayload2300 = new SsPayload2300(10, "static");
  payload: SsPayload2300 = new SsPayload2300(11, "instance");
}

class SsErrorMatrix3200 {
  static ids: int[] = [1, 2, 3];
  static textBox: SsBox2500<string> = new SsBox2500<string>("safe");
}

class SsRepeatMatrix3400 {
  static label: string = "start";
  static payload: SsPayload2300 = new SsPayload2300(1, "start");
}

class SsNullableMatrix3500 {
  parA: undefined = undefined;
  parB: null = null;
  parC: string | undefined = undefined;
  parD: string | null = null;
  parE?: string;
  parF: Array<string> = new Array<string>();
  parG: string[] = [];
}

export default function FieldSetStaticValueTest(): void {
  describe('FieldSetStaticValueTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_SET_STATIC_VALUE_0100
     * @tc.name testSetStaticValue0100
     * @tc.desc Verify setStaticValue called with one int argument normally sets a static field value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSetStaticValue0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<SsSample001>() as ClassType;
      const field = classType.getFieldByName("count");
      const original: int = SsSample001.count;
      expect(field.getName()).assertEqual("count");
      expect(field.isStatic()).assertTrue();
      try {
        field.setStaticValue(2);
        expect(field.getStaticValue() as int).assertEqual(2);
        expect(SsSample001.count).assertEqual(2);
      } finally {
        field.setStaticValue(original);
      }
      expect(field.getStaticValue() as int).assertEqual(original);
      expect(SsSample001.count).assertEqual(original);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_SET_STATIC_VALUE_0200
     * @tc.name testSetStaticValue0200
     * @tc.desc Verify setStaticValue sets boolean type static field with boolean value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSetStaticValue0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<SsSample006>() as ClassType;
      const field = classType.getFieldByName("flag");
      const original: boolean = SsSample006.flag;
      try {
        field.setStaticValue(true);
        let val = field.getStaticValue() as boolean;
        expect(val).assertEqual(true);
      } finally {
        field.setStaticValue(original);
      }
      expect(field.getStaticValue() as boolean).assertEqual(original);
      expect(SsSample006.flag).assertEqual(original);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_SET_STATIC_VALUE_0300
     * @tc.name testSetStaticValue0300
     * @tc.desc Verify setStaticValue sets int static field to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSetStaticValue0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<SsSample008>() as ClassType;
      const field = classType.getFieldByName("count");
      const original: int = SsSample008.count;
      try {
        field.setStaticValue(0);
        let val = field.getStaticValue() as int;
        expect(val).assertEqual(0);
      } finally {
        field.setStaticValue(original);
      }
      expect(field.getStaticValue() as int).assertEqual(original);
      expect(SsSample008.count).assertEqual(original);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_SET_STATIC_VALUE_0400
     * @tc.name testSetStaticValue0400
     * @tc.desc Verify setStaticValue sets int static field to -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSetStaticValue0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<SsSample008>() as ClassType;
      const field = classType.getFieldByName("count");
      const original: int = SsSample008.count;
      try {
        field.setStaticValue(-1);
        let val = field.getStaticValue() as int;
        expect(val).assertEqual(-1);
      } finally {
        field.setStaticValue(original);
      }
      expect(field.getStaticValue() as int).assertEqual(original);
      expect(SsSample008.count).assertEqual(original);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_SET_STATIC_VALUE_0500
     * @tc.name testSetStaticValue0500
     * @tc.desc Verify setStaticValue sets int static field to max int value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSetStaticValue0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<SsSample010>() as ClassType;
      const field = classType.getFieldByName("count");
      const original: int = SsSample010.count;
      try {
        field.setStaticValue(2147483647);
        let val = field.getStaticValue() as int;
        expect(val).assertEqual(2147483647);
      } finally {
        field.setStaticValue(original);
      }
      expect(field.getStaticValue() as int).assertEqual(original);
      expect(SsSample010.count).assertEqual(original);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_SET_STATIC_VALUE_0600
     * @tc.name testSetStaticValue0600
     * @tc.desc Verify setStaticValue sets int static field to min int value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSetStaticValue0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<SsSample010>() as ClassType;
      const field = classType.getFieldByName("count");
      const original: int = SsSample010.count;
      const minIntValue: int = -2147483647 - 1;
      try {
        field.setStaticValue(minIntValue);
        let val = field.getStaticValue() as int;
        expect(val).assertEqual(minIntValue);
      } finally {
        field.setStaticValue(original);
      }
      expect(field.getStaticValue() as int).assertEqual(original);
      expect(SsSample010.count).assertEqual(original);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_SET_STATIC_VALUE_0700
     * @tc.name testSetStaticValue0700
     * @tc.desc Verify setStaticValue throws TypeError when setting boolean field with int value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSetStaticValue0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<SsSample006>() as ClassType;
      const field = classType.getFieldByName("flag");
      expect(SsSample006.flag).assertEqual(false);
      const original = SsSample006.flag;
      try {
        try {
          field.setStaticValue(123);
          expect().assertFail();
        } catch (e) {
          expect((e as Error).name).assertEqual('TypeError');
        }
        expect(field.getStaticValue() as boolean).assertEqual(original);
        expect(SsSample006.flag).assertEqual(original);
      } finally {
        field.setStaticValue(original);
      }
      const currentVal: boolean = field.getStaticValue() as boolean;
      expect(currentVal).assertEqual(original);
      expect(SsSample006.flag).assertEqual(original);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_SET_STATIC_VALUE_0800
     * @tc.name testSetStaticValue0800
     * @tc.desc Verify multiple setStaticValue calls and final getStaticValue returns last set value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSetStaticValue0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<SsSample010>() as ClassType;
      const field = classType.getFieldByName("count");
      const original: int = SsSample010.count;
      try {
        field.setStaticValue(10);
        field.setStaticValue(20);
        field.setStaticValue(30);
        let result = field.getStaticValue() as int;
        expect(result).assertEqual(30);
      } finally {
        field.setStaticValue(original);
      }
      expect(field.getStaticValue() as int).assertEqual(original);
      expect(SsSample010.count).assertEqual(original);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_SET_STATIC_VALUE_0900
     * @tc.name testSetStaticValue0900
     * @tc.desc Verify setStaticValue on instance field throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSetStaticValue0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<SsSample021>() as ClassType;
      const field = classType.getFieldByName("count");
      try {
        field.setStaticValue(99);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('TypeError');
      }
      expect(field.isStatic()).assertFalse();
      expect(SsSample021.staticCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_SET_STATIC_VALUE_1000
     * @tc.name testSetStaticValue1000
     * @tc.desc Verify setStaticValue with boolean on double field throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSetStaticValue1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<SsSample023>() as ClassType;
      const field = classType.getFieldByName("price");
      const original: double = SsSample023.price;
      try {
        try {
          field.setStaticValue(true);
          expect().assertFail();
        } catch (e) {
          expect((e as Error).name).assertEqual('TypeError');
        }
        expect(field.getStaticValue() as double).assertEqual(original);
      } finally {
        field.setStaticValue(original);
      }
      expect(field.getStaticValue() as double).assertEqual(original);
      expect(SsSample023.price).assertEqual(original);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_SET_STATIC_VALUE_1100
     * @tc.name testSetStaticValue1100
     * @tc.desc Verify int static field rejects boolean value and remains writable afterward
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSetStaticValue1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<SsSample001>() as ClassType;
      const field = classType.getFieldByName("count");
      const original = SsSample001.count;
      try {
        try {
          field.setStaticValue(true);
          expect().assertFail();
        } catch (e) {
          expect((e as Error).name).assertEqual('TypeError');
        }
        expect(field.getStaticValue() as int).assertEqual(original);
      } finally {
        field.setStaticValue(original);
      }
      expect(field.getStaticValue() as int).assertEqual(original);
      expect(SsSample001.count).assertEqual(original);
      try {
        field.setStaticValue(3);
        expect(field.getStaticValue() as int).assertEqual(3);
      } finally {
        field.setStaticValue(original);
      }
      expect(field.getStaticValue() as int).assertEqual(original);
      expect(SsSample001.count).assertEqual(original);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_SET_STATIC_VALUE_1200
     * @tc.name testSetStaticValue1200
     * @tc.desc Verify setStaticValue throws TypeError for a wrong value type and remains writable afterward
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSetStaticValue1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<SsSample001>() as ClassType;
      const validField = classType.getFieldByName("count");
      const original: int = SsSample001.count;
      try {
        try {
          validField.setStaticValue("bad-count");
          expect().assertFail();
        } catch (e) {
          expect((e as Error).name).assertEqual('TypeError');
        }
        expect(SsSample001.count).assertEqual(original);
        validField.setStaticValue(77);
        expect(validField.getStaticValue() as int).assertEqual(77);
        expect(SsSample001.count).assertEqual(77);
      } finally {
        validField.setStaticValue(original);
      }
      expect(SsSample001.count).assertEqual(original);
      expect(validField.getStaticValue() as int).assertEqual(original);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_SET_STATIC_VALUE_1300
     * @tc.name testSetStaticValue1300
     * @tc.desc Verify setStaticValue updates a string static field to an empty value and restores it through direct static access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSetStaticValue1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<SsSample018>() as ClassType).getFieldByName("name");
      const original: string = SsSample018.name;
      try {
        field.setStaticValue("");
        expect(SsSample018.name).assertEqual("");
      } finally {
        field.setStaticValue(original);
      }
      expect(SsSample018.name).assertEqual(original);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_SET_STATIC_VALUE_1400
     * @tc.name testSetStaticValue1400
     * @tc.desc Verify alternating reflective writes to two int static fields remain isolated and restorable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSetStaticValue1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<SsSample023Pair>() as ClassType;
      const left = classType.getFieldByName("left");
      const right = classType.getFieldByName("right");
      const originalLeft = SsSample023Pair.left;
      const originalRight = SsSample023Pair.right;
      try {
        left.setStaticValue(21);
        expect(left.getStaticValue() as int).assertEqual(21);
        expect(right.getStaticValue() as int).assertEqual(originalRight);
        right.setStaticValue(22);
        expect(left.getStaticValue() as int).assertEqual(21);
        expect(right.getStaticValue() as int).assertEqual(22);
      } finally {
        left.setStaticValue(originalLeft);
        right.setStaticValue(originalRight);
      }
      expect(left.getStaticValue() as int).assertEqual(originalLeft);
      expect(right.getStaticValue() as int).assertEqual(originalRight);
      expect(SsSample023Pair.left).assertEqual(originalLeft);
      expect(SsSample023Pair.right).assertEqual(originalRight);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_SET_STATIC_VALUE_1500
     * @tc.name testSetStaticValue1500
     * @tc.desc Verify reflective boolean write updates getStaticValue and direct static access consistently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSetStaticValue1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<SsSample024Pair>() as ClassType;
      const flag = classType.getFieldByName("flag");
      const originalFlag = SsSample024Pair.flag;
      try {
        flag.setStaticValue(true);
        expect(flag.getStaticValue() as boolean).assertTrue();
        expect(SsSample024Pair.flag).assertTrue();
      } finally {
        flag.setStaticValue(originalFlag);
      }
      expect(flag.getStaticValue() as boolean).assertEqual(originalFlag);
      expect(SsSample024Pair.flag).assertEqual(originalFlag);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_SET_STATIC_VALUE_1600
     * @tc.name testSetStaticValue1600
     * @tc.desc Verify a failed write to one int field does not block a later valid write to another int field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSetStaticValue1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<SsSample023Pair>() as ClassType;
      const left = classType.getFieldByName("left");
      const right = classType.getFieldByName("right");
      const originalLeft = SsSample023Pair.left;
      const originalRight = SsSample023Pair.right;
      try {
        try {
          left.setStaticValue("bad");
          expect().assertFail();
        } catch (e) {
          expect((e as Error).name).assertEqual('TypeError');
        }
        expect(left.getStaticValue() as int).assertEqual(originalLeft);
      } finally {
        left.setStaticValue(originalLeft);
      }
      expect(left.getStaticValue() as int).assertEqual(originalLeft);
      try {
        right.setStaticValue(31);
        expect(right.getStaticValue() as int).assertEqual(31);
        expect(left.getStaticValue() as int).assertEqual(originalLeft);
      } finally {
        right.setStaticValue(originalRight);
      }
      expect(right.getStaticValue() as int).assertEqual(originalRight);
      expect(SsSample023Pair.left).assertEqual(originalLeft);
      expect(SsSample023Pair.right).assertEqual(originalRight);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_SET_STATIC_VALUE_1700
     * @tc.name testSetStaticValue1700
     * @tc.desc Verify setStaticValue accepts a double value for a double static field and restores original value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSetStaticValue1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<SsSample023>() as ClassType).getFieldByName("price");
      const original = SsSample023.price;
      try {
        field.setStaticValue(2.5);
        expect(field.getStaticValue() as double).assertEqual(2.5);
      } finally {
        field.setStaticValue(original);
      }
      expect(field.getStaticValue() as double).assertEqual(original);
      expect(SsSample023.price).assertEqual(original);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_SET_STATIC_VALUE_1800
     * @tc.name testSetStaticValue1800
     * @tc.desc Verify setStaticValue keeps Field identity and metadata stable across equals name and type reads
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSetStaticValue1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<SsSample001>() as ClassType;
      const field = classType.getFieldByName("count");
      const sameField = classType.getFieldByName("count");
      const original = SsSample001.count;
      try {
        field.setStaticValue(9);
        expect(field.getStaticValue() as int).assertEqual(9);
        expect(field.equals(sameField)).assertTrue();
        expect(field.getName()).assertEqual("count");
        expect(field.getType().toString()).assertEqual("int");
      } finally {
        field.setStaticValue(original);
      }
      expect(field.getStaticValue() as int).assertEqual(original);
      expect(SsSample001.count).assertEqual(original);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_SET_STATIC_VALUE_1900
     * @tc.name testSetStaticValue1900
     * @tc.desc Verify setStaticValue sets long static field and restores original value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSetStaticValue1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<SsSample026>() as ClassType;
      const field = classType.getFieldByName("bigValue");
      const original: long = SsSample026.bigValue;
      try {
        field.setStaticValue(200);
        expect(field.getStaticValue() as long).assertEqual(200);
      } finally {
        field.setStaticValue(original);
      }
      expect(field.getStaticValue() as long).assertEqual(original);
      expect(SsSample026.bigValue).assertEqual(original);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_SET_STATIC_VALUE_2000
     * @tc.name testSetStaticValue2000
     * @tc.desc Verify setStaticValue sets float static field and restores original value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSetStaticValue2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<SsSample027>() as ClassType;
      const field = classType.getFieldByName("ratio");
      const original: float = SsSample027.ratio;
      try {
        field.setStaticValue(2.5f);
        expect(field.getStaticValue() as float).assertEqual(2.5f);
      } finally {
        field.setStaticValue(original);
      }
      expect(field.getStaticValue() as float).assertEqual(original);
      expect(SsSample027.ratio).assertEqual(original);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_SET_STATIC_VALUE_2100
     * @tc.name testSetStaticValue2100
     * @tc.desc Verify primitive static fields accept matching values and keep getType text stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSetStaticValue2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<SsPrimitiveMatrix2100>() as ClassType;
      const count = classType.getFieldByName("count");
      const price = classType.getFieldByName("price");
      const bigValue = classType.getFieldByName("bigValue");
      const ratio = classType.getFieldByName("ratio");
      const title = classType.getFieldByName("title");
      const enabled = classType.getFieldByName("enabled");
      const originalCount: int = SsPrimitiveMatrix2100.count;
      const originalPrice: double = SsPrimitiveMatrix2100.price;
      const originalBigValue: long = SsPrimitiveMatrix2100.bigValue;
      const originalRatio: float = SsPrimitiveMatrix2100.ratio;
      const originalTitle: string = SsPrimitiveMatrix2100.title;
      const originalEnabled: boolean = SsPrimitiveMatrix2100.enabled;
      try {
        count.setStaticValue(21);
        price.setStaticValue(2.75);
        bigValue.setStaticValue(2100);
        ratio.setStaticValue(3.5f);
        title.setStaticValue("new-title");
        enabled.setStaticValue(true);
        expect(count.getStaticValue() as int).assertEqual(21);
        expect(price.getStaticValue() as double).assertEqual(2.75);
        expect(bigValue.getStaticValue() as long).assertEqual(2100);
        expect(ratio.getStaticValue() as float).assertEqual(3.5f);
        expect(SsPrimitiveMatrix2100.title).assertEqual("new-title");
        expect(enabled.getStaticValue() as boolean).assertEqual(true);
        expect(count.getType().toString()).assertEqual("int");
        expect(price.getType().toString()).assertEqual("double");
        expect(bigValue.getType().toString()).assertEqual("long");
        expect(ratio.getType().toString()).assertEqual("float");
        expect(title.getType().toString()).assertEqual("string");
        expect(enabled.getType().toString()).assertEqual("boolean");
      } finally {
        count.setStaticValue(originalCount);
        price.setStaticValue(originalPrice);
        bigValue.setStaticValue(originalBigValue);
        ratio.setStaticValue(originalRatio);
        title.setStaticValue(originalTitle);
        enabled.setStaticValue(originalEnabled);
      }
      expect(count.getStaticValue() as int).assertEqual(originalCount);
      expect(price.getStaticValue() as double).assertEqual(originalPrice);
      expect(bigValue.getStaticValue() as long).assertEqual(originalBigValue);
      expect(ratio.getStaticValue() as float).assertEqual(originalRatio);
      expect(SsPrimitiveMatrix2100.title).assertEqual(originalTitle);
      expect(enabled.getStaticValue() as boolean).assertEqual(originalEnabled);
      expect(SsPrimitiveMatrix2100.count).assertEqual(originalCount);
      expect(SsPrimitiveMatrix2100.price).assertEqual(originalPrice);
      expect(SsPrimitiveMatrix2100.bigValue).assertEqual(originalBigValue);
      expect(SsPrimitiveMatrix2100.ratio).assertEqual(originalRatio);
      expect(SsPrimitiveMatrix2100.enabled).assertEqual(originalEnabled);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_SET_STATIC_VALUE_2200
     * @tc.name testSetStaticValue2200
     * @tc.desc Verify array static fields accept one dimensional and two dimensional arrays while metadata stays stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSetStaticValue2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<SsArrayMatrix2200>() as ClassType;
      const ids = classType.getFieldByName("ids");
      const names = classType.getFieldByName("names");
      const grid = classType.getFieldByName("grid");
      const originalIds: int[] = SsArrayMatrix2200.ids;
      const originalNames: string[] = SsArrayMatrix2200.names;
      const originalGrid: int[][] = SsArrayMatrix2200.grid;
      const newIds: int[] = [7, 8, 9];
      const newNames: string[] = ["alpha", "beta"];
      const newGrid: int[][] = [[5, 6], [7, 8]];
      try {
        ids.setStaticValue(newIds);
        names.setStaticValue(newNames);
        grid.setStaticValue(newGrid);
        expect(SsArrayMatrix2200.ids.length).assertEqual(3);
        expect(SsArrayMatrix2200.ids[0]).assertEqual(7);
        expect(SsArrayMatrix2200.names[1]).assertEqual("beta");
        expect(SsArrayMatrix2200.grid[1][1]).assertEqual(8);
        expect(ids.getName()).assertEqual("ids");
        expect(names.getName()).assertEqual("names");
        expect(grid.getName()).assertEqual("grid");
        expect(ids.getType().toString()).assertEqual("std.core.Array");
        expect(names.getType().toString()).assertEqual("std.core.Array");
        expect(grid.getType().toString()).assertEqual("std.core.Array");
      } finally {
        ids.setStaticValue(originalIds);
        names.setStaticValue(originalNames);
        grid.setStaticValue(originalGrid);
      }
      expect(ids.getType().toString()).assertEqual("std.core.Array");
      expect(names.getType().toString()).assertEqual("std.core.Array");
      expect(SsArrayMatrix2200.ids).assertEqual(originalIds);
      expect(SsArrayMatrix2200.names).assertEqual(originalNames);
      expect(SsArrayMatrix2200.grid).assertEqual(originalGrid);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_SET_STATIC_VALUE_2300
     * @tc.name testSetStaticValue2300
     * @tc.desc Verify custom object static field accepts same class instance and preserves declared type metadata
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSetStaticValue2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field = (Type.from<SsObjectMatrix2300>() as ClassType).getFieldByName("payload");
      const original: SsPayload2300 = SsObjectMatrix2300.payload;
      const replacement: SsPayload2300 = new SsPayload2300(23, "new");
      try {
        field.setStaticValue(replacement);
        expect(SsObjectMatrix2300.payload.code).assertEqual(23);
        expect(SsObjectMatrix2300.payload.label).assertEqual("new");
        expect(field.getName()).assertEqual("payload");
        expect(field.getType().getName()).assertEqual((Type.from<SsPayload2300>() as ClassType).getName());
        expect(field.toString()).assertEqual("payload: " + Type.from<SsPayload2300>().toString());
      } finally {
        field.setStaticValue(original);
      }
      expect(field.isStatic()).assertTrue();
      expect(SsObjectMatrix2300.payload).assertEqual(original);
      expect(SsObjectMatrix2300.payload.code).assertEqual(original.code);
      expect(SsObjectMatrix2300.payload.label).assertEqual(original.label);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_SET_STATIC_VALUE_2400
     * @tc.name testSetStaticValue2400
     * @tc.desc Verify numeric and string enum static fields accept enum values and keep enum type metadata
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSetStaticValue2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<SsEnumMatrix2400>() as ClassType;
      const numericState = classType.getFieldByName("numericState");
      const stringState = classType.getFieldByName("stringState");
      const originalNumeric: SsNumericState2400 = SsEnumMatrix2400.numericState;
      const originalString: SsStringState2400 = SsEnumMatrix2400.stringState;
      try {
        numericState.setStaticValue(SsNumericState2400.Done);
        stringState.setStaticValue(SsStringState2400.Done);
        expect(SsEnumMatrix2400.numericState).assertEqual(SsNumericState2400.Done);
        expect(SsEnumMatrix2400.stringState).assertEqual(SsStringState2400.Done);
        expect(numericState.getName()).assertEqual("numericState");
        expect(stringState.getName()).assertEqual("stringState");
        expect(numericState.getType().toString()).assertEqual(Type.from<SsNumericState2400>().toString());
        expect(stringState.getType().toString()).assertEqual(Type.from<SsStringState2400>().toString());
        expect(numericState.getStaticValue() as SsNumericState2400).assertEqual(SsNumericState2400.Done);
        expect(stringState.getStaticValue() as SsStringState2400).assertEqual(SsStringState2400.Done);
        expect(numericState.equals(stringState)).assertFalse();
      } finally {
        numericState.setStaticValue(originalNumeric);
        stringState.setStaticValue(originalString);
      }
      expect(SsEnumMatrix2400.numericState).assertEqual(originalNumeric);
      expect(SsEnumMatrix2400.stringState).assertEqual(originalString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_SET_STATIC_VALUE_2500
     * @tc.name testSetStaticValue2500
     * @tc.desc Verify generic container static fields accept matching generic instances and retain parameterized type text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSetStaticValue2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<SsGenericMatrix2500>() as ClassType;
      const textBox = classType.getFieldByName("textBox");
      const pair = classType.getFieldByName("pair");
      const originalTextBox: SsBox2500<string> = SsGenericMatrix2500.textBox;
      const originalPair: SsPair2500<int, string> = SsGenericMatrix2500.pair;
      const newTextBox: SsBox2500<string> = new SsBox2500<string>("changed");
      const newPair: SsPair2500<int, string> = new SsPair2500<int, string>(25, "changed");
      try {
        textBox.setStaticValue(newTextBox);
        pair.setStaticValue(newPair);
        expect(SsGenericMatrix2500.textBox.value).assertEqual("changed");
        expect(SsGenericMatrix2500.pair.key).assertEqual(25);
        expect(SsGenericMatrix2500.pair.value).assertEqual("changed");
        expect(textBox.getName()).assertEqual("textBox");
        expect(pair.getName()).assertEqual("pair");
        expect(textBox.getType().toString()).assertEqual(Type.from<SsBox2500<string>>().toString());
        expect(pair.getType().toString()).assertEqual(Type.from<SsPair2500<int, string>>().toString());
      } finally {
        textBox.setStaticValue(originalTextBox);
        pair.setStaticValue(originalPair);
      }
      expect(textBox.isStatic()).assertTrue();
      expect(pair.isStatic()).assertTrue();
      expect(SsGenericMatrix2500.textBox).assertEqual(originalTextBox);
      expect(SsGenericMatrix2500.textBox.value).assertEqual(originalTextBox.value);
      expect(SsGenericMatrix2500.pair).assertEqual(originalPair);
      expect(SsGenericMatrix2500.pair.key).assertEqual(originalPair.key);
      expect(SsGenericMatrix2500.pair.value).assertEqual(originalPair.value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_SET_STATIC_VALUE_2600
     * @tc.name testSetStaticValue2600
     * @tc.desc Verify function typed static field metadata is correct and direct assignment updates and restores function values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     * @tc.knownIssue setStaticValue on function-typed fields causes runtime crash, direct assignment is used instead
     */
    it('testSetStaticValue2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<SsFunctionMatrix2600>() as ClassType;
      const mapper = classType.getFieldByName("mapper");
      const supplier = classType.getFieldByName("supplier");
      const originalMapper: SsMapper2600 = SsFunctionMatrix2600.mapper;
      const originalSupplier: SsSupplier2600 = SsFunctionMatrix2600.supplier;
      try {
        SsFunctionMatrix2600.mapper = ssMapNew2600;
        SsFunctionMatrix2600.supplier = ssSupplyNew2600;
        expect(SsFunctionMatrix2600.mapper(26)).assertEqual("new-26");
        expect(SsFunctionMatrix2600.supplier()).assertEqual("new");
      } finally {
        SsFunctionMatrix2600.mapper = originalMapper;
        SsFunctionMatrix2600.supplier = originalSupplier;
      }
      expect(mapper.getName()).assertEqual("mapper");
      expect(supplier.getName()).assertEqual("supplier");
      expect(mapper.isStatic()).assertTrue();
      expect(supplier.isStatic()).assertTrue();
      expect(SsFunctionMatrix2600.mapper(26)).assertEqual("old-26");
      expect(SsFunctionMatrix2600.supplier()).assertEqual("old");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_SET_STATIC_VALUE_2700
     * @tc.name testSetStaticValue2700
     * @tc.desc Verify readonly static int remains readable while a mutable peer is written and restored
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSetStaticValue2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<SsReadonlyMatrix2700>() as ClassType;
      const fixed = classType.getFieldByName("fixed");
      const mutable = classType.getFieldByName("mutable");
      const originalMutable: int = SsReadonlyMatrix2700.mutable;
      expect(fixed.isStatic()).assertTrue();
      expect(fixed.isReadonly()).assertTrue();
      expect(fixed.getStaticValue() as int).assertEqual(7);
      try {
        mutable.setStaticValue(27);
        expect(mutable.getStaticValue() as int).assertEqual(27);
        expect(mutable.isReadonly()).assertFalse();
        expect(fixed.isReadonly()).assertTrue();
        expect(fixed.getType().toString()).assertEqual("int");
      } finally {
        mutable.setStaticValue(originalMutable);
      }
      expect(mutable.getStaticValue() as int).assertEqual(originalMutable);
      expect(SsReadonlyMatrix2700.mutable).assertEqual(originalMutable);
      expect(fixed.getStaticValue() as int).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_SET_STATIC_VALUE_2800
     * @tc.name testSetStaticValue2800
     * @tc.desc Verify same named static fields in unrelated classes are written independently by owner and type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSetStaticValue2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = (Type.from<SsSameNameLeft2800>() as ClassType).getFieldByName("shared");
      const right = (Type.from<SsSameNameRight2800>() as ClassType).getFieldByName("shared");
      const originalLeft: int = SsSameNameLeft2800.shared;
      const originalRight: string = SsSameNameRight2800.shared;
      try {
        left.setStaticValue(28);
        right.setStaticValue("twenty-eight");
        expect(left.getStaticValue() as int).assertEqual(28);
        expect(SsSameNameRight2800.shared).assertEqual("twenty-eight");
        expect(left.getName()).assertEqual("shared");
        expect(right.getName()).assertEqual("shared");
        expect(left.getType().toString()).assertEqual("int");
        expect(right.getType().toString()).assertEqual("string");
        expect(left.getOwnerType().getName()).assertEqual((Type.from<SsSameNameLeft2800>() as ClassType).getName());
        expect(right.getOwnerType().getName()).assertEqual((Type.from<SsSameNameRight2800>() as ClassType).getName());
      } finally {
        left.setStaticValue(originalLeft);
        right.setStaticValue(originalRight);
      }
      expect(left.getStaticValue() as int).assertEqual(originalLeft);
      expect(SsSameNameRight2800.shared).assertEqual(originalRight);
      expect(SsSameNameLeft2800.shared).assertEqual(originalLeft);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_SET_STATIC_VALUE_2900
     * @tc.name testSetStaticValue2900
     * @tc.desc Verify hidden parent and child static fields are written independently and preserve different type metadata
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSetStaticValue2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parentToken = (Type.from<SsHiddenParent2900>() as ClassType).getFieldByName("token");
      const childToken = (Type.from<SsHiddenChild2900>() as ClassType).getFieldByName("token");
      const originalParent: int = SsHiddenParent2900.token;
      const originalChild: string = SsHiddenChild2900.token;
      try {
        parentToken.setStaticValue(29);
        childToken.setStaticValue("child-29");
        expect(parentToken.getStaticValue() as int).assertEqual(29);
        expect(SsHiddenChild2900.token).assertEqual("child-29");
        expect(parentToken.getType().toString()).assertEqual("int");
        expect(childToken.getType().toString()).assertEqual("string");
        expect(parentToken.getOwnerType().getName())
          .assertEqual((Type.from<SsHiddenParent2900>() as ClassType).getName());
        expect(childToken.getOwnerType().getName())
          .assertEqual((Type.from<SsHiddenChild2900>() as ClassType).getName());
      } finally {
        parentToken.setStaticValue(originalParent);
        childToken.setStaticValue(originalChild);
      }
      expect(parentToken.getStaticValue() as int).assertEqual(originalParent);
      expect(SsHiddenChild2900.token).assertEqual(originalChild);
      expect(SsHiddenParent2900.token).assertEqual(originalParent);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_SET_STATIC_VALUE_3000
     * @tc.name testSetStaticValue3000
     * @tc.desc Verify inherited static field resolved through parent and child metadata writes the same declared field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSetStaticValue3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parentField = (Type.from<SsInheritedParent3000>() as ClassType).getFieldByName("inheritedCount");
      const childField = (Type.from<SsInheritedChild3000>() as ClassType).getFieldByName("inheritedCount");
      const original: int = SsInheritedParent3000.inheritedCount;
      try {
        childField.setStaticValue(30);
        expect(parentField.getStaticValue() as int).assertEqual(30);
        expect(childField.getStaticValue() as int).assertEqual(30);
        expect(parentField.getType().toString()).assertEqual("int");
        expect(childField.getType().toString()).assertEqual("int");
        expect(parentField.getOwnerType().getName())
          .assertEqual((Type.from<SsInheritedParent3000>() as ClassType).getName());
        expect(childField.getOwnerType().getName())
          .assertEqual((Type.from<SsInheritedParent3000>() as ClassType).getName());
      } finally {
        parentField.setStaticValue(original);
      }
      expect(parentField.getStaticValue() as int).assertEqual(original);
      expect(childField.getStaticValue() as int).assertEqual(original);
      expect(SsInheritedParent3000.inheritedCount).assertEqual(original);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_SET_STATIC_VALUE_3100
     * @tc.name testSetStaticValue3100
     * @tc.desc Verify setStaticValue on custom object instance field throws TypeError and static peer remains usable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSetStaticValue3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<SsInstanceMatrix3100>() as ClassType;
      const instanceField = classType.getFieldByName("payload");
      const staticField = classType.getFieldByName("staticPayload");
      const original: SsPayload2300 = SsInstanceMatrix3100.staticPayload;
      try {
        try {
          instanceField.setStaticValue(new SsPayload2300(31, "bad"));
          expect().assertFail();
        } catch (e) {
          expect((e as Error).name).assertEqual('TypeError');
        }
        staticField.setStaticValue(new SsPayload2300(32, "good"));
        expect(SsInstanceMatrix3100.staticPayload.code).assertEqual(32);
        expect(SsInstanceMatrix3100.staticPayload.label).assertEqual("good");
        expect(staticField.getName()).assertEqual("staticPayload");
        expect(instanceField.isStatic()).assertFalse();
        expect(staticField.isStatic()).assertTrue();
      } finally {
        staticField.setStaticValue(original);
      }
      expect(SsInstanceMatrix3100.staticPayload).assertEqual(original);
      expect(SsInstanceMatrix3100.staticPayload.code).assertEqual(original.code);
      expect(SsInstanceMatrix3100.staticPayload.label).assertEqual(original.label);
      expect(staticField.getType().getName()).assertEqual((Type.from<SsPayload2300>() as ClassType).getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_SET_STATIC_VALUE_3200
     * @tc.name testSetStaticValue3200
     * @tc.desc Verify wrong value types for array and generic static fields throw TypeError and preserve metadata
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSetStaticValue3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<SsErrorMatrix3200>() as ClassType;
      const ids = classType.getFieldByName("ids");
      const textBox = classType.getFieldByName("textBox");
      const originalIds: int[] = SsErrorMatrix3200.ids;
      const originalIdsSnapshot: int[] = [];
      for (let index: int = 0; index < originalIds.length; index++) {
        originalIdsSnapshot.push(originalIds[index]);
      }
      const originalTextBox: SsBox2500<string> = SsErrorMatrix3200.textBox;
      const originalTextBoxValue: string = originalTextBox.value;
      try {
        try {
          ids.setStaticValue("bad-array");
          expect().assertFail();
        } catch (e) {
          expect((e as Error).name).assertEqual('TypeError');
        }
        expect(SsErrorMatrix3200.ids.length).assertEqual(originalIdsSnapshot.length);
        for (let index: int = 0; index < originalIdsSnapshot.length; index++) {
          expect(SsErrorMatrix3200.ids[index]).assertEqual(originalIdsSnapshot[index]);
        }
        try {
          textBox.setStaticValue(new SsPayload2300(32, "bad"));
          expect().assertFail();
        } catch (e) {
          expect((e as Error).name).assertEqual('TypeError');
        }
        expect(SsErrorMatrix3200.textBox).assertEqual(originalTextBox);
        expect(SsErrorMatrix3200.textBox.value).assertEqual(originalTextBoxValue);
      } finally {
        ids.setStaticValue(originalIds);
        textBox.setStaticValue(originalTextBox);
      }
      expect(SsErrorMatrix3200.ids).assertEqual(originalIds);
      expect(SsErrorMatrix3200.textBox).assertEqual(originalTextBox);
      expect(ids.getType().toString()).assertEqual("std.core.Array");
      expect(textBox.getType().toString()).assertEqual(Type.from<SsBox2500<string>>().toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_SET_STATIC_VALUE_3300
     * @tc.name testSetStaticValue3300
     * @tc.desc Verify repeated writes to string and object static fields remain stable and restore final state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSetStaticValue3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<SsRepeatMatrix3400>() as ClassType;
      const label = classType.getFieldByName("label");
      const payload = classType.getFieldByName("payload");
      const originalLabel: string = SsRepeatMatrix3400.label;
      const originalPayload: SsPayload2300 = SsRepeatMatrix3400.payload;
      try {
        label.setStaticValue("first");
        label.setStaticValue("second");
        label.setStaticValue("third");
        payload.setStaticValue(new SsPayload2300(41, "first"));
        payload.setStaticValue(new SsPayload2300(42, "second"));
        payload.setStaticValue(new SsPayload2300(43, "third"));
        expect(SsRepeatMatrix3400.label).assertEqual("third");
        expect(SsRepeatMatrix3400.payload.code).assertEqual(43);
        expect(SsRepeatMatrix3400.payload.label).assertEqual("third");
        expect(payload.getName()).assertEqual("payload");
        expect(label.getType().toString()).assertEqual("string");
        expect(payload.getType().getName()).assertEqual((Type.from<SsPayload2300>() as ClassType).getName());
      } finally {
        label.setStaticValue(originalLabel);
        payload.setStaticValue(originalPayload);
      }
      expect(SsRepeatMatrix3400.label).assertEqual(originalLabel);
      expect(SsRepeatMatrix3400.payload.code).assertEqual(originalPayload.code);
      expect(SsRepeatMatrix3400.payload.label).assertEqual(originalPayload.label);
      expect(payload.isStatic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_SET_STATIC_VALUE_3400
     * @tc.name testSetStaticValue3400
     * @tc.desc Verify null and undefined cannot be assigned to non nullable int string and object static fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSetStaticValue3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const intField = (Type.from<SsSample001>() as ClassType).getFieldByName("count");
      const stringField = (Type.from<SsSample018>() as ClassType).getFieldByName("name");
      const objectField = (Type.from<SsObjectMatrix2300>() as ClassType).getFieldByName("payload");
      const originalInt: int = SsSample001.count;
      const originalString: string = SsSample018.name;
      const originalObject: SsPayload2300 = SsObjectMatrix2300.payload;
      try {
        try {
          intField.setStaticValue(null);
          expect().assertFail();
        } catch (e) {
          expect((e as Error).name).assertEqual('TypeError');
        }
        expect(SsSample001.count).assertEqual(originalInt);
        try {
          intField.setStaticValue(undefined);
          expect().assertFail();
        } catch (e) {
          expect((e as Error).name).assertEqual('TypeError');
        }
        expect(SsSample001.count).assertEqual(originalInt);
        try {
          stringField.setStaticValue(null);
          expect().assertFail();
        } catch (e) {
          expect((e as Error).name).assertEqual('TypeError');
        }
        expect(SsSample018.name).assertEqual(originalString);
        try {
          stringField.setStaticValue(undefined);
          expect().assertFail();
        } catch (e) {
          expect((e as Error).name).assertEqual('TypeError');
        }
        expect(SsSample018.name).assertEqual(originalString);
        try {
          objectField.setStaticValue(null);
          expect().assertFail();
        } catch (e) {
          expect((e as Error).name).assertEqual('TypeError');
        }
        expect(SsObjectMatrix2300.payload).assertEqual(originalObject);
        expect(SsObjectMatrix2300.payload.code).assertEqual(originalObject.code);
        try {
          objectField.setStaticValue(undefined);
          expect().assertFail();
        } catch (e) {
          expect((e as Error).name).assertEqual('TypeError');
        }
        expect(SsObjectMatrix2300.payload).assertEqual(originalObject);
        expect(SsObjectMatrix2300.payload.label).assertEqual(originalObject.label);
      } finally {
        intField.setStaticValue(originalInt);
        stringField.setStaticValue(originalString);
        objectField.setStaticValue(originalObject);
      }
      expect(SsSample001.count).assertEqual(originalInt);
      expect(SsSample018.name).assertEqual(originalString);
      expect(SsObjectMatrix2300.payload).assertEqual(originalObject);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIELD_SET_STATIC_VALUE_3500
     * @tc.name testSetStaticValue3500
     * @tc.desc Verify setStaticValue throws TypeError for undefined null union and optional instance fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSetStaticValue3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<SsNullableMatrix3500>() as ClassType;
      const parA = classType.getFieldByName("parA");
      const parB = classType.getFieldByName("parB");
      const parC = classType.getFieldByName("parC");
      const parD = classType.getFieldByName("parD");
      const parE = classType.getFieldByName("parE");
      const parF = classType.getFieldByName("parF");
      const parG = classType.getFieldByName("parG");
      try {
        parA.setStaticValue(undefined);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('TypeError');
      }
      try {
        parB.setStaticValue(null);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('TypeError');
      }
      try {
        parC.setStaticValue("defined");
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('TypeError');
      }
      try {
        parD.setStaticValue("not-null");
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('TypeError');
      }
      try {
        parE.setStaticValue("bad-instance");
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('TypeError');
      }
      try {
        parF.setStaticValue(new Array<string>());
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('TypeError');
      }
      try {
        parG.setStaticValue(new Array<string>());
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('TypeError');
      }
      expect(parF.getType().toString()).assertEqual("std.core.Array");
      expect(parG.getType().toString()).assertEqual("std.core.Array");
      expect(parA.isStatic()).assertFalse();
      expect(parB.isStatic()).assertFalse();
      expect(parC.isStatic()).assertFalse();
      expect(parD.isStatic()).assertFalse();
      expect(parE.isStatic()).assertFalse();
      expect(parF.isStatic()).assertFalse();
      expect(parG.isStatic()).assertFalse();
    });
  });
}
