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

import { beforeAll, beforeEach, afterEach, afterAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

function sleep(time: number): Promise<void> {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

const VALID_VALUES: Array<bigint> = [
  100n, -99n, BigInt('9007199254740991'), BigInt(Number.MAX_SAFE_INTEGER), 9007199254740991n,
  -9007199254740991n, 0n, BigInt('0'), BigInt('123456789012345678901234567890'),
  BigInt('138001380001234567890'), BigInt('100000000000000000000000'), -1n,
];

export default function mapBigIntTest() {
  describe('MapBigIntTest', () => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await sleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.name testMapBigIntTest0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_BIGINT_TEST_0100
     * @tc.desc Verify Map size and constructor behavior with BigInt dynamic values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMapBigIntTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<bigint> = VALID_VALUES;
      const emptyMap: Map<bigint, bigint> = new Map<bigint, bigint>();
      expect(emptyMap.size).assertEqual(0);

      const entries: Array<[bigint, bigint]> = [
        [values[0], values[1]], [values[1], values[2]], [values[0], values[3]],
      ];
      const constructed: Map<bigint, bigint> = new Map<bigint, bigint>(entries);
      expect(constructed.size).assertEqual(2);
      expect(constructed.get(values[0])).assertEqual(values[3]);
      expect(constructed.get(values[1])).assertEqual(values[2]);

      const copied: Map<bigint, bigint> = new Map<bigint, bigint>(constructed);
      expect(copied.size).assertEqual(constructed.size);
      expect(copied.get(values[0])).assertEqual(values[3]);
    });

    /**
     * @tc.name testMapBigIntTest0200
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_BIGINT_TEST_0200
     * @tc.desc Verify Map set, get, has and duplicate-key replacement with BigInt values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMapBigIntTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<bigint> = VALID_VALUES;
      const map: Map<bigint, bigint> = new Map<bigint, bigint>();
      const setResult: Map<bigint, bigint> = map.set(values[0], values[1]);
      expect(setResult).assertEqual(map);
      expect(map.has(values[0])).assertTrue();
      expect(map.get(values[0])).assertEqual(values[1]);
      expect(map.has(values[1])).assertFalse();
      expect(map.get(values[1])).assertUndefined();

      map.set(values[0], values[2]);
      expect(map.size).assertEqual(1);
      expect(map.get(values[0])).assertEqual(values[2]);
    });

    /**
     * @tc.name testMapBigIntTest0300
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_BIGINT_TEST_0300
     * @tc.desc Verify Map delete, clear and size transitions with BigInt values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMapBigIntTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<bigint> = VALID_VALUES;
      const map: Map<bigint, bigint> = new Map<bigint, bigint>();
      map.set(values[0], values[1]);
      map.set(values[1], values[2]);
      const beforeDeleteSize: number = map.size;
      expect(beforeDeleteSize).assertEqual(2);

      const deleted: boolean = map.delete(values[0]);
      expect(deleted).assertTrue();
      expect(map.has(values[0])).assertFalse();
      expect(map.size).assertEqual(beforeDeleteSize - 1);

      const missingDelete: boolean = map.delete(values[0]);
      expect(missingDelete).assertFalse();
      map.clear();
      expect(map.size).assertEqual(0);
      map.set(values[2], values[3]);
      expect(map.get(values[2])).assertEqual(values[3]);
    });

    /**
     * @tc.name testMapBigIntTest0400
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_BIGINT_TEST_0400
     * @tc.desc Verify Map entries, keys, values and forEach insertion order with BigInt values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMapBigIntTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<bigint> = VALID_VALUES;
      const map: Map<bigint, bigint> = new Map<bigint, bigint>();
      map.set(values[0], values[1]);
      map.set(values[1], values[2]);

      const entryItem: IteratorResult<[bigint, bigint]> = map.entries().next();
      expect(entryItem.done).assertFalse();
      expect(entryItem.value[0]).assertEqual(values[0]);
      expect(entryItem.value[1]).assertEqual(values[1]);

      const keyItem: IteratorResult<bigint> = map.keys().next();
      expect(keyItem.value).assertEqual(values[0]);
      const valueItem: IteratorResult<bigint> = map.values().next();
      expect(valueItem.value).assertEqual(values[1]);

      let callbackCount: number = 0;
      let lastKey: bigint = values[0];
      let lastValue: bigint = values[1];
      map.forEach((value: bigint, key: bigint, _container: Map<bigint, bigint>): void => {
        callbackCount++;
        lastKey = key;
        lastValue = value;
      });
      expect(callbackCount).assertEqual(2);
      expect(lastKey).assertEqual(values[1]);
      expect(lastValue).assertEqual(values[2]);
    });

    /**
     * @tc.name testMapBigIntTest0500
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_BIGINT_TEST_0500
     * @tc.desc Verify Map SameValueZero duplicate-key semantics with BigInt values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMapBigIntTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<bigint> = VALID_VALUES;
      const duplicateEntries: Array<[bigint, bigint]> = [
        [values[0], values[1]], [values[0], values[2]],
      ];
      const map: Map<bigint, bigint> = new Map<bigint, bigint>(duplicateEntries);
      expect(map.size).assertEqual(1);
      expect(map.get(values[0])).assertEqual(values[2]);
      expect(map.has(values[0])).assertTrue();

      map.set(values[1], values[3]);
      expect(map.size).assertEqual(2);
      expect(map.get(values[1])).assertEqual(values[3]);
      expect(map.delete(values[1])).assertTrue();
      expect(map.has(values[1])).assertFalse();
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.name testMapBigIntTest0600
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_BIGINT_TEST_0600
     * @tc.desc Verify Map Symbol.iterator and iterator completion with BigInt values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMapBigIntTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<bigint> = VALID_VALUES;
      const map: Map<bigint, bigint> = new Map<bigint, bigint>();
      map.set(values[0], values[1]);
      map.set(values[1], values[2]);

      const iterator: Iterator<[bigint, bigint]> = map[Symbol.iterator]();
      const first: IteratorResult<[bigint, bigint]> = iterator.next();
      expect(first.done).assertFalse();
      expect(first.value[0]).assertEqual(values[0]);
      expect(first.value[1]).assertEqual(values[1]);

      const second: IteratorResult<[bigint, bigint]> = iterator.next();
      expect(second.done).assertFalse();
      expect(second.value[0]).assertEqual(values[1]);
      expect(second.value[1]).assertEqual(values[2]);

      const end: IteratorResult<[bigint, bigint]> = iterator.next();
      expect(end.done).assertTrue();
    });

  });
}
