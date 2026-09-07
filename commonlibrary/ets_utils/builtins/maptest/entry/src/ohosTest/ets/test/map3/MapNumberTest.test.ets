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

const VALID_VALUES: Array<number> = [
  1, 100.5, -99.9, 0, Math.floor(1.5), 123.456, 0xcafebabe, 2 ** 3, 1.2e3, 1e3,
  2.5e-2, 0x12, 0x0102, 0x01020304, 0x3, 0o12, 0b1010, NaN, Infinity, -Infinity,
  -0, Number.MAX_VALUE, Number.MAX_VALUE + 1, Number.MIN_VALUE, Number.MIN_VALUE - 1, Number.EPSILON,
  Number.MAX_SAFE_INTEGER, Number.MIN_SAFE_INTEGER, -128, 127, -32768, 32767, -2147483648,
  2147483647, -9223372036854775808, 9223372036854775807, -1.40129846432481707e-45,
  1.40129846432481707e-45, -3.4028234663852886e38, 3.4028234663852886e38, 65535,
  -1, 999999.99, 13800138000, 123456, -100.5,
];

export default function mapNumberTest() {
  describe('MapNumberTest', () => {
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
     * @tc.name testMapNumberTest0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NUMBER_TEST_0100
     * @tc.desc Verify Map size and constructor behavior with Number dynamic values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMapNumberTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<number> = VALID_VALUES;
      const emptyMap: Map<number, number> = new Map<number, number>();
      expect(emptyMap.size).assertEqual(0);

      const entries: Array<[number, number]> = [
        [values[0], values[1]], [values[1], values[2]], [values[0], values[3]],
      ];
      const constructed: Map<number, number> = new Map<number, number>(entries);
      expect(constructed.size).assertEqual(2);
      expect(constructed.get(values[0])).assertEqual(values[3]);
      expect(constructed.get(values[1])).assertEqual(values[2]);

      const copied: Map<number, number> = new Map<number, number>(constructed);
      expect(copied.size).assertEqual(constructed.size);
      expect(copied.get(values[0])).assertEqual(values[3]);
    });

    /**
     * @tc.name testMapNumberTest0200
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NUMBER_TEST_0200
     * @tc.desc Verify Map set, get, has and duplicate-key replacement with Number values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMapNumberTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<number> = VALID_VALUES;
      const map: Map<number, number> = new Map<number, number>();
      const setResult: Map<number, number> = map.set(values[0], values[1]);
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
     * @tc.name testMapNumberTest0300
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NUMBER_TEST_0300
     * @tc.desc Verify Map delete, clear and size transitions with Number values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMapNumberTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<number> = VALID_VALUES;
      const map: Map<number, number> = new Map<number, number>();
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
     * @tc.name testMapNumberTest0400
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NUMBER_TEST_0400
     * @tc.desc Verify Map entries, keys, values and forEach insertion order with Number values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMapNumberTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<number> = VALID_VALUES;
      const map: Map<number, number> = new Map<number, number>();
      map.set(values[0], values[1]);
      map.set(values[1], values[2]);

      const entryItem: IteratorResult<[number, number]> = map.entries().next();
      expect(entryItem.done).assertFalse();
      expect(entryItem.value[0]).assertEqual(values[0]);
      expect(entryItem.value[1]).assertEqual(values[1]);

      const keyItem: IteratorResult<number> = map.keys().next();
      expect(keyItem.value).assertEqual(values[0]);
      const valueItem: IteratorResult<number> = map.values().next();
      expect(valueItem.value).assertEqual(values[1]);

      let callbackCount: number = 0;
      let lastKey: number = values[0];
      let lastValue: number = values[1];
      map.forEach((value: number, key: number, _container: Map<number, number>): void => {
        callbackCount++;
        lastKey = key;
        lastValue = value;
      });
      expect(callbackCount).assertEqual(2);
      expect(lastKey).assertEqual(values[1]);
      expect(lastValue).assertEqual(values[2]);
    });

    /**
     * @tc.name testMapNumberTest0500
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NUMBER_TEST_0500
     * @tc.desc Verify Map SameValueZero duplicate-key semantics with Number values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMapNumberTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<number> = VALID_VALUES;
      const duplicateEntries: Array<[number, number]> = [
        [values[0], values[1]], [values[0], values[2]],
      ];
      const map: Map<number, number> = new Map<number, number>(duplicateEntries);
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
     * @tc.name testMapNumberTest0600
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_NUMBER_TEST_0600
     * @tc.desc Verify Map Symbol.iterator and iterator completion with Number values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMapNumberTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<number> = VALID_VALUES;
      const map: Map<number, number> = new Map<number, number>();
      map.set(values[0], values[1]);
      map.set(values[1], values[2]);

      const iterator: Iterator<[number, number]> = map[Symbol.iterator]();
      const first: IteratorResult<[number, number]> = iterator.next();
      expect(first.done).assertFalse();
      expect(first.value[0]).assertEqual(values[0]);
      expect(first.value[1]).assertEqual(values[1]);

      const second: IteratorResult<[number, number]> = iterator.next();
      expect(second.done).assertFalse();
      expect(second.value[0]).assertEqual(values[1]);
      expect(second.value[1]).assertEqual(values[2]);

      const end: IteratorResult<[number, number]> = iterator.next();
      expect(end.done).assertTrue();
    });

  });
}
