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

/**
 * @file CollectionsMapKeysValues.test.ets
 * @description collections.Map keys and values methods unit test cases covering
 *              all 36 test value types
 * @since 2026
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { collections, ArkTSUtils } from '@kit.ArkTS';

function sleep(time: number): Promise<void> {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

@Sendable
class SendableClassBasic {
  value: number = 0;
  constructor() { this.value = 100; }
}

@Sendable
class SendableClassComplex {
  name: string = "complex";
  id: number = 1;
  constructor() { this.name = "complex"; this.id = 1; }
}

@Sendable
class SendableClassExtended extends SendableClassBasic {
  extra: string = "extended";
  constructor() { super(); this.extra = "extended"; }
}

@Sendable
class TestPerson {
  name: string = "";
  age: number = 0;
  constructor(name: string, age: number) { this.name = name; this.age = age; }
}

@Sendable
class EmptyClass { constructor() {} }

@Sendable
class ComplexIndexSignature {
  a: number = 1;
  b: number = 2;
  c: number = 3;
  constructor() {
    this.a = 1;
    this.b = 2;
    this.c = 3;
  }
}

@Sendable
class CircularRef {
  name: string = "";
  ref: CircularRef | null = null;
  constructor(name: string) { this.name = name; }
}

@Sendable
class LargeObject {
  data: string;
  constructor() {
    let arr: number[] = [];
    for (let i: number = 0; i < 1000; i++) arr.push(i);
    this.data = JSON.stringify(arr);
  }
  getValue(index: number): number { let arr: number[] = JSON.parse(this.data); return arr[index]; }
}

@Sendable
class DeepNestedObject {
  level: string = "";
  next: DeepNestedObject | null = null;
  constructor(level: string) { this.level = level; }
}

@Sendable
class SendableNormalFn {
  execute(): number { return 42; }
}

@Sendable
class SendableArrowFn {
  execute(): number { return 100; }
}

@Sendable
class SendableAsyncFn {
  async execute(): Promise<number> { return 200; }
}

@Sendable
class SendableAddFn {
  execute(x: number): number { return x + 1; }
}

const enum SendableEnum { Success = 0, Failure = 1, Pending = 2 }

export default function CollectionsMapKeysValuesTest() {
  describe('CollectionsMapKeysValuesTest', () => {

    beforeAll(() => { console.info('[CollectionsMapKeysValuesTest] beforeAll'); });
    beforeEach(async () => {
      await sleep(20);
      console.info('[CollectionsMapKeysValuesTest] beforeEach');
    });
    afterEach(() => { console.info('[CollectionsMapKeysValuesTest] afterEach'); });
    afterAll(() => { console.info('[CollectionsMapKeysValuesTest] afterAll'); });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_KEYS_VALUES_0100
     * @tc.name    testCollectionsMapKeysValues0001
     * @tc.desc    Verify keys returns correct normal number keys
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapKeysValues0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapKeysValues0001';
      console.info(caseName + ', test start');
      let map: collections.Map<number, number> = new collections.Map<number, number>();
      map.set(1, 10).set(2, 20).set(3, 30);
      let keys = map.keys();
      expect(keys.next().value).assertEqual(1);
      expect(keys.next().value).assertEqual(2);
      expect(keys.next().value).assertEqual(3);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_KEYS_VALUES_0200
     * @tc.name    testCollectionsMapKeysValues0002
     * @tc.desc    Verify values returns correct normal number values
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapKeysValues0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapKeysValues0002';
      console.info(caseName + ', test start');
      let map: collections.Map<number, number> = new collections.Map<number, number>();
      map.set(1, 10).set(2, 20).set(3, 30);
      let values = map.values();
      expect(values.next().value).assertEqual(10);
      expect(values.next().value).assertEqual(20);
      expect(values.next().value).assertEqual(30);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_KEYS_VALUES_0300
     * @tc.name    testCollectionsMapKeysValues0003
     * @tc.desc    Verify keys returns correct scientific notation number keys
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapKeysValues0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapKeysValues0003';
      console.info(caseName + ', test start');
      let map: collections.Map<number, number> = new collections.Map<number, number>();
      let val1: number = 1.5e-10, val2: number = 2.5e-10;
      map.set(val1, val1).set(val2, val2);
      let keys = map.keys();
      expect(keys.next().value).assertEqual(val1);
      expect(keys.next().value).assertEqual(val2);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_KEYS_VALUES_0400
     * @tc.name    testCollectionsMapKeysValues0004
     * @tc.desc    Verify values returns correct scientific notation number values
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapKeysValues0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapKeysValues0004';
      console.info(caseName + ', test start');
      let map: collections.Map<number, number> = new collections.Map<number, number>();
      let val1: number = 1.5e-10, val2: number = 2.5e-10;
      map.set(val1, val1).set(val2, val2);
      let values = map.values();
      expect(values.next().value).assertEqual(val1);
      expect(values.next().value).assertEqual(val2);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_KEYS_VALUES_0500
     * @tc.name    testCollectionsMapKeysValues0005
     * @tc.desc    Verify keys returns correct MAX_SAFE_INTEGER keys
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapKeysValues0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapKeysValues0005';
      console.info(caseName + ', test start');
      let map: collections.Map<number, number> = new collections.Map<number, number>();
      let maxInt: number = Number.MAX_SAFE_INTEGER;
      map.set(maxInt, maxInt);
      let keys = map.keys();
      expect(keys.next().value).assertEqual(maxInt);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_KEYS_VALUES_0600
     * @tc.name    testCollectionsMapKeysValues0006
     * @tc.desc    Verify values returns correct MAX_SAFE_INTEGER values
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapKeysValues0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapKeysValues0006';
      console.info(caseName + ', test start');
      let map: collections.Map<number, number> = new collections.Map<number, number>();
      let maxInt: number = Number.MAX_SAFE_INTEGER;
      map.set(maxInt, maxInt);
      let values = map.values();
      expect(values.next().value).assertEqual(maxInt);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_KEYS_VALUES_0700
     * @tc.name    testCollectionsMapKeysValues0007
     * @tc.desc    Verify keys returns correct NaN keys
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapKeysValues0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapKeysValues0007';
      console.info(caseName + ', test start');
      let map: collections.Map<number, number> = new collections.Map<number, number>();
      map.set(NaN, NaN);
      let keys = map.keys();
      expect(isNaN(keys.next().value)).assertTrue();
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_KEYS_VALUES_0800
     * @tc.name    testCollectionsMapKeysValues0008
     * @tc.desc    Verify values returns correct NaN values
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapKeysValues0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapKeysValues0008';
      console.info(caseName + ', test start');
      let map: collections.Map<number, number> = new collections.Map<number, number>();
      map.set(NaN, NaN);
      let values = map.values();
      expect(isNaN(values.next().value)).assertTrue();
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_KEYS_VALUES_0900
     * @tc.name    testCollectionsMapKeysValues0009
     * @tc.desc    Verify keys returns correct normal string keys
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapKeysValues0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapKeysValues0009';
      console.info(caseName + ', test start');
      let map: collections.Map<string, string> = new collections.Map<string, string>();
      map.set("a", "valueA").set("b", "valueB").set("c", "valueC");
      let keys = map.keys();
      expect(keys.next().value).assertEqual("a");
      expect(keys.next().value).assertEqual("b");
      expect(keys.next().value).assertEqual("c");
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_KEYS_VALUES_1000
     * @tc.name    testCollectionsMapKeysValues0010
     * @tc.desc    Verify values returns correct normal string values
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapKeysValues0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapKeysValues0010';
      console.info(caseName + ', test start');
      let map: collections.Map<string, string> = new collections.Map<string, string>();
      map.set("a", "valueA").set("b", "valueB").set("c", "valueC");
      let values = map.values();
      expect(values.next().value).assertEqual("valueA");
      expect(values.next().value).assertEqual("valueB");
      expect(values.next().value).assertEqual("valueC");
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_KEYS_VALUES_1100
     * @tc.name    testCollectionsMapKeysValues0011
     * @tc.desc    Verify keys returns correct special character string keys
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapKeysValues0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapKeysValues0011';
      console.info(caseName + ', test start');
      let map: collections.Map<string, string> = new collections.Map<string, string>();
      let str: string = "key!@#";
      map.set(str, str);
      let keys = map.keys();
      expect(keys.next().value).assertEqual(str);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_KEYS_VALUES_1200
     * @tc.name    testCollectionsMapKeysValues0012
     * @tc.desc    Verify values returns correct special character string values
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapKeysValues0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapKeysValues0012';
      console.info(caseName + ', test start');
      let map: collections.Map<string, string> = new collections.Map<string, string>();
      let str: string = "key!@#";
      map.set(str, str);
      let values = map.values();
      expect(values.next().value).assertEqual(str);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_KEYS_VALUES_1300
     * @tc.name    testCollectionsMapKeysValues0013
     * @tc.desc    Verify keys returns correct emoji string keys
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapKeysValues0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapKeysValues0013';
      console.info(caseName + ', test start');
      let map: collections.Map<string, string> = new collections.Map<string, string>();
      let str: string = "😀🎉🔥";
      map.set(str, str);
      let keys = map.keys();
      expect(keys.next().value).assertEqual(str);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_KEYS_VALUES_1400
     * @tc.name    testCollectionsMapKeysValues0014
     * @tc.desc    Verify values returns correct emoji string values
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapKeysValues0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapKeysValues0014';
      console.info(caseName + ', test start');
      let map: collections.Map<string, string> = new collections.Map<string, string>();
      let str: string = "😀🎉🔥";
      map.set(str, str);
      let values = map.values();
      expect(values.next().value).assertEqual(str);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_KEYS_VALUES_1500
     * @tc.name    testCollectionsMapKeysValues0015
     * @tc.desc    Verify keys returns correct empty string keys
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapKeysValues0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapKeysValues0015';
      console.info(caseName + ', test start');
      let map: collections.Map<string, string> = new collections.Map<string, string>();
      map.set("", "emptyValue");
      let keys = map.keys();
      expect(keys.next().value).assertEqual("");
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_KEYS_VALUES_1600
     * @tc.name    testCollectionsMapKeysValues0016
     * @tc.desc    Verify values returns correct empty string values
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapKeysValues0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapKeysValues0016';
      console.info(caseName + ', test start');
      let map: collections.Map<string, string> = new collections.Map<string, string>();
      map.set("", "emptyValue");
      let values = map.values();
      expect(values.next().value).assertEqual("emptyValue");
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_KEYS_VALUES_1700
     * @tc.name    testCollectionsMapKeysValues0017
     * @tc.desc    Verify keys returns correct boolean true keys
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapKeysValues0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapKeysValues0017';
      console.info(caseName + ', test start');
      let map: collections.Map<boolean, string> = new collections.Map<boolean, string>();
      map.set(true, "trueValue");
      let keys = map.keys();
      expect(keys.next().value).assertEqual(true);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_KEYS_VALUES_1800
     * @tc.name    testCollectionsMapKeysValues0018
     * @tc.desc    Verify values returns correct boolean true values
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapKeysValues0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapKeysValues0018';
      console.info(caseName + ', test start');
      let map: collections.Map<string, boolean> = new collections.Map<string, boolean>();
      map.set("trueKey", true);
      let values = map.values();
      expect(values.next().value).assertEqual(true);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_KEYS_VALUES_1900
     * @tc.name    testCollectionsMapKeysValues0019
     * @tc.desc    Verify keys returns correct boolean false keys
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapKeysValues0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapKeysValues0019';
      console.info(caseName + ', test start');
      let map: collections.Map<boolean, string> = new collections.Map<boolean, string>();
      map.set(false, "falseValue");
      let keys = map.keys();
      expect(keys.next().value).assertEqual(false);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_KEYS_VALUES_2000
     * @tc.name    testCollectionsMapKeysValues0020
     * @tc.desc    Verify values returns correct boolean false values
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapKeysValues0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapKeysValues0020';
      console.info(caseName + ', test start');
      let map: collections.Map<string, boolean> = new collections.Map<string, boolean>();
      map.set("falseKey", false);
      let values = map.values();
      expect(values.next().value).assertEqual(false);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_KEYS_VALUES_2100
     * @tc.name    testCollectionsMapKeysValues0021
     * @tc.desc    Verify keys returns correct undefined keys
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapKeysValues0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapKeysValues0021';
      console.info(caseName + ', test start');
      let map: collections.Map<undefined, string> = new collections.Map<undefined, string>();
      map.set(undefined, "undefinedValue");
      let keys = map.keys();
      expect(keys.next().value).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_KEYS_VALUES_2200
     * @tc.name    testCollectionsMapKeysValues0022
     * @tc.desc    Verify values returns correct undefined values
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapKeysValues0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapKeysValues0022';
      console.info(caseName + ', test start');
      let map: collections.Map<string, undefined> = new collections.Map<string, undefined>();
      map.set("undefinedKey", undefined);
      let values = map.values();
      expect(values.next().value).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_KEYS_VALUES_2300
     * @tc.name    testCollectionsMapKeysValues0023
     * @tc.desc    Verify keys returns correct null keys
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapKeysValues0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapKeysValues0023';
      console.info(caseName + ', test start');
      let map: collections.Map<null, string> = new collections.Map<null, string>();
      map.set(null, "nullValue");
      let keys = map.keys();
      expect(keys.next().value).assertEqual(null);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_KEYS_VALUES_2400
     * @tc.name    testCollectionsMapKeysValues0024
     * @tc.desc    Verify values returns correct null values
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapKeysValues0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapKeysValues0024';
      console.info(caseName + ', test start');
      let map: collections.Map<string, null> = new collections.Map<string, null>();
      map.set("nullKey", null);
      let values = map.values();
      expect(values.next().value).assertEqual(null);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_KEYS_VALUES_2500
     * @tc.name    testCollectionsMapKeysValues0025
     * @tc.desc    Verify keys returns correct Sendable object keys
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapKeysValues0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapKeysValues0025';
      console.info(caseName + ', test start');
      let map: collections.Map<TestPerson, string> = new collections.Map<TestPerson, string>();
      let obj: TestPerson = new TestPerson("test", 20);
      map.set(obj, "personValue");
      let keys = map.keys();
      expect(keys.next().value).assertEqual(obj);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_KEYS_VALUES_2600
     * @tc.name    testCollectionsMapKeysValues0026
     * @tc.desc    Verify values returns correct Sendable object values
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapKeysValues0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapKeysValues0026';
      console.info(caseName + ', test start');
      let map: collections.Map<string, TestPerson> = new collections.Map<string, TestPerson>();
      let obj: TestPerson = new TestPerson("test", 20);
      map.set("personKey", obj);
      let values = map.values();
      expect(values.next().value).assertEqual(obj);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_KEYS_VALUES_2700
     * @tc.name    testCollectionsMapKeysValues0027
     * @tc.desc    Verify keys returns correct empty Sendable object keys
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapKeysValues0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapKeysValues0027';
      console.info(caseName + ', test start');
      let map: collections.Map<EmptyClass, string> = new collections.Map<EmptyClass, string>();
      let obj: EmptyClass = new EmptyClass();
      map.set(obj, "emptyValue");
      let keys = map.keys();
      expect(keys.next().value).assertEqual(obj);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_KEYS_VALUES_2800
     * @tc.name    testCollectionsMapKeysValues0028
     * @tc.desc    Verify values returns correct empty Sendable object values
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapKeysValues0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapKeysValues0028';
      console.info(caseName + ', test start');
      let map: collections.Map<string, EmptyClass> = new collections.Map<string, EmptyClass>();
      let obj: EmptyClass = new EmptyClass();
      map.set("emptyKey", obj);
      let values = map.values();
      expect(values.next().value).assertEqual(obj);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_KEYS_VALUES_2900
     * @tc.name    testCollectionsMapKeysValues0029
     * @tc.desc    Verify keys returns correct ComplexIndexSignature object keys
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapKeysValues0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapKeysValues0029';
      console.info(caseName + ', test start');
      let map: collections.Map<ComplexIndexSignature, string> = new collections.Map<ComplexIndexSignature, string>();
      let obj: ComplexIndexSignature = new ComplexIndexSignature();
      map.set(obj, "complexValue");
      let keys = map.keys();
      expect(keys.next().value).assertEqual(obj);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_KEYS_VALUES_3000
     * @tc.name    testCollectionsMapKeysValues0030
     * @tc.desc    Verify values returns correct ComplexIndexSignature object values
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapKeysValues0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapKeysValues0030';
      console.info(caseName + ', test start');
      let map: collections.Map<string, ComplexIndexSignature> = new collections.Map<string, ComplexIndexSignature>();
      let obj: ComplexIndexSignature = new ComplexIndexSignature();
      map.set("complexKey", obj);
      let values = map.values();
      expect(values.next().value).assertEqual(obj);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_KEYS_VALUES_3100
     * @tc.name    testCollectionsMapKeysValues0031
     * @tc.desc    Verify keys returns correct collections.Array keys
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapKeysValues0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapKeysValues0031';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Array<number>> = new collections.Map<string, collections.Array<number>>();
      let arr: collections.Array<number> = new collections.Array<number>();
      arr.push(1); arr.push(2); arr.push(3);
      map.set("arrayKey", arr);
      let keys = map.keys();
      expect(keys.next().value).assertEqual("arrayKey");
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_KEYS_VALUES_3200
     * @tc.name    testCollectionsMapKeysValues0032
     * @tc.desc    Verify values returns correct collections.Array values
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapKeysValues0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapKeysValues0032';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Array<number>> = new collections.Map<string, collections.Array<number>>();
      let arr: collections.Array<number> = new collections.Array<number>();
      arr.push(1); arr.push(2); arr.push(3);
      map.set("arrayKey", arr);
      let values = map.values();
      expect(values.next().value).assertEqual(arr);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_KEYS_VALUES_3300
     * @tc.name    testCollectionsMapKeysValues0033
     * @tc.desc    Verify keys returns correct empty collections.Array keys
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapKeysValues0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapKeysValues0033';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Array<number>> = new collections.Map<string, collections.Array<number>>();
      let arr: collections.Array<number> = new collections.Array<number>();
      map.set("emptyArrayKey", arr);
      let keys = map.keys();
      expect(keys.next().value).assertEqual("emptyArrayKey");
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_KEYS_VALUES_3400
     * @tc.name    testCollectionsMapKeysValues0034
     * @tc.desc    Verify values returns correct empty collections.Array values
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapKeysValues0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapKeysValues0034';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Array<number>> = new collections.Map<string, collections.Array<number>>();
      let arr: collections.Array<number> = new collections.Array<number>();
      map.set("emptyArrayKey", arr);
      let values = map.values();
      expect(values.next().value).assertEqual(arr);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_KEYS_VALUES_3500
     * @tc.name    testCollectionsMapKeysValues0035
     * @tc.desc    Verify keys returns correct sparse array keys
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapKeysValues0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapKeysValues0035';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Array<number | null>> = new collections.Map<string, collections.Array<number | null>>();
      let arr: collections.Array<number | null> = new collections.Array<number | null>();
      arr.push(1);
      arr.push(null);
      arr.push(2);
      map.set("sparseKey", arr);
      let keys = map.keys();
      expect(keys.next().value).assertEqual("sparseKey");
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_KEYS_VALUES_3600
     * @tc.name    testCollectionsMapKeysValues0036
     * @tc.desc    Verify values returns correct sparse array values
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapKeysValues0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapKeysValues0036';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Array<number | null>> = new collections.Map<string, collections.Array<number | null>>();
      let arr: collections.Array<number | null> = new collections.Array<number | null>();
      arr.push(1);
      arr.push(null);
      arr.push(2);
      map.set("sparseKey", arr);
      let values = map.values();
      expect(values.next().value).assertEqual(arr);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_KEYS_VALUES_3700
     * @tc.name    testCollectionsMapKeysValues0037
     * @tc.desc    Verify keys returns correct SendableNormalFn keys
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapKeysValues0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapKeysValues0037';
      console.info(caseName + ', test start');
      let map: collections.Map<string, SendableNormalFn> = new collections.Map<string, SendableNormalFn>();
      let fn: SendableNormalFn = new SendableNormalFn();
      map.set("fnKey", fn);
      let keys = map.keys();
      expect(keys.next().value).assertEqual("fnKey");
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_KEYS_VALUES_3800
     * @tc.name    testCollectionsMapKeysValues0038
     * @tc.desc    Verify values returns correct SendableNormalFn values
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapKeysValues0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapKeysValues0038';
      console.info(caseName + ', test start');
      let map: collections.Map<string, SendableNormalFn> = new collections.Map<string, SendableNormalFn>();
      let fn: SendableNormalFn = new SendableNormalFn();
      map.set("fnKey", fn);
      let values = map.values();
      expect(values.next().value).assertEqual(fn);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_KEYS_VALUES_3900
     * @tc.name    testCollectionsMapKeysValues0039
     * @tc.desc    Verify keys returns correct SendableArrowFn keys
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapKeysValues0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapKeysValues0039';
      console.info(caseName + ', test start');
      let map: collections.Map<string, SendableArrowFn> = new collections.Map<string, SendableArrowFn>();
      let fn: SendableArrowFn = new SendableArrowFn();
      map.set("arrowKey", fn);
      let keys = map.keys();
      expect(keys.next().value).assertEqual("arrowKey");
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_KEYS_VALUES_4000
     * @tc.name    testCollectionsMapKeysValues0040
     * @tc.desc    Verify values returns correct SendableArrowFn values
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapKeysValues0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapKeysValues0040';
      console.info(caseName + ', test start');
      let map: collections.Map<string, SendableArrowFn> = new collections.Map<string, SendableArrowFn>();
      let fn: SendableArrowFn = new SendableArrowFn();
      map.set("arrowKey", fn);
      let values = map.values();
      expect(values.next().value).assertEqual(fn);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_KEYS_VALUES_4100
     * @tc.name    testCollectionsMapKeysValues0041
     * @tc.desc    Verify keys returns correct SendableAsyncFn keys
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapKeysValues0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapKeysValues0041';
      console.info(caseName + ', test start');
      let map: collections.Map<string, SendableAsyncFn> = new collections.Map<string, SendableAsyncFn>();
      let fn: SendableAsyncFn = new SendableAsyncFn();
      map.set("asyncKey", fn);
      let keys = map.keys();
      expect(keys.next().value).assertEqual("asyncKey");
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_KEYS_VALUES_4200
     * @tc.name    testCollectionsMapKeysValues0042
     * @tc.desc    Verify values returns correct SendableAsyncFn values
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapKeysValues0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapKeysValues0042';
      console.info(caseName + ', test start');
      let map: collections.Map<string, SendableAsyncFn> = new collections.Map<string, SendableAsyncFn>();
      let fn: SendableAsyncFn = new SendableAsyncFn();
      map.set("asyncKey", fn);
      let values = map.values();
      expect(values.next().value).assertEqual(fn);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_KEYS_VALUES_4300
     * @tc.name    testCollectionsMapKeysValues0043
     * @tc.desc    Verify keys returns correct SendableClassBasic keys
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapKeysValues0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapKeysValues0043';
      console.info(caseName + ', test start');
      let map: collections.Map<SendableClassBasic, string> = new collections.Map<SendableClassBasic, string>();
      let instance: SendableClassBasic = new SendableClassBasic();
      map.set(instance, "basicValue");
      let keys = map.keys();
      expect(keys.next().value).assertEqual(instance);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_KEYS_VALUES_4400
     * @tc.name    testCollectionsMapKeysValues0044
     * @tc.desc    Verify values returns correct SendableClassBasic values
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapKeysValues0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapKeysValues0044';
      console.info(caseName + ', test start');
      let map: collections.Map<string, SendableClassBasic> = new collections.Map<string, SendableClassBasic>();
      let instance: SendableClassBasic = new SendableClassBasic();
      map.set("basicKey", instance);
      let values = map.values();
      expect(values.next().value).assertEqual(instance);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_KEYS_VALUES_4500
     * @tc.name    testCollectionsMapKeysValues0045
     * @tc.desc    Verify keys returns correct SendableClassComplex keys
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapKeysValues0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapKeysValues0045';
      console.info(caseName + ', test start');
      let map: collections.Map<SendableClassComplex, string> = new collections.Map<SendableClassComplex, string>();
      let instance: SendableClassComplex = new SendableClassComplex();
      map.set(instance, "complexValue");
      let keys = map.keys();
      expect(keys.next().value).assertEqual(instance);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_KEYS_VALUES_4600
     * @tc.name    testCollectionsMapKeysValues0046
     * @tc.desc    Verify values returns correct SendableClassComplex values
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapKeysValues0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapKeysValues0046';
      console.info(caseName + ', test start');
      let map: collections.Map<string, SendableClassComplex> = new collections.Map<string, SendableClassComplex>();
      let instance: SendableClassComplex = new SendableClassComplex();
      map.set("complexKey", instance);
      let values = map.values();
      expect(values.next().value).assertEqual(instance);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_KEYS_VALUES_4700
     * @tc.name    testCollectionsMapKeysValues0047
     * @tc.desc    Verify keys returns correct SendableClassExtended keys
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapKeysValues0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapKeysValues0047';
      console.info(caseName + ', test start');
      let map: collections.Map<SendableClassExtended, string> = new collections.Map<SendableClassExtended, string>();
      let instance: SendableClassExtended = new SendableClassExtended();
      map.set(instance, "extendedValue");
      let keys = map.keys();
      expect(keys.next().value).assertEqual(instance);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_KEYS_VALUES_4800
     * @tc.name    testCollectionsMapKeysValues0048
     * @tc.desc    Verify values returns correct SendableClassExtended values
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapKeysValues0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapKeysValues0048';
      console.info(caseName + ', test start');
      let map: collections.Map<string, SendableClassExtended> = new collections.Map<string, SendableClassExtended>();
      let instance: SendableClassExtended = new SendableClassExtended();
      map.set("extendedKey", instance);
      let values = map.values();
      expect(values.next().value).assertEqual(instance);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_KEYS_VALUES_4900
     * @tc.name    testCollectionsMapKeysValues0049
     * @tc.desc    Verify keys returns correct SendableAddFn keys
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapKeysValues0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapKeysValues0049';
      console.info(caseName + ', test start');
      let map: collections.Map<string, SendableAddFn> = new collections.Map<string, SendableAddFn>();
      let fn: SendableAddFn = new SendableAddFn();
      map.set("sendableFnKey", fn);
      let keys = map.keys();
      expect(keys.next().value).assertEqual("sendableFnKey");
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_KEYS_VALUES_5000
     * @tc.name    testCollectionsMapKeysValues0050
     * @tc.desc    Verify values returns correct SendableAddFn values
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapKeysValues0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapKeysValues0050';
      console.info(caseName + ', test start');
      let map: collections.Map<string, SendableAddFn> = new collections.Map<string, SendableAddFn>();
      let fn: SendableAddFn = new SendableAddFn();
      map.set("sendableFnKey", fn);
      let values = map.values();
      expect(values.next().value).assertEqual(fn);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_KEYS_VALUES_5100
     * @tc.name    testCollectionsMapKeysValues0051
     * @tc.desc    Verify keys returns correct const enum keys
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapKeysValues0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapKeysValues0051';
      console.info(caseName + ', test start');
      let map: collections.Map<SendableEnum, string> = new collections.Map<SendableEnum, string>();
      map.set(SendableEnum.Success, "successValue");
      let keys = map.keys();
      expect(keys.next().value).assertEqual(SendableEnum.Success);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_KEYS_VALUES_5200
     * @tc.name    testCollectionsMapKeysValues0052
     * @tc.desc    Verify values returns correct const enum values
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapKeysValues0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapKeysValues0052';
      console.info(caseName + ', test start');
      let map: collections.Map<string, string> = new collections.Map<string, string>();
      map.set("enumKey", "successValue");
      let values = map.values();
      expect(values.next().value).assertEqual("successValue");
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_KEYS_VALUES_5300
     * @tc.name    testCollectionsMapKeysValues0053
     * @tc.desc    Verify keys returns correct AsyncLock keys
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapKeysValues0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapKeysValues0053';
      console.info(caseName + ', test start');
      let lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
      let map: collections.Map<string, ArkTSUtils.locks.AsyncLock> = new collections.Map<string, ArkTSUtils.locks.AsyncLock>();
      map.set("lockKey", lock);
      let keys = map.keys();
      expect(keys.next().value).assertEqual("lockKey");
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_KEYS_VALUES_5400
     * @tc.name    testCollectionsMapKeysValues0054
     * @tc.desc    Verify values returns correct AsyncLock values
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapKeysValues0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapKeysValues0054';
      console.info(caseName + ', test start');
      let lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
      let map: collections.Map<string, ArkTSUtils.locks.AsyncLock> = new collections.Map<string, ArkTSUtils.locks.AsyncLock>();
      map.set("lockKey", lock);
      let values = map.values();
      expect(values.next().value).assertEqual(lock);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_KEYS_VALUES_5500
     * @tc.name    testCollectionsMapKeysValues0055
     * @tc.desc    Verify keys returns correct ConditionVariable keys
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapKeysValues0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapKeysValues0055';
      console.info(caseName + ', test start');
      let cv: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
      let map: collections.Map<string, ArkTSUtils.locks.ConditionVariable> = new collections.Map<string, ArkTSUtils.locks.ConditionVariable>();
      map.set("cvKey", cv);
      let keys = map.keys();
      expect(keys.next().value).assertEqual("cvKey");
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_KEYS_VALUES_5600
     * @tc.name    testCollectionsMapKeysValues0056
     * @tc.desc    Verify values returns correct ConditionVariable values
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapKeysValues0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapKeysValues0056';
      console.info(caseName + ', test start');
      let cv: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
      let map: collections.Map<string, ArkTSUtils.locks.ConditionVariable> = new collections.Map<string, ArkTSUtils.locks.ConditionVariable>();
      map.set("cvKey", cv);
      let values = map.values();
      expect(values.next().value).assertEqual(cv);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_KEYS_VALUES_5700
     * @tc.name    testCollectionsMapKeysValues0057
     * @tc.desc    Verify keys returns correct SendableLruCache keys
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapKeysValues0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapKeysValues0057';
      console.info(caseName + ', test start');
      let cache: ArkTSUtils.SendableLruCache<number, string> = new ArkTSUtils.SendableLruCache<number, string>();
      cache.put(1, "value1");
      let map: collections.Map<string, ArkTSUtils.SendableLruCache<number, string>> = new collections.Map<string, ArkTSUtils.SendableLruCache<number, string>>();
      map.set("cacheKey", cache);
      let keys = map.keys();
      expect(keys.next().value).assertEqual("cacheKey");
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_KEYS_VALUES_5800
     * @tc.name    testCollectionsMapKeysValues0058
     * @tc.desc    Verify values returns correct SendableLruCache values
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapKeysValues0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapKeysValues0058';
      console.info(caseName + ', test start');
      let cache: ArkTSUtils.SendableLruCache<number, string> = new ArkTSUtils.SendableLruCache<number, string>();
      cache.put(1, "value1");
      let map: collections.Map<string, ArkTSUtils.SendableLruCache<number, string>> = new collections.Map<string, ArkTSUtils.SendableLruCache<number, string>>();
      map.set("cacheKey", cache);
      let values = map.values();
      expect(values.next().value).assertEqual(cache);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_KEYS_VALUES_5900
     * @tc.name    testCollectionsMapKeysValues0059
     * @tc.desc    Verify keys returns correct nested collections.Map keys
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapKeysValues0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapKeysValues0059';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Map<number, string>> = new collections.Map<string, collections.Map<number, string>>();
      let nestedMap: collections.Map<number, string> = new collections.Map<number, string>();
      nestedMap.set(1, "one").set(2, "two");
      map.set("nestedKey", nestedMap);
      let keys = map.keys();
      expect(keys.next().value).assertEqual("nestedKey");
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_KEYS_VALUES_6000
     * @tc.name    testCollectionsMapKeysValues0060
     * @tc.desc    Verify values returns correct nested collections.Map values
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapKeysValues0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapKeysValues0060';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Map<number, string>> = new collections.Map<string, collections.Map<number, string>>();
      let nestedMap: collections.Map<number, string> = new collections.Map<number, string>();
      nestedMap.set(1, "one").set(2, "two");
      map.set("nestedKey", nestedMap);
      let values = map.values();
      expect(values.next().value).assertEqual(nestedMap);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_KEYS_VALUES_6100
     * @tc.name    testCollectionsMapKeysValues0061
     * @tc.desc    Verify keys returns correct nested collections.Set keys
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapKeysValues0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapKeysValues0061';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Set<number>> = new collections.Map<string, collections.Set<number>>();
      let nestedSet: collections.Set<number> = new collections.Set<number>();
      nestedSet.add(1).add(2);
      map.set("nestedSetKey", nestedSet);
      let keys = map.keys();
      expect(keys.next().value).assertEqual("nestedSetKey");
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_KEYS_VALUES_6200
     * @tc.name    testCollectionsMapKeysValues0062
     * @tc.desc    Verify values returns correct nested collections.Set values
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapKeysValues0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapKeysValues0062';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Set<number>> = new collections.Map<string, collections.Set<number>>();
      let nestedSet: collections.Set<number> = new collections.Set<number>();
      nestedSet.add(1).add(2);
      map.set("nestedSetKey", nestedSet);
      let values = map.values();
      expect(values.next().value).assertEqual(nestedSet);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_KEYS_VALUES_6300
     * @tc.name    testCollectionsMapKeysValues0063
     * @tc.desc    Verify keys returns correct nested collections.Array keys
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapKeysValues0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapKeysValues0063';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Array<number>> = new collections.Map<string, collections.Array<number>>();
      let nestedArray: collections.Array<number> = new collections.Array<number>();
      nestedArray.push(1); nestedArray.push(2);
      map.set("nestedArrayKey", nestedArray);
      let keys = map.keys();
      expect(keys.next().value).assertEqual("nestedArrayKey");
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_KEYS_VALUES_6400
     * @tc.name    testCollectionsMapKeysValues0064
     * @tc.desc    Verify values returns correct nested collections.Array values
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapKeysValues0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapKeysValues0064';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Array<number>> = new collections.Map<string, collections.Array<number>>();
      let nestedArray: collections.Array<number> = new collections.Array<number>();
      nestedArray.push(1); nestedArray.push(2);
      map.set("nestedArrayKey", nestedArray);
      let values = map.values();
      expect(values.next().value).assertEqual(nestedArray);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_KEYS_VALUES_6500
     * @tc.name    testCollectionsMapKeysValues0065
     * @tc.desc    Verify keys returns correct large object keys
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapKeysValues0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapKeysValues0065';
      console.info(caseName + ', test start');
      let map: collections.Map<string, LargeObject> = new collections.Map<string, LargeObject>();
      let obj: LargeObject = new LargeObject();
      map.set("largeKey", obj);
      let keys = map.keys();
      expect(keys.next().value).assertEqual("largeKey");
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_KEYS_VALUES_6600
     * @tc.name    testCollectionsMapKeysValues0066
     * @tc.desc    Verify values returns correct large object values
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapKeysValues0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapKeysValues0066';
      console.info(caseName + ', test start');
      let map: collections.Map<string, LargeObject> = new collections.Map<string, LargeObject>();
      let obj: LargeObject = new LargeObject();
      map.set("largeKey", obj);
      let values = map.values();
      expect(values.next().value).assertEqual(obj);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_KEYS_VALUES_6700
     * @tc.name    testCollectionsMapKeysValues0067
     * @tc.desc    Verify keys returns correct large array keys
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapKeysValues0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapKeysValues0067';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Array<number>> = new collections.Map<string, collections.Array<number>>();
      let arr: collections.Array<number> = new collections.Array<number>();
      for (let i: number = 0; i < 10000; i++) arr.push(i);
      map.set("largeArrayKey", arr);
      let keys = map.keys();
      expect(keys.next().value).assertEqual("largeArrayKey");
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_KEYS_VALUES_6800
     * @tc.name    testCollectionsMapKeysValues0068
     * @tc.desc    Verify values returns correct large array values
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapKeysValues0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapKeysValues0068';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Array<number>> = new collections.Map<string, collections.Array<number>>();
      let arr: collections.Array<number> = new collections.Array<number>();
      for (let i: number = 0; i < 10000; i++) arr.push(i);
      map.set("largeArrayKey", arr);
      let values = map.values();
      expect(values.next().value).assertEqual(arr);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_KEYS_VALUES_6900
     * @tc.name    testCollectionsMapKeysValues0069
     * @tc.desc    Verify keys returns correct deeply nested object keys
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapKeysValues0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapKeysValues0069';
      console.info(caseName + ', test start');
      let map: collections.Map<string, DeepNestedObject> = new collections.Map<string, DeepNestedObject>();
      let root: DeepNestedObject = new DeepNestedObject("level0");
      let current: DeepNestedObject = root;
      for (let i: number = 1; i < 10; i++) { let next: DeepNestedObject = new DeepNestedObject("level" + i); current.next = next; current = next; }
      map.set("deepKey", root);
      let keys = map.keys();
      expect(keys.next().value).assertEqual("deepKey");
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_KEYS_VALUES_7000
     * @tc.name    testCollectionsMapKeysValues0070
     * @tc.desc    Verify values returns correct deeply nested object values
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapKeysValues0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapKeysValues0070';
      console.info(caseName + ', test start');
      let map: collections.Map<string, DeepNestedObject> = new collections.Map<string, DeepNestedObject>();
      let root: DeepNestedObject = new DeepNestedObject("level0");
      let current: DeepNestedObject = root;
      for (let i: number = 1; i < 10; i++) { let next: DeepNestedObject = new DeepNestedObject("level" + i); current.next = next; current = next; }
      map.set("deepKey", root);
      let values = map.values();
      expect(values.next().value).assertEqual(root);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_KEYS_VALUES_7100
     * @tc.name    testCollectionsMapKeysValues0071
     * @tc.desc    Verify keys returns correct circular reference object keys
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapKeysValues0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapKeysValues0071';
      console.info(caseName + ', test start');
      let map: collections.Map<string, CircularRef> = new collections.Map<string, CircularRef>();
      let obj: CircularRef = new CircularRef("parent");
      obj.ref = new CircularRef("child");
      obj.ref.ref = obj;
      map.set("circularKey", obj);
      let keys = map.keys();
      expect(keys.next().value).assertEqual("circularKey");
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_KEYS_VALUES_7200
     * @tc.name    testCollectionsMapKeysValues0072
     * @tc.desc    Verify values returns correct circular reference object values
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapKeysValues0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapKeysValues0072';
      console.info(caseName + ', test start');
      let map: collections.Map<string, CircularRef> = new collections.Map<string, CircularRef>();
      let obj: CircularRef = new CircularRef("parent");
      obj.ref = new CircularRef("child");
      obj.ref.ref = obj;
      map.set("circularKey", obj);
      let values = map.values();
      expect(values.next().value).assertEqual(obj);
      console.info(caseName + ', test end');
    });

  });
}