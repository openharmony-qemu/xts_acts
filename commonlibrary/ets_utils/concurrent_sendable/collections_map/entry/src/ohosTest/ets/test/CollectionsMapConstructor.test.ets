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
 * @file CollectionsMapConstructor.test.ets
 * @description collections.Map constructor unit test cases covering entries array
 *              and iterable object construction with all 36 test value types
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

function entries<K, V>(...pairs: Array<[K, V]>): Array<[K, V]> { return pairs; }

export default function CollectionsMapConstructorTest() {
  describe('CollectionsMapConstructorTest', () => {

    beforeAll(() => { console.info('[CollectionsMapConstructorTest] beforeAll'); });
    beforeEach(async () => {
      await sleep(20);
      console.info('[CollectionsMapConstructorTest] beforeEach');
    });
    afterEach(() => { console.info('[CollectionsMapConstructorTest] afterEach'); });
    afterAll(() => { console.info('[CollectionsMapConstructorTest] afterAll'); });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_0100
     * @tc.name    testCollectionsMapConstructor0001
     * @tc.desc    Verify constructor with entries array stores normal number correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapConstructor0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapConstructor0001';
      console.info(caseName + ', test start');
      let map: collections.Map<number, number> = new collections.Map<number, number>(
        entries<number, number>([100, 100])
      );
      expect(map.size).assertEqual(1);
      expect(map.get(100)).assertEqual(100);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_0200
     * @tc.name    testCollectionsMapConstructor0002
     * @tc.desc    Verify constructor with iterable stores normal number correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapConstructor0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapConstructor0002';
      console.info(caseName + ', test start');
      let iterable: Array<[number, number]> = [[100, 100]];
      let map: collections.Map<number, number> = new collections.Map<number, number>(iterable);
      expect(map.size).assertEqual(1);
      expect(map.get(100)).assertEqual(100);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_0300
     * @tc.name    testCollectionsMapConstructor0003
     * @tc.desc    Verify constructor with entries array stores scientific notation number correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapConstructor0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapConstructor0003';
      console.info(caseName + ', test start');
      let value: number = 1.5e-10;
      let map: collections.Map<number, number> = new collections.Map<number, number>(
        entries<number, number>([value, value])
      );
      expect(map.size).assertEqual(1);
      expect(map.get(value)).assertEqual(value);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_0400
     * @tc.name    testCollectionsMapConstructor0004
     * @tc.desc    Verify constructor with iterable stores scientific notation number correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapConstructor0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapConstructor0004';
      console.info(caseName + ', test start');
      let value: number = 1.5e-10;
      let iterable: Array<[number, number]> = [[value, value]];
      let map: collections.Map<number, number> = new collections.Map<number, number>(iterable);
      expect(map.size).assertEqual(1);
      expect(map.get(value)).assertEqual(value);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_0500
     * @tc.name    testCollectionsMapConstructor0005
     * @tc.desc    Verify constructor with entries array stores MAX_SAFE_INTEGER correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapConstructor0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapConstructor0005';
      console.info(caseName + ', test start');
      let maxInt: number = Number.MAX_SAFE_INTEGER;
      let map: collections.Map<number, number> = new collections.Map<number, number>(
        entries<number, number>([maxInt, maxInt])
      );
      expect(map.size).assertEqual(1);
      expect(map.get(maxInt)).assertEqual(maxInt);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_0600
     * @tc.name    testCollectionsMapConstructor0006
     * @tc.desc    Verify constructor with iterable stores MAX_SAFE_INTEGER correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapConstructor0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapConstructor0006';
      console.info(caseName + ', test start');
      let maxInt: number = Number.MAX_SAFE_INTEGER;
      let iterable: Array<[number, number]> = [[maxInt, maxInt]];
      let map: collections.Map<number, number> = new collections.Map<number, number>(iterable);
      expect(map.size).assertEqual(1);
      expect(map.get(maxInt)).assertEqual(maxInt);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_0700
     * @tc.name    testCollectionsMapConstructor0007
     * @tc.desc    Verify constructor with entries array stores NaN correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapConstructor0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapConstructor0007';
      console.info(caseName + ', test start');
      let map: collections.Map<number, number> = new collections.Map<number, number>(
        entries<number, number>([NaN, NaN])
      );
      expect(map.size).assertEqual(1);
      let value: number | undefined = map.get(NaN);
      expect(value !== undefined).assertTrue();
      if (value !== undefined) { expect(isNaN(value)).assertTrue(); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_0800
     * @tc.name    testCollectionsMapConstructor0008
     * @tc.desc    Verify constructor with iterable stores NaN correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapConstructor0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapConstructor0008';
      console.info(caseName + ', test start');
      let iterable: Array<[number, number]> = [[NaN, NaN]];
      let map: collections.Map<number, number> = new collections.Map<number, number>(iterable);
      expect(map.size).assertEqual(1);
      let value: number | undefined = map.get(NaN);
      expect(value !== undefined).assertTrue();
      if (value !== undefined) { expect(isNaN(value)).assertTrue(); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_0900
     * @tc.name    testCollectionsMapConstructor0009
     * @tc.desc    Verify constructor with entries array stores normal string correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapConstructor0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapConstructor0009';
      console.info(caseName + ', test start');
      let str: string = "test测试123";
      let map: collections.Map<string, string> = new collections.Map<string, string>(
        entries<string, string>([str, str])
      );
      expect(map.size).assertEqual(1);
      expect(map.get(str)).assertEqual(str);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_1000
     * @tc.name    testCollectionsMapConstructor0010
     * @tc.desc    Verify constructor with iterable stores normal string correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapConstructor0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapConstructor0010';
      console.info(caseName + ', test start');
      let str: string = "test测试123";
      let iterable: Array<[string, string]> = [[str, str]];
      let map: collections.Map<string, string> = new collections.Map<string, string>(iterable);
      expect(map.size).assertEqual(1);
      expect(map.get(str)).assertEqual(str);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_1100
     * @tc.name    testCollectionsMapConstructor0011
     * @tc.desc    Verify constructor with entries array stores special character string correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapConstructor0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapConstructor0011';
      console.info(caseName + ', test start');
      let str: string = "a\n\t\u200B\u0000";
      let map: collections.Map<string, string> = new collections.Map<string, string>(
        entries<string, string>([str, str])
      );
      expect(map.size).assertEqual(1);
      expect(map.get(str)).assertEqual(str);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_1200
     * @tc.name    testCollectionsMapConstructor0012
     * @tc.desc    Verify constructor with iterable stores special character string correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapConstructor0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapConstructor0012';
      console.info(caseName + ', test start');
      let str: string = "a\n\t\u200B\u0000";
      let iterable: Array<[string, string]> = [[str, str]];
      let map: collections.Map<string, string> = new collections.Map<string, string>(iterable);
      expect(map.size).assertEqual(1);
      expect(map.get(str)).assertEqual(str);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_1300
     * @tc.name    testCollectionsMapConstructor0013
     * @tc.desc    Verify constructor with entries array stores emoji string correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapConstructor0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapConstructor0013';
      console.info(caseName + ', test start');
      let str: string = "测试😀🎉🔥";
      let map: collections.Map<string, string> = new collections.Map<string, string>(
        entries<string, string>([str, str])
      );
      expect(map.size).assertEqual(1);
      expect(map.get(str)).assertEqual(str);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_1400
     * @tc.name    testCollectionsMapConstructor0014
     * @tc.desc    Verify constructor with iterable stores emoji string correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapConstructor0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapConstructor0014';
      console.info(caseName + ', test start');
      let str: string = "测试😀🎉🔥";
      let iterable: Array<[string, string]> = [[str, str]];
      let map: collections.Map<string, string> = new collections.Map<string, string>(iterable);
      expect(map.size).assertEqual(1);
      expect(map.get(str)).assertEqual(str);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_1500
     * @tc.name    testCollectionsMapConstructor0015
     * @tc.desc    Verify constructor with entries array stores empty string correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapConstructor0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapConstructor0015';
      console.info(caseName + ', test start');
      let map: collections.Map<string, string> = new collections.Map<string, string>(
        entries<string, string>(["", ""])
      );
      expect(map.size).assertEqual(1);
      expect(map.get("")).assertEqual("");
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_1600
     * @tc.name    testCollectionsMapConstructor0016
     * @tc.desc    Verify constructor with iterable stores empty string correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapConstructor0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapConstructor0016';
      console.info(caseName + ', test start');
      let iterable: Array<[string, string]> = [["", ""]];
      let map: collections.Map<string, string> = new collections.Map<string, string>(iterable);
      expect(map.size).assertEqual(1);
      expect(map.get("")).assertEqual("");
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_1700
     * @tc.name    testCollectionsMapConstructor0017
     * @tc.desc    Verify constructor with entries array stores boolean true correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapConstructor0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapConstructor0017';
      console.info(caseName + ', test start');
      let map: collections.Map<boolean, boolean> = new collections.Map<boolean, boolean>(
        entries<boolean, boolean>([true, true])
      );
      expect(map.size).assertEqual(1);
      expect(map.get(true)).assertEqual(true);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_1800
     * @tc.name    testCollectionsMapConstructor0018
     * @tc.desc    Verify constructor with iterable stores boolean true correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapConstructor0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapConstructor0018';
      console.info(caseName + ', test start');
      let iterable: Array<[boolean, boolean]> = [[true, true]];
      let map: collections.Map<boolean, boolean> = new collections.Map<boolean, boolean>(iterable);
      expect(map.size).assertEqual(1);
      expect(map.get(true)).assertEqual(true);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_1900
     * @tc.name    testCollectionsMapConstructor0019
     * @tc.desc    Verify constructor with entries array stores boolean false correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapConstructor0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapConstructor0019';
      console.info(caseName + ', test start');
      let map: collections.Map<boolean, string> = new collections.Map<boolean, string>(
        entries<boolean, string>([false, "falseValue"])
      );
      expect(map.size).assertEqual(1);
      expect(map.get(false)).assertEqual("falseValue");
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_2000
     * @tc.name    testCollectionsMapConstructor0020
     * @tc.desc    Verify constructor with iterable stores boolean false correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapConstructor0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapConstructor0020';
      console.info(caseName + ', test start');
      let iterable: Array<[boolean, string]> = [[false, "falseValue"]];
      let map: collections.Map<boolean, string> = new collections.Map<boolean, string>(iterable);
      expect(map.size).assertEqual(1);
      expect(map.get(false)).assertEqual("falseValue");
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_2100
     * @tc.name    testCollectionsMapConstructor0021
     * @tc.desc    Verify constructor with entries array stores undefined correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapConstructor0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapConstructor0021';
      console.info(caseName + ', test start');
      let map: collections.Map<undefined, undefined> = new collections.Map<undefined, undefined>(
        entries<undefined, undefined>([undefined, undefined])
      );
      expect(map.size).assertEqual(1);
      expect(map.get(undefined)).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_2200
     * @tc.name    testCollectionsMapConstructor0022
     * @tc.desc    Verify constructor with iterable stores undefined correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapConstructor0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapConstructor0022';
      console.info(caseName + ', test start');
      let iterable: Array<[undefined, undefined]> = [[undefined, undefined]];
      let map: collections.Map<undefined, undefined> = new collections.Map<undefined, undefined>(iterable);
      expect(map.size).assertEqual(1);
      expect(map.get(undefined)).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_2300
     * @tc.name    testCollectionsMapConstructor0023
     * @tc.desc    Verify constructor with entries array stores null correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapConstructor0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapConstructor0023';
      console.info(caseName + ', test start');
      let map: collections.Map<null, null> = new collections.Map<null, null>(
        entries<null, null>([null, null])
      );
      expect(map.size).assertEqual(1);
      expect(map.get(null)).assertEqual(null);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_2400
     * @tc.name    testCollectionsMapConstructor0024
     * @tc.desc    Verify constructor with iterable stores null correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapConstructor0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapConstructor0024';
      console.info(caseName + ', test start');
      let iterable: Array<[null, null]> = [[null, null]];
      let map: collections.Map<null, null> = new collections.Map<null, null>(iterable);
      expect(map.size).assertEqual(1);
      expect(map.get(null)).assertEqual(null);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_2500
     * @tc.name    testCollectionsMapConstructor0025
     * @tc.desc    Verify constructor with entries array stores Sendable object correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapConstructor0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapConstructor0025';
      console.info(caseName + ', test start');
      let obj: TestPerson = new TestPerson("test", 20);
      let map: collections.Map<TestPerson, TestPerson> = new collections.Map<TestPerson, TestPerson>(
        entries<TestPerson, TestPerson>([obj, obj])
      );
      expect(map.size).assertEqual(1);
      let value: TestPerson | undefined = map.get(obj);
      expect(value).assertEqual(obj);
      if (value) { expect(value.name).assertEqual("test"); expect(value.age).assertEqual(20); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_2600
     * @tc.name    testCollectionsMapConstructor0026
     * @tc.desc    Verify constructor with iterable stores Sendable object correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapConstructor0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapConstructor0026';
      console.info(caseName + ', test start');
      let obj: TestPerson = new TestPerson("test", 20);
      let iterable: Array<[TestPerson, TestPerson]> = [[obj, obj]];
      let map: collections.Map<TestPerson, TestPerson> = new collections.Map<TestPerson, TestPerson>(iterable);
      expect(map.size).assertEqual(1);
      let value: TestPerson | undefined = map.get(obj);
      expect(value).assertEqual(obj);
      if (value) { expect(value.name).assertEqual("test"); expect(value.age).assertEqual(20); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_2700
     * @tc.name    testCollectionsMapConstructor0027
     * @tc.desc    Verify constructor with entries array stores empty Sendable object correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapConstructor0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapConstructor0027';
      console.info(caseName + ', test start');
      let obj: EmptyClass = new EmptyClass();
      let map: collections.Map<EmptyClass, EmptyClass> = new collections.Map<EmptyClass, EmptyClass>(
        entries<EmptyClass, EmptyClass>([obj, obj])
      );
      expect(map.size).assertEqual(1);
      expect(map.get(obj)).assertEqual(obj);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_2800
     * @tc.name    testCollectionsMapConstructor0028
     * @tc.desc    Verify constructor with iterable stores empty Sendable object correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapConstructor0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapConstructor0028';
      console.info(caseName + ', test start');
      let obj: EmptyClass = new EmptyClass();
      let iterable: Array<[EmptyClass, EmptyClass]> = [[obj, obj]];
      let map: collections.Map<EmptyClass, EmptyClass> = new collections.Map<EmptyClass, EmptyClass>(iterable);
      expect(map.size).assertEqual(1);
      expect(map.get(obj)).assertEqual(obj);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_2900
     * @tc.name    testCollectionsMapConstructor0029
     * @tc.desc    Verify constructor with entries array stores ComplexIndexSignature object correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapConstructor0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapConstructor0029';
      console.info(caseName + ', test start');
      let obj: ComplexIndexSignature = new ComplexIndexSignature();
      let map: collections.Map<ComplexIndexSignature, ComplexIndexSignature> = new collections.Map<ComplexIndexSignature, ComplexIndexSignature>(
        entries<ComplexIndexSignature, ComplexIndexSignature>([obj, obj])
      );
      expect(map.size).assertEqual(1);
      expect(map.get(obj)).assertEqual(obj);
      if (map.get(obj)) { expect(map.get(obj)!.a).assertEqual(1); expect(map.get(obj)!.b).assertEqual(2); expect(map.get(obj)!.c).assertEqual(3); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_3000
     * @tc.name    testCollectionsMapConstructor0030
     * @tc.desc    Verify constructor with iterable stores ComplexIndexSignature object correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapConstructor0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapConstructor0030';
      console.info(caseName + ', test start');
      let obj: ComplexIndexSignature = new ComplexIndexSignature();
      let iterable: Array<[ComplexIndexSignature, ComplexIndexSignature]> = [[obj, obj]];
      let map: collections.Map<ComplexIndexSignature, ComplexIndexSignature> = new collections.Map<ComplexIndexSignature, ComplexIndexSignature>(iterable);
      expect(map.size).assertEqual(1);
      expect(map.get(obj)).assertEqual(obj);
      if (map.get(obj)) { expect(map.get(obj)!.a).assertEqual(1); expect(map.get(obj)!.b).assertEqual(2); expect(map.get(obj)!.c).assertEqual(3); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_3100
     * @tc.name    testCollectionsMapConstructor0031
     * @tc.desc    Verify constructor with entries array stores collections.Array correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapConstructor0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapConstructor0031';
      console.info(caseName + ', test start');
      let arr: collections.Array<number> = new collections.Array<number>();
      arr.push(1); arr.push(2); arr.push(3);
      let map: collections.Map<string, collections.Array<number>> = new collections.Map<string, collections.Array<number>>(
        entries<string, collections.Array<number>>(["arrayKey", arr])
      );
      expect(map.size).assertEqual(1);
      let value: collections.Array<number> | undefined = map.get("arrayKey");
      expect(value).assertEqual(arr);
      if (value) { expect(value[0]).assertEqual(1); expect(value[1]).assertEqual(2); expect(value[2]).assertEqual(3); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_3200
     * @tc.name    testCollectionsMapConstructor0032
     * @tc.desc    Verify constructor with iterable stores collections.Array correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapConstructor0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapConstructor0032';
      console.info(caseName + ', test start');
      let arr: collections.Array<number> = new collections.Array<number>();
      arr.push(1); arr.push(2); arr.push(3);
      let iterable: Array<[string, collections.Array<number>]> = [["arrayKey", arr]];
      let map: collections.Map<string, collections.Array<number>> = new collections.Map<string, collections.Array<number>>(iterable);
      expect(map.size).assertEqual(1);
      let value: collections.Array<number> | undefined = map.get("arrayKey");
      expect(value).assertEqual(arr);
      if (value) { expect(value[0]).assertEqual(1); expect(value[1]).assertEqual(2); expect(value[2]).assertEqual(3); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_3300
     * @tc.name    testCollectionsMapConstructor0033
     * @tc.desc    Verify constructor with entries array stores empty collections.Array correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapConstructor0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapConstructor0033';
      console.info(caseName + ', test start');
      let arr: collections.Array<number> = new collections.Array<number>();
      let map: collections.Map<string, collections.Array<number>> = new collections.Map<string, collections.Array<number>>(
        entries<string, collections.Array<number>>(["emptyArrayKey", arr])
      );
      expect(map.size).assertEqual(1);
      let value: collections.Array<number> | undefined = map.get("emptyArrayKey");
      expect(value).assertEqual(arr);
      if (value) { expect(value.length).assertEqual(0); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_3400
     * @tc.name    testCollectionsMapConstructor0034
     * @tc.desc    Verify constructor with iterable stores empty collections.Array correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapConstructor0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapConstructor0034';
      console.info(caseName + ', test start');
      let arr: collections.Array<number> = new collections.Array<number>();
      let iterable: Array<[string, collections.Array<number>]> = [["emptyArrayKey", arr]];
      let map: collections.Map<string, collections.Array<number>> = new collections.Map<string, collections.Array<number>>(iterable);
      expect(map.size).assertEqual(1);
      let value: collections.Array<number> | undefined = map.get("emptyArrayKey");
      expect(value).assertEqual(arr);
      if (value) { expect(value.length).assertEqual(0); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_3500
     * @tc.name    testCollectionsMapConstructor0035
     * @tc.desc    Verify constructor with entries array stores sparse array correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapConstructor0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapConstructor0035';
      console.info(caseName + ', test start');
      let arr: collections.Array<number | null> = new collections.Array<number | null>();
      arr.push(1);
      arr.push(null);
      arr.push(2);
      let map: collections.Map<string, collections.Array<number | null>> = new collections.Map<string, collections.Array<number | null>>(
        entries<string, collections.Array<number | null>>(["sparseKey", arr])
      );
      expect(map.size).assertEqual(1);
      let value: collections.Array<number | null> | undefined = map.get("sparseKey");
      expect(value).assertEqual(arr);
      if (value) { expect(value[0]).assertEqual(1); expect(value[1]).assertEqual(null); expect(value[2]).assertEqual(2); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_3600
     * @tc.name    testCollectionsMapConstructor0036
     * @tc.desc    Verify constructor with iterable stores sparse array correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapConstructor0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapConstructor0036';
      console.info(caseName + ', test start');
      let arr: collections.Array<number | null> = new collections.Array<number | null>();
      arr.push(1);
      arr.push(null);
      arr.push(2);
      let iterable: Array<[string, collections.Array<number | null>]> = [["sparseKey", arr]];
      let map: collections.Map<string, collections.Array<number | null>> = new collections.Map<string, collections.Array<number | null>>(iterable);
      expect(map.size).assertEqual(1);
      let value: collections.Array<number | null> | undefined = map.get("sparseKey");
      expect(value).assertEqual(arr);
      if (value) { expect(value[0]).assertEqual(1); expect(value[1]).assertEqual(null); expect(value[2]).assertEqual(2); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_3700
     * @tc.name    testCollectionsMapConstructor0037
     * @tc.desc    Verify constructor with entries array stores SendableNormalFn correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapConstructor0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapConstructor0037';
      console.info(caseName + ', test start');
      let fn: SendableNormalFn = new SendableNormalFn();
      let map: collections.Map<string, SendableNormalFn> = new collections.Map<string, SendableNormalFn>(
        entries<string, SendableNormalFn>(["fnKey", fn])
      );
      expect(map.size).assertEqual(1);
      let value: SendableNormalFn | undefined = map.get("fnKey");
      expect(value).assertEqual(fn);
      if (value) { expect(value.execute()).assertEqual(42); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_3800
     * @tc.name    testCollectionsMapConstructor0038
     * @tc.desc    Verify constructor with iterable stores SendableNormalFn correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapConstructor0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapConstructor0038';
      console.info(caseName + ', test start');
      let fn: SendableNormalFn = new SendableNormalFn();
      let iterable: Array<[string, SendableNormalFn]> = [["fnKey", fn]];
      let map: collections.Map<string, SendableNormalFn> = new collections.Map<string, SendableNormalFn>(iterable);
      expect(map.size).assertEqual(1);
      let value: SendableNormalFn | undefined = map.get("fnKey");
      expect(value).assertEqual(fn);
      if (value) { expect(value.execute()).assertEqual(42); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_3900
     * @tc.name    testCollectionsMapConstructor0039
     * @tc.desc    Verify constructor with entries array stores SendableArrowFn correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapConstructor0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapConstructor0039';
      console.info(caseName + ', test start');
      let fn: SendableArrowFn = new SendableArrowFn();
      let map: collections.Map<string, SendableArrowFn> = new collections.Map<string, SendableArrowFn>(
        entries<string, SendableArrowFn>(["arrowKey", fn])
      );
      expect(map.size).assertEqual(1);
      let value: SendableArrowFn | undefined = map.get("arrowKey");
      expect(value).assertEqual(fn);
      if (value) { expect(value.execute()).assertEqual(100); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_4000
     * @tc.name    testCollectionsMapConstructor0040
     * @tc.desc    Verify constructor with iterable stores SendableArrowFn correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapConstructor0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapConstructor0040';
      console.info(caseName + ', test start');
      let fn: SendableArrowFn = new SendableArrowFn();
      let iterable: Array<[string, SendableArrowFn]> = [["arrowKey", fn]];
      let map: collections.Map<string, SendableArrowFn> = new collections.Map<string, SendableArrowFn>(iterable);
      expect(map.size).assertEqual(1);
      let value: SendableArrowFn | undefined = map.get("arrowKey");
      expect(value).assertEqual(fn);
      if (value) { expect(value.execute()).assertEqual(100); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_4100
     * @tc.name    testCollectionsMapConstructor0041
     * @tc.desc    Verify constructor with entries array stores SendableAsyncFn correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapConstructor0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapConstructor0041';
      console.info(caseName + ', test start');
      let fn: SendableAsyncFn = new SendableAsyncFn();
      let map: collections.Map<string, SendableAsyncFn> = new collections.Map<string, SendableAsyncFn>(
        entries<string, SendableAsyncFn>(["asyncKey", fn])
      );
      expect(map.size).assertEqual(1);
      let value: SendableAsyncFn | undefined = map.get("asyncKey");
      expect(value).assertEqual(fn);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_4200
     * @tc.name    testCollectionsMapConstructor0042
     * @tc.desc    Verify constructor with iterable stores SendableAsyncFn correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapConstructor0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapConstructor0042';
      console.info(caseName + ', test start');
      let fn: SendableAsyncFn = new SendableAsyncFn();
      let iterable: Array<[string, SendableAsyncFn]> = [["asyncKey", fn]];
      let map: collections.Map<string, SendableAsyncFn> = new collections.Map<string, SendableAsyncFn>(iterable);
      expect(map.size).assertEqual(1);
      let value: SendableAsyncFn | undefined = map.get("asyncKey");
      expect(value).assertEqual(fn);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_4300
     * @tc.name    testCollectionsMapConstructor0043
     * @tc.desc    Verify constructor with entries array stores SendableClassBasic correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapConstructor0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapConstructor0043';
      console.info(caseName + ', test start');
      let instance: SendableClassBasic = new SendableClassBasic();
      let map: collections.Map<SendableClassBasic, SendableClassBasic> = new collections.Map<SendableClassBasic, SendableClassBasic>(
        entries<SendableClassBasic, SendableClassBasic>([instance, instance])
      );
      expect(map.size).assertEqual(1);
      expect(map.get(instance)).assertEqual(instance);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_4400
     * @tc.name    testCollectionsMapConstructor0044
     * @tc.desc    Verify constructor with iterable stores SendableClassBasic correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapConstructor0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapConstructor0044';
      console.info(caseName + ', test start');
      let instance: SendableClassBasic = new SendableClassBasic();
      let iterable: Array<[SendableClassBasic, SendableClassBasic]> = [[instance, instance]];
      let map: collections.Map<SendableClassBasic, SendableClassBasic> = new collections.Map<SendableClassBasic, SendableClassBasic>(iterable);
      expect(map.size).assertEqual(1);
      expect(map.get(instance)).assertEqual(instance);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_4500
     * @tc.name    testCollectionsMapConstructor0045
     * @tc.desc    Verify constructor with entries array stores SendableClassComplex correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapConstructor0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapConstructor0045';
      console.info(caseName + ', test start');
      let instance: SendableClassComplex = new SendableClassComplex();
      let map: collections.Map<SendableClassComplex, SendableClassComplex> = new collections.Map<SendableClassComplex, SendableClassComplex>(
        entries<SendableClassComplex, SendableClassComplex>([instance, instance])
      );
      expect(map.size).assertEqual(1);
      expect(map.get(instance)).assertEqual(instance);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_4600
     * @tc.name    testCollectionsMapConstructor0046
     * @tc.desc    Verify constructor with iterable stores SendableClassComplex correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapConstructor0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapConstructor0046';
      console.info(caseName + ', test start');
      let instance: SendableClassComplex = new SendableClassComplex();
      let iterable: Array<[SendableClassComplex, SendableClassComplex]> = [[instance, instance]];
      let map: collections.Map<SendableClassComplex, SendableClassComplex> = new collections.Map<SendableClassComplex, SendableClassComplex>(iterable);
      expect(map.size).assertEqual(1);
      expect(map.get(instance)).assertEqual(instance);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_4700
     * @tc.name    testCollectionsMapConstructor0047
     * @tc.desc    Verify constructor with entries array stores SendableClassExtended correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapConstructor0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapConstructor0047';
      console.info(caseName + ', test start');
      let instance: SendableClassExtended = new SendableClassExtended();
      let map: collections.Map<SendableClassExtended, SendableClassExtended> = new collections.Map<SendableClassExtended, SendableClassExtended>(
        entries<SendableClassExtended, SendableClassExtended>([instance, instance])
      );
      expect(map.size).assertEqual(1);
      expect(map.get(instance)).assertEqual(instance);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_4800
     * @tc.name    testCollectionsMapConstructor0048
     * @tc.desc    Verify constructor with iterable stores SendableClassExtended correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapConstructor0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapConstructor0048';
      console.info(caseName + ', test start');
      let instance: SendableClassExtended = new SendableClassExtended();
      let iterable: Array<[SendableClassExtended, SendableClassExtended]> = [[instance, instance]];
      let map: collections.Map<SendableClassExtended, SendableClassExtended> = new collections.Map<SendableClassExtended, SendableClassExtended>(iterable);
      expect(map.size).assertEqual(1);
      expect(map.get(instance)).assertEqual(instance);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_4900
     * @tc.name    testCollectionsMapConstructor0049
     * @tc.desc    Verify constructor with entries array stores SendableAddFn correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapConstructor0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapConstructor0049';
      console.info(caseName + ', test start');
      let fn: SendableAddFn = new SendableAddFn();
      let map: collections.Map<string, SendableAddFn> = new collections.Map<string, SendableAddFn>(
        entries<string, SendableAddFn>(["sendableFnKey", fn])
      );
      expect(map.size).assertEqual(1);
      let value: SendableAddFn | undefined = map.get("sendableFnKey");
      expect(value).assertEqual(fn);
      if (value) { expect(value.execute(5)).assertEqual(6); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_5000
     * @tc.name    testCollectionsMapConstructor0050
     * @tc.desc    Verify constructor with iterable stores SendableAddFn correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapConstructor0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapConstructor0050';
      console.info(caseName + ', test start');
      let fn: SendableAddFn = new SendableAddFn();
      let iterable: Array<[string, SendableAddFn]> = [["sendableFnKey", fn]];
      let map: collections.Map<string, SendableAddFn> = new collections.Map<string, SendableAddFn>(iterable);
      expect(map.size).assertEqual(1);
      let value: SendableAddFn | undefined = map.get("sendableFnKey");
      expect(value).assertEqual(fn);
      if (value) { expect(value.execute(5)).assertEqual(6); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_5100
     * @tc.name    testCollectionsMapConstructor0051
     * @tc.desc    Verify constructor with entries array stores const enum correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapConstructor0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapConstructor0051';
      console.info(caseName + ', test start');
      let map: collections.Map<SendableEnum, string> = new collections.Map<SendableEnum, string>(
        entries<SendableEnum, string>([SendableEnum.Success, "successValue"])
      );
      expect(map.size).assertEqual(1);
      expect(map.get(SendableEnum.Success)).assertEqual("successValue");
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_5200
     * @tc.name    testCollectionsMapConstructor0052
     * @tc.desc    Verify constructor with iterable stores const enum correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapConstructor0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapConstructor0052';
      console.info(caseName + ', test start');
      let iterable: Array<[SendableEnum, string]> = [[SendableEnum.Success, "successValue"]];
      let map: collections.Map<SendableEnum, string> = new collections.Map<SendableEnum, string>(iterable);
      expect(map.size).assertEqual(1);
      expect(map.get(SendableEnum.Success)).assertEqual("successValue");
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_5300
     * @tc.name    testCollectionsMapConstructor0053
     * @tc.desc    Verify constructor with entries array stores AsyncLock correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapConstructor0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapConstructor0053';
      console.info(caseName + ', test start');
      let lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
      let map: collections.Map<string, ArkTSUtils.locks.AsyncLock> = new collections.Map<string, ArkTSUtils.locks.AsyncLock>(
        entries<string, ArkTSUtils.locks.AsyncLock>(["lockKey", lock])
      );
      expect(map.size).assertEqual(1);
      expect(map.get("lockKey")).assertEqual(lock);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_5400
     * @tc.name    testCollectionsMapConstructor0054
     * @tc.desc    Verify constructor with iterable stores AsyncLock correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapConstructor0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapConstructor0054';
      console.info(caseName + ', test start');
      let lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
      let iterable: Array<[string, ArkTSUtils.locks.AsyncLock]> = [["lockKey", lock]];
      let map: collections.Map<string, ArkTSUtils.locks.AsyncLock> = new collections.Map<string, ArkTSUtils.locks.AsyncLock>(iterable);
      expect(map.size).assertEqual(1);
      expect(map.get("lockKey")).assertEqual(lock);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_5500
     * @tc.name    testCollectionsMapConstructor0055
     * @tc.desc    Verify constructor with entries array stores ConditionVariable correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapConstructor0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapConstructor0055';
      console.info(caseName + ', test start');
      let cv: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
      let map: collections.Map<string, ArkTSUtils.locks.ConditionVariable> = new collections.Map<string, ArkTSUtils.locks.ConditionVariable>(
        entries<string, ArkTSUtils.locks.ConditionVariable>(["cvKey", cv])
      );
      expect(map.size).assertEqual(1);
      expect(map.get("cvKey")).assertEqual(cv);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_5600
     * @tc.name    testCollectionsMapConstructor0056
     * @tc.desc    Verify constructor with iterable stores ConditionVariable correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapConstructor0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapConstructor0056';
      console.info(caseName + ', test start');
      let cv: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
      let iterable: Array<[string, ArkTSUtils.locks.ConditionVariable]> = [["cvKey", cv]];
      let map: collections.Map<string, ArkTSUtils.locks.ConditionVariable> = new collections.Map<string, ArkTSUtils.locks.ConditionVariable>(iterable);
      expect(map.size).assertEqual(1);
      expect(map.get("cvKey")).assertEqual(cv);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_5700
     * @tc.name    testCollectionsMapConstructor0057
     * @tc.desc    Verify constructor with entries array stores SendableLruCache correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapConstructor0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapConstructor0057';
      console.info(caseName + ', test start');
      let cache: ArkTSUtils.SendableLruCache<number, string> = new ArkTSUtils.SendableLruCache<number, string>();
      cache.put(1, "value1");
      let map: collections.Map<string, ArkTSUtils.SendableLruCache<number, string>> = new collections.Map<string, ArkTSUtils.SendableLruCache<number, string>>(
        entries<string, ArkTSUtils.SendableLruCache<number, string>>(["cacheKey", cache])
      );
      expect(map.size).assertEqual(1);
      let value: ArkTSUtils.SendableLruCache<number, string> | undefined = map.get("cacheKey");
      expect(value).assertEqual(cache);
      if (value) { expect(value.get(1)).assertEqual("value1"); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_5800
     * @tc.name    testCollectionsMapConstructor0058
     * @tc.desc    Verify constructor with iterable stores SendableLruCache correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapConstructor0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapConstructor0058';
      console.info(caseName + ', test start');
      let cache: ArkTSUtils.SendableLruCache<number, string> = new ArkTSUtils.SendableLruCache<number, string>();
      cache.put(1, "value1");
      let iterable: Array<[string, ArkTSUtils.SendableLruCache<number, string>]> = [["cacheKey", cache]];
      let map: collections.Map<string, ArkTSUtils.SendableLruCache<number, string>> = new collections.Map<string, ArkTSUtils.SendableLruCache<number, string>>(iterable);
      expect(map.size).assertEqual(1);
      let value: ArkTSUtils.SendableLruCache<number, string> | undefined = map.get("cacheKey");
      expect(value).assertEqual(cache);
      if (value) { expect(value.get(1)).assertEqual("value1"); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_5900
     * @tc.name    testCollectionsMapConstructor0059
     * @tc.desc    Verify constructor with entries array stores nested collections.Map correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapConstructor0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapConstructor0059';
      console.info(caseName + ', test start');
      let nestedMap: collections.Map<number, string> = new collections.Map<number, string>();
      nestedMap.set(1, "one").set(2, "two");
      let map: collections.Map<string, collections.Map<number, string>> = new collections.Map<string, collections.Map<number, string>>(
        entries<string, collections.Map<number, string>>(["nestedKey", nestedMap])
      );
      expect(map.size).assertEqual(1);
      let value: collections.Map<number, string> | undefined = map.get("nestedKey");
      expect(value).assertEqual(nestedMap);
      if (value) { expect(value.get(1)).assertEqual("one"); expect(value.get(2)).assertEqual("two"); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_6000
     * @tc.name    testCollectionsMapConstructor0060
     * @tc.desc    Verify constructor with iterable stores nested collections.Map correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapConstructor0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapConstructor0060';
      console.info(caseName + ', test start');
      let nestedMap: collections.Map<number, string> = new collections.Map<number, string>();
      nestedMap.set(1, "one").set(2, "two");
      let iterable: Array<[string, collections.Map<number, string>]> = [["nestedKey", nestedMap]];
      let map: collections.Map<string, collections.Map<number, string>> = new collections.Map<string, collections.Map<number, string>>(iterable);
      expect(map.size).assertEqual(1);
      let value: collections.Map<number, string> | undefined = map.get("nestedKey");
      expect(value).assertEqual(nestedMap);
      if (value) { expect(value.get(1)).assertEqual("one"); expect(value.get(2)).assertEqual("two"); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_6100
     * @tc.name    testCollectionsMapConstructor0061
     * @tc.desc    Verify constructor with entries array stores nested collections.Set correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapConstructor0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapConstructor0061';
      console.info(caseName + ', test start');
      let nestedSet: collections.Set<number> = new collections.Set<number>();
      nestedSet.add(1).add(2);
      let map: collections.Map<string, collections.Set<number>> = new collections.Map<string, collections.Set<number>>(
        entries<string, collections.Set<number>>(["nestedSetKey", nestedSet])
      );
      expect(map.size).assertEqual(1);
      let value: collections.Set<number> | undefined = map.get("nestedSetKey");
      expect(value).assertEqual(nestedSet);
      if (value) { expect(value.has(1)).assertTrue(); expect(value.has(2)).assertTrue(); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_6200
     * @tc.name    testCollectionsMapConstructor0062
     * @tc.desc    Verify constructor with iterable stores nested collections.Set correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapConstructor0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapConstructor0062';
      console.info(caseName + ', test start');
      let nestedSet: collections.Set<number> = new collections.Set<number>();
      nestedSet.add(1).add(2);
      let iterable: Array<[string, collections.Set<number>]> = [["nestedSetKey", nestedSet]];
      let map: collections.Map<string, collections.Set<number>> = new collections.Map<string, collections.Set<number>>(iterable);
      expect(map.size).assertEqual(1);
      let value: collections.Set<number> | undefined = map.get("nestedSetKey");
      expect(value).assertEqual(nestedSet);
      if (value) { expect(value.has(1)).assertTrue(); expect(value.has(2)).assertTrue(); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_6300
     * @tc.name    testCollectionsMapConstructor0063
     * @tc.desc    Verify constructor with entries array stores nested collections.Array correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapConstructor0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapConstructor0063';
      console.info(caseName + ', test start');
      let nestedArray: collections.Array<number> = new collections.Array<number>();
      nestedArray.push(1); nestedArray.push(2);
      let map: collections.Map<string, collections.Array<number>> = new collections.Map<string, collections.Array<number>>(
        entries<string, collections.Array<number>>(["nestedArrayKey", nestedArray])
      );
      expect(map.size).assertEqual(1);
      let value: collections.Array<number> | undefined = map.get("nestedArrayKey");
      expect(value).assertEqual(nestedArray);
      if (value) { expect(value[0]).assertEqual(1); expect(value[1]).assertEqual(2); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_6400
     * @tc.name    testCollectionsMapConstructor0064
     * @tc.desc    Verify constructor with iterable stores nested collections.Array correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapConstructor0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapConstructor0064';
      console.info(caseName + ', test start');
      let nestedArray: collections.Array<number> = new collections.Array<number>();
      nestedArray.push(1); nestedArray.push(2);
      let iterable: Array<[string, collections.Array<number>]> = [["nestedArrayKey", nestedArray]];
      let map: collections.Map<string, collections.Array<number>> = new collections.Map<string, collections.Array<number>>(iterable);
      expect(map.size).assertEqual(1);
      let value: collections.Array<number> | undefined = map.get("nestedArrayKey");
      expect(value).assertEqual(nestedArray);
      if (value) { expect(value[0]).assertEqual(1); expect(value[1]).assertEqual(2); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_6500
     * @tc.name    testCollectionsMapConstructor0065
     * @tc.desc    Verify constructor with entries array stores large object correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapConstructor0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapConstructor0065';
      console.info(caseName + ', test start');
      let obj: LargeObject = new LargeObject();
      let map: collections.Map<string, LargeObject> = new collections.Map<string, LargeObject>(
        entries<string, LargeObject>(["largeKey", obj])
      );
      expect(map.size).assertEqual(1);
      let value: LargeObject | undefined = map.get("largeKey");
      expect(value).assertEqual(obj);
      if (value) { expect(value.getValue(500)).assertEqual(500); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_6600
     * @tc.name    testCollectionsMapConstructor0066
     * @tc.desc    Verify constructor with iterable stores large object correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapConstructor0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapConstructor0066';
      console.info(caseName + ', test start');
      let obj: LargeObject = new LargeObject();
      let iterable: Array<[string, LargeObject]> = [["largeKey", obj]];
      let map: collections.Map<string, LargeObject> = new collections.Map<string, LargeObject>(iterable);
      expect(map.size).assertEqual(1);
      let value: LargeObject | undefined = map.get("largeKey");
      expect(value).assertEqual(obj);
      if (value) { expect(value.getValue(500)).assertEqual(500); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_6700
     * @tc.name    testCollectionsMapConstructor0067
     * @tc.desc    Verify constructor with entries array stores large array correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapConstructor0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapConstructor0067';
      console.info(caseName + ', test start');
      let arr: collections.Array<number> = new collections.Array<number>();
      for (let i: number = 0; i < 10000; i++) arr.push(i);
      let map: collections.Map<string, collections.Array<number>> = new collections.Map<string, collections.Array<number>>(
        entries<string, collections.Array<number>>(["largeArrayKey", arr])
      );
      expect(map.size).assertEqual(1);
      let value: collections.Array<number> | undefined = map.get("largeArrayKey");
      expect(value).assertEqual(arr);
      if (value) { expect(value[5000]).assertEqual(5000); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_6800
     * @tc.name    testCollectionsMapConstructor0068
     * @tc.desc    Verify constructor with iterable stores large array correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapConstructor0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapConstructor0068';
      console.info(caseName + ', test start');
      let arr: collections.Array<number> = new collections.Array<number>();
      for (let i: number = 0; i < 10000; i++) arr.push(i);
      let iterable: Array<[string, collections.Array<number>]> = [["largeArrayKey", arr]];
      let map: collections.Map<string, collections.Array<number>> = new collections.Map<string, collections.Array<number>>(iterable);
      expect(map.size).assertEqual(1);
      let value: collections.Array<number> | undefined = map.get("largeArrayKey");
      expect(value).assertEqual(arr);
      if (value) { expect(value[5000]).assertEqual(5000); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_6900
     * @tc.name    testCollectionsMapConstructor0069
     * @tc.desc    Verify constructor with entries array stores deeply nested object correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapConstructor0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapConstructor0069';
      console.info(caseName + ', test start');
      let root: DeepNestedObject = new DeepNestedObject("level0");
      let current: DeepNestedObject = root;
      for (let i: number = 1; i < 10; i++) { let next: DeepNestedObject = new DeepNestedObject("level" + i); current.next = next; current = next; }
      let map: collections.Map<string, DeepNestedObject> = new collections.Map<string, DeepNestedObject>(
        entries<string, DeepNestedObject>(["deepKey", root])
      );
      expect(map.size).assertEqual(1);
      let value: DeepNestedObject | undefined = map.get("deepKey");
      expect(value).assertEqual(root);
      if (value) { expect(value.level).assertEqual("level0"); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_7000
     * @tc.name    testCollectionsMapConstructor0070
     * @tc.desc    Verify constructor with iterable stores deeply nested object correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapConstructor0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapConstructor0070';
      console.info(caseName + ', test start');
      let root: DeepNestedObject = new DeepNestedObject("level0");
      let current: DeepNestedObject = root;
      for (let i: number = 1; i < 10; i++) { let next: DeepNestedObject = new DeepNestedObject("level" + i); current.next = next; current = next; }
      let iterable: Array<[string, DeepNestedObject]> = [["deepKey", root]];
      let map: collections.Map<string, DeepNestedObject> = new collections.Map<string, DeepNestedObject>(iterable);
      expect(map.size).assertEqual(1);
      let value: DeepNestedObject | undefined = map.get("deepKey");
      expect(value).assertEqual(root);
      if (value) { expect(value.level).assertEqual("level0"); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_7100
     * @tc.name    testCollectionsMapConstructor0071
     * @tc.desc    Verify constructor with entries array stores circular reference object correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapConstructor0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapConstructor0071';
      console.info(caseName + ', test start');
      let obj: CircularRef = new CircularRef("parent");
      obj.ref = new CircularRef("child");
      obj.ref.ref = obj;
      let map: collections.Map<string, CircularRef> = new collections.Map<string, CircularRef>(
        entries<string, CircularRef>(["circularKey", obj])
      );
      expect(map.size).assertEqual(1);
      let value: CircularRef | undefined = map.get("circularKey");
      expect(value).assertEqual(obj);
      if (value) { expect(value.name).assertEqual("parent"); expect(value.ref !== null).assertTrue(); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_CONSTRUCTOR_7200
     * @tc.name    testCollectionsMapConstructor0072
     * @tc.desc    Verify constructor with iterable stores circular reference object correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapConstructor0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapConstructor0072';
      console.info(caseName + ', test start');
      let obj: CircularRef = new CircularRef("parent");
      obj.ref = new CircularRef("child");
      obj.ref.ref = obj;
      let iterable: Array<[string, CircularRef]> = [["circularKey", obj]];
      let map: collections.Map<string, CircularRef> = new collections.Map<string, CircularRef>(iterable);
      expect(map.size).assertEqual(1);
      let value: CircularRef | undefined = map.get("circularKey");
      expect(value).assertEqual(obj);
      if (value) { expect(value.name).assertEqual("parent"); expect(value.ref !== null).assertTrue(); }
      console.info(caseName + ', test end');
    });

  });
}