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
 * @file CollectionsMapHasDelete.test.ets
 * @description collections.Map has and delete methods unit test cases covering
 *              all 36 test value types
 * @since 2026
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { collections, ArkTSUtils } from '@kit.ArkTS';

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

export default function CollectionsMapHasDeleteTest() {
  describe('CollectionsMapHasDeleteTest', () => {

    beforeAll(() => { console.info('[CollectionsMapHasDeleteTest] beforeAll'); });
    beforeEach(() => { console.info('[CollectionsMapHasDeleteTest] beforeEach'); });
    afterEach(() => { console.info('[CollectionsMapHasDeleteTest] afterEach'); });
    afterAll(() => { console.info('[CollectionsMapHasDeleteTest] afterAll'); });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_HAS_DELETE_0100
     * @tc.name    testCollectionsMapHasDelete0001
     * @tc.desc    Verify has checks normal number existence correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapHasDelete0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapHasDelete0001';
      console.info(caseName + ', test start');
      let map: collections.Map<number, string> = new collections.Map<number, string>();
      map.set(100, "value100");
      expect(map.has(100)).assertTrue();
      expect(map.has(200)).assertFalse();
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_HAS_DELETE_0200
     * @tc.name    testCollectionsMapHasDelete0002
     * @tc.desc    Verify delete removes normal number correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapHasDelete0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapHasDelete0002';
      console.info(caseName + ', test start');
      let map: collections.Map<number, string> = new collections.Map<number, string>();
      map.set(100, "value100");
      expect(map.has(100)).assertTrue();
      let result: boolean = map.delete(100);
      expect(result).assertTrue();
      expect(map.has(100)).assertFalse();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_HAS_DELETE_0300
     * @tc.name    testCollectionsMapHasDelete0003
     * @tc.desc    Verify has checks scientific notation number existence correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapHasDelete0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapHasDelete0003';
      console.info(caseName + ', test start');
      let map: collections.Map<number, string> = new collections.Map<number, string>();
      let value: number = 1.5e-10;
      map.set(value, "scientificValue");
      expect(map.has(value)).assertTrue();
      expect(map.has(1.6e-10)).assertFalse();
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_HAS_DELETE_0400
     * @tc.name    testCollectionsMapHasDelete0004
     * @tc.desc    Verify delete removes scientific notation number correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapHasDelete0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapHasDelete0004';
      console.info(caseName + ', test start');
      let map: collections.Map<number, string> = new collections.Map<number, string>();
      let value: number = 1.5e-10;
      map.set(value, "scientificValue");
      expect(map.has(value)).assertTrue();
      let result: boolean = map.delete(value);
      expect(result).assertTrue();
      expect(map.has(value)).assertFalse();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_HAS_DELETE_0500
     * @tc.name    testCollectionsMapHasDelete0005
     * @tc.desc    Verify has checks MAX_SAFE_INTEGER existence correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapHasDelete0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapHasDelete0005';
      console.info(caseName + ', test start');
      let map: collections.Map<number, string> = new collections.Map<number, string>();
      let maxInt: number = Number.MAX_SAFE_INTEGER;
      map.set(maxInt, "maxSafeValue");
      expect(map.has(maxInt)).assertTrue();
      expect(map.has(maxInt - 1)).assertFalse();
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_HAS_DELETE_0600
     * @tc.name    testCollectionsMapHasDelete0006
     * @tc.desc    Verify delete removes MAX_SAFE_INTEGER correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapHasDelete0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapHasDelete0006';
      console.info(caseName + ', test start');
      let map: collections.Map<number, string> = new collections.Map<number, string>();
      let maxInt: number = Number.MAX_SAFE_INTEGER;
      map.set(maxInt, "maxSafeValue");
      expect(map.has(maxInt)).assertTrue();
      let result: boolean = map.delete(maxInt);
      expect(result).assertTrue();
      expect(map.has(maxInt)).assertFalse();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_HAS_DELETE_0700
     * @tc.name    testCollectionsMapHasDelete0007
     * @tc.desc    Verify has checks NaN existence correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapHasDelete0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapHasDelete0007';
      console.info(caseName + ', test start');
      let map: collections.Map<number, string> = new collections.Map<number, string>();
      map.set(NaN, "nanValue");
      expect(map.has(NaN)).assertTrue();
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_HAS_DELETE_0800
     * @tc.name    testCollectionsMapHasDelete0008
     * @tc.desc    Verify delete removes NaN correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapHasDelete0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapHasDelete0008';
      console.info(caseName + ', test start');
      let map: collections.Map<number, string> = new collections.Map<number, string>();
      map.set(NaN, "nanValue");
      expect(map.has(NaN)).assertTrue();
      let result: boolean = map.delete(NaN);
      expect(result).assertTrue();
      expect(map.has(NaN)).assertFalse();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_HAS_DELETE_0900
     * @tc.name    testCollectionsMapHasDelete0009
     * @tc.desc    Verify has checks normal string existence correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapHasDelete0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapHasDelete0009';
      console.info(caseName + ', test start');
      let map: collections.Map<string, number> = new collections.Map<string, number>();
      map.set("key1", 1);
      expect(map.has("key1")).assertTrue();
      expect(map.has("key2")).assertFalse();
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_HAS_DELETE_1000
     * @tc.name    testCollectionsMapHasDelete0010
     * @tc.desc    Verify delete removes normal string correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapHasDelete0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapHasDelete0010';
      console.info(caseName + ', test start');
      let map: collections.Map<string, number> = new collections.Map<string, number>();
      map.set("key1", 1);
      expect(map.has("key1")).assertTrue();
      let result: boolean = map.delete("key1");
      expect(result).assertTrue();
      expect(map.has("key1")).assertFalse();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_HAS_DELETE_1100
     * @tc.name    testCollectionsMapHasDelete0011
     * @tc.desc    Verify has checks special character string existence correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapHasDelete0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapHasDelete0011';
      console.info(caseName + ', test start');
      let map: collections.Map<string, string> = new collections.Map<string, string>();
      let str: string = "key!@#";
      map.set(str, "value");
      expect(map.has(str)).assertTrue();
      expect(map.has("key")).assertFalse();
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_HAS_DELETE_1200
     * @tc.name    testCollectionsMapHasDelete0012
     * @tc.desc    Verify delete removes special character string correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapHasDelete0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapHasDelete0012';
      console.info(caseName + ', test start');
      let map: collections.Map<string, string> = new collections.Map<string, string>();
      let str: string = "key!@#";
      map.set(str, "value");
      expect(map.has(str)).assertTrue();
      let result: boolean = map.delete(str);
      expect(result).assertTrue();
      expect(map.has(str)).assertFalse();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_HAS_DELETE_1300
     * @tc.name    testCollectionsMapHasDelete0013
     * @tc.desc    Verify has checks emoji string existence correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapHasDelete0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapHasDelete0013';
      console.info(caseName + ', test start');
      let map: collections.Map<string, string> = new collections.Map<string, string>();
      let str: string = "😀🎉🔥";
      map.set(str, "emojiValue");
      expect(map.has(str)).assertTrue();
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_HAS_DELETE_1400
     * @tc.name    testCollectionsMapHasDelete0014
     * @tc.desc    Verify delete removes emoji string correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapHasDelete0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapHasDelete0014';
      console.info(caseName + ', test start');
      let map: collections.Map<string, string> = new collections.Map<string, string>();
      let str: string = "😀🎉🔥";
      map.set(str, "emojiValue");
      expect(map.has(str)).assertTrue();
      let result: boolean = map.delete(str);
      expect(result).assertTrue();
      expect(map.has(str)).assertFalse();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_HAS_DELETE_1500
     * @tc.name    testCollectionsMapHasDelete0015
     * @tc.desc    Verify has checks empty string existence correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapHasDelete0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapHasDelete0015';
      console.info(caseName + ', test start');
      let map: collections.Map<string, string> = new collections.Map<string, string>();
      map.set("", "emptyValue");
      expect(map.has("")).assertTrue();
      expect(map.has("nonempty")).assertFalse();
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_HAS_DELETE_1600
     * @tc.name    testCollectionsMapHasDelete0016
     * @tc.desc    Verify delete removes empty string correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapHasDelete0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapHasDelete0016';
      console.info(caseName + ', test start');
      let map: collections.Map<string, string> = new collections.Map<string, string>();
      map.set("", "emptyValue");
      expect(map.has("")).assertTrue();
      let result: boolean = map.delete("");
      expect(result).assertTrue();
      expect(map.has("")).assertFalse();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_HAS_DELETE_1700
     * @tc.name    testCollectionsMapHasDelete0017
     * @tc.desc    Verify has checks boolean true existence correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapHasDelete0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapHasDelete0017';
      console.info(caseName + ', test start');
      let map: collections.Map<boolean, string> = new collections.Map<boolean, string>();
      map.set(true, "trueValue");
      expect(map.has(true)).assertTrue();
      expect(map.has(false)).assertFalse();
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_HAS_DELETE_1800
     * @tc.name    testCollectionsMapHasDelete0018
     * @tc.desc    Verify delete removes boolean true correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapHasDelete0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapHasDelete0018';
      console.info(caseName + ', test start');
      let map: collections.Map<boolean, string> = new collections.Map<boolean, string>();
      map.set(true, "trueValue");
      expect(map.has(true)).assertTrue();
      let result: boolean = map.delete(true);
      expect(result).assertTrue();
      expect(map.has(true)).assertFalse();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_HAS_DELETE_1900
     * @tc.name    testCollectionsMapHasDelete0019
     * @tc.desc    Verify has checks boolean false existence correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapHasDelete0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapHasDelete0019';
      console.info(caseName + ', test start');
      let map: collections.Map<boolean, string> = new collections.Map<boolean, string>();
      map.set(false, "falseValue");
      expect(map.has(false)).assertTrue();
      expect(map.has(true)).assertFalse();
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_HAS_DELETE_2000
     * @tc.name    testCollectionsMapHasDelete0020
     * @tc.desc    Verify delete removes boolean false correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapHasDelete0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapHasDelete0020';
      console.info(caseName + ', test start');
      let map: collections.Map<boolean, string> = new collections.Map<boolean, string>();
      map.set(false, "falseValue");
      expect(map.has(false)).assertTrue();
      let result: boolean = map.delete(false);
      expect(result).assertTrue();
      expect(map.has(false)).assertFalse();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_HAS_DELETE_2100
     * @tc.name    testCollectionsMapHasDelete0021
     * @tc.desc    Verify has checks undefined existence correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapHasDelete0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapHasDelete0021';
      console.info(caseName + ', test start');
      let map: collections.Map<undefined, string> = new collections.Map<undefined, string>();
      map.set(undefined, "undefinedValue");
      expect(map.has(undefined)).assertTrue();
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_HAS_DELETE_2200
     * @tc.name    testCollectionsMapHasDelete0022
     * @tc.desc    Verify delete removes undefined correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapHasDelete0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapHasDelete0022';
      console.info(caseName + ', test start');
      let map: collections.Map<undefined, string> = new collections.Map<undefined, string>();
      map.set(undefined, "undefinedValue");
      expect(map.has(undefined)).assertTrue();
      let result: boolean = map.delete(undefined);
      expect(result).assertTrue();
      expect(map.has(undefined)).assertFalse();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_HAS_DELETE_2300
     * @tc.name    testCollectionsMapHasDelete0023
     * @tc.desc    Verify has checks null existence correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapHasDelete0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapHasDelete0023';
      console.info(caseName + ', test start');
      let map: collections.Map<null, string> = new collections.Map<null, string>();
      map.set(null, "nullValue");
      expect(map.has(null)).assertTrue();
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_HAS_DELETE_2400
     * @tc.name    testCollectionsMapHasDelete0024
     * @tc.desc    Verify delete removes null correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapHasDelete0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapHasDelete0024';
      console.info(caseName + ', test start');
      let map: collections.Map<null, string> = new collections.Map<null, string>();
      map.set(null, "nullValue");
      expect(map.has(null)).assertTrue();
      let result: boolean = map.delete(null);
      expect(result).assertTrue();
      expect(map.has(null)).assertFalse();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_HAS_DELETE_2500
     * @tc.name    testCollectionsMapHasDelete0025
     * @tc.desc    Verify has checks Sendable object existence correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapHasDelete0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapHasDelete0025';
      console.info(caseName + ', test start');
      let map: collections.Map<TestPerson, string> = new collections.Map<TestPerson, string>();
      let obj: TestPerson = new TestPerson("test", 20);
      map.set(obj, "personValue");
      expect(map.has(obj)).assertTrue();
      let differentObj: TestPerson = new TestPerson("other", 30);
      expect(map.has(differentObj)).assertFalse();
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_HAS_DELETE_2600
     * @tc.name    testCollectionsMapHasDelete0026
     * @tc.desc    Verify delete removes Sendable object correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapHasDelete0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapHasDelete0026';
      console.info(caseName + ', test start');
      let map: collections.Map<TestPerson, string> = new collections.Map<TestPerson, string>();
      let obj: TestPerson = new TestPerson("test", 20);
      map.set(obj, "personValue");
      expect(map.has(obj)).assertTrue();
      let result: boolean = map.delete(obj);
      expect(result).assertTrue();
      expect(map.has(obj)).assertFalse();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_HAS_DELETE_2700
     * @tc.name    testCollectionsMapHasDelete0027
     * @tc.desc    Verify has checks empty Sendable object existence correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapHasDelete0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapHasDelete0027';
      console.info(caseName + ', test start');
      let map: collections.Map<EmptyClass, string> = new collections.Map<EmptyClass, string>();
      let obj: EmptyClass = new EmptyClass();
      map.set(obj, "emptyValue");
      expect(map.has(obj)).assertTrue();
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_HAS_DELETE_2800
     * @tc.name    testCollectionsMapHasDelete0028
     * @tc.desc    Verify delete removes empty Sendable object correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapHasDelete0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapHasDelete0028';
      console.info(caseName + ', test start');
      let map: collections.Map<EmptyClass, string> = new collections.Map<EmptyClass, string>();
      let obj: EmptyClass = new EmptyClass();
      map.set(obj, "emptyValue");
      expect(map.has(obj)).assertTrue();
      let result: boolean = map.delete(obj);
      expect(result).assertTrue();
      expect(map.has(obj)).assertFalse();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_HAS_DELETE_2900
     * @tc.name    testCollectionsMapHasDelete0029
     * @tc.desc    Verify has checks ComplexIndexSignature object existence correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapHasDelete0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapHasDelete0029';
      console.info(caseName + ', test start');
      let map: collections.Map<ComplexIndexSignature, string> = new collections.Map<ComplexIndexSignature, string>();
      let obj: ComplexIndexSignature = new ComplexIndexSignature();
      map.set(obj, "complexValue");
      expect(map.has(obj)).assertTrue();
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_HAS_DELETE_3000
     * @tc.name    testCollectionsMapHasDelete0030
     * @tc.desc    Verify delete removes ComplexIndexSignature object correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapHasDelete0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapHasDelete0030';
      console.info(caseName + ', test start');
      let map: collections.Map<ComplexIndexSignature, string> = new collections.Map<ComplexIndexSignature, string>();
      let obj: ComplexIndexSignature = new ComplexIndexSignature();
      map.set(obj, "complexValue");
      expect(map.has(obj)).assertTrue();
      let result: boolean = map.delete(obj);
      expect(result).assertTrue();
      expect(map.has(obj)).assertFalse();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_HAS_DELETE_3100
     * @tc.name    testCollectionsMapHasDelete0031
     * @tc.desc    Verify has checks collections.Array existence correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapHasDelete0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapHasDelete0031';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Array<number>> = new collections.Map<string, collections.Array<number>>();
      let arr: collections.Array<number> = new collections.Array<number>();
      arr.push(1); arr.push(2); arr.push(3);
      map.set("arrayKey", arr);
      expect(map.has("arrayKey")).assertTrue();
      expect(map.has("nonExistentKey")).assertFalse();
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_HAS_DELETE_3200
     * @tc.name    testCollectionsMapHasDelete0032
     * @tc.desc    Verify delete removes collections.Array correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapHasDelete0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapHasDelete0032';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Array<number>> = new collections.Map<string, collections.Array<number>>();
      let arr: collections.Array<number> = new collections.Array<number>();
      arr.push(1); arr.push(2); arr.push(3);
      map.set("arrayKey", arr);
      expect(map.has("arrayKey")).assertTrue();
      let result: boolean = map.delete("arrayKey");
      expect(result).assertTrue();
      expect(map.has("arrayKey")).assertFalse();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_HAS_DELETE_3300
     * @tc.name    testCollectionsMapHasDelete0033
     * @tc.desc    Verify has checks empty collections.Array existence correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapHasDelete0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapHasDelete0033';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Array<number>> = new collections.Map<string, collections.Array<number>>();
      let arr: collections.Array<number> = new collections.Array<number>();
      map.set("emptyArrayKey", arr);
      expect(map.has("emptyArrayKey")).assertTrue();
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_HAS_DELETE_3400
     * @tc.name    testCollectionsMapHasDelete0034
     * @tc.desc    Verify delete removes empty collections.Array correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapHasDelete0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapHasDelete0034';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Array<number>> = new collections.Map<string, collections.Array<number>>();
      let arr: collections.Array<number> = new collections.Array<number>();
      map.set("emptyArrayKey", arr);
      expect(map.has("emptyArrayKey")).assertTrue();
      let result: boolean = map.delete("emptyArrayKey");
      expect(result).assertTrue();
      expect(map.has("emptyArrayKey")).assertFalse();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_HAS_DELETE_3500
     * @tc.name    testCollectionsMapHasDelete0035
     * @tc.desc    Verify has checks sparse array existence correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapHasDelete0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapHasDelete0035';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Array<number | null>> = new collections.Map<string, collections.Array<number | null>>();
      let arr: collections.Array<number | null> = new collections.Array<number | null>();
      arr.push(1);
      arr.push(null);
      arr.push(2);
      map.set("sparseKey", arr);
      expect(map.has("sparseKey")).assertTrue();
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_HAS_DELETE_3600
     * @tc.name    testCollectionsMapHasDelete0036
     * @tc.desc    Verify delete removes sparse array correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapHasDelete0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapHasDelete0036';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Array<number | null>> = new collections.Map<string, collections.Array<number | null>>();
      let arr: collections.Array<number | null> = new collections.Array<number | null>();
      arr.push(1);
      arr.push(null);
      arr.push(2);
      map.set("sparseKey", arr);
      expect(map.has("sparseKey")).assertTrue();
      let result: boolean = map.delete("sparseKey");
      expect(result).assertTrue();
      expect(map.has("sparseKey")).assertFalse();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_HAS_DELETE_3700
     * @tc.name    testCollectionsMapHasDelete0037
     * @tc.desc    Verify has checks SendableNormalFn existence correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapHasDelete0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapHasDelete0037';
      console.info(caseName + ', test start');
      let map: collections.Map<string, SendableNormalFn> = new collections.Map<string, SendableNormalFn>();
      let fn: SendableNormalFn = new SendableNormalFn();
      map.set("fnKey", fn);
      expect(map.has("fnKey")).assertTrue();
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_HAS_DELETE_3800
     * @tc.name    testCollectionsMapHasDelete0038
     * @tc.desc    Verify delete removes SendableNormalFn correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapHasDelete0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapHasDelete0038';
      console.info(caseName + ', test start');
      let map: collections.Map<string, SendableNormalFn> = new collections.Map<string, SendableNormalFn>();
      let fn: SendableNormalFn = new SendableNormalFn();
      map.set("fnKey", fn);
      expect(map.has("fnKey")).assertTrue();
      let result: boolean = map.delete("fnKey");
      expect(result).assertTrue();
      expect(map.has("fnKey")).assertFalse();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_HAS_DELETE_3900
     * @tc.name    testCollectionsMapHasDelete0039
     * @tc.desc    Verify has checks SendableArrowFn existence correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapHasDelete0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapHasDelete0039';
      console.info(caseName + ', test start');
      let map: collections.Map<string, SendableArrowFn> = new collections.Map<string, SendableArrowFn>();
      let fn: SendableArrowFn = new SendableArrowFn();
      map.set("arrowKey", fn);
      expect(map.has("arrowKey")).assertTrue();
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_HAS_DELETE_4000
     * @tc.name    testCollectionsMapHasDelete0040
     * @tc.desc    Verify delete removes SendableArrowFn correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapHasDelete0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapHasDelete0040';
      console.info(caseName + ', test start');
      let map: collections.Map<string, SendableArrowFn> = new collections.Map<string, SendableArrowFn>();
      let fn: SendableArrowFn = new SendableArrowFn();
      map.set("arrowKey", fn);
      expect(map.has("arrowKey")).assertTrue();
      let result: boolean = map.delete("arrowKey");
      expect(result).assertTrue();
      expect(map.has("arrowKey")).assertFalse();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_HAS_DELETE_4100
     * @tc.name    testCollectionsMapHasDelete0041
     * @tc.desc    Verify has checks SendableAsyncFn existence correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapHasDelete0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapHasDelete0041';
      console.info(caseName + ', test start');
      let map: collections.Map<string, SendableAsyncFn> = new collections.Map<string, SendableAsyncFn>();
      let fn: SendableAsyncFn = new SendableAsyncFn();
      map.set("asyncKey", fn);
      expect(map.has("asyncKey")).assertTrue();
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_HAS_DELETE_4200
     * @tc.name    testCollectionsMapHasDelete0042
     * @tc.desc    Verify delete removes SendableAsyncFn correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapHasDelete0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapHasDelete0042';
      console.info(caseName + ', test start');
      let map: collections.Map<string, SendableAsyncFn> = new collections.Map<string, SendableAsyncFn>();
      let fn: SendableAsyncFn = new SendableAsyncFn();
      map.set("asyncKey", fn);
      expect(map.has("asyncKey")).assertTrue();
      let result: boolean = map.delete("asyncKey");
      expect(result).assertTrue();
      expect(map.has("asyncKey")).assertFalse();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_HAS_DELETE_4300
     * @tc.name    testCollectionsMapHasDelete0043
     * @tc.desc    Verify has checks SendableClassBasic existence correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapHasDelete0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapHasDelete0043';
      console.info(caseName + ', test start');
      let map: collections.Map<SendableClassBasic, string> = new collections.Map<SendableClassBasic, string>();
      let instance: SendableClassBasic = new SendableClassBasic();
      map.set(instance, "basicValue");
      expect(map.has(instance)).assertTrue();
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_HAS_DELETE_4400
     * @tc.name    testCollectionsMapHasDelete0044
     * @tc.desc    Verify delete removes SendableClassBasic correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapHasDelete0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapHasDelete0044';
      console.info(caseName + ', test start');
      let map: collections.Map<SendableClassBasic, string> = new collections.Map<SendableClassBasic, string>();
      let instance: SendableClassBasic = new SendableClassBasic();
      map.set(instance, "basicValue");
      expect(map.has(instance)).assertTrue();
      let result: boolean = map.delete(instance);
      expect(result).assertTrue();
      expect(map.has(instance)).assertFalse();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_HAS_DELETE_4500
     * @tc.name    testCollectionsMapHasDelete0045
     * @tc.desc    Verify has checks SendableClassComplex existence correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapHasDelete0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapHasDelete0045';
      console.info(caseName + ', test start');
      let map: collections.Map<SendableClassComplex, string> = new collections.Map<SendableClassComplex, string>();
      let instance: SendableClassComplex = new SendableClassComplex();
      map.set(instance, "complexValue");
      expect(map.has(instance)).assertTrue();
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_HAS_DELETE_4600
     * @tc.name    testCollectionsMapHasDelete0046
     * @tc.desc    Verify delete removes SendableClassComplex correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapHasDelete0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapHasDelete0046';
      console.info(caseName + ', test start');
      let map: collections.Map<SendableClassComplex, string> = new collections.Map<SendableClassComplex, string>();
      let instance: SendableClassComplex = new SendableClassComplex();
      map.set(instance, "complexValue");
      expect(map.has(instance)).assertTrue();
      let result: boolean = map.delete(instance);
      expect(result).assertTrue();
      expect(map.has(instance)).assertFalse();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_HAS_DELETE_4700
     * @tc.name    testCollectionsMapHasDelete0047
     * @tc.desc    Verify has checks SendableClassExtended existence correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapHasDelete0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapHasDelete0047';
      console.info(caseName + ', test start');
      let map: collections.Map<SendableClassExtended, string> = new collections.Map<SendableClassExtended, string>();
      let instance: SendableClassExtended = new SendableClassExtended();
      map.set(instance, "extendedValue");
      expect(map.has(instance)).assertTrue();
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_HAS_DELETE_4800
     * @tc.name    testCollectionsMapHasDelete0048
     * @tc.desc    Verify delete removes SendableClassExtended correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapHasDelete0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapHasDelete0048';
      console.info(caseName + ', test start');
      let map: collections.Map<SendableClassExtended, string> = new collections.Map<SendableClassExtended, string>();
      let instance: SendableClassExtended = new SendableClassExtended();
      map.set(instance, "extendedValue");
      expect(map.has(instance)).assertTrue();
      let result: boolean = map.delete(instance);
      expect(result).assertTrue();
      expect(map.has(instance)).assertFalse();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_HAS_DELETE_4900
     * @tc.name    testCollectionsMapHasDelete0049
     * @tc.desc    Verify has checks SendableAddFn existence correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapHasDelete0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapHasDelete0049';
      console.info(caseName + ', test start');
      let map: collections.Map<string, SendableAddFn> = new collections.Map<string, SendableAddFn>();
      let fn: SendableAddFn = new SendableAddFn();
      map.set("sendableFnKey", fn);
      expect(map.has("sendableFnKey")).assertTrue();
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_HAS_DELETE_5000
     * @tc.name    testCollectionsMapHasDelete0050
     * @tc.desc    Verify delete removes SendableAddFn correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapHasDelete0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapHasDelete0050';
      console.info(caseName + ', test start');
      let map: collections.Map<string, SendableAddFn> = new collections.Map<string, SendableAddFn>();
      let fn: SendableAddFn = new SendableAddFn();
      map.set("sendableFnKey", fn);
      expect(map.has("sendableFnKey")).assertTrue();
      let result: boolean = map.delete("sendableFnKey");
      expect(result).assertTrue();
      expect(map.has("sendableFnKey")).assertFalse();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_HAS_DELETE_5100
     * @tc.name    testCollectionsMapHasDelete0051
     * @tc.desc    Verify has checks const enum existence correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapHasDelete0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapHasDelete0051';
      console.info(caseName + ', test start');
      let map: collections.Map<SendableEnum, string> = new collections.Map<SendableEnum, string>();
      map.set(SendableEnum.Success, "successValue");
      expect(map.has(SendableEnum.Success)).assertTrue();
      expect(map.has(SendableEnum.Failure)).assertFalse();
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_HAS_DELETE_5200
     * @tc.name    testCollectionsMapHasDelete0052
     * @tc.desc    Verify delete removes const enum correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapHasDelete0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapHasDelete0052';
      console.info(caseName + ', test start');
      let map: collections.Map<SendableEnum, string> = new collections.Map<SendableEnum, string>();
      map.set(SendableEnum.Success, "successValue");
      expect(map.has(SendableEnum.Success)).assertTrue();
      let result: boolean = map.delete(SendableEnum.Success);
      expect(result).assertTrue();
      expect(map.has(SendableEnum.Success)).assertFalse();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_HAS_DELETE_5300
     * @tc.name    testCollectionsMapHasDelete0053
     * @tc.desc    Verify has checks AsyncLock existence correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapHasDelete0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapHasDelete0053';
      console.info(caseName + ', test start');
      let lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
      let map: collections.Map<string, ArkTSUtils.locks.AsyncLock> = new collections.Map<string, ArkTSUtils.locks.AsyncLock>();
      map.set("lockKey", lock);
      expect(map.has("lockKey")).assertTrue();
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_HAS_DELETE_5400
     * @tc.name    testCollectionsMapHasDelete0054
     * @tc.desc    Verify delete removes AsyncLock correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapHasDelete0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapHasDelete0054';
      console.info(caseName + ', test start');
      let lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
      let map: collections.Map<string, ArkTSUtils.locks.AsyncLock> = new collections.Map<string, ArkTSUtils.locks.AsyncLock>();
      map.set("lockKey", lock);
      expect(map.has("lockKey")).assertTrue();
      let result: boolean = map.delete("lockKey");
      expect(result).assertTrue();
      expect(map.has("lockKey")).assertFalse();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_HAS_DELETE_5500
     * @tc.name    testCollectionsMapHasDelete0055
     * @tc.desc    Verify has checks ConditionVariable existence correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapHasDelete0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapHasDelete0055';
      console.info(caseName + ', test start');
      let cv: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
      let map: collections.Map<string, ArkTSUtils.locks.ConditionVariable> = new collections.Map<string, ArkTSUtils.locks.ConditionVariable>();
      map.set("cvKey", cv);
      expect(map.has("cvKey")).assertTrue();
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_HAS_DELETE_5600
     * @tc.name    testCollectionsMapHasDelete0056
     * @tc.desc    Verify delete removes ConditionVariable correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapHasDelete0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapHasDelete0056';
      console.info(caseName + ', test start');
      let cv: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
      let map: collections.Map<string, ArkTSUtils.locks.ConditionVariable> = new collections.Map<string, ArkTSUtils.locks.ConditionVariable>();
      map.set("cvKey", cv);
      expect(map.has("cvKey")).assertTrue();
      let result: boolean = map.delete("cvKey");
      expect(result).assertTrue();
      expect(map.has("cvKey")).assertFalse();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_HAS_DELETE_5700
     * @tc.name    testCollectionsMapHasDelete0057
     * @tc.desc    Verify has checks SendableLruCache existence correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapHasDelete0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapHasDelete0057';
      console.info(caseName + ', test start');
      let cache: ArkTSUtils.SendableLruCache<number, string> = new ArkTSUtils.SendableLruCache<number, string>();
      cache.put(1, "value1");
      let map: collections.Map<string, ArkTSUtils.SendableLruCache<number, string>> = new collections.Map<string, ArkTSUtils.SendableLruCache<number, string>>();
      map.set("cacheKey", cache);
      expect(map.has("cacheKey")).assertTrue();
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_HAS_DELETE_5800
     * @tc.name    testCollectionsMapHasDelete0058
     * @tc.desc    Verify delete removes SendableLruCache correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapHasDelete0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapHasDelete0058';
      console.info(caseName + ', test start');
      let cache: ArkTSUtils.SendableLruCache<number, string> = new ArkTSUtils.SendableLruCache<number, string>();
      cache.put(1, "value1");
      let map: collections.Map<string, ArkTSUtils.SendableLruCache<number, string>> = new collections.Map<string, ArkTSUtils.SendableLruCache<number, string>>();
      map.set("cacheKey", cache);
      expect(map.has("cacheKey")).assertTrue();
      let result: boolean = map.delete("cacheKey");
      expect(result).assertTrue();
      expect(map.has("cacheKey")).assertFalse();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_HAS_DELETE_5900
     * @tc.name    testCollectionsMapHasDelete0059
     * @tc.desc    Verify has checks nested collections.Map existence correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapHasDelete0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapHasDelete0059';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Map<number, string>> = new collections.Map<string, collections.Map<number, string>>();
      let nestedMap: collections.Map<number, string> = new collections.Map<number, string>();
      nestedMap.set(1, "one").set(2, "two");
      map.set("nestedKey", nestedMap);
      expect(map.has("nestedKey")).assertTrue();
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_HAS_DELETE_6000
     * @tc.name    testCollectionsMapHasDelete0060
     * @tc.desc    Verify delete removes nested collections.Map correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapHasDelete0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapHasDelete0060';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Map<number, string>> = new collections.Map<string, collections.Map<number, string>>();
      let nestedMap: collections.Map<number, string> = new collections.Map<number, string>();
      nestedMap.set(1, "one").set(2, "two");
      map.set("nestedKey", nestedMap);
      expect(map.has("nestedKey")).assertTrue();
      let result: boolean = map.delete("nestedKey");
      expect(result).assertTrue();
      expect(map.has("nestedKey")).assertFalse();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_HAS_DELETE_6100
     * @tc.name    testCollectionsMapHasDelete0061
     * @tc.desc    Verify has checks nested collections.Set existence correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapHasDelete0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapHasDelete0061';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Set<number>> = new collections.Map<string, collections.Set<number>>();
      let nestedSet: collections.Set<number> = new collections.Set<number>();
      nestedSet.add(1).add(2);
      map.set("nestedSetKey", nestedSet);
      expect(map.has("nestedSetKey")).assertTrue();
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_HAS_DELETE_6200
     * @tc.name    testCollectionsMapHasDelete0062
     * @tc.desc    Verify delete removes nested collections.Set correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapHasDelete0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapHasDelete0062';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Set<number>> = new collections.Map<string, collections.Set<number>>();
      let nestedSet: collections.Set<number> = new collections.Set<number>();
      nestedSet.add(1).add(2);
      map.set("nestedSetKey", nestedSet);
      expect(map.has("nestedSetKey")).assertTrue();
      let result: boolean = map.delete("nestedSetKey");
      expect(result).assertTrue();
      expect(map.has("nestedSetKey")).assertFalse();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_HAS_DELETE_6300
     * @tc.name    testCollectionsMapHasDelete0063
     * @tc.desc    Verify has checks nested collections.Array existence correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapHasDelete0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapHasDelete0063';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Array<number>> = new collections.Map<string, collections.Array<number>>();
      let nestedArray: collections.Array<number> = new collections.Array<number>();
      nestedArray.push(1); nestedArray.push(2);
      map.set("nestedArrayKey", nestedArray);
      expect(map.has("nestedArrayKey")).assertTrue();
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_HAS_DELETE_6400
     * @tc.name    testCollectionsMapHasDelete0064
     * @tc.desc    Verify delete removes nested collections.Array correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapHasDelete0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapHasDelete0064';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Array<number>> = new collections.Map<string, collections.Array<number>>();
      let nestedArray: collections.Array<number> = new collections.Array<number>();
      nestedArray.push(1); nestedArray.push(2);
      map.set("nestedArrayKey", nestedArray);
      expect(map.has("nestedArrayKey")).assertTrue();
      let result: boolean = map.delete("nestedArrayKey");
      expect(result).assertTrue();
      expect(map.has("nestedArrayKey")).assertFalse();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_HAS_DELETE_6500
     * @tc.name    testCollectionsMapHasDelete0065
     * @tc.desc    Verify has checks large object existence correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapHasDelete0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapHasDelete0065';
      console.info(caseName + ', test start');
      let map: collections.Map<string, LargeObject> = new collections.Map<string, LargeObject>();
      let obj: LargeObject = new LargeObject();
      map.set("largeKey", obj);
      expect(map.has("largeKey")).assertTrue();
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_HAS_DELETE_6600
     * @tc.name    testCollectionsMapHasDelete0066
     * @tc.desc    Verify delete removes large object correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapHasDelete0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapHasDelete0066';
      console.info(caseName + ', test start');
      let map: collections.Map<string, LargeObject> = new collections.Map<string, LargeObject>();
      let obj: LargeObject = new LargeObject();
      map.set("largeKey", obj);
      expect(map.has("largeKey")).assertTrue();
      let result: boolean = map.delete("largeKey");
      expect(result).assertTrue();
      expect(map.has("largeKey")).assertFalse();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_HAS_DELETE_6700
     * @tc.name    testCollectionsMapHasDelete0067
     * @tc.desc    Verify has checks large array existence correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapHasDelete0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapHasDelete0067';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Array<number>> = new collections.Map<string, collections.Array<number>>();
      let arr: collections.Array<number> = new collections.Array<number>();
      for (let i: number = 0; i < 10000; i++) arr.push(i);
      map.set("largeArrayKey", arr);
      expect(map.has("largeArrayKey")).assertTrue();
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_HAS_DELETE_6800
     * @tc.name    testCollectionsMapHasDelete0068
     * @tc.desc    Verify delete removes large array correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapHasDelete0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapHasDelete0068';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Array<number>> = new collections.Map<string, collections.Array<number>>();
      let arr: collections.Array<number> = new collections.Array<number>();
      for (let i: number = 0; i < 10000; i++) arr.push(i);
      map.set("largeArrayKey", arr);
      expect(map.has("largeArrayKey")).assertTrue();
      let result: boolean = map.delete("largeArrayKey");
      expect(result).assertTrue();
      expect(map.has("largeArrayKey")).assertFalse();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_HAS_DELETE_6900
     * @tc.name    testCollectionsMapHasDelete0069
     * @tc.desc    Verify has checks deeply nested object existence correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapHasDelete0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapHasDelete0069';
      console.info(caseName + ', test start');
      let map: collections.Map<string, DeepNestedObject> = new collections.Map<string, DeepNestedObject>();
      let root: DeepNestedObject = new DeepNestedObject("level0");
      let current: DeepNestedObject = root;
      for (let i: number = 1; i < 10; i++) { let next: DeepNestedObject = new DeepNestedObject("level" + i); current.next = next; current = next; }
      map.set("deepKey", root);
      expect(map.has("deepKey")).assertTrue();
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_HAS_DELETE_7000
     * @tc.name    testCollectionsMapHasDelete0070
     * @tc.desc    Verify delete removes deeply nested object correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapHasDelete0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapHasDelete0070';
      console.info(caseName + ', test start');
      let map: collections.Map<string, DeepNestedObject> = new collections.Map<string, DeepNestedObject>();
      let root: DeepNestedObject = new DeepNestedObject("level0");
      let current: DeepNestedObject = root;
      for (let i: number = 1; i < 10; i++) { let next: DeepNestedObject = new DeepNestedObject("level" + i); current.next = next; current = next; }
      map.set("deepKey", root);
      expect(map.has("deepKey")).assertTrue();
      let result: boolean = map.delete("deepKey");
      expect(result).assertTrue();
      expect(map.has("deepKey")).assertFalse();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_HAS_DELETE_7100
     * @tc.name    testCollectionsMapHasDelete0071
     * @tc.desc    Verify has checks circular reference object existence correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapHasDelete0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapHasDelete0071';
      console.info(caseName + ', test start');
      let map: collections.Map<string, CircularRef> = new collections.Map<string, CircularRef>();
      let obj: CircularRef = new CircularRef("parent");
      obj.ref = new CircularRef("child");
      obj.ref.ref = obj;
      map.set("circularKey", obj);
      expect(map.has("circularKey")).assertTrue();
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_HAS_DELETE_7200
     * @tc.name    testCollectionsMapHasDelete0072
     * @tc.desc    Verify delete removes circular reference object correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapHasDelete0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapHasDelete0072';
      console.info(caseName + ', test start');
      let map: collections.Map<string, CircularRef> = new collections.Map<string, CircularRef>();
      let obj: CircularRef = new CircularRef("parent");
      obj.ref = new CircularRef("child");
      obj.ref.ref = obj;
      map.set("circularKey", obj);
      expect(map.has("circularKey")).assertTrue();
      let result: boolean = map.delete("circularKey");
      expect(result).assertTrue();
      expect(map.has("circularKey")).assertFalse();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

  });
}