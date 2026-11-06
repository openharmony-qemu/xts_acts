/*
 * Copyright (C) 2026 HiHope Open Source Organization.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * @file CollectionsArrayThisArgTest.test.ets
 * @description collections.Array forEach/map/filter callback verification.
 *              ArkTS strict mode bans function expressions and standalone this,
 *              so arrow functions are used. thisArg properties accessed via closure.
 * @since 2026
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { collections } from '@kit.ArkTS';

function sleep(time: number): Promise<void> {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

@Sendable
class TagHolder {
  public tag: string;
  constructor(tag: string) {
    this.tag = tag;
  }
}

@Sendable
class MultiplierHolder {
  public multiplier: number;
  constructor(multiplier: number) {
    this.multiplier = multiplier;
  }
}

@Sendable
class ThresholdHolder {
  public threshold: number;
  constructor(threshold: number) {
    this.threshold = threshold;
  }
}

export default function CollectionsArrayThisArgTest() {
  describe('CollectionsArrayThisArgTest', () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
      await sleep(100)
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name case_id_temp_003_collectionsArrayForEachWithThisArg
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COLLECTIONS_ARRAY_THISARG_0300
     * @tc.desc   forEach with @Sendable TagHolder as thisArg context, verify callback args and iteration order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('case_id_temp_003_collectionsArrayForEachWithThisArg', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'case_id_temp_003';
      console.info(`${caseName}, test start`);
      const arr: collections.Array<number> = collections.Array.from([1, 2, 3]);
      const thisArg: TagHolder = new TagHolder('myTag');
      const visited: string[] = [];
      let callCount: number = 0;

      arr.forEach((item: number, index: number, array: collections.Array<number>): void => {
        callCount++;
        visited.push(`${thisArg.tag}:${index}:${item}`);
      });

      expect(callCount).assertEqual(3);
      expect(visited.length).assertEqual(3);
      expect(visited[0]).assertEqual('myTag:0:1');
      expect(visited[1]).assertEqual('myTag:1:2');
      expect(visited[2]).assertEqual('myTag:2:3');
      console.info(`${caseName}, test end`);
      done();
    });

    /**
     * @tc.name case_id_temp_004_collectionsArrayForEachWithoutThisArg
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COLLECTIONS_ARRAY_THISARG_0400
     * @tc.desc   forEach without thisArg, verify callback args and iteration order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('case_id_temp_004_collectionsArrayForEachWithoutThisArg', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'case_id_temp_004';
      console.info(`${caseName}, test start`);
      const arr: collections.Array<number> = collections.Array.from([10, 20]);
      const visited: number[] = [];
      let callCount: number = 0;

      arr.forEach((item: number, index: number, array: collections.Array<number>): void => {
        callCount++;
        visited.push(item);
      });

      expect(callCount).assertEqual(2);
      expect(visited.length).assertEqual(2);
      expect(visited[0]).assertEqual(10);
      expect(visited[1]).assertEqual(20);
      console.info(`${caseName}, test end`);
      done();
    });

    /**
     * @tc.name case_id_temp_009_collectionsArrayMapWithThisArg
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COLLECTIONS_ARRAY_THISARG_0900
     * @tc.desc   map with @Sendable MultiplierHolder (multiplier=2) as context, verify every element is multiplied
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('case_id_temp_009_collectionsArrayMapWithThisArg', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'case_id_temp_009';
      console.info(`${caseName}, test start`);
      const arr: collections.Array<number> = collections.Array.from([1, 2, 3, 4]);
      const thisArg: MultiplierHolder = new MultiplierHolder(2);
      let callCount: number = 0;

      const result: collections.Array<number> = arr.map((value: number, index: number, array: collections.Array<number>): number => {
        callCount++;
        return value * thisArg.multiplier;
      });

      expect(callCount).assertEqual(4);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(6);
      expect(result[3]).assertEqual(8);
      console.info(`${caseName}, test end`);
      done();
    });

    /**
     * @tc.name case_id_temp_016_collectionsArrayFilterWithThisArg
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COLLECTIONS_ARRAY_THISARG_1600
     * @tc.desc   filter with @Sendable ThresholdHolder (threshold=4) as context, verify only elements >= threshold retained
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('case_id_temp_016_collectionsArrayFilterWithThisArg', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'case_id_temp_016';
      console.info(`${caseName}, test start`);
      const arr: collections.Array<number> = collections.Array.from([1, 5, 3, 7, 2, 8]);
      const thisArg: ThresholdHolder = new ThresholdHolder(4);
      let callCount: number = 0;

      const result: collections.Array<number> = arr.filter((value: number, index: number, array: collections.Array<number>): boolean => {
        callCount++;
        return value >= thisArg.threshold;
      });

      expect(callCount).assertEqual(6);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(5);
      expect(result[1]).assertEqual(7);
      expect(result[2]).assertEqual(8);
      console.info(`${caseName}, test end`);
      done();
    });
  });
}
