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
 * @file CollectionsMapSetGet.test.ets
 * @description collections.Map set and get methods unit test cases covering
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

export default function CollectionsMapSetGetTest() {
  describe('CollectionsMapSetGetTest', () => {

    beforeAll(() => { console.info('[CollectionsMapSetGetTest] beforeAll'); });
    beforeEach(async () => {
      await sleep(20);
      console.info('[CollectionsMapSetGetTest] beforeEach');
    });
    afterEach(() => { console.info('[CollectionsMapSetGetTest] afterEach'); });
    afterAll(() => { console.info('[CollectionsMapSetGetTest] afterAll'); });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_SET_GET_0100
     * @tc.name    testCollectionsMapSetGet0001
     * @tc.desc    Verify set stores normal number correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapSetGet0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapSetGet0001';
      console.info(caseName + ', test start');
      let map: collections.Map<number, number> = new collections.Map<number, number>();
      map.set(100, 100);
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_SET_GET_0200
     * @tc.name    testCollectionsMapSetGet0002
     * @tc.desc    Verify get retrieves normal number correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapSetGet0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapSetGet0002';
      console.info(caseName + ', test start');
      let map: collections.Map<number, number> = new collections.Map<number, number>();
      map.set(100, 100);
      expect(map.get(100)).assertEqual(100);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_SET_GET_0300
     * @tc.name    testCollectionsMapSetGet0003
     * @tc.desc    Verify set stores scientific notation number correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapSetGet0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapSetGet0003';
      console.info(caseName + ', test start');
      let map: collections.Map<number, number> = new collections.Map<number, number>();
      let value: number = 1.5e-10;
      map.set(value, value);
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_SET_GET_0400
     * @tc.name    testCollectionsMapSetGet0004
     * @tc.desc    Verify get retrieves scientific notation number correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapSetGet0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapSetGet0004';
      console.info(caseName + ', test start');
      let map: collections.Map<number, number> = new collections.Map<number, number>();
      let value: number = 1.5e-10;
      map.set(value, value);
      expect(map.get(value)).assertEqual(value);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_SET_GET_0500
     * @tc.name    testCollectionsMapSetGet0005
     * @tc.desc    Verify set stores MAX_SAFE_INTEGER correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapSetGet0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapSetGet0005';
      console.info(caseName + ', test start');
      let map: collections.Map<number, number> = new collections.Map<number, number>();
      let maxInt: number = Number.MAX_SAFE_INTEGER;
      map.set(maxInt, maxInt);
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_SET_GET_0600
     * @tc.name    testCollectionsMapSetGet0006
     * @tc.desc    Verify get retrieves MAX_SAFE_INTEGER correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapSetGet0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapSetGet0006';
      console.info(caseName + ', test start');
      let map: collections.Map<number, number> = new collections.Map<number, number>();
      let maxInt: number = Number.MAX_SAFE_INTEGER;
      map.set(maxInt, maxInt);
      expect(map.get(maxInt)).assertEqual(maxInt);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_SET_GET_0700
     * @tc.name    testCollectionsMapSetGet0007
     * @tc.desc    Verify set stores NaN correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapSetGet0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapSetGet0007';
      console.info(caseName + ', test start');
      let map: collections.Map<number, number> = new collections.Map<number, number>();
      map.set(NaN, NaN);
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_SET_GET_0800
     * @tc.name    testCollectionsMapSetGet0008
     * @tc.desc    Verify get retrieves NaN correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapSetGet0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapSetGet0008';
      console.info(caseName + ', test start');
      let map: collections.Map<number, number> = new collections.Map<number, number>();
      map.set(NaN, NaN);
      let value: number | undefined = map.get(NaN);
      expect(value !== undefined).assertTrue();
      if (value !== undefined) { expect(isNaN(value)).assertTrue(); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_SET_GET_0900
     * @tc.name    testCollectionsMapSetGet0009
     * @tc.desc    Verify set stores normal string correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapSetGet0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapSetGet0009';
      console.info(caseName + ', test start');
      let map: collections.Map<string, string> = new collections.Map<string, string>();
      let str: string = "test测试123";
      map.set(str, str);
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_SET_GET_1000
     * @tc.name    testCollectionsMapSetGet0010
     * @tc.desc    Verify get retrieves normal string correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapSetGet0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapSetGet0010';
      console.info(caseName + ', test start');
      let map: collections.Map<string, string> = new collections.Map<string, string>();
      let str: string = "test测试123";
      map.set(str, str);
      expect(map.get(str)).assertEqual(str);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_SET_GET_1100
     * @tc.name    testCollectionsMapSetGet0011
     * @tc.desc    Verify set stores special character string correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapSetGet0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapSetGet0011';
      console.info(caseName + ', test start');
      let map: collections.Map<string, string> = new collections.Map<string, string>();
      let str: string = "a\n\t\u200B\u0000";
      map.set(str, str);
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_SET_GET_1200
     * @tc.name    testCollectionsMapSetGet0012
     * @tc.desc    Verify get retrieves special character string correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapSetGet0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapSetGet0012';
      console.info(caseName + ', test start');
      let map: collections.Map<string, string> = new collections.Map<string, string>();
      let str: string = "a\n\t\u200B\u0000";
      map.set(str, str);
      expect(map.get(str)).assertEqual(str);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_SET_GET_1300
     * @tc.name    testCollectionsMapSetGet0013
     * @tc.desc    Verify set stores emoji string correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapSetGet0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapSetGet0013';
      console.info(caseName + ', test start');
      let map: collections.Map<string, string> = new collections.Map<string, string>();
      let str: string = "测试😀🎉🔥";
      map.set(str, str);
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_SET_GET_1400
     * @tc.name    testCollectionsMapSetGet0014
     * @tc.desc    Verify get retrieves emoji string correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapSetGet0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapSetGet0014';
      console.info(caseName + ', test start');
      let map: collections.Map<string, string> = new collections.Map<string, string>();
      let str: string = "测试😀🎉🔥";
      map.set(str, str);
      expect(map.get(str)).assertEqual(str);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_SET_GET_1500
     * @tc.name    testCollectionsMapSetGet0015
     * @tc.desc    Verify set stores empty string correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapSetGet0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapSetGet0015';
      console.info(caseName + ', test start');
      let map: collections.Map<string, string> = new collections.Map<string, string>();
      map.set("", "");
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_SET_GET_1600
     * @tc.name    testCollectionsMapSetGet0016
     * @tc.desc    Verify get retrieves empty string correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapSetGet0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapSetGet0016';
      console.info(caseName + ', test start');
      let map: collections.Map<string, string> = new collections.Map<string, string>();
      map.set("", "");
      expect(map.get("")).assertEqual("");
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_SET_GET_1700
     * @tc.name    testCollectionsMapSetGet0017
     * @tc.desc    Verify set stores boolean true correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapSetGet0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapSetGet0017';
      console.info(caseName + ', test start');
      let map: collections.Map<boolean, boolean> = new collections.Map<boolean, boolean>();
      map.set(true, true);
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_SET_GET_1800
     * @tc.name    testCollectionsMapSetGet0018
     * @tc.desc    Verify get retrieves boolean true correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapSetGet0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapSetGet0018';
      console.info(caseName + ', test start');
      let map: collections.Map<boolean, boolean> = new collections.Map<boolean, boolean>();
      map.set(true, true);
      expect(map.get(true)).assertEqual(true);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_SET_GET_1900
     * @tc.name    testCollectionsMapSetGet0019
     * @tc.desc    Verify set stores boolean false correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapSetGet0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapSetGet0019';
      console.info(caseName + ', test start');
      let map: collections.Map<boolean, string> = new collections.Map<boolean, string>();
      map.set(false, "falseValue");
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_SET_GET_2000
     * @tc.name    testCollectionsMapSetGet0020
     * @tc.desc    Verify get retrieves boolean false correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapSetGet0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapSetGet0020';
      console.info(caseName + ', test start');
      let map: collections.Map<boolean, string> = new collections.Map<boolean, string>();
      map.set(false, "falseValue");
      expect(map.get(false)).assertEqual("falseValue");
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_SET_GET_2100
     * @tc.name    testCollectionsMapSetGet0021
     * @tc.desc    Verify set stores undefined correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapSetGet0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapSetGet0021';
      console.info(caseName + ', test start');
      let map: collections.Map<undefined, undefined> = new collections.Map<undefined, undefined>();
      map.set(undefined, undefined);
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_SET_GET_2200
     * @tc.name    testCollectionsMapSetGet0022
     * @tc.desc    Verify get retrieves undefined correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapSetGet0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapSetGet0022';
      console.info(caseName + ', test start');
      let map: collections.Map<undefined, undefined> = new collections.Map<undefined, undefined>();
      map.set(undefined, undefined);
      expect(map.get(undefined)).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_SET_GET_2300
     * @tc.name    testCollectionsMapSetGet0023
     * @tc.desc    Verify set stores null correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapSetGet0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapSetGet0023';
      console.info(caseName + ', test start');
      let map: collections.Map<null, null> = new collections.Map<null, null>();
      map.set(null, null);
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_SET_GET_2400
     * @tc.name    testCollectionsMapSetGet0024
     * @tc.desc    Verify get retrieves null correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapSetGet0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapSetGet0024';
      console.info(caseName + ', test start');
      let map: collections.Map<null, null> = new collections.Map<null, null>();
      map.set(null, null);
      expect(map.get(null)).assertEqual(null);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_SET_GET_2500
     * @tc.name    testCollectionsMapSetGet0025
     * @tc.desc    Verify set stores Sendable object correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapSetGet0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapSetGet0025';
      console.info(caseName + ', test start');
      let map: collections.Map<TestPerson, TestPerson> = new collections.Map<TestPerson, TestPerson>();
      let obj: TestPerson = new TestPerson("test", 20);
      map.set(obj, obj);
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_SET_GET_2600
     * @tc.name    testCollectionsMapSetGet0026
     * @tc.desc    Verify get retrieves Sendable object correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapSetGet0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapSetGet0026';
      console.info(caseName + ', test start');
      let map: collections.Map<TestPerson, TestPerson> = new collections.Map<TestPerson, TestPerson>();
      let obj: TestPerson = new TestPerson("test", 20);
      map.set(obj, obj);
      let value: TestPerson | undefined = map.get(obj);
      expect(value).assertEqual(obj);
      if (value) { expect(value.name).assertEqual("test"); expect(value.age).assertEqual(20); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_SET_GET_2700
     * @tc.name    testCollectionsMapSetGet0027
     * @tc.desc    Verify set stores empty Sendable object correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapSetGet0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapSetGet0027';
      console.info(caseName + ', test start');
      let map: collections.Map<EmptyClass, EmptyClass> = new collections.Map<EmptyClass, EmptyClass>();
      let obj: EmptyClass = new EmptyClass();
      map.set(obj, obj);
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_SET_GET_2800
     * @tc.name    testCollectionsMapSetGet0028
     * @tc.desc    Verify get retrieves empty Sendable object correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapSetGet0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapSetGet0028';
      console.info(caseName + ', test start');
      let map: collections.Map<EmptyClass, EmptyClass> = new collections.Map<EmptyClass, EmptyClass>();
      let obj: EmptyClass = new EmptyClass();
      map.set(obj, obj);
      expect(map.get(obj)).assertEqual(obj);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_SET_GET_2900
     * @tc.name    testCollectionsMapSetGet0029
     * @tc.desc    Verify set stores ComplexIndexSignature object correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapSetGet0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapSetGet0029';
      console.info(caseName + ', test start');
      let map: collections.Map<ComplexIndexSignature, ComplexIndexSignature> = new collections.Map<ComplexIndexSignature, ComplexIndexSignature>();
      let obj: ComplexIndexSignature = new ComplexIndexSignature();
      map.set(obj, obj);
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_SET_GET_3000
     * @tc.name    testCollectionsMapSetGet0030
     * @tc.desc    Verify get retrieves ComplexIndexSignature object correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapSetGet0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapSetGet0030';
      console.info(caseName + ', test start');
      let map: collections.Map<ComplexIndexSignature, ComplexIndexSignature> = new collections.Map<ComplexIndexSignature, ComplexIndexSignature>();
      let obj: ComplexIndexSignature = new ComplexIndexSignature();
      map.set(obj, obj);
      let value: ComplexIndexSignature | undefined = map.get(obj);
      expect(value).assertEqual(obj);
      if (value) { expect(value.a).assertEqual(1); expect(value.b).assertEqual(2); expect(value.c).assertEqual(3); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_SET_GET_3100
     * @tc.name    testCollectionsMapSetGet0031
     * @tc.desc    Verify set stores collections.Array correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapSetGet0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapSetGet0031';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Array<number>> = new collections.Map<string, collections.Array<number>>();
      let arr: collections.Array<number> = new collections.Array<number>();
      arr.push(1); arr.push(2); arr.push(3);
      map.set("arrayKey", arr);
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_SET_GET_3200
     * @tc.name    testCollectionsMapSetGet0032
     * @tc.desc    Verify get retrieves collections.Array correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapSetGet0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapSetGet0032';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Array<number>> = new collections.Map<string, collections.Array<number>>();
      let arr: collections.Array<number> = new collections.Array<number>();
      arr.push(1); arr.push(2); arr.push(3);
      map.set("arrayKey", arr);
      let value: collections.Array<number> | undefined = map.get("arrayKey");
      expect(value).assertEqual(arr);
      if (value) { expect(value[0]).assertEqual(1); expect(value[1]).assertEqual(2); expect(value[2]).assertEqual(3); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_SET_GET_3300
     * @tc.name    testCollectionsMapSetGet0033
     * @tc.desc    Verify set stores empty collections.Array correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapSetGet0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapSetGet0033';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Array<number>> = new collections.Map<string, collections.Array<number>>();
      let arr: collections.Array<number> = new collections.Array<number>();
      map.set("emptyArrayKey", arr);
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_SET_GET_3400
     * @tc.name    testCollectionsMapSetGet0034
     * @tc.desc    Verify get retrieves empty collections.Array correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapSetGet0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapSetGet0034';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Array<number>> = new collections.Map<string, collections.Array<number>>();
      let arr: collections.Array<number> = new collections.Array<number>();
      map.set("emptyArrayKey", arr);
      let value: collections.Array<number> | undefined = map.get("emptyArrayKey");
      expect(value).assertEqual(arr);
      if (value) { expect(value.length).assertEqual(0); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_SET_GET_3500
     * @tc.name    testCollectionsMapSetGet0035
     * @tc.desc    Verify set stores sparse array correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapSetGet0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapSetGet0035';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Array<number | null>> = new collections.Map<string, collections.Array<number | null>>();
      let arr: collections.Array<number | null> = new collections.Array<number | null>();
      arr.push(1);
      arr.push(null);
      arr.push(2);
      map.set("sparseKey", arr);
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_SET_GET_3600
     * @tc.name    testCollectionsMapSetGet0036
     * @tc.desc    Verify get retrieves sparse array correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapSetGet0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapSetGet0036';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Array<number | null>> = new collections.Map<string, collections.Array<number | null>>();
      let arr: collections.Array<number | null> = new collections.Array<number | null>();
      arr.push(1);
      arr.push(null);
      arr.push(2);
      map.set("sparseKey", arr);
      let value: collections.Array<number | null> | undefined = map.get("sparseKey");
      expect(value).assertEqual(arr);
      if (value) { expect(value[0]).assertEqual(1); expect(value[1]).assertEqual(null); expect(value[2]).assertEqual(2); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_SET_GET_3700
     * @tc.name    testCollectionsMapSetGet0037
     * @tc.desc    Verify set stores SendableNormalFn correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapSetGet0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapSetGet0037';
      console.info(caseName + ', test start');
      let map: collections.Map<string, SendableNormalFn> = new collections.Map<string, SendableNormalFn>();
      let fn: SendableNormalFn = new SendableNormalFn();
      map.set("fnKey", fn);
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_SET_GET_3800
     * @tc.name    testCollectionsMapSetGet0038
     * @tc.desc    Verify get retrieves SendableNormalFn correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapSetGet0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapSetGet0038';
      console.info(caseName + ', test start');
      let map: collections.Map<string, SendableNormalFn> = new collections.Map<string, SendableNormalFn>();
      let fn: SendableNormalFn = new SendableNormalFn();
      map.set("fnKey", fn);
      let value: SendableNormalFn | undefined = map.get("fnKey");
      expect(value).assertEqual(fn);
      if (value) { expect(value.execute()).assertEqual(42); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_SET_GET_3900
     * @tc.name    testCollectionsMapSetGet0039
     * @tc.desc    Verify set stores SendableArrowFn correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapSetGet0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapSetGet0039';
      console.info(caseName + ', test start');
      let map: collections.Map<string, SendableArrowFn> = new collections.Map<string, SendableArrowFn>();
      let fn: SendableArrowFn = new SendableArrowFn();
      map.set("arrowKey", fn);
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_SET_GET_4000
     * @tc.name    testCollectionsMapSetGet0040
     * @tc.desc    Verify get retrieves SendableArrowFn correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapSetGet0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapSetGet0040';
      console.info(caseName + ', test start');
      let map: collections.Map<string, SendableArrowFn> = new collections.Map<string, SendableArrowFn>();
      let fn: SendableArrowFn = new SendableArrowFn();
      map.set("arrowKey", fn);
      let value: SendableArrowFn | undefined = map.get("arrowKey");
      expect(value).assertEqual(fn);
      if (value) { expect(value.execute()).assertEqual(100); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_SET_GET_4100
     * @tc.name    testCollectionsMapSetGet0041
     * @tc.desc    Verify set stores SendableAsyncFn correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapSetGet0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapSetGet0041';
      console.info(caseName + ', test start');
      let map: collections.Map<string, SendableAsyncFn> = new collections.Map<string, SendableAsyncFn>();
      let fn: SendableAsyncFn = new SendableAsyncFn();
      map.set("asyncKey", fn);
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_SET_GET_4200
     * @tc.name    testCollectionsMapSetGet0042
     * @tc.desc    Verify get retrieves SendableAsyncFn correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapSetGet0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapSetGet0042';
      console.info(caseName + ', test start');
      let map: collections.Map<string, SendableAsyncFn> = new collections.Map<string, SendableAsyncFn>();
      let fn: SendableAsyncFn = new SendableAsyncFn();
      map.set("asyncKey", fn);
      let value: SendableAsyncFn | undefined = map.get("asyncKey");
      expect(value).assertEqual(fn);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_SET_GET_4300
     * @tc.name    testCollectionsMapSetGet0043
     * @tc.desc    Verify set stores SendableClassBasic correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapSetGet0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapSetGet0043';
      console.info(caseName + ', test start');
      let map: collections.Map<SendableClassBasic, SendableClassBasic> = new collections.Map<SendableClassBasic, SendableClassBasic>();
      let instance: SendableClassBasic = new SendableClassBasic();
      map.set(instance, instance);
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_SET_GET_4400
     * @tc.name    testCollectionsMapSetGet0044
     * @tc.desc    Verify get retrieves SendableClassBasic correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapSetGet0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapSetGet0044';
      console.info(caseName + ', test start');
      let map: collections.Map<SendableClassBasic, SendableClassBasic> = new collections.Map<SendableClassBasic, SendableClassBasic>();
      let instance: SendableClassBasic = new SendableClassBasic();
      map.set(instance, instance);
      let value: SendableClassBasic | undefined = map.get(instance);
      expect(value).assertEqual(instance);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_SET_GET_4500
     * @tc.name    testCollectionsMapSetGet0045
     * @tc.desc    Verify set stores SendableClassComplex correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapSetGet0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapSetGet0045';
      console.info(caseName + ', test start');
      let map: collections.Map<SendableClassComplex, SendableClassComplex> = new collections.Map<SendableClassComplex, SendableClassComplex>();
      let instance: SendableClassComplex = new SendableClassComplex();
      map.set(instance, instance);
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_SET_GET_4600
     * @tc.name    testCollectionsMapSetGet0046
     * @tc.desc    Verify get retrieves SendableClassComplex correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapSetGet0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapSetGet0046';
      console.info(caseName + ', test start');
      let map: collections.Map<SendableClassComplex, SendableClassComplex> = new collections.Map<SendableClassComplex, SendableClassComplex>();
      let instance: SendableClassComplex = new SendableClassComplex();
      map.set(instance, instance);
      let value: SendableClassComplex | undefined = map.get(instance);
      expect(value).assertEqual(instance);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_SET_GET_4700
     * @tc.name    testCollectionsMapSetGet0047
     * @tc.desc    Verify set stores SendableClassExtended correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapSetGet0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapSetGet0047';
      console.info(caseName + ', test start');
      let map: collections.Map<SendableClassExtended, SendableClassExtended> = new collections.Map<SendableClassExtended, SendableClassExtended>();
      let instance: SendableClassExtended = new SendableClassExtended();
      map.set(instance, instance);
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_SET_GET_4800
     * @tc.name    testCollectionsMapSetGet0048
     * @tc.desc    Verify get retrieves SendableClassExtended correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapSetGet0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapSetGet0048';
      console.info(caseName + ', test start');
      let map: collections.Map<SendableClassExtended, SendableClassExtended> = new collections.Map<SendableClassExtended, SendableClassExtended>();
      let instance: SendableClassExtended = new SendableClassExtended();
      map.set(instance, instance);
      let value: SendableClassExtended | undefined = map.get(instance);
      expect(value).assertEqual(instance);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_SET_GET_4900
     * @tc.name    testCollectionsMapSetGet0049
     * @tc.desc    Verify set stores SendableAddFn correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapSetGet0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapSetGet0049';
      console.info(caseName + ', test start');
      let map: collections.Map<string, SendableAddFn> = new collections.Map<string, SendableAddFn>();
      let fn: SendableAddFn = new SendableAddFn();
      map.set("sendableFnKey", fn);
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_SET_GET_5000
     * @tc.name    testCollectionsMapSetGet0050
     * @tc.desc    Verify get retrieves SendableAddFn correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapSetGet0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapSetGet0050';
      console.info(caseName + ', test start');
      let map: collections.Map<string, SendableAddFn> = new collections.Map<string, SendableAddFn>();
      let fn: SendableAddFn = new SendableAddFn();
      map.set("sendableFnKey", fn);
      let value: SendableAddFn | undefined = map.get("sendableFnKey");
      expect(value).assertEqual(fn);
      if (value) { expect(value.execute(5)).assertEqual(6); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_SET_GET_5100
     * @tc.name    testCollectionsMapSetGet0051
     * @tc.desc    Verify set stores const enum correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapSetGet0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapSetGet0051';
      console.info(caseName + ', test start');
      let map: collections.Map<SendableEnum, string> = new collections.Map<SendableEnum, string>();
      map.set(SendableEnum.Success, "successValue");
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_SET_GET_5200
     * @tc.name    testCollectionsMapSetGet0052
     * @tc.desc    Verify get retrieves const enum correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapSetGet0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapSetGet0052';
      console.info(caseName + ', test start');
      let map: collections.Map<SendableEnum, string> = new collections.Map<SendableEnum, string>();
      map.set(SendableEnum.Success, "successValue");
      expect(map.get(SendableEnum.Success)).assertEqual("successValue");
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_SET_GET_5300
     * @tc.name    testCollectionsMapSetGet0053
     * @tc.desc    Verify set stores AsyncLock correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapSetGet0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapSetGet0053';
      console.info(caseName + ', test start');
      let lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
      let map: collections.Map<string, ArkTSUtils.locks.AsyncLock> = new collections.Map<string, ArkTSUtils.locks.AsyncLock>();
      map.set("lockKey", lock);
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_SET_GET_5400
     * @tc.name    testCollectionsMapSetGet0054
     * @tc.desc    Verify get retrieves AsyncLock correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapSetGet0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapSetGet0054';
      console.info(caseName + ', test start');
      let lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
      let map: collections.Map<string, ArkTSUtils.locks.AsyncLock> = new collections.Map<string, ArkTSUtils.locks.AsyncLock>();
      map.set("lockKey", lock);
      expect(map.get("lockKey")).assertEqual(lock);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_SET_GET_5500
     * @tc.name    testCollectionsMapSetGet0055
     * @tc.desc    Verify set stores ConditionVariable correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapSetGet0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapSetGet0055';
      console.info(caseName + ', test start');
      let cv: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
      let map: collections.Map<string, ArkTSUtils.locks.ConditionVariable> = new collections.Map<string, ArkTSUtils.locks.ConditionVariable>();
      map.set("cvKey", cv);
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_SET_GET_5600
     * @tc.name    testCollectionsMapSetGet0056
     * @tc.desc    Verify get retrieves ConditionVariable correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapSetGet0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapSetGet0056';
      console.info(caseName + ', test start');
      let cv: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
      let map: collections.Map<string, ArkTSUtils.locks.ConditionVariable> = new collections.Map<string, ArkTSUtils.locks.ConditionVariable>();
      map.set("cvKey", cv);
      expect(map.get("cvKey")).assertEqual(cv);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_SET_GET_5700
     * @tc.name    testCollectionsMapSetGet0057
     * @tc.desc    Verify set stores SendableLruCache correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapSetGet0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapSetGet0057';
      console.info(caseName + ', test start');
      let cache: ArkTSUtils.SendableLruCache<number, string> = new ArkTSUtils.SendableLruCache<number, string>();
      cache.put(1, "value1");
      let map: collections.Map<string, ArkTSUtils.SendableLruCache<number, string>> = new collections.Map<string, ArkTSUtils.SendableLruCache<number, string>>();
      map.set("cacheKey", cache);
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_SET_GET_5800
     * @tc.name    testCollectionsMapSetGet0058
     * @tc.desc    Verify get retrieves SendableLruCache correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapSetGet0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapSetGet0058';
      console.info(caseName + ', test start');
      let cache: ArkTSUtils.SendableLruCache<number, string> = new ArkTSUtils.SendableLruCache<number, string>();
      cache.put(1, "value1");
      let map: collections.Map<string, ArkTSUtils.SendableLruCache<number, string>> = new collections.Map<string, ArkTSUtils.SendableLruCache<number, string>>();
      map.set("cacheKey", cache);
      let value: ArkTSUtils.SendableLruCache<number, string> | undefined = map.get("cacheKey");
      expect(value).assertEqual(cache);
      if (value) { expect(value.get(1)).assertEqual("value1"); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_SET_GET_5900
     * @tc.name    testCollectionsMapSetGet0059
     * @tc.desc    Verify set stores nested collections.Map correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapSetGet0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapSetGet0059';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Map<number, string>> = new collections.Map<string, collections.Map<number, string>>();
      let nestedMap: collections.Map<number, string> = new collections.Map<number, string>();
      nestedMap.set(1, "one").set(2, "two");
      map.set("nestedKey", nestedMap);
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_SET_GET_6000
     * @tc.name    testCollectionsMapSetGet0060
     * @tc.desc    Verify get retrieves nested collections.Map correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapSetGet0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapSetGet0060';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Map<number, string>> = new collections.Map<string, collections.Map<number, string>>();
      let nestedMap: collections.Map<number, string> = new collections.Map<number, string>();
      nestedMap.set(1, "one").set(2, "two");
      map.set("nestedKey", nestedMap);
      let value: collections.Map<number, string> | undefined = map.get("nestedKey");
      expect(value).assertEqual(nestedMap);
      if (value) { expect(value.get(1)).assertEqual("one"); expect(value.get(2)).assertEqual("two"); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_SET_GET_6100
     * @tc.name    testCollectionsMapSetGet0061
     * @tc.desc    Verify set stores nested collections.Set correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapSetGet0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapSetGet0061';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Set<number>> = new collections.Map<string, collections.Set<number>>();
      let nestedSet: collections.Set<number> = new collections.Set<number>();
      nestedSet.add(1).add(2);
      map.set("nestedSetKey", nestedSet);
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_SET_GET_6200
     * @tc.name    testCollectionsMapSetGet0062
     * @tc.desc    Verify get retrieves nested collections.Set correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapSetGet0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapSetGet0062';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Set<number>> = new collections.Map<string, collections.Set<number>>();
      let nestedSet: collections.Set<number> = new collections.Set<number>();
      nestedSet.add(1).add(2);
      map.set("nestedSetKey", nestedSet);
      let value: collections.Set<number> | undefined = map.get("nestedSetKey");
      expect(value).assertEqual(nestedSet);
      if (value) { expect(value.has(1)).assertTrue(); expect(value.has(2)).assertTrue(); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_SET_GET_6300
     * @tc.name    testCollectionsMapSetGet0063
     * @tc.desc    Verify set stores nested collections.Array correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapSetGet0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapSetGet0063';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Array<number>> = new collections.Map<string, collections.Array<number>>();
      let nestedArray: collections.Array<number> = new collections.Array<number>();
      nestedArray.push(1); nestedArray.push(2);
      map.set("nestedArrayKey", nestedArray);
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_SET_GET_6400
     * @tc.name    testCollectionsMapSetGet0064
     * @tc.desc    Verify get retrieves nested collections.Array correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapSetGet0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapSetGet0064';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Array<number>> = new collections.Map<string, collections.Array<number>>();
      let nestedArray: collections.Array<number> = new collections.Array<number>();
      nestedArray.push(1); nestedArray.push(2);
      map.set("nestedArrayKey", nestedArray);
      let value: collections.Array<number> | undefined = map.get("nestedArrayKey");
      expect(value).assertEqual(nestedArray);
      if (value) { expect(value[0]).assertEqual(1); expect(value[1]).assertEqual(2); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_SET_GET_6500
     * @tc.name    testCollectionsMapSetGet0065
     * @tc.desc    Verify set stores large object correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapSetGet0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapSetGet0065';
      console.info(caseName + ', test start');
      let map: collections.Map<string, LargeObject> = new collections.Map<string, LargeObject>();
      let obj: LargeObject = new LargeObject();
      map.set("largeKey", obj);
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_SET_GET_6600
     * @tc.name    testCollectionsMapSetGet0066
     * @tc.desc    Verify get retrieves large object correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapSetGet0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapSetGet0066';
      console.info(caseName + ', test start');
      let map: collections.Map<string, LargeObject> = new collections.Map<string, LargeObject>();
      let obj: LargeObject = new LargeObject();
      map.set("largeKey", obj);
      let value: LargeObject | undefined = map.get("largeKey");
      expect(value).assertEqual(obj);
      if (value) { expect(value.getValue(500)).assertEqual(500); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_SET_GET_6700
     * @tc.name    testCollectionsMapSetGet0067
     * @tc.desc    Verify set stores large array correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapSetGet0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapSetGet0067';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Array<number>> = new collections.Map<string, collections.Array<number>>();
      let arr: collections.Array<number> = new collections.Array<number>();
      for (let i: number = 0; i < 10000; i++) arr.push(i);
      map.set("largeArrayKey", arr);
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_SET_GET_6800
     * @tc.name    testCollectionsMapSetGet0068
     * @tc.desc    Verify get retrieves large array correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapSetGet0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapSetGet0068';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Array<number>> = new collections.Map<string, collections.Array<number>>();
      let arr: collections.Array<number> = new collections.Array<number>();
      for (let i: number = 0; i < 10000; i++) arr.push(i);
      map.set("largeArrayKey", arr);
      let value: collections.Array<number> | undefined = map.get("largeArrayKey");
      expect(value).assertEqual(arr);
      if (value) { expect(value[5000]).assertEqual(5000); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_SET_GET_6900
     * @tc.name    testCollectionsMapSetGet0069
     * @tc.desc    Verify set stores deeply nested object correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapSetGet0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapSetGet0069';
      console.info(caseName + ', test start');
      let map: collections.Map<string, DeepNestedObject> = new collections.Map<string, DeepNestedObject>();
      let root: DeepNestedObject = new DeepNestedObject("level0");
      let current: DeepNestedObject = root;
      for (let i: number = 1; i < 10; i++) { let next: DeepNestedObject = new DeepNestedObject("level" + i); current.next = next; current = next; }
      map.set("deepKey", root);
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_SET_GET_7000
     * @tc.name    testCollectionsMapSetGet0070
     * @tc.desc    Verify get retrieves deeply nested object correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapSetGet0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapSetGet0070';
      console.info(caseName + ', test start');
      let map: collections.Map<string, DeepNestedObject> = new collections.Map<string, DeepNestedObject>();
      let root: DeepNestedObject = new DeepNestedObject("level0");
      let current: DeepNestedObject = root;
      for (let i: number = 1; i < 10; i++) { let next: DeepNestedObject = new DeepNestedObject("level" + i); current.next = next; current = next; }
      map.set("deepKey", root);
      let value: DeepNestedObject | undefined = map.get("deepKey");
      expect(value).assertEqual(root);
      if (value) { expect(value.level).assertEqual("level0"); }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_SET_GET_7100
     * @tc.name    testCollectionsMapSetGet0071
     * @tc.desc    Verify set stores circular reference object correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapSetGet0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapSetGet0071';
      console.info(caseName + ', test start');
      let map: collections.Map<string, CircularRef> = new collections.Map<string, CircularRef>();
      let obj: CircularRef = new CircularRef("parent");
      obj.ref = new CircularRef("child");
      obj.ref.ref = obj;
      map.set("circularKey", obj);
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_SET_GET_7200
     * @tc.name    testCollectionsMapSetGet0072
     * @tc.desc    Verify get retrieves circular reference object correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapSetGet0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapSetGet0072';
      console.info(caseName + ', test start');
      let map: collections.Map<string, CircularRef> = new collections.Map<string, CircularRef>();
      let obj: CircularRef = new CircularRef("parent");
      obj.ref = new CircularRef("child");
      obj.ref.ref = obj;
      map.set("circularKey", obj);
      let value: CircularRef | undefined = map.get("circularKey");
      expect(value).assertEqual(obj);
      if (value) { expect(value.name).assertEqual("parent"); expect(value.ref !== null).assertTrue(); }
      console.info(caseName + ', test end');
    });

  });
}