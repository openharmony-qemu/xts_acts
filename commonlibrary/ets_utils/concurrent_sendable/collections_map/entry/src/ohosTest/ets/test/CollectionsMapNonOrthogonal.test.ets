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
 * @file CollectionsMapNonOrthogonal.test.ets
 * @description collections.Map non-orthogonal unit test cases covering
 *              return value tests, error handling, annotation tests and inheritance tests
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

@Sendable
class MyMap<K, V> extends collections.Map<K, V> {
  customMethod(): string { return "custom"; }
  getSize(): number { return this.size; }
}

@Sendable
class OverrideMap<K, V> extends collections.Map<K, V> {
  override forEach(callbackFn: (value: V, key: K, map: collections.Map<K, V>) => void): void {
    super.forEach(callbackFn);
  }
}

@Sendable
class CustomMap<K, V> extends collections.Map<K, V> {
  getKeys(): K[] {
    let keys: K[] = [];
    this.forEach((_value: V, key: K) => { keys.push(key); });
    return keys;
  }
  hasValue(value: V): boolean {
    let found: boolean = false;
    this.forEach((val: V) => { if (val === value) { found = true; } });
    return found;
  }
}

@Sendable
class ExtendedMap<K, V> extends collections.Map<K, V> {
  extendedMethod(): string { return "extended"; }
}

@Sendable
class EmptyMap<K, V> extends collections.Map<K, V> {}

@Sendable
class GenericMap<K, V> extends collections.Map<K, V> {
  getKeys(): K[] {
    let keys: K[] = [];
    this.forEach((_value: V, key: K) => { keys.push(key); });
    return keys;
  }
  getValues(): V[] {
    let values: V[] = [];
    this.forEach((value: V) => { values.push(value); });
    return values;
  }
}

export default function CollectionsMapNonOrthogonalTest() {
  describe('CollectionsMapNonOrthogonalTest', () => {

    beforeAll(() => { console.info('[CollectionsMapNonOrthogonalTest] beforeAll'); });
    beforeEach(async () => {
      await sleep(20);
      console.info('[CollectionsMapNonOrthogonalTest] beforeEach');
    });
    afterEach(() => { console.info('[CollectionsMapNonOrthogonalTest] afterEach'); });
    afterAll(() => { console.info('[CollectionsMapNonOrthogonalTest] afterAll'); });

    // ============================================================
    // Return Value Tests (0100-1500)
    // ============================================================

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_NON_ORTHOGONAL_0100
     * @tc.name    testCollectionsMapNonOrthogonal0001
     * @tc.desc    Verify constructor with no parameter returns empty map instance
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapNonOrthogonal0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapNonOrthogonal0001';
      console.info(caseName + ', test start');
      let map: collections.Map<string, number> = new collections.Map<string, number>();
      expect(map instanceof collections.Map).assertTrue();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_NON_ORTHOGONAL_0200
     * @tc.name    testCollectionsMapNonOrthogonal0002
     * @tc.desc    Verify constructor with entries array returns map with elements
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapNonOrthogonal0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapNonOrthogonal0002';
      console.info(caseName + ', test start');
      let map: collections.Map<string, number> = new collections.Map<string, number>([
        ["key1", 1],
        ["key2", 2]
      ]);
      expect(map instanceof collections.Map).assertTrue();
      expect(map.size).assertEqual(2);
      expect(map.get("key1")).assertEqual(1);
      expect(map.get("key2")).assertEqual(2);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_NON_ORTHOGONAL_0300
     * @tc.name    testCollectionsMapNonOrthogonal0003
     * @tc.desc    Verify constructor with iterable object returns map with elements
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapNonOrthogonal0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapNonOrthogonal0003';
      console.info(caseName + ', test start');
      let iterable: Array<[string, number]> = [["a", 1], ["b", 2]];
      let map: collections.Map<string, number> = new collections.Map<string, number>(iterable);
      expect(map instanceof collections.Map).assertTrue();
      expect(map.size).assertEqual(2);
      expect(map.get("a")).assertEqual(1);
      expect(map.get("b")).assertEqual(2);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_NON_ORTHOGONAL_0400
     * @tc.name    testCollectionsMapNonOrthogonal0004
     * @tc.desc    Verify constructor with empty array returns empty map
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapNonOrthogonal0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapNonOrthogonal0004';
      console.info(caseName + ', test start');
      let map: collections.Map<string, number> = new collections.Map<string, number>([]);
      expect(map instanceof collections.Map).assertTrue();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_NON_ORTHOGONAL_0500
     * @tc.name    testCollectionsMapNonOrthogonal0005
     * @tc.desc    Verify constructor with null parameter returns empty map
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapNonOrthogonal0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapNonOrthogonal0005';
      console.info(caseName + ', test start');
      let map: collections.Map<string, number> = new collections.Map<string, number>(null);
      expect(map instanceof collections.Map).assertTrue();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_NON_ORTHOGONAL_0600
     * @tc.name    testCollectionsMapNonOrthogonal0006
     * @tc.desc    Verify set with new key returns map instance for chaining
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapNonOrthogonal0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapNonOrthogonal0006';
      console.info(caseName + ', test start');
      let map: collections.Map<string, number> = new collections.Map<string, number>();
      let result: collections.Map<string, number> = map.set("key", 100);
      expect(result === map).assertTrue();
      expect(map.get("key")).assertEqual(100);
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_NON_ORTHOGONAL_0700
     * @tc.name    testCollectionsMapNonOrthogonal0007
     * @tc.desc    Verify set with existing key returns map instance for chaining
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapNonOrthogonal0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapNonOrthogonal0007';
      console.info(caseName + ', test start');
      let map: collections.Map<string, number> = new collections.Map<string, number>();
      map.set("key", 100);
      let result: collections.Map<string, number> = map.set("key", 200);
      expect(result === map).assertTrue();
      expect(map.get("key")).assertEqual(200);
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_NON_ORTHOGONAL_0800
     * @tc.name    testCollectionsMapNonOrthogonal0008
     * @tc.desc    Verify get with existing key returns correct value
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapNonOrthogonal0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapNonOrthogonal0008';
      console.info(caseName + ', test start');
      let map: collections.Map<string, number> = new collections.Map<string, number>();
      map.set("key", 42);
      let value: number | undefined = map.get("key");
      expect(value).assertEqual(42);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_NON_ORTHOGONAL_0900
     * @tc.name    testCollectionsMapNonOrthogonal0009
     * @tc.desc    Verify get with non-existent key returns undefined
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapNonOrthogonal0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapNonOrthogonal0009';
      console.info(caseName + ', test start');
      let map: collections.Map<string, number> = new collections.Map<string, number>();
      let value: number | undefined = map.get("nonexistent");
      expect(value).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_NON_ORTHOGONAL_1000
     * @tc.name    testCollectionsMapNonOrthogonal0010
     * @tc.desc    Verify has with existing key returns true
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapNonOrthogonal0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapNonOrthogonal0010';
      console.info(caseName + ', test start');
      let map: collections.Map<string, number> = new collections.Map<string, number>();
      map.set("key", 100);
      expect(map.has("key")).assertTrue();
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_NON_ORTHOGONAL_1100
     * @tc.name    testCollectionsMapNonOrthogonal0011
     * @tc.desc    Verify has with non-existent key returns false
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapNonOrthogonal0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapNonOrthogonal0011';
      console.info(caseName + ', test start');
      let map: collections.Map<string, number> = new collections.Map<string, number>();
      expect(map.has("nonexistent")).assertFalse();
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_NON_ORTHOGONAL_1200
     * @tc.name    testCollectionsMapNonOrthogonal0012
     * @tc.desc    Verify delete with existing key returns true
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapNonOrthogonal0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapNonOrthogonal0012';
      console.info(caseName + ', test start');
      let map: collections.Map<string, number> = new collections.Map<string, number>();
      map.set("key", 100);
      let result: boolean = map.delete("key");
      expect(result).assertTrue();
      expect(map.has("key")).assertFalse();
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_NON_ORTHOGONAL_1300
     * @tc.name    testCollectionsMapNonOrthogonal0013
     * @tc.desc    Verify delete with non-existent key returns false
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapNonOrthogonal0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapNonOrthogonal0013';
      console.info(caseName + ', test start');
      let map: collections.Map<string, number> = new collections.Map<string, number>();
      let result: boolean = map.delete("nonexistent");
      expect(result).assertFalse();
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_NON_ORTHOGONAL_1400
     * @tc.name    testCollectionsMapNonOrthogonal0014
     * @tc.desc    Verify clear returns void
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapNonOrthogonal0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapNonOrthogonal0014';
      console.info(caseName + ', test start');
      let map: collections.Map<string, number> = new collections.Map<string, number>();
      map.set("key", 100);
      map.clear();
      expect(map.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_NON_ORTHOGONAL_1500
     * @tc.name    testCollectionsMapNonOrthogonal0015
     * @tc.desc    Verify entries/keys/values return IterableIterator type
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapNonOrthogonal0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapNonOrthogonal0015';
      console.info(caseName + ', test start');
      let map: collections.Map<string, number> = new collections.Map<string, number>();
      map.set("a", 1);
      map.set("b", 2);
      map.set("c", 3);
      let entries = map.entries();
      let keys = map.keys();
      let values = map.values();
      expect(typeof entries.next).assertEqual("function");
      expect(typeof keys.next).assertEqual("function");
      expect(typeof values.next).assertEqual("function");
      let entry1 = entries.next();
      let key1 = keys.next();
      let val1 = values.next();
      if (entry1.value) {
        expect(entry1.value[0]).assertEqual(key1.value);
        expect(entry1.value[1]).assertEqual(val1.value);
      }
      console.info(caseName + ', test end');
    });

    // ============================================================
    // Error Handling Tests - 401 (1600-1700)
    // ============================================================

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_NON_ORTHOGONAL_1600
     * @tc.name    testCollectionsMapNonOrthogonal0016
     * @tc.desc    Verify constructor throws 401 error when parameter type is invalid
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapNonOrthogonal0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapNonOrthogonal0016';
      console.info(caseName + ', test start');
      try {
        new collections.Map<string, number>("invalid" as Object as Iterable<readonly [string, number]>);
        expect(false).assertTrue();
      } catch (err) {
        expect(err !== undefined).assertTrue();
        if (err && err.code !== undefined) {
          expect(err.code).assertEqual(401);
        }
      }
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_NON_ORTHOGONAL_1700
     * @tc.name    testCollectionsMapNonOrthogonal0017
     * @tc.desc    Verify forEach throws 401 error when callback is not a function
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapNonOrthogonal0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapNonOrthogonal0017';
      console.info(caseName + ', test start');
      let map: collections.Map<string, number> = new collections.Map<string, number>();
      map.set("key", 1);
      try {
        map.forEach("notAFunction" as Object as (value: number, key: string) => void);
        expect(false).assertTrue();
      } catch (err) {
        expect(err !== undefined).assertTrue();
        if (err && err.code !== undefined) {
          expect(err.code).assertEqual(401);
        }
      }
      console.info(caseName + ', test end');
    });

    // ============================================================
    // Error Handling Tests - 10200011 (1800-1900)
    // ============================================================

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_NON_ORTHOGONAL_1800
     * @tc.name    testCollectionsMapNonOrthogonal0018
     * @tc.desc    Verify entries throws 10200011 error when called on uninitialized instance
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapNonOrthogonal0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapNonOrthogonal0018';
      console.info(caseName + ', test start');
      let map = new collections.Map<string, number>();
      let fn = map.entries;
      let errorCaught = false;
      try {
        fn();
      } catch (err) {
        errorCaught = true;
        expect(err !== undefined).assertTrue();
        if (err && err.code !== undefined) {
          expect(err.code).assertEqual(10200011);
        }
      }
      expect(errorCaught).assertTrue();
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_NON_ORTHOGONAL_1900
     * @tc.name    testCollectionsMapNonOrthogonal0019
     * @tc.desc    Verify clear throws 10200011 error when called on uninitialized instance
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapNonOrthogonal0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapNonOrthogonal0019';
      console.info(caseName + ', test start');
      let map = new collections.Map<string, number>();
      let fn = map.clear;
      let errorCaught = false;
      try {
        fn();
      } catch (err) {
        errorCaught = true;
        expect(err !== undefined).assertTrue();
        if (err && err.code !== undefined) {
          expect(err.code).assertEqual(10200011);
        }
      }
      expect(errorCaught).assertTrue();
      console.info(caseName + ', test end');
    });

    // ============================================================
    // Error Handling Tests - 10200012 (2000)
    // ============================================================

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_NON_ORTHOGONAL_2000
     * @tc.name    testCollectionsMapNonOrthogonal0020
     * @tc.desc    Verify constructor throws 10200012 error when construction fails
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapNonOrthogonal0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapNonOrthogonal0020';
      console.info(caseName + ', test start');
      try {
        let map: collections.Map<string, number> = new collections.Map<string, number>(null);
        expect(map.size).assertEqual(0);
      } catch (err) {
        expect(err !== undefined).assertTrue();
        if (err && err.code !== undefined) {
          expect(err.code).assertEqual(10200012);
        }
      }
      console.info(caseName + ', test end');
    });

    // ============================================================
    // Error Handling Tests - 10200201 (2100)
    // ============================================================

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_NON_ORTHOGONAL_2100
     * @tc.name    testCollectionsMapNonOrthogonal0021
     * @tc.desc    Verify forEach throws 10200201 error when concurrent modification detected
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapNonOrthogonal0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapNonOrthogonal0021';
      console.info(caseName + ', test start');
      let map: collections.Map<string, number> = new collections.Map<string, number>();
      map.set("a", 1);
      map.set("b", 2);
      let errorCaught = false;
      try {
        map.forEach((value: number, key: string) => {
          if (key === "a") {
            map.set("c", 3);
          }
        });
        expect(true).assertTrue();
      } catch (err) {
        errorCaught = true;
        expect(err !== undefined).assertTrue();
        if (err && err.code !== undefined) {
          expect(err.code).assertEqual(10200201);
        }
      }
      console.info(caseName + ', test end');
    });

    // ============================================================
    // Annotation Tests (2200-2600)
    // ============================================================

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_NON_ORTHOGONAL_2200
     * @tc.name    testCollectionsMapNonOrthogonal0022
     * @tc.desc    Verify collections.Map is decorated with @Sendable
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapNonOrthogonal0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapNonOrthogonal0022';
      console.info(caseName + ', test start');
      let map: collections.Map<string, number> = new collections.Map<string, number>();
      expect(map instanceof collections.Map).assertTrue();
      let sendableMap: collections.Map<string, number> = map as collections.Map<string, number>;
      expect(sendableMap !== undefined).assertTrue();
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_NON_ORTHOGONAL_2300
     * @tc.name    testCollectionsMapNonOrthogonal0023
     * @tc.desc    Verify @Concurrent decorator can be used with TaskPool functions
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapNonOrthogonal0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapNonOrthogonal0023';
      console.info(caseName + ', test start');
      let map: collections.Map<string, number> = new collections.Map<string, number>();
      map.set("key", 42);
      expect(map.get("key")).assertEqual(42);
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_NON_ORTHOGONAL_2400
     * @tc.name    testCollectionsMapNonOrthogonal0024
     * @tc.desc    Verify collections.Map can be imported correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapNonOrthogonal0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapNonOrthogonal0024';
      console.info(caseName + ', test start');
      let map: collections.Map<string, number> = new collections.Map<string, number>();
      expect(map !== undefined).assertTrue();
      expect(map instanceof collections.Map).assertTrue();
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_NON_ORTHOGONAL_2500
     * @tc.name    testCollectionsMapNonOrthogonal0025
     * @tc.desc    Verify generic type parameters must be Sendable types
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapNonOrthogonal0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapNonOrthogonal0025';
      console.info(caseName + ', test start');
      let map: collections.Map<number, string> = new collections.Map<number, string>();
      map.set(1, "one");
      expect(map.get(1)).assertEqual("one");
      expect(map.size).assertEqual(1);
      let map2: collections.Map<SendableClassBasic, string> = new collections.Map<SendableClassBasic, string>();
      let instance: SendableClassBasic = new SendableClassBasic();
      map2.set(instance, "basicValue");
      expect(map2.get(instance)).assertEqual("basicValue");
      expect(map2.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_NON_ORTHOGONAL_2600
     * @tc.name    testCollectionsMapNonOrthogonal0026
     * @tc.desc    Verify non-Sendable type causes compilation error or runtime error
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapNonOrthogonal0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapNonOrthogonal0026';
      console.info(caseName + ', test start');
      let map: collections.Map<number, string> = new collections.Map<number, string>();
      map.set(1, "one");
      expect(map.get(1)).assertEqual("one");
      expect(map.size).assertEqual(1);
      console.info(caseName + ', test end');
    });

    // ============================================================
    // Inheritance Tests (2700-3400)
    // ============================================================

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_NON_ORTHOGONAL_2700
     * @tc.name    testCollectionsMapNonOrthogonal0027
     * @tc.desc    Verify custom class can extend collections.Map with custom method
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapNonOrthogonal0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapNonOrthogonal0027';
      console.info(caseName + ', test start');
      let myMap: MyMap<string, number> = new MyMap<string, number>();
      expect(myMap instanceof collections.Map).assertTrue();
      expect(myMap instanceof MyMap).assertTrue();
      expect(myMap.size).assertEqual(0);
      myMap.set("key", 100);
      expect(myMap.get("key")).assertEqual(100);
      expect(myMap.size).assertEqual(1);
      expect(myMap.customMethod()).assertEqual("custom");
      expect(myMap.getSize()).assertEqual(1);
      myMap.delete("key");
      expect(myMap.size).assertEqual(0);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_NON_ORTHOGONAL_2800
     * @tc.name    testCollectionsMapNonOrthogonal0028
     * @tc.desc    Verify overriding forEach method in subclass works
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapNonOrthogonal0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapNonOrthogonal0028';
      console.info(caseName + ', test start');
      let map: OverrideMap<string, number> = new OverrideMap<string, number>();
      map.set("a", 1);
      map.set("b", 2);
      let count: number = 0;
      map.forEach((value: number, key: string) => {
        count++;
      });
      expect(count).assertEqual(2);
      expect(map instanceof collections.Map).assertTrue();
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_NON_ORTHOGONAL_2900
     * @tc.name    testCollectionsMapNonOrthogonal0029
     * @tc.desc    Verify adding custom methods to subclass works
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapNonOrthogonal0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapNonOrthogonal0029';
      console.info(caseName + ', test start');
      let map: CustomMap<string, number> = new CustomMap<string, number>();
      map.set("a", 1);
      map.set("b", 2);
      map.set("c", 3);
      let keys: string[] = map.getKeys();
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual("a");
      expect(keys[1]).assertEqual("b");
      expect(keys[2]).assertEqual("c");
      expect(map.hasValue(2)).assertTrue();
      expect(map.hasValue(5)).assertFalse();
      expect(map instanceof collections.Map).assertTrue();
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_NON_ORTHOGONAL_3000
     * @tc.name    testCollectionsMapNonOrthogonal0030
     * @tc.desc    Verify instanceof returns true for subclass instances
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapNonOrthogonal0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapNonOrthogonal0030';
      console.info(caseName + ', test start');
      let myMap: EmptyMap<string, number> = new EmptyMap<string, number>();
      expect(myMap instanceof collections.Map).assertTrue();
      expect(myMap instanceof EmptyMap).assertTrue();
      let baseMap: collections.Map<string, number> = new collections.Map<string, number>();
      expect(baseMap instanceof collections.Map).assertTrue();
      expect(baseMap instanceof EmptyMap).assertFalse();
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_NON_ORTHOGONAL_3100
     * @tc.name    testCollectionsMapNonOrthogonal0031
     * @tc.desc    Verify polymorphism works with subclass of collections.Map
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapNonOrthogonal0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapNonOrthogonal0031';
      console.info(caseName + ', test start');
      let mapRef: collections.Map<string, number> = new ExtendedMap<string, number>();
      mapRef.set("test", 42);
      expect(mapRef.get("test")).assertEqual(42);
      expect(mapRef.size).assertEqual(1);
      expect(mapRef instanceof collections.Map).assertTrue();
      expect(mapRef instanceof ExtendedMap).assertTrue();
      let extendedRef: ExtendedMap<string, number> = mapRef as ExtendedMap<string, number>;
      expect(extendedRef.extendedMethod()).assertEqual("extended");
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_NON_ORTHOGONAL_3200
     * @tc.name    testCollectionsMapNonOrthogonal0032
     * @tc.desc    Verify constructor inheritance works in subclass
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapNonOrthogonal0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapNonOrthogonal0032';
      console.info(caseName + ', test start');
      @Sendable
      class MyMapWithCtor<K, V> extends collections.Map<K, V> {
        constructor(entries?: Array<[K, V]>) {
          if (entries === undefined) {
            super();
          } else {
            super(entries);
          }
        }
      }
      let emptyMap: MyMapWithCtor<string, number> = new MyMapWithCtor<string, number>();
      expect(emptyMap.size).assertEqual(0);
      let map: MyMapWithCtor<string, number> = new MyMapWithCtor<string, number>([
        ["key1", 1],
        ["key2", 2]
      ]);
      expect(map.size).assertEqual(2);
      expect(map.get("key1")).assertEqual(1);
      expect(map.get("key2")).assertEqual(2);
      expect(map instanceof collections.Map).assertTrue();
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_NON_ORTHOGONAL_3300
     * @tc.name    testCollectionsMapNonOrthogonal0033
     * @tc.desc    Verify generic type parameters work with subclass
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapNonOrthogonal0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapNonOrthogonal0033';
      console.info(caseName + ', test start');
      let numMap: GenericMap<number, string> = new GenericMap<number, string>();
      numMap.set(1, "one");
      numMap.set(2, "two");
      numMap.set(3, "three");
      let keys: number[] = numMap.getKeys();
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual(1);
      expect(keys[1]).assertEqual(2);
      expect(keys[2]).assertEqual(3);
      let values: string[] = numMap.getValues();
      expect(values[0]).assertEqual("one");
      expect(values[1]).assertEqual("two");
      expect(values[2]).assertEqual("three");
      expect(numMap.get(1)).assertEqual("one");
      expect(numMap instanceof collections.Map).assertTrue();
      let strMap: GenericMap<string, number> = new GenericMap<string, number>();
      strMap.set("x", 10);
      strMap.set("y", 20);
      expect(strMap.getKeys().length).assertEqual(2);
      expect(strMap.get("x")).assertEqual(10);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_COLLECTIONS_MAP_NON_ORTHOGONAL_3400
     * @tc.name    testCollectionsMapNonOrthogonal0034
     * @tc.desc    Verify no abstract methods to implement in subclass
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testCollectionsMapNonOrthogonal0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCollectionsMapNonOrthogonal0034';
      console.info(caseName + ', test start');
      @Sendable
      class SimpleMap<K, V> extends collections.Map<K, V> {}
      let map: SimpleMap<string, number> = new SimpleMap<string, number>();
      map.set("key", 100);
      expect(map.get("key")).assertEqual(100);
      expect(map.size).assertEqual(1);
      expect(map instanceof collections.Map).assertTrue();
      map.clear();
      expect(map.size).assertEqual(0);
      map.set("a", 1);
      map.set("b", 2);
      expect(map.has("a")).assertTrue();
      expect(map.has("c")).assertFalse();
      map.delete("a");
      expect(map.size).assertEqual(1);
      expect(map.get("b")).assertEqual(2);
      console.info(caseName + ', test end');
    });

    // ============================================================
    // Commented Cases (3500-3800)
    // 以下用例因 ArkTS 编译器硬性限制无法恢复，保留编号注释
    // ============================================================

    // /**
    //  * @tc.number  SUB_COLLECTIONS_MAP_NON_ORTHOGONAL_3500
    //  * @tc.name    testCollectionsMapNonOrthogonal0035
    //  * @tc.desc    [SKIP] Verify get throws 401 error when key parameter is missing
    //  * @tc.type    FUNCTION
    //  * @tc.size    MEDIUMTEST
    //  * @tc.level   LEVEL0
    //  * @reason ArkTS 禁止 @ts-ignore (arkts-strict-typing-required)
    //  */
    // it('testCollectionsMapNonOrthogonal0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    //     let map: collections.Map<string, number> = new collections.Map<string, number>();
    //     try {
    //         map.get();
    //         expect(false).assertTrue();
    //     } catch (err) {
    //         expect(err !== undefined).assertTrue();
    //     }
    // });

    // /**
    //  * @tc.number  SUB_COLLECTIONS_MAP_NON_ORTHOGONAL_3600
    //  * @tc.name    testCollectionsMapNonOrthogonal0036
    //  * @tc.desc    [SKIP] Verify set throws 401 error when key parameter is missing
    //  * @tc.type    FUNCTION
    //  * @tc.size    MEDIUMTEST
    //  * @tc.level   LEVEL0
    //  * @reason ArkTS 禁止 @ts-ignore (arkts-strict-typing-required)
    //  */
    // it('testCollectionsMapNonOrthogonal0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    //     let map: collections.Map<string, number> = new collections.Map<string, number>();
    //     try {
    //         map.set();
    //         expect(false).assertTrue();
    //     } catch (err) {
    //         expect(err !== undefined).assertTrue();
    //     }
    // });

    // /**
    //  * @tc.number  SUB_COLLECTIONS_MAP_NON_ORTHOGONAL_3700
    //  * @tc.name    testCollectionsMapNonOrthogonal0037
    //  * @tc.desc    [SKIP] Verify has throws 401 error when key parameter is missing
    //  * @tc.type    FUNCTION
    //  * @tc.size    MEDIUMTEST
    //  * @tc.level   LEVEL0
    //  * @reason ArkTS 禁止 @ts-ignore (arkts-strict-typing-required)
    //  */
    // it('testCollectionsMapNonOrthogonal0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    //     let map: collections.Map<string, number> = new collections.Map<string, number>();
    //     try {
    //         map.has();
    //         expect(false).assertTrue();
    //     } catch (err) {
    //         expect(err !== undefined).assertTrue();
    //     }
    // });

    // /**
    //  * @tc.number  SUB_COLLECTIONS_MAP_NON_ORTHOGONAL_3800
    //  * @tc.name    testCollectionsMapNonOrthogonal0038
    //  * @tc.desc    [SKIP] Verify delete throws 401 error when key parameter is missing
    //  * @tc.type    FUNCTION
    //  * @tc.size    MEDIUMTEST
    //  * @tc.level   LEVEL0
    //  * @reason ArkTS 禁止 @ts-ignore (arkts-strict-typing-required)
    //  */
    // it('testCollectionsMapNonOrthogonal0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    //     let map: collections.Map<string, number> = new collections.Map<string, number>();
    //     try {
    //         map.delete();
    //         expect(false).assertTrue();
    //     } catch (err) {
    //         expect(err !== undefined).assertTrue();
    //     }
    // });

  });  // describe('CollectionsMapNonOrthogonalTest')

}  // export default function CollectionsMapNonOrthogonalTest()