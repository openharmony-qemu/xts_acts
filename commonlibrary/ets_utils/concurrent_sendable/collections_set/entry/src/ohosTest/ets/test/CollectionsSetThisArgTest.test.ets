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
 * @file CollectionsSetThisArgTest.test.ets
 * @description collections.Set.forEach thisArg binding unit test cases.
 *              The callback is a regular function expression so that the thisArg supplied
 *              as the second argument is bound to `this` inside the callback (arrow
 *              functions capture `this` lexically and cannot exercise thisArg).
 *              For a Set, the callback receives (value, key) where key === value, plus the
 *              set itself as the third argument.
 * @since 2026
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { collections } from '@kit.ArkTS';

function sleep(time: number): Promise<void> {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

@Sendable
class SetContext {
  public tag: string;
  constructor(tag: string) {
    this.tag = tag;
  }
}

export default function CollectionsSetThisArgTest() {
  describe('CollectionsSetThisArgTest', () => {
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
     * @tc.name case_id_temp_044_collectionsSetForEachWithThisArg
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COLLECTIONS_SET_THISARG_4400
     * @tc.desc   Set.forEach after delete + re-add of one element, with @Sendable SetContext as thisArg;
     *            verify callback args (value === key), insertion order after re-add, and this === thisArg.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('case_id_temp_044_collectionsSetForEachWithThisArg', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'case_id_temp_044';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([1, 2, 3]);
      set.delete(2);
      set.add(2);

      const thisArg: SetContext = new SetContext('s');
      const visited: number[] = [];
      const keys: number[] = [];
      let capturedThis: SetContext | undefined = undefined;
      let capturedSet: collections.Set<number> | undefined = undefined;
      let callCount: number = 0;

      set.forEach(function (value: number, key: number, s: collections.Set<number>): void {
        callCount++;
        visited.push(value);
        keys.push(key);
        capturedThis = this;
        capturedSet = s;
      }, thisArg);

      expect(set.size).assertEqual(3);
      expect(callCount).assertEqual(3);
      expect(visited.length).assertEqual(3);
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual(visited[0]);
      expect(keys[1]).assertEqual(visited[1]);
      expect(keys[2]).assertEqual(visited[2]);
      expect(visited[0]).assertEqual(1);
      expect(visited[1]).assertEqual(3);
      expect(visited[2]).assertEqual(2);
      expect(capturedThis).assertEqual(thisArg);
      expect(capturedSet).assertEqual(set);
      console.info(`${caseName}, test end`);
      done();
    });

    /**
     * @tc.name case_id_temp_045_collectionsSetForEachWithoutThisArg
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_COLLECTIONS_SET_THISARG_4500
     * @tc.desc   Set.forEach without thisArg, verify this is undefined inside the callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('case_id_temp_045_collectionsSetForEachWithoutThisArg', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'case_id_temp_045';
      console.info(`${caseName}, test start`);
      const set: collections.Set<number> = new collections.Set<number>([100, 200]);

      const visited: number[] = [];
      let thisWasUndefined: boolean = false;
      let callCount: number = 0;

      set.forEach(function (value: number, key: number, s: collections.Set<number>): void {
        callCount++;
        thisWasUndefined = (typeof this === 'undefined');
        visited.push(value);
      });

      expect(callCount).assertEqual(2);
      expect(visited.length).assertEqual(2);
      expect(visited.includes(100)).assertEqual(true);
      expect(visited.includes(200)).assertEqual(true);
      expect(thisWasUndefined).assertEqual(true);
      console.info(`${caseName}, test end`);
      done();
    });
  });
}
