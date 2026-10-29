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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, TestType, Size } from '@ohos/hypium';
import { collections } from '@kit.ArkTS';

function sleep(time: number): Promise<void> {
  return new Promise<void>((resolve: (v: void) => void): void => {
    setTimeout((): void => {
      resolve();
    }, time);
  });
}

export default function CollectionsMapEntriesOrderTest() {
  describe('CollectionsMapEntriesOrderTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
    })
    beforeEach(async () => {
      await sleep(30);
      // Presets an action, which is performed before each unit test case starts.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
    })

    /**
     * @tc.name   collectionsMapEntriesOrderTest0029
     * @tc.number SUB_COLLECTIONS_MAP_ENTRIES_ORDER_0029
     * @tc.desc   case_id_temp_029: iterating the map directly via @@iterator yields the same entry sequence as map.entries()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapEntriesOrderTest0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function): Promise<void> => {
      const map: collections.Map<string, number> = new collections.Map<string, number>([['a', 1], ['b', 2], ['c', 3]]);
      const fromForOf: [string, number][] = [];
      for (const entry of map) {
        fromForOf.push(entry);
      }
      const fromEntries: [string, number][] = Array.from(map.entries());
      // for...of (via @@iterator) and entries() must describe the identical insertion-order sequence.
      expect(fromForOf.length).assertEqual(fromEntries.length);
      expect(fromForOf.length).assertEqual(3);
      expect(JSON.stringify(fromForOf)).assertDeepEquals(JSON.stringify(fromEntries));
      expect(JSON.stringify(fromForOf)).assertDeepEquals(JSON.stringify([['a', 1], ['b', 2], ['c', 3]]));
      done();
    })

    /**
     * @tc.name   collectionsMapEntriesOrderTest0030
     * @tc.number SUB_COLLECTIONS_MAP_ENTRIES_ORDER_0030
     * @tc.desc   case_id_temp_030: after deleting keyA and re-adding it, keyA is the last entry in iteration order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapEntriesOrderTest0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function): Promise<void> => {
      const map: collections.Map<string, number> = new collections.Map<string, number>();
      map.set('keyA', 1);
      map.set('keyB', 2);
      map.set('keyC', 3);
      map.delete('keyA');
      map.set('keyA', 10);
      const entries: [string, number][] = Array.from(map.entries());
      expect(entries.length).assertEqual(3);
      // keyA was removed and re-inserted, so it must land at the tail of the insertion order.
      expect(entries[0][0]).assertEqual('keyB');
      expect(entries[1][0]).assertEqual('keyC');
      expect(entries[2][0]).assertEqual('keyA');
      expect(entries[2][1]).assertEqual(10);
      done();
    })
  })
}
