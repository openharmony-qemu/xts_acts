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

const VALID_VALUES: Array<RegExp> = [
  /abc/gi, /def/m, /^test$/u, new RegExp(''), /测试😀/u, /[\u0000-\u001F]/g, /abc/gi,
];

export default function mapRegExpTest() {
  describe('MapRegExpTest', () => {
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
     * @tc.name testMapRegExpTest0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_REGEXP_TEST_0100
     * @tc.desc Verify Map size and constructor behavior with RegExp dynamic values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMapRegExpTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<RegExp> = VALID_VALUES;
      const emptyMap: Map<RegExp, RegExp> = new Map<RegExp, RegExp>();
      expect(emptyMap.size).assertEqual(0);

      const entries: Array<[RegExp, RegExp]> = [
        [values[0], values[1]], [values[1], values[2]], [values[0], values[3]],
      ];
      const constructed: Map<RegExp, RegExp> = new Map<RegExp, RegExp>(entries);
      expect(constructed.size).assertEqual(2);
      expect(constructed.get(values[0])).assertEqual(values[3]);
      expect(constructed.get(values[1])).assertEqual(values[2]);

      const copied: Map<RegExp, RegExp> = new Map<RegExp, RegExp>(constructed);
      expect(copied.size).assertEqual(constructed.size);
      expect(copied.get(values[0])).assertEqual(values[3]);
    });

    /**
     * @tc.name testMapRegExpTest0200
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_REGEXP_TEST_0200
     * @tc.desc Verify Map set, get, has and duplicate-key replacement with RegExp values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMapRegExpTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<RegExp> = VALID_VALUES;
      const map: Map<RegExp, RegExp> = new Map<RegExp, RegExp>();
      const setResult: Map<RegExp, RegExp> = map.set(values[0], values[1]);
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
     * @tc.name testMapRegExpTest0300
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_REGEXP_TEST_0300
     * @tc.desc Verify Map delete, clear and size transitions with RegExp values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMapRegExpTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<RegExp> = VALID_VALUES;
      const map: Map<RegExp, RegExp> = new Map<RegExp, RegExp>();
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
     * @tc.name testMapRegExpTest0400
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_REGEXP_TEST_0400
     * @tc.desc Verify Map entries, keys, values and forEach insertion order with RegExp values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMapRegExpTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<RegExp> = VALID_VALUES;
      const map: Map<RegExp, RegExp> = new Map<RegExp, RegExp>();
      map.set(values[0], values[1]);
      map.set(values[1], values[2]);

      const entryItem: IteratorResult<[RegExp, RegExp]> = map.entries().next();
      expect(entryItem.done).assertFalse();
      expect(entryItem.value[0]).assertEqual(values[0]);
      expect(entryItem.value[1]).assertEqual(values[1]);

      const keyItem: IteratorResult<RegExp> = map.keys().next();
      expect(keyItem.value).assertEqual(values[0]);
      const valueItem: IteratorResult<RegExp> = map.values().next();
      expect(valueItem.value).assertEqual(values[1]);

      let callbackCount: number = 0;
      let lastKey: RegExp = values[0];
      let lastValue: RegExp = values[1];
      map.forEach((value: RegExp, key: RegExp, _container: Map<RegExp, RegExp>): void => {
        callbackCount++;
        lastKey = key;
        lastValue = value;
      });
      expect(callbackCount).assertEqual(2);
      expect(lastKey).assertEqual(values[1]);
      expect(lastValue).assertEqual(values[2]);
    });

    /**
     * @tc.name testMapRegExpTest0500
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_REGEXP_TEST_0500
     * @tc.desc Verify Map SameValueZero duplicate-key semantics with RegExp values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMapRegExpTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<RegExp> = VALID_VALUES;
      const duplicateEntries: Array<[RegExp, RegExp]> = [
        [values[0], values[1]], [values[0], values[2]],
      ];
      const map: Map<RegExp, RegExp> = new Map<RegExp, RegExp>(duplicateEntries);
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
     * @tc.name testMapRegExpTest0600
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_REGEXP_TEST_0600
     * @tc.desc Verify Map Symbol.iterator and iterator completion with RegExp values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMapRegExpTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<RegExp> = VALID_VALUES;
      const map: Map<RegExp, RegExp> = new Map<RegExp, RegExp>();
      map.set(values[0], values[1]);
      map.set(values[1], values[2]);

      const iterator: Iterator<[RegExp, RegExp]> = map[Symbol.iterator]();
      const first: IteratorResult<[RegExp, RegExp]> = iterator.next();
      expect(first.done).assertFalse();
      expect(first.value[0]).assertEqual(values[0]);
      expect(first.value[1]).assertEqual(values[1]);

      const second: IteratorResult<[RegExp, RegExp]> = iterator.next();
      expect(second.done).assertFalse();
      expect(second.value[0]).assertEqual(values[1]);
      expect(second.value[1]).assertEqual(values[2]);

      const end: IteratorResult<[RegExp, RegExp]> = iterator.next();
      expect(end.done).assertTrue();
    });

  });
}
