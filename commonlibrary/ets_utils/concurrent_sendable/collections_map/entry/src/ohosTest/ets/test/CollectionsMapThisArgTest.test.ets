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
 * @file CollectionsMapThisArgTest.test.ets
 * @description collections.Map.forEach thisArg binding unit test cases.
 *              The callback is a regular function expression so that the thisArg supplied
 *              as the second argument is bound to `this` inside the callback (arrow
 *              functions capture `this` lexically and cannot exercise thisArg).
 * @since 2026
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { collections } from '@kit.ArkTS';

function sleep(time: number): Promise<void> {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

@Sendable
class MapContext {
  public tag: string;
  constructor(tag: string) {
    this.tag = tag;
  }
}

export default function CollectionsMapThisArgTest() {
  describe('CollectionsMapThisArgTest', () => {
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
     * @tc.name case_id_temp_023_collectionsMapForEachWithThisArg
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COLLECTIONS_MAP_THISARG_2300
     * @tc.desc   Map.forEach after deleting 1 of 3 entries, with @Sendable MapContext as thisArg;
     *            verify the deleted entry is skipped, callback args (value/key) are correct,
     *            and this === thisArg inside the callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('case_id_temp_023_collectionsMapForEachWithThisArg', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'case_id_temp_023';
      console.info(`${caseName}, test start`);
      const map: collections.Map<number, string> = new collections.Map<number, string>();
      map.set(1, 'one');
      map.set(2, 'two');
      map.set(3, 'three');
      map.delete(2);

      const thisArg: MapContext = new MapContext('ctx');
      const visited: string[] = [];
      let capturedThis: MapContext | undefined = undefined;
      let capturedMap: collections.Map<number, string> | undefined = undefined;
      let callCount: number = 0;

      map.forEach(function (value: string, key: number, m: collections.Map<number, string>): void {
        callCount++;
        visited.push(`${this.tag}:${key}=${value}`);
        capturedThis = this;
        capturedMap = m;
      }, thisArg);

      expect(map.size).assertEqual(2);
      expect(callCount).assertEqual(2);
      expect(visited.length).assertEqual(2);
      expect(visited[0]).assertEqual('ctx:1=one');
      expect(visited[1]).assertEqual('ctx:3=three');
      expect(capturedThis).assertEqual(thisArg);
      expect(capturedMap).assertEqual(map);
      console.info(`${caseName}, test end`);
      done();
    });

    /**
     * @tc.name case_id_temp_024_collectionsMapForEachWithoutThisArg
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COLLECTIONS_MAP_THISARG_2400
     * @tc.desc   Map.forEach without thisArg, verify this is undefined inside the callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('case_id_temp_024_collectionsMapForEachWithoutThisArg', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'case_id_temp_024';
      console.info(`${caseName}, test start`);
      const map: collections.Map<number, string> = new collections.Map<number, string>();
      map.set(10, 'ten');
      map.set(20, 'twenty');

      const visited: string[] = [];
      let thisWasUndefined: boolean = false;
      let callCount: number = 0;

      map.forEach(function (value: string, key: number, m: collections.Map<number, string>): void {
        callCount++;
        thisWasUndefined = (typeof this === 'undefined');
        visited.push(`${key}=${value}`);
      });

      expect(callCount).assertEqual(2);
      expect(visited.length).assertEqual(2);
      expect(visited[0]).assertEqual('10=ten');
      expect(visited[1]).assertEqual('20=twenty');
      expect(thisWasUndefined).assertEqual(true);
      console.info(`${caseName}, test end`);
      done();
    });
  });
}
