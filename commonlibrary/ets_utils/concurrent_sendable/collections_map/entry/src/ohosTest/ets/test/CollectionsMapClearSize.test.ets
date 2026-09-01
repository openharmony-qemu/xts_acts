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
 * @file CollectionsMapClearSize.test.ets
 * @description collections.Map clear and size methods unit test cases covering
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

export default function CollectionsMapClearSizeTest() {
  describe('CollectionsMapClearSizeTest', () => {

    beforeAll(() => { console.info('[CollectionsMapClearSizeTest] beforeAll'); });
    beforeEach(async () => {
      await sleep(20);
      console.info('[CollectionsMapClearSizeTest] beforeEach');
    });
    afterEach(() => { console.info('[CollectionsMapClearSizeTest] afterEach'); });
    afterAll(() => { console.info('[CollectionsMapClearSizeTest] afterAll'); });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_SIZE_0100
     * @tc.name    testCollectionsMapClearSize0001
     * @tc.desc    Verify clear removes normal number key-value pairs and size is correct
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapClearSize0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapClearSize0001';
      console.info(caseName + ', test start');
      let map: collections.Map<number, number> = new collections.Map<number, number>();
      map.set(100, 100).set(200, 200);
      expect(map.size).assertEqual(2);
      map.clear();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_SIZE_0200
     * @tc.name    testCollectionsMapClearSize0002
     * @tc.desc    Verify size returns correct count after clear for normal number
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapClearSize0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapClearSize0002';
      console.info(caseName + ', test start');
      let map: collections.Map<number, number> = new collections.Map<number, number>();
      map.set(100, 100).set(200, 200);
      map.clear();
      expect(map.size).assertEqual(0);
      map.set(300, 300);
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_SIZE_0300
     * @tc.name    testCollectionsMapClearSize0003
     * @tc.desc    Verify clear removes scientific notation number pairs
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapClearSize0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapClearSize0003';
      console.info(caseName + ', test start');
      let map: collections.Map<number, number> = new collections.Map<number, number>();
      let val1: number = 1.5e-10, val2: number = 2.5e-10;
      map.set(val1, val1).set(val2, val2);
      expect(map.size).assertEqual(2);
      map.clear();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_SIZE_0400
     * @tc.name    testCollectionsMapClearSize0004
     * @tc.desc    Verify size is correct after clear for scientific notation number
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapClearSize0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapClearSize0004';
      console.info(caseName + ', test start');
      let map: collections.Map<number, number> = new collections.Map<number, number>();
      let val1: number = 1.5e-10;
      map.set(val1, val1);
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_SIZE_0500
     * @tc.name    testCollectionsMapClearSize0005
     * @tc.desc    Verify clear removes MAX_SAFE_INTEGER correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapClearSize0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapClearSize0005';
      console.info(caseName + ', test start');
      let map: collections.Map<number, number> = new collections.Map<number, number>();
      let maxInt: number = Number.MAX_SAFE_INTEGER;
      map.set(maxInt, maxInt);
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_SIZE_0600
     * @tc.name    testCollectionsMapClearSize0006
     * @tc.desc    Verify size is correct after clear for MAX_SAFE_INTEGER
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapClearSize0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapClearSize0006';
      console.info(caseName + ', test start');
      let map: collections.Map<number, number> = new collections.Map<number, number>();
      let maxInt: number = Number.MAX_SAFE_INTEGER;
      map.set(maxInt, maxInt);
      map.clear();
      expect(map.size).assertEqual(0);
      map.set(maxInt - 1, maxInt - 1);
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_SIZE_0700
     * @tc.name    testCollectionsMapClearSize0007
     * @tc.desc    Verify clear removes NaN correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapClearSize0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapClearSize0007';
      console.info(caseName + ', test start');
      let map: collections.Map<number, number> = new collections.Map<number, number>();
      map.set(NaN, NaN);
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_SIZE_0800
     * @tc.name    testCollectionsMapClearSize0008
     * @tc.desc    Verify size is correct after clear for NaN
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapClearSize0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapClearSize0008';
      console.info(caseName + ', test start');
      let map: collections.Map<number, number> = new collections.Map<number, number>();
      map.set(NaN, NaN);
      map.clear();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_SIZE_0900
     * @tc.name    testCollectionsMapClearSize0009
     * @tc.desc    Verify clear removes normal string key-value pairs
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapClearSize0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapClearSize0009';
      console.info(caseName + ', test start');
      let map: collections.Map<string, string> = new collections.Map<string, string>();
      map.set("key1", "value1").set("key2", "value2");
      expect(map.size).assertEqual(2);
      map.clear();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_SIZE_1000
     * @tc.name    testCollectionsMapClearSize0010
     * @tc.desc    Verify size is correct after clear for normal string
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapClearSize0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapClearSize0010';
      console.info(caseName + ', test start');
      let map: collections.Map<string, string> = new collections.Map<string, string>();
      map.set("key1", "value1").set("key2", "value2");
      map.clear();
      expect(map.size).assertEqual(0);
      map.set("key3", "value3");
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_SIZE_1100
     * @tc.name    testCollectionsMapClearSize0011
     * @tc.desc    Verify clear removes special character string correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapClearSize0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapClearSize0011';
      console.info(caseName + ', test start');
      let map: collections.Map<string, string> = new collections.Map<string, string>();
      let str: string = "key!@#";
      map.set(str, str);
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_SIZE_1200
     * @tc.name    testCollectionsMapClearSize0012
     * @tc.desc    Verify size is correct after clear for special character string
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapClearSize0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapClearSize0012';
      console.info(caseName + ', test start');
      let map: collections.Map<string, string> = new collections.Map<string, string>();
      let str: string = "key!@#";
      map.set(str, str);
      map.clear();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_SIZE_1300
     * @tc.name    testCollectionsMapClearSize0013
     * @tc.desc    Verify clear removes emoji string correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapClearSize0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapClearSize0013';
      console.info(caseName + ', test start');
      let map: collections.Map<string, string> = new collections.Map<string, string>();
      let str: string = "😀🎉🔥";
      map.set(str, str);
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_SIZE_1400
     * @tc.name    testCollectionsMapClearSize0014
     * @tc.desc    Verify size is correct after clear for emoji string
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapClearSize0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapClearSize0014';
      console.info(caseName + ', test start');
      let map: collections.Map<string, string> = new collections.Map<string, string>();
      let str: string = "😀🎉🔥";
      map.set(str, str);
      map.clear();
      expect(map.size).assertEqual(0);
      map.set("newKey", "newValue");
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_SIZE_1500
     * @tc.name    testCollectionsMapClearSize0015
     * @tc.desc    Verify clear removes empty string correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapClearSize0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapClearSize0015';
      console.info(caseName + ', test start');
      let map: collections.Map<string, string> = new collections.Map<string, string>();
      map.set("", "emptyValue");
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_SIZE_1600
     * @tc.name    testCollectionsMapClearSize0016
     * @tc.desc    Verify size is correct after clear for empty string
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapClearSize0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapClearSize0016';
      console.info(caseName + ', test start');
      let map: collections.Map<string, string> = new collections.Map<string, string>();
      map.set("", "emptyValue");
      map.clear();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_SIZE_1700
     * @tc.name    testCollectionsMapClearSize0017
     * @tc.desc    Verify clear removes boolean true correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapClearSize0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapClearSize0017';
      console.info(caseName + ', test start');
      let map: collections.Map<boolean, string> = new collections.Map<boolean, string>();
      map.set(true, "trueValue").set(false, "falseValue");
      expect(map.size).assertEqual(2);
      map.clear();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_SIZE_1800
     * @tc.name    testCollectionsMapClearSize0018
     * @tc.desc    Verify size is correct after clear for boolean
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapClearSize0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapClearSize0018';
      console.info(caseName + ', test start');
      let map: collections.Map<boolean, string> = new collections.Map<boolean, string>();
      map.set(true, "trueValue");
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      map.set(false, "falseValue");
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_SIZE_1900
     * @tc.name    testCollectionsMapClearSize0019
     * @tc.desc    Verify clear removes undefined correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapClearSize0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapClearSize0019';
      console.info(caseName + ', test start');
      let map: collections.Map<undefined, string> = new collections.Map<undefined, string>();
      map.set(undefined, "undefinedValue");
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_SIZE_2000
     * @tc.name    testCollectionsMapClearSize0020
     * @tc.desc    Verify size is correct after clear for undefined
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapClearSize0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapClearSize0020';
      console.info(caseName + ', test start');
      let map: collections.Map<undefined, string> = new collections.Map<undefined, string>();
      map.set(undefined, "undefinedValue");
      map.clear();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_SIZE_2100
     * @tc.name    testCollectionsMapClearSize0021
     * @tc.desc    Verify clear removes null correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapClearSize0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapClearSize0021';
      console.info(caseName + ', test start');
      let map: collections.Map<null, string> = new collections.Map<null, string>();
      map.set(null, "nullValue");
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_SIZE_2200
     * @tc.name    testCollectionsMapClearSize0022
     * @tc.desc    Verify size is correct after clear for null
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapClearSize0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapClearSize0022';
      console.info(caseName + ', test start');
      let map: collections.Map<null, string> = new collections.Map<null, string>();
      map.set(null, "nullValue");
      map.clear();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_SIZE_2300
     * @tc.name    testCollectionsMapClearSize0023
     * @tc.desc    Verify clear removes Sendable object correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapClearSize0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapClearSize0023';
      console.info(caseName + ', test start');
      let map: collections.Map<TestPerson, string> = new collections.Map<TestPerson, string>();
      let obj: TestPerson = new TestPerson("test", 20);
      map.set(obj, "personValue");
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_SIZE_2400
     * @tc.name    testCollectionsMapClearSize0024
     * @tc.desc    Verify size is correct after clear for Sendable object
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapClearSize0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapClearSize0024';
      console.info(caseName + ', test start');
      let map: collections.Map<TestPerson, string> = new collections.Map<TestPerson, string>();
      let obj: TestPerson = new TestPerson("test", 20);
      map.set(obj, "personValue");
      map.clear();
      expect(map.size).assertEqual(0);
      let obj2: TestPerson = new TestPerson("test2", 30);
      map.set(obj2, "personValue2");
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_SIZE_2500
     * @tc.name    testCollectionsMapClearSize0025
     * @tc.desc    Verify clear removes empty Sendable object correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapClearSize0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapClearSize0025';
      console.info(caseName + ', test start');
      let map: collections.Map<EmptyClass, string> = new collections.Map<EmptyClass, string>();
      let obj: EmptyClass = new EmptyClass();
      map.set(obj, "emptyValue");
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_SIZE_2600
     * @tc.name    testCollectionsMapClearSize0026
     * @tc.desc    Verify size is correct after clear for empty Sendable object
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapClearSize0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapClearSize0026';
      console.info(caseName + ', test start');
      let map: collections.Map<EmptyClass, string> = new collections.Map<EmptyClass, string>();
      let obj: EmptyClass = new EmptyClass();
      map.set(obj, "emptyValue");
      map.clear();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_SIZE_2700
     * @tc.name    testCollectionsMapClearSize0027
     * @tc.desc    Verify clear removes ComplexIndexSignature object correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapClearSize0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapClearSize0027';
      console.info(caseName + ', test start');
      let map: collections.Map<ComplexIndexSignature, string> = new collections.Map<ComplexIndexSignature, string>();
      let obj: ComplexIndexSignature = new ComplexIndexSignature();
      map.set(obj, "complexValue");
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_SIZE_2800
     * @tc.name    testCollectionsMapClearSize0028
     * @tc.desc    Verify size is correct after clear for ComplexIndexSignature object
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapClearSize0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapClearSize0028';
      console.info(caseName + ', test start');
      let map: collections.Map<ComplexIndexSignature, string> = new collections.Map<ComplexIndexSignature, string>();
      let obj: ComplexIndexSignature = new ComplexIndexSignature();
      map.set(obj, "complexValue");
      map.clear();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_SIZE_2900
     * @tc.name    testCollectionsMapClearSize0029
     * @tc.desc    Verify clear removes collections.Array correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapClearSize0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapClearSize0029';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Array<number>> = new collections.Map<string, collections.Array<number>>();
      let arr: collections.Array<number> = new collections.Array<number>();
      arr.push(1); arr.push(2); arr.push(3);
      map.set("arrayKey", arr);
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_SIZE_3000
     * @tc.name    testCollectionsMapClearSize0030
     * @tc.desc    Verify size is correct after clear for collections.Array
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapClearSize0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapClearSize0030';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Array<number>> = new collections.Map<string, collections.Array<number>>();
      let arr: collections.Array<number> = new collections.Array<number>();
      arr.push(1); arr.push(2); arr.push(3);
      map.set("arrayKey", arr);
      map.clear();
      expect(map.size).assertEqual(0);
      let arr2: collections.Array<number> = new collections.Array<number>();
      arr2.push(4); arr2.push(5);
      map.set("arrayKey2", arr2);
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_SIZE_3100
     * @tc.name    testCollectionsMapClearSize0031
     * @tc.desc    Verify clear removes empty collections.Array correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapClearSize0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapClearSize0031';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Array<number>> = new collections.Map<string, collections.Array<number>>();
      let arr: collections.Array<number> = new collections.Array<number>();
      map.set("emptyArrayKey", arr);
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_SIZE_3200
     * @tc.name    testCollectionsMapClearSize0032
     * @tc.desc    Verify size is correct after clear for empty collections.Array
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapClearSize0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapClearSize0032';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Array<number>> = new collections.Map<string, collections.Array<number>>();
      let arr: collections.Array<number> = new collections.Array<number>();
      map.set("emptyArrayKey", arr);
      map.clear();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_SIZE_3300
     * @tc.name    testCollectionsMapClearSize0033
     * @tc.desc    Verify clear removes sparse array correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapClearSize0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapClearSize0033';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Array<number | null>> = new collections.Map<string, collections.Array<number | null>>();
      let arr: collections.Array<number | null> = new collections.Array<number | null>();
      arr.push(1);
      arr.push(null);
      arr.push(2);
      map.set("sparseKey", arr);
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_SIZE_3400
     * @tc.name    testCollectionsMapClearSize0034
     * @tc.desc    Verify size is correct after clear for sparse array
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapClearSize0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapClearSize0034';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Array<number | null>> = new collections.Map<string, collections.Array<number | null>>();
      let arr: collections.Array<number | null> = new collections.Array<number | null>();
      arr.push(1);
      arr.push(null);
      arr.push(2);
      map.set("sparseKey", arr);
      map.clear();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_SIZE_3500
     * @tc.name    testCollectionsMapClearSize0035
     * @tc.desc    Verify clear removes SendableNormalFn correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapClearSize0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapClearSize0035';
      console.info(caseName + ', test start');
      let map: collections.Map<string, SendableNormalFn> = new collections.Map<string, SendableNormalFn>();
      let fn: SendableNormalFn = new SendableNormalFn();
      map.set("fnKey", fn);
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_SIZE_3600
     * @tc.name    testCollectionsMapClearSize0036
     * @tc.desc    Verify size is correct after clear for SendableNormalFn
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapClearSize0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapClearSize0036';
      console.info(caseName + ', test start');
      let map: collections.Map<string, SendableNormalFn> = new collections.Map<string, SendableNormalFn>();
      let fn: SendableNormalFn = new SendableNormalFn();
      map.set("fnKey", fn);
      map.clear();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_SIZE_3700
     * @tc.name    testCollectionsMapClearSize0037
     * @tc.desc    Verify clear removes SendableArrowFn correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapClearSize0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapClearSize0037';
      console.info(caseName + ', test start');
      let map: collections.Map<string, SendableArrowFn> = new collections.Map<string, SendableArrowFn>();
      let fn: SendableArrowFn = new SendableArrowFn();
      map.set("arrowKey", fn);
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_SIZE_3800
     * @tc.name    testCollectionsMapClearSize0038
     * @tc.desc    Verify size is correct after clear for SendableArrowFn
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapClearSize0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapClearSize0038';
      console.info(caseName + ', test start');
      let map: collections.Map<string, SendableArrowFn> = new collections.Map<string, SendableArrowFn>();
      let fn: SendableArrowFn = new SendableArrowFn();
      map.set("arrowKey", fn);
      map.clear();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_SIZE_3900
     * @tc.name    testCollectionsMapClearSize0039
     * @tc.desc    Verify clear removes SendableAsyncFn correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapClearSize0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapClearSize0039';
      console.info(caseName + ', test start');
      let map: collections.Map<string, SendableAsyncFn> = new collections.Map<string, SendableAsyncFn>();
      let fn: SendableAsyncFn = new SendableAsyncFn();
      map.set("asyncKey", fn);
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_SIZE_4000
     * @tc.name    testCollectionsMapClearSize0040
     * @tc.desc    Verify size is correct after clear for SendableAsyncFn
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapClearSize0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapClearSize0040';
      console.info(caseName + ', test start');
      let map: collections.Map<string, SendableAsyncFn> = new collections.Map<string, SendableAsyncFn>();
      let fn: SendableAsyncFn = new SendableAsyncFn();
      map.set("asyncKey", fn);
      map.clear();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_SIZE_4100
     * @tc.name    testCollectionsMapClearSize0041
     * @tc.desc    Verify clear removes SendableClassBasic correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapClearSize0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapClearSize0041';
      console.info(caseName + ', test start');
      let map: collections.Map<SendableClassBasic, string> = new collections.Map<SendableClassBasic, string>();
      let instance: SendableClassBasic = new SendableClassBasic();
      map.set(instance, "basicValue");
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_SIZE_4200
     * @tc.name    testCollectionsMapClearSize0042
     * @tc.desc    Verify size is correct after clear for SendableClassBasic
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapClearSize0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapClearSize0042';
      console.info(caseName + ', test start');
      let map: collections.Map<SendableClassBasic, string> = new collections.Map<SendableClassBasic, string>();
      let instance: SendableClassBasic = new SendableClassBasic();
      map.set(instance, "basicValue");
      map.clear();
      expect(map.size).assertEqual(0);
      let instance2: SendableClassBasic = new SendableClassBasic();
      map.set(instance2, "basicValue2");
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_SIZE_4300
     * @tc.name    testCollectionsMapClearSize0043
     * @tc.desc    Verify clear removes SendableClassComplex correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapClearSize0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapClearSize0043';
      console.info(caseName + ', test start');
      let map: collections.Map<SendableClassComplex, string> = new collections.Map<SendableClassComplex, string>();
      let instance: SendableClassComplex = new SendableClassComplex();
      map.set(instance, "complexValue");
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_SIZE_4400
     * @tc.name    testCollectionsMapClearSize0044
     * @tc.desc    Verify size is correct after clear for SendableClassComplex
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapClearSize0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapClearSize0044';
      console.info(caseName + ', test start');
      let map: collections.Map<SendableClassComplex, string> = new collections.Map<SendableClassComplex, string>();
      let instance: SendableClassComplex = new SendableClassComplex();
      map.set(instance, "complexValue");
      map.clear();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_SIZE_4500
     * @tc.name    testCollectionsMapClearSize0045
     * @tc.desc    Verify clear removes SendableClassExtended correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapClearSize0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapClearSize0045';
      console.info(caseName + ', test start');
      let map: collections.Map<SendableClassExtended, string> = new collections.Map<SendableClassExtended, string>();
      let instance: SendableClassExtended = new SendableClassExtended();
      map.set(instance, "extendedValue");
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_SIZE_4600
     * @tc.name    testCollectionsMapClearSize0046
     * @tc.desc    Verify size is correct after clear for SendableClassExtended
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapClearSize0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapClearSize0046';
      console.info(caseName + ', test start');
      let map: collections.Map<SendableClassExtended, string> = new collections.Map<SendableClassExtended, string>();
      let instance: SendableClassExtended = new SendableClassExtended();
      map.set(instance, "extendedValue");
      map.clear();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_SIZE_4700
     * @tc.name    testCollectionsMapClearSize0047
     * @tc.desc    Verify clear removes SendableAddFn correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapClearSize0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapClearSize0047';
      console.info(caseName + ', test start');
      let map: collections.Map<string, SendableAddFn> = new collections.Map<string, SendableAddFn>();
      let fn: SendableAddFn = new SendableAddFn();
      map.set("sendableFnKey", fn);
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_SIZE_4800
     * @tc.name    testCollectionsMapClearSize0048
     * @tc.desc    Verify size is correct after clear for SendableAddFn
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapClearSize0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapClearSize0048';
      console.info(caseName + ', test start');
      let map: collections.Map<string, SendableAddFn> = new collections.Map<string, SendableAddFn>();
      let fn: SendableAddFn = new SendableAddFn();
      map.set("sendableFnKey", fn);
      map.clear();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_SIZE_4900
     * @tc.name    testCollectionsMapClearSize0049
     * @tc.desc    Verify clear removes const enum correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapClearSize0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapClearSize0049';
      console.info(caseName + ', test start');
      let map: collections.Map<SendableEnum, string> = new collections.Map<SendableEnum, string>();
      map.set(SendableEnum.Success, "successValue");
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_SIZE_5000
     * @tc.name    testCollectionsMapClearSize0050
     * @tc.desc    Verify size is correct after clear for const enum
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapClearSize0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapClearSize0050';
      console.info(caseName + ', test start');
      let map: collections.Map<SendableEnum, string> = new collections.Map<SendableEnum, string>();
      map.set(SendableEnum.Success, "successValue");
      map.clear();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_SIZE_5100
     * @tc.name    testCollectionsMapClearSize0051
     * @tc.desc    Verify clear removes AsyncLock correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapClearSize0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapClearSize0051';
      console.info(caseName + ', test start');
      let lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
      let map: collections.Map<string, ArkTSUtils.locks.AsyncLock> = new collections.Map<string, ArkTSUtils.locks.AsyncLock>();
      map.set("lockKey", lock);
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_SIZE_5200
     * @tc.name    testCollectionsMapClearSize0052
     * @tc.desc    Verify size is correct after clear for AsyncLock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapClearSize0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapClearSize0052';
      console.info(caseName + ', test start');
      let lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
      let map: collections.Map<string, ArkTSUtils.locks.AsyncLock> = new collections.Map<string, ArkTSUtils.locks.AsyncLock>();
      map.set("lockKey", lock);
      map.clear();
      expect(map.size).assertEqual(0);
      let lock2: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
      map.set("lockKey2", lock2);
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_SIZE_5300
     * @tc.name    testCollectionsMapClearSize0053
     * @tc.desc    Verify clear removes ConditionVariable correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapClearSize0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapClearSize0053';
      console.info(caseName + ', test start');
      let cv: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
      let map: collections.Map<string, ArkTSUtils.locks.ConditionVariable> = new collections.Map<string, ArkTSUtils.locks.ConditionVariable>();
      map.set("cvKey", cv);
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_SIZE_5400
     * @tc.name    testCollectionsMapClearSize0054
     * @tc.desc    Verify size is correct after clear for ConditionVariable
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapClearSize0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapClearSize0054';
      console.info(caseName + ', test start');
      let cv: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
      let map: collections.Map<string, ArkTSUtils.locks.ConditionVariable> = new collections.Map<string, ArkTSUtils.locks.ConditionVariable>();
      map.set("cvKey", cv);
      map.clear();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_SIZE_5500
     * @tc.name    testCollectionsMapClearSize0055
     * @tc.desc    Verify clear removes SendableLruCache correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapClearSize0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapClearSize0055';
      console.info(caseName + ', test start');
      let cache: ArkTSUtils.SendableLruCache<number, string> = new ArkTSUtils.SendableLruCache<number, string>();
      cache.put(1, "value1");
      let map: collections.Map<string, ArkTSUtils.SendableLruCache<number, string>> = new collections.Map<string, ArkTSUtils.SendableLruCache<number, string>>();
      map.set("cacheKey", cache);
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_SIZE_5600
     * @tc.name    testCollectionsMapClearSize0056
     * @tc.desc    Verify size is correct after clear for SendableLruCache
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapClearSize0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapClearSize0056';
      console.info(caseName + ', test start');
      let cache: ArkTSUtils.SendableLruCache<number, string> = new ArkTSUtils.SendableLruCache<number, string>();
      cache.put(1, "value1");
      let map: collections.Map<string, ArkTSUtils.SendableLruCache<number, string>> = new collections.Map<string, ArkTSUtils.SendableLruCache<number, string>>();
      map.set("cacheKey", cache);
      map.clear();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_SIZE_5700
     * @tc.name    testCollectionsMapClearSize0057
     * @tc.desc    Verify clear removes nested collections.Map correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapClearSize0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapClearSize0057';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Map<number, string>> = new collections.Map<string, collections.Map<number, string>>();
      let nestedMap: collections.Map<number, string> = new collections.Map<number, string>();
      nestedMap.set(1, "one").set(2, "two");
      map.set("nestedKey", nestedMap);
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_SIZE_5800
     * @tc.name    testCollectionsMapClearSize0058
     * @tc.desc    Verify size is correct after clear for nested collections.Map
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapClearSize0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapClearSize0058';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Map<number, string>> = new collections.Map<string, collections.Map<number, string>>();
      let nestedMap: collections.Map<number, string> = new collections.Map<number, string>();
      nestedMap.set(1, "one").set(2, "two");
      map.set("nestedKey", nestedMap);
      map.clear();
      expect(map.size).assertEqual(0);
      let nestedMap2: collections.Map<number, string> = new collections.Map<number, string>();
      nestedMap2.set(3, "three");
      map.set("nestedKey2", nestedMap2);
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_SIZE_5900
     * @tc.name    testCollectionsMapClearSize0059
     * @tc.desc    Verify clear removes nested collections.Set correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapClearSize0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapClearSize0059';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Set<number>> = new collections.Map<string, collections.Set<number>>();
      let nestedSet: collections.Set<number> = new collections.Set<number>();
      nestedSet.add(1).add(2);
      map.set("nestedSetKey", nestedSet);
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_SIZE_6000
     * @tc.name    testCollectionsMapClearSize0060
     * @tc.desc    Verify size is correct after clear for nested collections.Set
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapClearSize0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapClearSize0060';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Set<number>> = new collections.Map<string, collections.Set<number>>();
      let nestedSet: collections.Set<number> = new collections.Set<number>();
      nestedSet.add(1).add(2);
      map.set("nestedSetKey", nestedSet);
      map.clear();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_SIZE_6100
     * @tc.name    testCollectionsMapClearSize0061
     * @tc.desc    Verify clear removes nested collections.Array correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapClearSize0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapClearSize0061';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Array<number>> = new collections.Map<string, collections.Array<number>>();
      let nestedArray: collections.Array<number> = new collections.Array<number>();
      nestedArray.push(1); nestedArray.push(2);
      map.set("nestedArrayKey", nestedArray);
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_SIZE_6200
     * @tc.name    testCollectionsMapClearSize0062
     * @tc.desc    Verify size is correct after clear for nested collections.Array
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapClearSize0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapClearSize0062';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Array<number>> = new collections.Map<string, collections.Array<number>>();
      let nestedArray: collections.Array<number> = new collections.Array<number>();
      nestedArray.push(1); nestedArray.push(2);
      map.set("nestedArrayKey", nestedArray);
      map.clear();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_SIZE_6300
     * @tc.name    testCollectionsMapClearSize0063
     * @tc.desc    Verify clear removes large object correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapClearSize0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapClearSize0063';
      console.info(caseName + ', test start');
      let map: collections.Map<string, LargeObject> = new collections.Map<string, LargeObject>();
      let obj: LargeObject = new LargeObject();
      map.set("largeKey", obj);
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_SIZE_6400
     * @tc.name    testCollectionsMapClearSize0064
     * @tc.desc    Verify size is correct after clear for large object
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapClearSize0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapClearSize0064';
      console.info(caseName + ', test start');
      let map: collections.Map<string, LargeObject> = new collections.Map<string, LargeObject>();
      let obj: LargeObject = new LargeObject();
      map.set("largeKey", obj);
      map.clear();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_SIZE_6500
     * @tc.name    testCollectionsMapClearSize0065
     * @tc.desc    Verify clear removes large array correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapClearSize0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapClearSize0065';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Array<number>> = new collections.Map<string, collections.Array<number>>();
      let arr: collections.Array<number> = new collections.Array<number>();
      for (let i: number = 0; i < 10000; i++) arr.push(i);
      map.set("largeArrayKey", arr);
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_SIZE_6600
     * @tc.name    testCollectionsMapClearSize0066
     * @tc.desc    Verify size is correct after clear for large array
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapClearSize0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapClearSize0066';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Array<number>> = new collections.Map<string, collections.Array<number>>();
      let arr: collections.Array<number> = new collections.Array<number>();
      for (let i: number = 0; i < 10000; i++) arr.push(i);
      map.set("largeArrayKey", arr);
      map.clear();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_SIZE_6700
     * @tc.name    testCollectionsMapClearSize0067
     * @tc.desc    Verify clear removes deeply nested object correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapClearSize0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapClearSize0067';
      console.info(caseName + ', test start');
      let map: collections.Map<string, DeepNestedObject> = new collections.Map<string, DeepNestedObject>();
      let root: DeepNestedObject = new DeepNestedObject("level0");
      let current: DeepNestedObject = root;
      for (let i: number = 1; i < 10; i++) { let next: DeepNestedObject = new DeepNestedObject("level" + i); current.next = next; current = next; }
      map.set("deepKey", root);
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_SIZE_6800
     * @tc.name    testCollectionsMapClearSize0068
     * @tc.desc    Verify size is correct after clear for deeply nested object
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapClearSize0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapClearSize0068';
      console.info(caseName + ', test start');
      let map: collections.Map<string, DeepNestedObject> = new collections.Map<string, DeepNestedObject>();
      let root: DeepNestedObject = new DeepNestedObject("level0");
      let current: DeepNestedObject = root;
      for (let i: number = 1; i < 10; i++) { let next: DeepNestedObject = new DeepNestedObject("level" + i); current.next = next; current = next; }
      map.set("deepKey", root);
      map.clear();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_SIZE_6900
     * @tc.name    testCollectionsMapClearSize0069
     * @tc.desc    Verify clear removes circular reference object correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapClearSize0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapClearSize0069';
      console.info(caseName + ', test start');
      let map: collections.Map<string, CircularRef> = new collections.Map<string, CircularRef>();
      let obj: CircularRef = new CircularRef("parent");
      obj.ref = new CircularRef("child");
      obj.ref.ref = obj;
      map.set("circularKey", obj);
      expect(map.size).assertEqual(1);
      map.clear();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_SIZE_7000
     * @tc.name    testCollectionsMapClearSize0070
     * @tc.desc    Verify size is correct after clear for circular reference object
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapClearSize0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapClearSize0070';
      console.info(caseName + ', test start');
      let map: collections.Map<string, CircularRef> = new collections.Map<string, CircularRef>();
      let obj: CircularRef = new CircularRef("parent");
      obj.ref = new CircularRef("child");
      obj.ref.ref = obj;
      map.set("circularKey", obj);
      map.clear();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_SIZE_7100
     * @tc.name    testCollectionsMapClearSize0071
     * @tc.desc    Verify clear on empty map does nothing
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapClearSize0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapClearSize0071';
      console.info(caseName + ', test start');
      let map: collections.Map<string, number> = new collections.Map<string, number>();
      map.clear();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CLEAR_SIZE_7200
     * @tc.name    testCollectionsMapClearSize0072
     * @tc.desc    Verify clear after multiple operations works correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapClearSize0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapClearSize0072';
      console.info(caseName + ', test start');
      let map: collections.Map<number, number> = new collections.Map<number, number>();
      map.set(1, 1).set(2, 2);
      map.delete(1);
      map.set(3, 3);
      expect(map.size).assertEqual(2);
      map.clear();
      expect(map.size).assertEqual(0);
      map.set(4, 4);
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

  });
}