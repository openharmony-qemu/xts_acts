'use static'


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

import {
  beforeAll,
  afterEach,
  beforeEach,
  afterAll,
  describe,
  it,
  expect,
  TestType,
  Size,
  Level
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function mapToStringPart02TestTest(): void {
  describe('MapToStringPart02TestTest', (): void => {
    beforeAll((): void => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {
    });

    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_TO_STRING_PART02_TEST_0100
     * @tc.name mapToStringPart02Test001
     * @tc.desc Verify Map<string,int> toString typeof string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapToStringPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>();
      let result = map.toString();
      expect(typeof result).assertEqual('string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_TO_STRING_PART02_TEST_0200
     * @tc.name mapToStringPart02Test002
     * @tc.desc Verify toString Map size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapToStringPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>();
      map.set('a', 1);
      map.set('b', 2);
      let sizeBefore = map.size;
      map.toString();
      expect(map.size).assertEqual(sizeBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_TO_STRING_PART02_TEST_0300
     * @tc.name mapToStringPart02Test003
     * @tc.desc Verify toString get key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapToStringPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>();
      map.set('key1', 100);
      map.toString();
      let val = map.get('key1');
      expect(val).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_TO_STRING_PART02_TEST_0400
     * @tc.name mapToStringPart02Test004
     * @tc.desc Verify toString has
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapToStringPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>();
      map.set('exist', 42);
      map.toString();
      expect(map.has('exist')).assertTrue();
      expect(map.has('missing')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_TO_STRING_PART02_TEST_0500
     * @tc.name mapToStringPart02Test005
     * @tc.desc Verify toString keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapToStringPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>();
      map.set('a', 1);
      map.set('b', 2);
      let iter = map.keys();
      map.toString();
      let firstKey = iter.next().value!;
      let secondKey = iter.next().value!;
      expect(firstKey).assertEqual('a');
      expect(secondKey).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_TO_STRING_PART02_TEST_0600
     * @tc.name mapToStringPart02Test006
     * @tc.desc Verify toString values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapToStringPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>();
      map.set('x', 10);
      map.set('y', 20);
      let iter = map.values();
      map.toString();
      let firstVal = iter.next().value!;
      let secondVal = iter.next().value!;
      expect(firstVal).assertEqual(10);
      expect(secondVal).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_TO_STRING_PART02_TEST_0700
     * @tc.name mapToStringPart02Test007
     * @tc.desc Verify toString entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapToStringPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>();
      map.set('m', 100);
      map.set('n', 200);
      let iter = map.entries();
      map.toString();
      let firstEntry = iter.next().value!;
      let countEntries = 0;
      while (true) {
        let entry = iter.next();
        if (entry.done) {
          break;
        }
        countEntries++;
      }
      expect(firstEntry).not().assertNull();
      expect(countEntries).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_TO_STRING_PART02_TEST_0800
     * @tc.name mapToStringPart02Test008
     * @tc.desc Verify toString forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapToStringPart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>();
      map.set('p', 1);
      map.set('q', 2);
      let countBefore = 0;
      map.forEach((_value: int, _key: string) => {
        countBefore++;
      });
      map.toString();
      let countAfter = 0;
      map.forEach((_value: int, _key: string) => {
        countAfter++;
      });
      expect(countAfter).assertEqual(countBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_TO_STRING_PART02_TEST_0900
     * @tc.name mapToStringPart02Test009
     * @tc.desc Verify toString delete
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapToStringPart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>();
      map.set('del', 999);
      map.toString();
      let deleted = map.delete('del');
      expect(deleted).assertTrue();
      expect(map.has('del')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_TO_STRING_PART02_TEST_1000
     * @tc.name mapToStringPart02Test010
     * @tc.desc Verify toString set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapToStringPart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>();
      map.set('a', 1);
      map.toString();
      map.set('b', 2);
      expect(map.size).assertEqual(2);
      expect(map.get('b')).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_TO_STRING_PART02_TEST_1100
     * @tc.name mapToStringPart02Test011
     * @tc.desc Verify toString clear
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapToStringPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>();
      map.set('a', 1);
      map.set('b', 2);
      map.toString();
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_TO_STRING_PART02_TEST_1200
     * @tc.name mapToStringPart02Test012
     * @tc.desc Verify toString Map size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapToStringPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>();
      expect(map.size).assertEqual(0);
      map.toString();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_TO_STRING_PART02_TEST_1300
     * @tc.name mapToStringPart02Test013
     * @tc.desc Verify toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapToStringPart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>();
      map.set('only', 42);
      map.toString();
      expect(map.get('only')).assertEqual(42);
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_TO_STRING_PART02_TEST_1400
     * @tc.name mapToStringPart02Test014
     * @tc.desc Verify toString Map size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapToStringPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>();
      map.set('e1', 1);
      map.set('e2', 2);
      map.set('e3', 3);
      map.set('e4', 4);
      map.set('e5', 5);
      let origSize = map.size;
      map.toString();
      expect(map.size).assertEqual(origSize);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_TO_STRING_PART02_TEST_1500
     * @tc.name mapToStringPart02Test015
     * @tc.desc Verify Map toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapToStringPart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>();
      map.set('a', 1);
      map.set('b', 2);
      let firstResult = map.toString();
      let secondResult = map.toString();
      expect(firstResult).assertEqual(secondResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_TO_STRING_PART02_TEST_1600
     * @tc.name mapToStringPart02Test016
     * @tc.desc Verify toString has
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapToStringPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>();
      map.set('x', 10);
      let before = map.toString();
      map.has('x');
      let after = map.toString();
      expect(after).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_TO_STRING_PART02_TEST_1700
     * @tc.name mapToStringPart02Test017
     * @tc.desc Verify toString get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapToStringPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>();
      map.set('y', 20);
      let before = map.toString();
      map.get('y');
      let after = map.toString();
      expect(after).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_TO_STRING_PART02_TEST_1800
     * @tc.name mapToStringPart02Test018
     * @tc.desc Verify toString keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapToStringPart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>();
      map.set('a', 1);
      let before = map.toString();
      let iter = map.keys();
      let after = map.toString();
      expect(after).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_TO_STRING_PART02_TEST_1900
     * @tc.name mapToStringPart02Test019
     * @tc.desc Verify toString values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapToStringPart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>();
      map.set('v', 5);
      let before = map.toString();
      let iter = map.values();
      let after = map.toString();
      expect(after).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_TO_STRING_PART02_TEST_2000
     * @tc.name mapToStringPart02Test020
     * @tc.desc Verify toString entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapToStringPart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>();
      map.set('e', 8);
      let before = map.toString();
      let iter = map.entries();
      let after = map.toString();
      expect(after).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_TO_STRING_PART02_TEST_2100
     * @tc.name mapToStringPart02Test021
     * @tc.desc Verify toString forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapToStringPart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>();
      map.set('f', 15);
      let before = map.toString();
      map.forEach((_value: int, _key: string) => {});
      let after = map.toString();
      expect(after).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_TO_STRING_PART02_TEST_2200
     * @tc.name mapToStringPart02Test022
     * @tc.desc Verify Map toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapToStringPart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>();
      let firstResult = map.toString();
      let secondResult = map.toString();
      let thirdResult = map.toString();
      expect(firstResult).assertEqual(secondResult);
      expect(secondResult).assertEqual(thirdResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_TO_STRING_PART02_TEST_2300
     * @tc.name mapToStringPart02Test023
     * @tc.desc Verify toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapToStringPart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>();
      map.set('start', 1);
      let result = map.toString();
      expect(result.charAt(0) !== c',').assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_TO_STRING_PART02_TEST_2400
     * @tc.name mapToStringPart02Test024
     * @tc.desc Verify toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapToStringPart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>();
      map.set('end', 99);
      let result = map.toString();
      expect(result.charAt(result.length - 1) !== c',').assertTrue();
    });

  });
}
