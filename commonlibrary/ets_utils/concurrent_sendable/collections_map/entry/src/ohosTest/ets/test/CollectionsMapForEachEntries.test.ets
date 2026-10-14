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
 * @file CollectionsMapForEachEntries.test.ets
 * @description collections.Map forEach and entries methods unit test cases covering
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

export default function CollectionsMapForEachEntriesTest() {
  describe('CollectionsMapForEachEntriesTest', () => {

    beforeAll(() => { console.info('[CollectionsMapForEachEntriesTest] beforeAll'); });
    beforeEach(async () => {
      await sleep(20);
      console.info('[CollectionsMapForEachEntriesTest] beforeEach');
    });
    afterEach(() => { console.info('[CollectionsMapForEachEntriesTest] afterEach'); });
    afterAll(() => { console.info('[CollectionsMapForEachEntriesTest] afterAll'); });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_ENTRIES_0100
     * @tc.name    testCollectionsMapForEachEntries0001
     * @tc.desc    Verify forEach traverses normal number key-value pairs correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapForEachEntries0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapForEachEntries0001';
      console.info(caseName + ', test start');
      let map: collections.Map<number, number> = new collections.Map<number, number>();
      map.set(1, 10).set(2, 20).set(3, 30);
      let keys: number[] = [];
      let values: number[] = [];
      map.forEach((value: number, key: number) => { keys.push(key); values.push(value); });
      expect(keys[0]).assertEqual(1);
      expect(keys[1]).assertEqual(2);
      expect(keys[2]).assertEqual(3);
      expect(values[0]).assertEqual(10);
      expect(values[1]).assertEqual(20);
      expect(values[2]).assertEqual(30);
      expect(map.size).assertEqual(3);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_ENTRIES_0200
     * @tc.name    testCollectionsMapForEachEntries0002
     * @tc.desc    Verify entries returns correct normal number pairs
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapForEachEntries0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapForEachEntries0002';
      console.info(caseName + ', test start');
      let map: collections.Map<number, number> = new collections.Map<number, number>();
      map.set(1, 10).set(2, 20).set(3, 30);
      let entries = map.entries();
      let result1 = entries.next();
      let result2 = entries.next();
      let result3 = entries.next();
      expect(result1.done).assertFalse();
      if (result1.value) { expect(result1.value[0]).assertEqual(1); expect(result1.value[1]).assertEqual(10); }
      expect(result2.done).assertFalse();
      if (result2.value) { expect(result2.value[0]).assertEqual(2); expect(result2.value[1]).assertEqual(20); }
      expect(result3.done).assertFalse();
      if (result3.value) { expect(result3.value[0]).assertEqual(3); expect(result3.value[1]).assertEqual(30); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_ENTRIES_0300
     * @tc.name    testCollectionsMapForEachEntries0003
     * @tc.desc    Verify forEach traverses scientific notation number correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapForEachEntries0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapForEachEntries0003';
      console.info(caseName + ', test start');
      let map: collections.Map<number, number> = new collections.Map<number, number>();
      let val1: number = 1.5e-10, val2: number = 2.5e-10;
      map.set(val1, val1).set(val2, val2);
      let keys: number[] = [];
      let values: number[] = [];
      map.forEach((value: number, key: number) => { keys.push(key); values.push(value); });
      expect(keys[0]).assertEqual(val1);
      expect(keys[1]).assertEqual(val2);
      expect(values[0]).assertEqual(val1);
      expect(values[1]).assertEqual(val2);
      expect(map.size).assertEqual(2);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_ENTRIES_0400
     * @tc.name    testCollectionsMapForEachEntries0004
     * @tc.desc    Verify entries returns correct scientific notation number pairs
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapForEachEntries0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapForEachEntries0004';
      console.info(caseName + ', test start');
      let map: collections.Map<number, number> = new collections.Map<number, number>();
      let val1: number = 1.5e-10, val2: number = 2.5e-10;
      map.set(val1, val1).set(val2, val2);
      let entries = map.entries();
      let result1 = entries.next();
      let result2 = entries.next();
      expect(result1.done).assertFalse();
      if (result1.value) { expect(result1.value[0]).assertEqual(val1); expect(result1.value[1]).assertEqual(val1); }
      expect(result2.done).assertFalse();
      if (result2.value) { expect(result2.value[0]).assertEqual(val2); expect(result2.value[1]).assertEqual(val2); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_ENTRIES_0500
     * @tc.name    testCollectionsMapForEachEntries0005
     * @tc.desc    Verify forEach traverses MAX_SAFE_INTEGER correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapForEachEntries0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapForEachEntries0005';
      console.info(caseName + ', test start');
      let map: collections.Map<number, number> = new collections.Map<number, number>();
      let maxInt: number = Number.MAX_SAFE_INTEGER;
      map.set(maxInt, maxInt);
      let keys: number[] = [];
      let values: number[] = [];
      map.forEach((value: number, key: number) => { keys.push(key); values.push(value); });
      expect(keys[0]).assertEqual(maxInt);
      expect(values[0]).assertEqual(maxInt);
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_ENTRIES_0600
     * @tc.name    testCollectionsMapForEachEntries0006
     * @tc.desc    Verify entries returns correct MAX_SAFE_INTEGER pairs
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapForEachEntries0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapForEachEntries0006';
      console.info(caseName + ', test start');
      let map: collections.Map<number, number> = new collections.Map<number, number>();
      let maxInt: number = Number.MAX_SAFE_INTEGER;
      map.set(maxInt, maxInt);
      let entries = map.entries();
      let result = entries.next();
      expect(result.done).assertFalse();
      if (result.value) { expect(result.value[0]).assertEqual(maxInt); expect(result.value[1]).assertEqual(maxInt); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_ENTRIES_0700
     * @tc.name    testCollectionsMapForEachEntries0007
     * @tc.desc    Verify forEach traverses NaN correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapForEachEntries0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapForEachEntries0007';
      console.info(caseName + ', test start');
      let map: collections.Map<number, number> = new collections.Map<number, number>();
      map.set(NaN, NaN);
      let keys: number[] = [];
      let values: number[] = [];
      map.forEach((value: number, key: number) => { keys.push(key); values.push(value); });
      expect(keys.length).assertEqual(1);
      expect(isNaN(keys[0])).assertTrue();
      expect(isNaN(values[0])).assertTrue();
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_ENTRIES_0800
     * @tc.name    testCollectionsMapForEachEntries0008
     * @tc.desc    Verify entries returns correct NaN pairs
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapForEachEntries0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapForEachEntries0008';
      console.info(caseName + ', test start');
      let map: collections.Map<number, number> = new collections.Map<number, number>();
      map.set(NaN, NaN);
      let entries = map.entries();
      let result = entries.next();
      expect(result.done).assertFalse();
      if (result.value) { expect(isNaN(result.value[0])).assertTrue(); expect(isNaN(result.value[1])).assertTrue(); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_ENTRIES_0900
     * @tc.name    testCollectionsMapForEachEntries0009
     * @tc.desc    Verify forEach traverses normal string correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapForEachEntries0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapForEachEntries0009';
      console.info(caseName + ', test start');
      let map: collections.Map<string, string> = new collections.Map<string, string>();
      map.set("a", "valueA").set("b", "valueB").set("c", "valueC");
      let keys: string[] = [];
      let values: string[] = [];
      map.forEach((value: string, key: string) => { keys.push(key); values.push(value); });
      expect(keys[0]).assertEqual("a");
      expect(keys[1]).assertEqual("b");
      expect(keys[2]).assertEqual("c");
      expect(values[0]).assertEqual("valueA");
      expect(values[1]).assertEqual("valueB");
      expect(values[2]).assertEqual("valueC");
      expect(map.size).assertEqual(3);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_ENTRIES_1000
     * @tc.name    testCollectionsMapForEachEntries0010
     * @tc.desc    Verify entries returns correct string pairs
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapForEachEntries0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapForEachEntries0010';
      console.info(caseName + ', test start');
      let map: collections.Map<string, string> = new collections.Map<string, string>();
      map.set("a", "valueA").set("b", "valueB").set("c", "valueC");
      let entries = map.entries();
      expect(entries.next().value![0]).assertEqual("a");
      expect(entries.next().value![1]).assertEqual("valueB");
      expect(entries.next().value![0]).assertEqual("c");
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_ENTRIES_1100
     * @tc.name    testCollectionsMapForEachEntries0011
     * @tc.desc    Verify forEach traverses special character string correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapForEachEntries0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapForEachEntries0011';
      console.info(caseName + ', test start');
      let map: collections.Map<string, string> = new collections.Map<string, string>();
      let str: string = "key!@#";
      map.set(str, str);
      let keys: string[] = [];
      let values: string[] = [];
      map.forEach((value: string, key: string) => { keys.push(key); values.push(value); });
      expect(keys[0]).assertEqual(str);
      expect(values[0]).assertEqual(str);
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_ENTRIES_1200
     * @tc.name    testCollectionsMapForEachEntries0012
     * @tc.desc    Verify entries returns correct special character string pairs
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapForEachEntries0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapForEachEntries0012';
      console.info(caseName + ', test start');
      let map: collections.Map<string, string> = new collections.Map<string, string>();
      let str: string = "key!@#";
      map.set(str, str);
      let entries = map.entries();
      let result = entries.next();
      expect(result.done).assertFalse();
      if (result.value) { expect(result.value[0]).assertEqual(str); expect(result.value[1]).assertEqual(str); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_ENTRIES_1300
     * @tc.name    testCollectionsMapForEachEntries0013
     * @tc.desc    Verify forEach traverses emoji string correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapForEachEntries0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapForEachEntries0013';
      console.info(caseName + ', test start');
      let map: collections.Map<string, string> = new collections.Map<string, string>();
      let str: string = "😀🎉🔥";
      map.set(str, str);
      let keys: string[] = [];
      let values: string[] = [];
      map.forEach((value: string, key: string) => { keys.push(key); values.push(value); });
      expect(keys[0]).assertEqual(str);
      expect(values[0]).assertEqual(str);
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_ENTRIES_1400
     * @tc.name    testCollectionsMapForEachEntries0014
     * @tc.desc    Verify entries returns correct emoji string pairs
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapForEachEntries0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapForEachEntries0014';
      console.info(caseName + ', test start');
      let map: collections.Map<string, string> = new collections.Map<string, string>();
      let str: string = "😀🎉🔥";
      map.set(str, str);
      let entries = map.entries();
      let result = entries.next();
      expect(result.done).assertFalse();
      if (result.value) { expect(result.value[0]).assertEqual(str); expect(result.value[1]).assertEqual(str); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_ENTRIES_1500
     * @tc.name    testCollectionsMapForEachEntries0015
     * @tc.desc    Verify forEach traverses empty string correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapForEachEntries0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapForEachEntries0015';
      console.info(caseName + ', test start');
      let map: collections.Map<string, string> = new collections.Map<string, string>();
      map.set("", "emptyValue");
      let keys: string[] = [];
      let values: string[] = [];
      map.forEach((value: string, key: string) => { keys.push(key); values.push(value); });
      expect(keys[0]).assertEqual("");
      expect(values[0]).assertEqual("emptyValue");
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_ENTRIES_1600
     * @tc.name    testCollectionsMapForEachEntries0016
     * @tc.desc    Verify entries returns correct empty string pairs
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapForEachEntries0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapForEachEntries0016';
      console.info(caseName + ', test start');
      let map: collections.Map<string, string> = new collections.Map<string, string>();
      map.set("", "emptyValue");
      let entries = map.entries();
      let result = entries.next();
      expect(result.done).assertFalse();
      if (result.value) { expect(result.value[0]).assertEqual(""); expect(result.value[1]).assertEqual("emptyValue"); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_ENTRIES_1700
     * @tc.name    testCollectionsMapForEachEntries0017
     * @tc.desc    Verify forEach traverses boolean true correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapForEachEntries0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapForEachEntries0017';
      console.info(caseName + ', test start');
      let map: collections.Map<boolean, string> = new collections.Map<boolean, string>();
      map.set(true, "trueValue").set(false, "falseValue");
      let keys: boolean[] = [];
      let values: string[] = [];
      map.forEach((value: string, key: boolean) => { keys.push(key); values.push(value); });
      expect(keys.length).assertEqual(2);
      expect(values.length).assertEqual(2);
      expect(map.size).assertEqual(2);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_ENTRIES_1800
     * @tc.name    testCollectionsMapForEachEntries0018
     * @tc.desc    Verify entries returns correct boolean pairs
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapForEachEntries0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapForEachEntries0018';
      console.info(caseName + ', test start');
      let map: collections.Map<boolean, string> = new collections.Map<boolean, string>();
      map.set(true, "trueValue").set(false, "falseValue");
      let entries = map.entries();
      let result1 = entries.next();
      let result2 = entries.next();
      expect(result1.done).assertFalse();
      if (result1.value) { expect(result1.value[0]).assertEqual(true); expect(result1.value[1]).assertEqual("trueValue"); }
      expect(result2.done).assertFalse();
      if (result2.value) { expect(result2.value[0]).assertEqual(false); expect(result2.value[1]).assertEqual("falseValue"); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_ENTRIES_1900
     * @tc.name    testCollectionsMapForEachEntries0019
     * @tc.desc    Verify forEach traverses undefined correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapForEachEntries0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapForEachEntries0019';
      console.info(caseName + ', test start');
      let map: collections.Map<undefined, string> = new collections.Map<undefined, string>();
      map.set(undefined, "undefinedValue");
      let keys: undefined[] = [];
      let values: string[] = [];
      map.forEach((value: string, key: undefined) => { keys.push(key); values.push(value); });
      expect(keys[0]).assertEqual(undefined);
      expect(values[0]).assertEqual("undefinedValue");
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_ENTRIES_2000
     * @tc.name    testCollectionsMapForEachEntries0020
     * @tc.desc    Verify entries returns correct undefined pairs
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapForEachEntries0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapForEachEntries0020';
      console.info(caseName + ', test start');
      let map: collections.Map<undefined, string> = new collections.Map<undefined, string>();
      map.set(undefined, "undefinedValue");
      let entries = map.entries();
      let result = entries.next();
      expect(result.done).assertFalse();
      if (result.value) { expect(result.value[0]).assertEqual(undefined); expect(result.value[1]).assertEqual("undefinedValue"); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_ENTRIES_2100
     * @tc.name    testCollectionsMapForEachEntries0021
     * @tc.desc    Verify forEach traverses null correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapForEachEntries0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapForEachEntries0021';
      console.info(caseName + ', test start');
      let map: collections.Map<null, string> = new collections.Map<null, string>();
      map.set(null, "nullValue");
      let keys: null[] = [];
      let values: string[] = [];
      map.forEach((value: string, key: null) => { keys.push(key); values.push(value); });
      expect(keys[0]).assertEqual(null);
      expect(values[0]).assertEqual("nullValue");
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_ENTRIES_2200
     * @tc.name    testCollectionsMapForEachEntries0022
     * @tc.desc    Verify entries returns correct null pairs
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapForEachEntries0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapForEachEntries0022';
      console.info(caseName + ', test start');
      let map: collections.Map<null, string> = new collections.Map<null, string>();
      map.set(null, "nullValue");
      let entries = map.entries();
      let result = entries.next();
      expect(result.done).assertFalse();
      if (result.value) { expect(result.value[0]).assertEqual(null); expect(result.value[1]).assertEqual("nullValue"); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_ENTRIES_2300
     * @tc.name    testCollectionsMapForEachEntries0023
     * @tc.desc    Verify forEach traverses Sendable object correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapForEachEntries0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapForEachEntries0023';
      console.info(caseName + ', test start');
      let map: collections.Map<TestPerson, string> = new collections.Map<TestPerson, string>();
      let obj: TestPerson = new TestPerson("test", 20);
      map.set(obj, "personValue");
      let keys: TestPerson[] = [];
      let values: string[] = [];
      map.forEach((value: string, key: TestPerson) => { keys.push(key); values.push(value); });
      expect(keys[0]).assertEqual(obj);
      expect(values[0]).assertEqual("personValue");
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_ENTRIES_2400
     * @tc.name    testCollectionsMapForEachEntries0024
     * @tc.desc    Verify entries returns correct Sendable object pairs
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapForEachEntries0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapForEachEntries0024';
      console.info(caseName + ', test start');
      let map: collections.Map<TestPerson, string> = new collections.Map<TestPerson, string>();
      let obj: TestPerson = new TestPerson("test", 20);
      map.set(obj, "personValue");
      let entries = map.entries();
      let result = entries.next();
      expect(result.done).assertFalse();
      if (result.value) { expect(result.value[0]).assertEqual(obj); expect(result.value[1]).assertEqual("personValue"); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_ENTRIES_2500
     * @tc.name    testCollectionsMapForEachEntries0025
     * @tc.desc    Verify forEach traverses empty Sendable object correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapForEachEntries0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapForEachEntries0025';
      console.info(caseName + ', test start');
      let map: collections.Map<EmptyClass, string> = new collections.Map<EmptyClass, string>();
      let obj: EmptyClass = new EmptyClass();
      map.set(obj, "emptyValue");
      let count: number = 0;
      map.forEach((_value: string, _key: EmptyClass) => { count++; });
      expect(count).assertEqual(1);
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_ENTRIES_2600
     * @tc.name    testCollectionsMapForEachEntries0026
     * @tc.desc    Verify entries returns correct empty Sendable object pairs
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapForEachEntries0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapForEachEntries0026';
      console.info(caseName + ', test start');
      let map: collections.Map<EmptyClass, string> = new collections.Map<EmptyClass, string>();
      let obj: EmptyClass = new EmptyClass();
      map.set(obj, "emptyValue");
      let entries = map.entries();
      let result = entries.next();
      expect(result.done).assertFalse();
      if (result.value) { expect(result.value[0]).assertEqual(obj); expect(result.value[1]).assertEqual("emptyValue"); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_ENTRIES_2700
     * @tc.name    testCollectionsMapForEachEntries0027
     * @tc.desc    Verify forEach traverses ComplexIndexSignature object correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapForEachEntries0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapForEachEntries0027';
      console.info(caseName + ', test start');
      let map: collections.Map<ComplexIndexSignature, string> = new collections.Map<ComplexIndexSignature, string>();
      let obj: ComplexIndexSignature = new ComplexIndexSignature();
      map.set(obj, "complexValue");
      let count: number = 0;
      map.forEach((_value: string, _key: ComplexIndexSignature) => { count++; });
      expect(count).assertEqual(1);
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_ENTRIES_2800
     * @tc.name    testCollectionsMapForEachEntries0028
     * @tc.desc    Verify entries returns correct ComplexIndexSignature object pairs
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapForEachEntries0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapForEachEntries0028';
      console.info(caseName + ', test start');
      let map: collections.Map<ComplexIndexSignature, string> = new collections.Map<ComplexIndexSignature, string>();
      let obj: ComplexIndexSignature = new ComplexIndexSignature();
      map.set(obj, "complexValue");
      let entries = map.entries();
      let result = entries.next();
      expect(result.done).assertFalse();
      if (result.value) { expect(result.value[0]).assertEqual(obj); expect(result.value[1]).assertEqual("complexValue"); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_ENTRIES_2900
     * @tc.name    testCollectionsMapForEachEntries0029
     * @tc.desc    Verify forEach traverses collections.Array correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapForEachEntries0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapForEachEntries0029';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Array<number>> = new collections.Map<string, collections.Array<number>>();
      let arr: collections.Array<number> = new collections.Array<number>();
      arr.push(1); arr.push(2); arr.push(3);
      map.set("arrayKey", arr);
      let keys: string[] = [];
      let values: collections.Array<number>[] = [];
      map.forEach((value: collections.Array<number>, key: string) => { keys.push(key); values.push(value); });
      expect(keys[0]).assertEqual("arrayKey");
      expect(values[0]).assertEqual(arr);
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_ENTRIES_3000
     * @tc.name    testCollectionsMapForEachEntries0030
     * @tc.desc    Verify entries returns correct collections.Array pairs
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapForEachEntries0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapForEachEntries0030';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Array<number>> = new collections.Map<string, collections.Array<number>>();
      let arr: collections.Array<number> = new collections.Array<number>();
      arr.push(1); arr.push(2); arr.push(3);
      map.set("arrayKey", arr);
      let entries = map.entries();
      let result = entries.next();
      expect(result.done).assertFalse();
      if (result.value) { expect(result.value[0]).assertEqual("arrayKey"); expect(result.value[1]).assertEqual(arr); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_ENTRIES_3100
     * @tc.name    testCollectionsMapForEachEntries0031
     * @tc.desc    Verify forEach traverses empty collections.Array correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapForEachEntries0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapForEachEntries0031';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Array<number>> = new collections.Map<string, collections.Array<number>>();
      let arr: collections.Array<number> = new collections.Array<number>();
      map.set("emptyArrayKey", arr);
      let count: number = 0;
      map.forEach((_value: collections.Array<number>, _key: string) => { count++; });
      expect(count).assertEqual(1);
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_ENTRIES_3200
     * @tc.name    testCollectionsMapForEachEntries0032
     * @tc.desc    Verify entries returns correct empty collections.Array pairs
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapForEachEntries0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapForEachEntries0032';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Array<number>> = new collections.Map<string, collections.Array<number>>();
      let arr: collections.Array<number> = new collections.Array<number>();
      map.set("emptyArrayKey", arr);
      let entries = map.entries();
      let result = entries.next();
      expect(result.done).assertFalse();
      if (result.value) { expect(result.value[0]).assertEqual("emptyArrayKey"); expect(result.value[1]).assertEqual(arr); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_ENTRIES_3300
     * @tc.name    testCollectionsMapForEachEntries0033
     * @tc.desc    Verify forEach traverses sparse array correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapForEachEntries0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapForEachEntries0033';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Array<number | null>> = new collections.Map<string, collections.Array<number | null>>();
      let arr: collections.Array<number | null> = new collections.Array<number | null>();
      arr.push(1);
      arr.push(null);
      arr.push(2);
      map.set("sparseKey", arr);
      let count: number = 0;
      map.forEach((_value: collections.Array<number | null>, _key: string) => { count++; });
      expect(count).assertEqual(1);
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_ENTRIES_3400
     * @tc.name    testCollectionsMapForEachEntries0034
     * @tc.desc    Verify entries returns correct sparse array pairs
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapForEachEntries0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapForEachEntries0034';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Array<number | null>> = new collections.Map<string, collections.Array<number | null>>();
      let arr: collections.Array<number | null> = new collections.Array<number | null>();
      arr.push(1);
      arr.push(null);
      arr.push(2);
      map.set("sparseKey", arr);
      let entries = map.entries();
      let result = entries.next();
      expect(result.done).assertFalse();
      if (result.value) { expect(result.value[0]).assertEqual("sparseKey"); expect(result.value[1]).assertEqual(arr); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_ENTRIES_3500
     * @tc.name    testCollectionsMapForEachEntries0035
     * @tc.desc    Verify forEach traverses SendableNormalFn correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapForEachEntries0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapForEachEntries0035';
      console.info(caseName + ', test start');
      let map: collections.Map<string, SendableNormalFn> = new collections.Map<string, SendableNormalFn>();
      let fn: SendableNormalFn = new SendableNormalFn();
      map.set("fnKey", fn);
      let count: number = 0;
      map.forEach((_value: SendableNormalFn, _key: string) => { count++; });
      expect(count).assertEqual(1);
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_ENTRIES_3600
     * @tc.name    testCollectionsMapForEachEntries0036
     * @tc.desc    Verify entries returns correct SendableNormalFn pairs
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapForEachEntries0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapForEachEntries0036';
      console.info(caseName + ', test start');
      let map: collections.Map<string, SendableNormalFn> = new collections.Map<string, SendableNormalFn>();
      let fn: SendableNormalFn = new SendableNormalFn();
      map.set("fnKey", fn);
      let entries = map.entries();
      let result = entries.next();
      expect(result.done).assertFalse();
      if (result.value) { expect(result.value[0]).assertEqual("fnKey"); expect(result.value[1]).assertEqual(fn); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_ENTRIES_3700
     * @tc.name    testCollectionsMapForEachEntries0037
     * @tc.desc    Verify forEach traverses SendableArrowFn correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapForEachEntries0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapForEachEntries0037';
      console.info(caseName + ', test start');
      let map: collections.Map<string, SendableArrowFn> = new collections.Map<string, SendableArrowFn>();
      let fn: SendableArrowFn = new SendableArrowFn();
      map.set("arrowKey", fn);
      let count: number = 0;
      map.forEach((_value: SendableArrowFn, _key: string) => { count++; });
      expect(count).assertEqual(1);
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_ENTRIES_3800
     * @tc.name    testCollectionsMapForEachEntries0038
     * @tc.desc    Verify entries returns correct SendableArrowFn pairs
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapForEachEntries0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapForEachEntries0038';
      console.info(caseName + ', test start');
      let map: collections.Map<string, SendableArrowFn> = new collections.Map<string, SendableArrowFn>();
      let fn: SendableArrowFn = new SendableArrowFn();
      map.set("arrowKey", fn);
      let entries = map.entries();
      let result = entries.next();
      expect(result.done).assertFalse();
      if (result.value) { expect(result.value[0]).assertEqual("arrowKey"); expect(result.value[1]).assertEqual(fn); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_ENTRIES_3900
     * @tc.name    testCollectionsMapForEachEntries0039
     * @tc.desc    Verify forEach traverses SendableAsyncFn correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapForEachEntries0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapForEachEntries0039';
      console.info(caseName + ', test start');
      let map: collections.Map<string, SendableAsyncFn> = new collections.Map<string, SendableAsyncFn>();
      let fn: SendableAsyncFn = new SendableAsyncFn();
      map.set("asyncKey", fn);
      let count: number = 0;
      map.forEach((_value: SendableAsyncFn, _key: string) => { count++; });
      expect(count).assertEqual(1);
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_ENTRIES_4000
     * @tc.name    testCollectionsMapForEachEntries0040
     * @tc.desc    Verify entries returns correct SendableAsyncFn pairs
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapForEachEntries0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapForEachEntries0040';
      console.info(caseName + ', test start');
      let map: collections.Map<string, SendableAsyncFn> = new collections.Map<string, SendableAsyncFn>();
      let fn: SendableAsyncFn = new SendableAsyncFn();
      map.set("asyncKey", fn);
      let entries = map.entries();
      let result = entries.next();
      expect(result.done).assertFalse();
      if (result.value) { expect(result.value[0]).assertEqual("asyncKey"); expect(result.value[1]).assertEqual(fn); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_ENTRIES_4100
     * @tc.name    testCollectionsMapForEachEntries0041
     * @tc.desc    Verify forEach traverses SendableClassBasic correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapForEachEntries0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapForEachEntries0041';
      console.info(caseName + ', test start');
      let map: collections.Map<SendableClassBasic, string> = new collections.Map<SendableClassBasic, string>();
      let instance: SendableClassBasic = new SendableClassBasic();
      map.set(instance, "basicValue");
      let count: number = 0;
      map.forEach((_value: string, _key: SendableClassBasic) => { count++; });
      expect(count).assertEqual(1);
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_ENTRIES_4200
     * @tc.name    testCollectionsMapForEachEntries0042
     * @tc.desc    Verify entries returns correct SendableClassBasic pairs
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapForEachEntries0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapForEachEntries0042';
      console.info(caseName + ', test start');
      let map: collections.Map<SendableClassBasic, string> = new collections.Map<SendableClassBasic, string>();
      let instance: SendableClassBasic = new SendableClassBasic();
      map.set(instance, "basicValue");
      let entries = map.entries();
      let result = entries.next();
      expect(result.done).assertFalse();
      if (result.value) { expect(result.value[0]).assertEqual(instance); expect(result.value[1]).assertEqual("basicValue"); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_ENTRIES_4300
     * @tc.name    testCollectionsMapForEachEntries0043
     * @tc.desc    Verify forEach traverses SendableClassComplex correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapForEachEntries0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapForEachEntries0043';
      console.info(caseName + ', test start');
      let map: collections.Map<SendableClassComplex, string> = new collections.Map<SendableClassComplex, string>();
      let instance: SendableClassComplex = new SendableClassComplex();
      map.set(instance, "complexValue");
      let count: number = 0;
      map.forEach((_value: string, _key: SendableClassComplex) => { count++; });
      expect(count).assertEqual(1);
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_ENTRIES_4400
     * @tc.name    testCollectionsMapForEachEntries0044
     * @tc.desc    Verify entries returns correct SendableClassComplex pairs
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapForEachEntries0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapForEachEntries0044';
      console.info(caseName + ', test start');
      let map: collections.Map<SendableClassComplex, string> = new collections.Map<SendableClassComplex, string>();
      let instance: SendableClassComplex = new SendableClassComplex();
      map.set(instance, "complexValue");
      let entries = map.entries();
      let result = entries.next();
      expect(result.done).assertFalse();
      if (result.value) { expect(result.value[0]).assertEqual(instance); expect(result.value[1]).assertEqual("complexValue"); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_ENTRIES_4500
     * @tc.name    testCollectionsMapForEachEntries0045
     * @tc.desc    Verify forEach traverses SendableClassExtended correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapForEachEntries0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapForEachEntries0045';
      console.info(caseName + ', test start');
      let map: collections.Map<SendableClassExtended, string> = new collections.Map<SendableClassExtended, string>();
      let instance: SendableClassExtended = new SendableClassExtended();
      map.set(instance, "extendedValue");
      let count: number = 0;
      map.forEach((_value: string, _key: SendableClassExtended) => { count++; });
      expect(count).assertEqual(1);
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_ENTRIES_4600
     * @tc.name    testCollectionsMapForEachEntries0046
     * @tc.desc    Verify entries returns correct SendableClassExtended pairs
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapForEachEntries0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapForEachEntries0046';
      console.info(caseName + ', test start');
      let map: collections.Map<SendableClassExtended, string> = new collections.Map<SendableClassExtended, string>();
      let instance: SendableClassExtended = new SendableClassExtended();
      map.set(instance, "extendedValue");
      let entries = map.entries();
      let result = entries.next();
      expect(result.done).assertFalse();
      if (result.value) { expect(result.value[0]).assertEqual(instance); expect(result.value[1]).assertEqual("extendedValue"); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_ENTRIES_4700
     * @tc.name    testCollectionsMapForEachEntries0047
     * @tc.desc    Verify forEach traverses SendableAddFn correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapForEachEntries0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapForEachEntries0047';
      console.info(caseName + ', test start');
      let map: collections.Map<string, SendableAddFn> = new collections.Map<string, SendableAddFn>();
      let fn: SendableAddFn = new SendableAddFn();
      map.set("sendableFnKey", fn);
      let count: number = 0;
      map.forEach((_value: SendableAddFn, _key: string) => { count++; });
      expect(count).assertEqual(1);
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_ENTRIES_4800
     * @tc.name    testCollectionsMapForEachEntries0048
     * @tc.desc    Verify entries returns correct SendableAddFn pairs
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapForEachEntries0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapForEachEntries0048';
      console.info(caseName + ', test start');
      let map: collections.Map<string, SendableAddFn> = new collections.Map<string, SendableAddFn>();
      let fn: SendableAddFn = new SendableAddFn();
      map.set("sendableFnKey", fn);
      let entries = map.entries();
      let result = entries.next();
      expect(result.done).assertFalse();
      if (result.value) { expect(result.value[0]).assertEqual("sendableFnKey"); expect(result.value[1]).assertEqual(fn); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_ENTRIES_4900
     * @tc.name    testCollectionsMapForEachEntries0049
     * @tc.desc    Verify forEach traverses const enum correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapForEachEntries0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapForEachEntries0049';
      console.info(caseName + ', test start');
      let map: collections.Map<SendableEnum, string> = new collections.Map<SendableEnum, string>();
      map.set(SendableEnum.Success, "successValue").set(SendableEnum.Failure, "failureValue");
      let count: number = 0;
      map.forEach((_value: string, _key: SendableEnum) => { count++; });
      expect(count).assertEqual(2);
      expect(map.size).assertEqual(2);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_ENTRIES_5000
     * @tc.name    testCollectionsMapForEachEntries0050
     * @tc.desc    Verify entries returns correct const enum pairs
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapForEachEntries0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapForEachEntries0050';
      console.info(caseName + ', test start');
      let map: collections.Map<SendableEnum, string> = new collections.Map<SendableEnum, string>();
      map.set(SendableEnum.Success, "successValue");
      let entries = map.entries();
      let result = entries.next();
      expect(result.done).assertFalse();
      if (result.value) { expect(result.value[0]).assertEqual(SendableEnum.Success); expect(result.value[1]).assertEqual("successValue"); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_ENTRIES_5100
     * @tc.name    testCollectionsMapForEachEntries0051
     * @tc.desc    Verify forEach traverses AsyncLock correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapForEachEntries0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapForEachEntries0051';
      console.info(caseName + ', test start');
      let lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
      let map: collections.Map<string, ArkTSUtils.locks.AsyncLock> = new collections.Map<string, ArkTSUtils.locks.AsyncLock>();
      map.set("lockKey", lock);
      let count: number = 0;
      map.forEach((_value: ArkTSUtils.locks.AsyncLock, _key: string) => { count++; });
      expect(count).assertEqual(1);
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_ENTRIES_5200
     * @tc.name    testCollectionsMapForEachEntries0052
     * @tc.desc    Verify entries returns correct AsyncLock pairs
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapForEachEntries0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapForEachEntries0052';
      console.info(caseName + ', test start');
      let lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
      let map: collections.Map<string, ArkTSUtils.locks.AsyncLock> = new collections.Map<string, ArkTSUtils.locks.AsyncLock>();
      map.set("lockKey", lock);
      let entries = map.entries();
      let result = entries.next();
      expect(result.done).assertFalse();
      if (result.value) { expect(result.value[0]).assertEqual("lockKey"); expect(result.value[1]).assertEqual(lock); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_ENTRIES_5300
     * @tc.name    testCollectionsMapForEachEntries0053
     * @tc.desc    Verify forEach traverses ConditionVariable correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapForEachEntries0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapForEachEntries0053';
      console.info(caseName + ', test start');
      let cv: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
      let map: collections.Map<string, ArkTSUtils.locks.ConditionVariable> = new collections.Map<string, ArkTSUtils.locks.ConditionVariable>();
      map.set("cvKey", cv);
      let count: number = 0;
      map.forEach((_value: ArkTSUtils.locks.ConditionVariable, _key: string) => { count++; });
      expect(count).assertEqual(1);
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_ENTRIES_5400
     * @tc.name    testCollectionsMapForEachEntries0054
     * @tc.desc    Verify entries returns correct ConditionVariable pairs
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapForEachEntries0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapForEachEntries0054';
      console.info(caseName + ', test start');
      let cv: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
      let map: collections.Map<string, ArkTSUtils.locks.ConditionVariable> = new collections.Map<string, ArkTSUtils.locks.ConditionVariable>();
      map.set("cvKey", cv);
      let entries = map.entries();
      let result = entries.next();
      expect(result.done).assertFalse();
      if (result.value) { expect(result.value[0]).assertEqual("cvKey"); expect(result.value[1]).assertEqual(cv); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_ENTRIES_5500
     * @tc.name    testCollectionsMapForEachEntries0055
     * @tc.desc    Verify forEach traverses SendableLruCache correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapForEachEntries0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapForEachEntries0055';
      console.info(caseName + ', test start');
      let cache: ArkTSUtils.SendableLruCache<number, string> = new ArkTSUtils.SendableLruCache<number, string>();
      cache.put(1, "value1");
      let map: collections.Map<string, ArkTSUtils.SendableLruCache<number, string>> = new collections.Map<string, ArkTSUtils.SendableLruCache<number, string>>();
      map.set("cacheKey", cache);
      let count: number = 0;
      map.forEach((_value: ArkTSUtils.SendableLruCache<number, string>, _key: string) => { count++; });
      expect(count).assertEqual(1);
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_ENTRIES_5600
     * @tc.name    testCollectionsMapForEachEntries0056
     * @tc.desc    Verify entries returns correct SendableLruCache pairs
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapForEachEntries0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapForEachEntries0056';
      console.info(caseName + ', test start');
      let cache: ArkTSUtils.SendableLruCache<number, string> = new ArkTSUtils.SendableLruCache<number, string>();
      cache.put(1, "value1");
      let map: collections.Map<string, ArkTSUtils.SendableLruCache<number, string>> = new collections.Map<string, ArkTSUtils.SendableLruCache<number, string>>();
      map.set("cacheKey", cache);
      let entries = map.entries();
      let result = entries.next();
      expect(result.done).assertFalse();
      if (result.value) { expect(result.value[0]).assertEqual("cacheKey"); expect(result.value[1]).assertEqual(cache); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_ENTRIES_5700
     * @tc.name    testCollectionsMapForEachEntries0057
     * @tc.desc    Verify forEach traverses nested collections.Map correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapForEachEntries0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapForEachEntries0057';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Map<number, string>> = new collections.Map<string, collections.Map<number, string>>();
      let nestedMap: collections.Map<number, string> = new collections.Map<number, string>();
      nestedMap.set(1, "one").set(2, "two");
      map.set("nestedKey", nestedMap);
      let count: number = 0;
      map.forEach((_value: collections.Map<number, string>, _key: string) => { count++; });
      expect(count).assertEqual(1);
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_ENTRIES_5800
     * @tc.name    testCollectionsMapForEachEntries0058
     * @tc.desc    Verify entries returns correct nested collections.Map pairs
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapForEachEntries0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapForEachEntries0058';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Map<number, string>> = new collections.Map<string, collections.Map<number, string>>();
      let nestedMap: collections.Map<number, string> = new collections.Map<number, string>();
      nestedMap.set(1, "one").set(2, "two");
      map.set("nestedKey", nestedMap);
      let entries = map.entries();
      let result = entries.next();
      expect(result.done).assertFalse();
      if (result.value) { expect(result.value[0]).assertEqual("nestedKey"); expect(result.value[1]).assertEqual(nestedMap); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_ENTRIES_5900
     * @tc.name    testCollectionsMapForEachEntries0059
     * @tc.desc    Verify forEach traverses nested collections.Set correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapForEachEntries0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapForEachEntries0059';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Set<number>> = new collections.Map<string, collections.Set<number>>();
      let nestedSet: collections.Set<number> = new collections.Set<number>();
      nestedSet.add(1).add(2);
      map.set("nestedSetKey", nestedSet);
      let count: number = 0;
      map.forEach((_value: collections.Set<number>, _key: string) => { count++; });
      expect(count).assertEqual(1);
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_ENTRIES_6000
     * @tc.name    testCollectionsMapForEachEntries0060
     * @tc.desc    Verify entries returns correct nested collections.Set pairs
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapForEachEntries0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapForEachEntries0060';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Set<number>> = new collections.Map<string, collections.Set<number>>();
      let nestedSet: collections.Set<number> = new collections.Set<number>();
      nestedSet.add(1).add(2);
      map.set("nestedSetKey", nestedSet);
      let entries = map.entries();
      let result = entries.next();
      expect(result.done).assertFalse();
      if (result.value) { expect(result.value[0]).assertEqual("nestedSetKey"); expect(result.value[1]).assertEqual(nestedSet); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_ENTRIES_6100
     * @tc.name    testCollectionsMapForEachEntries0061
     * @tc.desc    Verify forEach traverses nested collections.Array correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapForEachEntries0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapForEachEntries0061';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Array<number>> = new collections.Map<string, collections.Array<number>>();
      let nestedArray: collections.Array<number> = new collections.Array<number>();
      nestedArray.push(1); nestedArray.push(2);
      map.set("nestedArrayKey", nestedArray);
      let count: number = 0;
      map.forEach((_value: collections.Array<number>, _key: string) => { count++; });
      expect(count).assertEqual(1);
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_ENTRIES_6200
     * @tc.name    testCollectionsMapForEachEntries0062
     * @tc.desc    Verify entries returns correct nested collections.Array pairs
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapForEachEntries0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapForEachEntries0062';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Array<number>> = new collections.Map<string, collections.Array<number>>();
      let nestedArray: collections.Array<number> = new collections.Array<number>();
      nestedArray.push(1); nestedArray.push(2);
      map.set("nestedArrayKey", nestedArray);
      let entries = map.entries();
      let result = entries.next();
      expect(result.done).assertFalse();
      if (result.value) { expect(result.value[0]).assertEqual("nestedArrayKey"); expect(result.value[1]).assertEqual(nestedArray); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_ENTRIES_6300
     * @tc.name    testCollectionsMapForEachEntries0063
     * @tc.desc    Verify forEach traverses large object correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapForEachEntries0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapForEachEntries0063';
      console.info(caseName + ', test start');
      let map: collections.Map<string, LargeObject> = new collections.Map<string, LargeObject>();
      let obj: LargeObject = new LargeObject();
      map.set("largeKey", obj);
      let count: number = 0;
      map.forEach((_value: LargeObject, _key: string) => { count++; });
      expect(count).assertEqual(1);
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_ENTRIES_6400
     * @tc.name    testCollectionsMapForEachEntries0064
     * @tc.desc    Verify entries returns correct large object pairs
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapForEachEntries0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapForEachEntries0064';
      console.info(caseName + ', test start');
      let map: collections.Map<string, LargeObject> = new collections.Map<string, LargeObject>();
      let obj: LargeObject = new LargeObject();
      map.set("largeKey", obj);
      let entries = map.entries();
      let result = entries.next();
      expect(result.done).assertFalse();
      if (result.value) { expect(result.value[0]).assertEqual("largeKey"); expect(result.value[1]).assertEqual(obj); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_ENTRIES_6500
     * @tc.name    testCollectionsMapForEachEntries0065
     * @tc.desc    Verify forEach traverses large array correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapForEachEntries0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapForEachEntries0065';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Array<number>> = new collections.Map<string, collections.Array<number>>();
      let arr: collections.Array<number> = new collections.Array<number>();
      for (let i: number = 0; i < 10000; i++) arr.push(i);
      map.set("largeArrayKey", arr);
      let count: number = 0;
      map.forEach((_value: collections.Array<number>, _key: string) => { count++; });
      expect(count).assertEqual(1);
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_ENTRIES_6600
     * @tc.name    testCollectionsMapForEachEntries0066
     * @tc.desc    Verify entries returns correct large array pairs
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapForEachEntries0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapForEachEntries0066';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Array<number>> = new collections.Map<string, collections.Array<number>>();
      let arr: collections.Array<number> = new collections.Array<number>();
      for (let i: number = 0; i < 10000; i++) arr.push(i);
      map.set("largeArrayKey", arr);
      let entries = map.entries();
      let result = entries.next();
      expect(result.done).assertFalse();
      if (result.value) { expect(result.value[0]).assertEqual("largeArrayKey"); expect(result.value[1]).assertEqual(arr); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_ENTRIES_6700
     * @tc.name    testCollectionsMapForEachEntries0067
     * @tc.desc    Verify forEach traverses deeply nested object correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapForEachEntries0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapForEachEntries0067';
      console.info(caseName + ', test start');
      let map: collections.Map<string, DeepNestedObject> = new collections.Map<string, DeepNestedObject>();
      let root: DeepNestedObject = new DeepNestedObject("level0");
      let current: DeepNestedObject = root;
      for (let i: number = 1; i < 10; i++) { let next: DeepNestedObject = new DeepNestedObject("level" + i); current.next = next; current = next; }
      map.set("deepKey", root);
      let count: number = 0;
      map.forEach((_value: DeepNestedObject, _key: string) => { count++; });
      expect(count).assertEqual(1);
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_ENTRIES_6800
     * @tc.name    testCollectionsMapForEachEntries0068
     * @tc.desc    Verify entries returns correct deeply nested object pairs
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapForEachEntries0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapForEachEntries0068';
      console.info(caseName + ', test start');
      let map: collections.Map<string, DeepNestedObject> = new collections.Map<string, DeepNestedObject>();
      let root: DeepNestedObject = new DeepNestedObject("level0");
      let current: DeepNestedObject = root;
      for (let i: number = 1; i < 10; i++) { let next: DeepNestedObject = new DeepNestedObject("level" + i); current.next = next; current = next; }
      map.set("deepKey", root);
      let entries = map.entries();
      let result = entries.next();
      expect(result.done).assertFalse();
      if (result.value) { expect(result.value[0]).assertEqual("deepKey"); expect(result.value[1]).assertEqual(root); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_ENTRIES_6900
     * @tc.name    testCollectionsMapForEachEntries0069
     * @tc.desc    Verify forEach traverses circular reference object correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapForEachEntries0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapForEachEntries0069';
      console.info(caseName + ', test start');
      let map: collections.Map<string, CircularRef> = new collections.Map<string, CircularRef>();
      let obj: CircularRef = new CircularRef("parent");
      obj.ref = new CircularRef("child");
      obj.ref.ref = obj;
      map.set("circularKey", obj);
      let count: number = 0;
      map.forEach((_value: CircularRef, _key: string) => { count++; });
      expect(count).assertEqual(1);
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_ENTRIES_7000
     * @tc.name    testCollectionsMapForEachEntries0070
     * @tc.desc    Verify entries returns correct circular reference object pairs
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapForEachEntries0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapForEachEntries0070';
      console.info(caseName + ', test start');
      let map: collections.Map<string, CircularRef> = new collections.Map<string, CircularRef>();
      let obj: CircularRef = new CircularRef("parent");
      obj.ref = new CircularRef("child");
      obj.ref.ref = obj;
      map.set("circularKey", obj);
      let entries = map.entries();
      let result = entries.next();
      expect(result.done).assertFalse();
      if (result.value) { expect(result.value[0]).assertEqual("circularKey"); expect(result.value[1]).assertEqual(obj); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_ENTRIES_7100
     * @tc.name    testCollectionsMapForEachEntries0071
     * @tc.desc    Verify forEach on empty map does not execute callback
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapForEachEntries0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapForEachEntries0071';
      console.info(caseName + ', test start');
      let map: collections.Map<string, number> = new collections.Map<string, number>();
      let count: number = 0;
      map.forEach((_value: number, _key: string) => { count++; });
      expect(count).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_FOREACH_ENTRIES_7200
     * @tc.name    testCollectionsMapForEachEntries0072
     * @tc.desc    Verify entries on empty map returns done true
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapForEachEntries0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapForEachEntries0072';
      console.info(caseName + ', test start');
      let map: collections.Map<string, number> = new collections.Map<string, number>();
      let entries = map.entries();
      let result = entries.next();
      expect(result.done).assertTrue();
      expect(result.value).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

  });
}