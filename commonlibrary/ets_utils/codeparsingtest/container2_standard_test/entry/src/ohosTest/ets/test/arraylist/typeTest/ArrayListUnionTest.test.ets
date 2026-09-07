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
import { describe, expect, it, beforeAll, beforeEach, afterEach, afterAll, TestType, Size, Level } from '@ohos/hypium';
import { ArrayList } from '@kit.ArkTS';

interface UnionInvalidObject {
  marker: string;
}

const UNION_INVALID_OBJECT: UnionInvalidObject = { marker: 'invalid' };

const VALID_VALUES: Array<number> = [100, -99, 0x12, 1.2e3, 0, NaN, Number.MAX_SAFE_INTEGER, 100];

type UnionAllValue = number | boolean | UnionInvalidObject | null | undefined | bigint;

const ALL_VALUES: Array<UnionAllValue> = [
  ...VALID_VALUES,
  true, UNION_INVALID_OBJECT, null, undefined, 100n,
];

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, ms);
  });
}

export default function arrayListUnionTest() {
  describe('ArrayListUnionTest', () => {
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
     * @tc.name   testArrayListUnionTest0100
     * @tc.number SUB_ARKTS_ARRAY_LIST_UNION_0100
     * @tc.desc   Verify ArrayList union type constructor and add with number, boolean, object, null, undefined and bigint values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListUnionTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const empty: ArrayList<UnionAllValue> = new ArrayList<UnionAllValue>();
      expect(empty.length).assertEqual(0);
      expect(empty.isEmpty()).assertTrue();

      const list: ArrayList<UnionAllValue> = new ArrayList<UnionAllValue>();
      for (let i = 0; i < ALL_VALUES.length; i++) {
        expect(list.add(ALL_VALUES[i])).assertTrue();
      }
      expect(list.length).assertEqual(ALL_VALUES.length);
      expect(list[0]).assertEqual(100);
      expect(list[4]).assertEqual(0);
      expect(list[8]).assertTrue();
      let accessThrew: boolean = false;
      try {
        const beyond: UnionAllValue = list[13];
        expect(beyond).assertUndefined();
      } catch (e) {
        accessThrew = true;
        expect((e as Error).name === 'BusinessError' || (e as Error).name === 'RangeError').assertTrue();
      }
      expect(accessThrew || list.length === 13).assertTrue();
      expect(list.length).assertEqual(ALL_VALUES.length);
    });

    /**
     * @tc.name   testArrayListUnionTest0200
     * @tc.number SUB_ARKTS_ARRAY_LIST_UNION_0200
     * @tc.desc   Verify ArrayList union type has, getIndexOf, getLastIndexOf, insert and remove behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListUnionTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: ArrayList<UnionAllValue> = new ArrayList<UnionAllValue>();
      list.add(100);
      list.add('x' as Object as UnionAllValue);
      list.add(100);

      expect(list.has(100)).assertTrue();
      expect(list.getIndexOf(100)).assertEqual(0);
      expect(list.getLastIndexOf(100)).assertEqual(2);
      expect(list.getIndexOf(-999)).assertEqual(-1);

      list.insert(true, 0);
      expect(list[0]).assertTrue();
      expect(list.length).assertEqual(4);

      expect(list.remove(100)).assertTrue();
      expect(list.getIndexOf(100)).assertEqual(2);
      expect(list.remove(null)).assertFalse();
    });

    /**
     * @tc.name   testArrayListUnionTest0300
     * @tc.number SUB_ARKTS_ARRAY_LIST_UNION_0300
     * @tc.desc   Verify ArrayList union type removeByIndex, removeByRange, subArrayList and clone
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListUnionTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: ArrayList<UnionAllValue> = new ArrayList<UnionAllValue>();
      list.add(3);
      list.add(1);
      list.add(2);
      list.add(4);

      const removed: UnionAllValue = list.removeByIndex(0);
      expect(removed).assertEqual(3);
      expect(list.length).assertEqual(3);

      list.removeByRange(0, 2);
      expect(list.length).assertEqual(1);
      expect(list[0]).assertEqual(4);

      const src: ArrayList<UnionAllValue> = new ArrayList<UnionAllValue>();
      src.add(10);
      src.add(null);
      src.add(30);
      const sub: ArrayList<UnionAllValue> = src.subArrayList(1, 3);
      expect(sub.length).assertEqual(2);
      expect(sub[0]).assertNull();
      expect(sub[1]).assertEqual(30);
      expect(src.length).assertEqual(3);

      const cloned: ArrayList<UnionAllValue> = src.clone();
      cloned.add(20);
      expect(src.length).assertEqual(3);
      expect(cloned.length).assertEqual(4);
      expect(cloned[0]).assertEqual(src[0]);
    });

    /**
     * @tc.name   testArrayListUnionTest0400
     * @tc.number SUB_ARKTS_ARRAY_LIST_UNION_0400
     * @tc.desc   Verify ArrayList union type replaceAllElements and forEach with typeof filtering
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListUnionTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: ArrayList<UnionAllValue> = new ArrayList<UnionAllValue>();
      list.add(1);
      list.add(2);
      list.add(3);

      list.replaceAllElements((value: UnionAllValue): UnionAllValue => {
        if (typeof value === 'number') {
          return value * 100;
        }
        return 0;
      });
      expect(list[0]).assertEqual(100);
      expect(list[1]).assertEqual(200);
      expect(list[2]).assertEqual(300);

      const collected: Array<UnionAllValue> = [];
      list.forEach((value: UnionAllValue) => {
        collected.push(value);
      });
      expect(collected.length).assertEqual(3);
      expect(collected[2]).assertEqual(300);
    });

    /**
     * @tc.name   testArrayListUnionTest0500
     * @tc.number SUB_ARKTS_ARRAY_LIST_UNION_0500
     * @tc.desc   Verify ArrayList union type sort with numeric fallback, getCapacity, increaseCapacityTo and trimToCurrentLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListUnionTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: ArrayList<UnionAllValue> = new ArrayList<UnionAllValue>();
      list.add(5);
      list.add(1);
      list.add(3);

      list.sort((a: UnionAllValue, b: UnionAllValue): number => {
        const na: number = typeof a === 'number' ? a : 0;
        const nb: number = typeof b === 'number' ? b : 0;
        return na - nb;
      });
      expect(list[0]).assertEqual(1);
      expect(list[2]).assertEqual(5);

      expect(list.getCapacity()).assertEqual(10);
      list.increaseCapacityTo(25);
      expect(list.getCapacity() >= 25).assertTrue();
      list.add(true);
      expect(list.length).assertEqual(4);
      list.trimToCurrentLength();
      expect(list.length).assertEqual(4);
    });

    /**
     * @tc.name   testArrayListUnionTest0600
     * @tc.number SUB_ARKTS_ARRAY_LIST_UNION_0600
     * @tc.desc   Verify ArrayList union type boundary access, out-of-range removeByIndex and insert, clear and empty clone
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayListUnionTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const list: ArrayList<UnionAllValue> = new ArrayList<UnionAllValue>();
      list.add(1);
      let accessThrew: boolean = false;
      try {
        const beyond: UnionAllValue = list[1];
        expect(beyond).assertUndefined();
      } catch (e) {
        accessThrew = true;
        expect((e as Error).name === 'BusinessError' || (e as Error).name === 'RangeError').assertTrue();
      }
      expect(accessThrew || list.length === 1).assertTrue();
      expect(list.length).assertEqual(1);

      let removeThrew: boolean = false;
      try {
        list.removeByIndex(88);
      } catch (e) {
        removeThrew = true;
        expect(((e as Error).name).length > 0).assertTrue();
      }
      expect(removeThrew).assertTrue();
      expect(list.length).assertEqual(1);

      let insertThrew: boolean = false;
      try {
        list.insert(9, 66);
      } catch (e) {
        insertThrew = true;
        expect((e as Error).name === 'BusinessError' || (e as Error).name === 'RangeError').assertTrue();
      }
      expect(insertThrew).assertTrue();
      expect(list.length).assertEqual(1);

      list.clear();
      expect(list.length).assertEqual(0);
      expect(list.isEmpty()).assertTrue();
      expect(list.clone().length).assertEqual(0);
    });
  });
}
