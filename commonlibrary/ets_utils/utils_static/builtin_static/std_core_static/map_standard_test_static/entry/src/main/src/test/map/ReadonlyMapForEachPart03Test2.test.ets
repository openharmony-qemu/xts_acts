'use static';


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
  beforeEach,
  afterEach,
  afterAll,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function readonlyMapForEachPart03TestTest(): void {
  describe('ReadonlyMapForEachPart03TestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART03_TEST_0100
     * @tc.name readonlyMapForEachPart03Test001
     * @tc.desc Verify ReadonlyMap forEach traverses all entries in insertion order and sums values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>();
      const map: ReadonlyMap<string, int> = src;
      src.set('k0', 0);
      src.set('k1', 1);
      src.set('k2', 2);
      src.set('k3', 3);
      src.set('k4', 4);
      let callCount: int = 0;
      let visitedKeys: string = '';
      let sumValues: int = 0;
      map.forEach((value: int, key: string) => {
        callCount = callCount + 1;
        visitedKeys = visitedKeys + key;
        sumValues = sumValues + value;
      });
      expect(callCount).assertEqual(5);
      expect(visitedKeys).assertEqual('k0k1k2k3k4');
      expect(sumValues).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART03_TEST_0200
     * @tc.name readonlyMapForEachPart03Test002
     * @tc.desc Verify ReadonlyMap forEach callbackfn receives value key and the Map reference
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart03Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>();
      const map: ReadonlyMap<string, int> = src;
      src.set('entry', 999);
      let capturedVal: int = 0;
      let capturedKey: string = '';
      let callbackMapSame: boolean = false;
      let callbackMapSize: int = 0;
      map.forEach((value: int, key: string, m: ReadonlyMap<string, int>) => {
        capturedVal = value;
        capturedKey = key;
        callbackMapSame = m === map;
        callbackMapSize = m.size;
      });
      expect(capturedVal).assertEqual(999);
      expect(capturedKey).assertEqual('entry');
      expect(callbackMapSame).assertTrue();
      expect(callbackMapSize).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART03_TEST_0300
     * @tc.name readonlyMapForEachPart03Test003
     * @tc.desc Verify ReadonlyMap forEach traverses int-string entries in insertion order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart03Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<int, string> = new Map<int, string>();
      const map: ReadonlyMap<int, string> = src;
      src.set(100, 'hundred');
      src.set(200, 'twoHundred');
      let callCount: int = 0;
      let visitedKeys: string = '';
      let visitedValues: string = '';
      map.forEach((value: string, key: int) => {
        callCount = callCount + 1;
        visitedKeys = visitedKeys + key.toString();
        visitedValues = visitedValues + value;
      });
      expect(callCount).assertEqual(2);
      expect(visitedKeys).assertEqual('100200');
      expect(visitedValues).assertEqual('hundredtwoHundred');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART03_TEST_0400
     * @tc.name readonlyMapForEachPart03Test004
     * @tc.desc Verify forEach callback throw Error is caught
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart03Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>();
      const map: ReadonlyMap<string, int> = src;
      src.set('first', 1);
      src.set('second', 2);
      src.set('third', 3);
      try {
        map.forEach((value: int, key: string, _m: ReadonlyMap<string, int>) => {
          throw new Error('throwOnFirst');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART03_TEST_0500
     * @tc.name readonlyMapForEachPart03Test005
     * @tc.desc Verify forEach throw on last key is caught and hitLast true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart03Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>();
      const map: ReadonlyMap<string, int> = src;
      src.set('x', 101);
      src.set('y', 202);
      let hitLast: boolean = false;
      try {
        map.forEach((value: int, key: string, _m: ReadonlyMap<string, int>) => {
          if (key === 'y') {
            hitLast = true;
            throw new Error('throwOnLast');
          }
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(hitLast).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART03_TEST_0600
     * @tc.name readonlyMapForEachPart03Test006
     * @tc.desc Verify ReadonlyMap forEach aborts on middle entry and keeps first two keys
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart03Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>();
      const map: ReadonlyMap<string, int> = src;
      src.set('one', 1);
      src.set('two', 2);
      src.set('three', 3);
      src.set('four', 4);
      src.set('five', 5);
      let processed: string[] = [];
      try {
        map.forEach((value: int, key: string, _m: ReadonlyMap<string, int>) => {
          if (key === 'three') {
            throw new Error('middleThrow');
          }
          processed.push(key);
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(processed.length).assertEqual(2);
      expect(processed[0]).assertEqual('one');
      expect(processed[1]).assertEqual('two');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART03_TEST_0700
     * @tc.name readonlyMapForEachPart03Test007
     * @tc.desc Verify forEach throw then re-forEach visits all keys
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart03Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>();
      const map: ReadonlyMap<string, int> = src;
      src.set('exist1', 10);
      src.set('exist2', 20);
      try {
        map.forEach((value: int, key: string, _m: ReadonlyMap<string, int>) => {
          throw new Error('hasCheckThrow');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(map.has('exist1')).assertTrue();
      expect(map.has('exist2')).assertTrue();
      let revisitCount: int = 0;
      map.forEach((value: int, key: string, _m: ReadonlyMap<string, int>) => {
        revisitCount++;
      });
      expect(revisitCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART03_TEST_0800
     * @tc.name readonlyMapForEachPart03Test008
     * @tc.desc Verify forEach delete current key, other keys still visited (tests live-iteration semantics of underlying Map)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart03Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>();
      const map: ReadonlyMap<string, int> = src;
      src.set('delMe', 1);
      src.set('stay', 2);
      let visited: string[] = [];
      map.forEach((value: int, key: string, _m: ReadonlyMap<string, int>) => {
        visited.push(key);
        if (key === 'delMe') {
          src.delete('delMe');
        }
      });
      expect(visited.length).assertEqual(2);
      expect(visited[0]).assertEqual('delMe');
      expect(visited[1]).assertEqual('stay');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART03_TEST_0900
     * @tc.name readonlyMapForEachPart03Test009
     * @tc.desc Verify forEach delete already-visited key updates map state (tests live-iteration semantics of underlying Map)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart03Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>();
      const map: ReadonlyMap<string, int> = src;
      src.set('past', 10);
      src.set('current', 20);
      src.set('future', 30);
      let visited: string[] = [];
      map.forEach((value: int, key: string, _m: ReadonlyMap<string, int>) => {
        visited.push(key);
        if (key === 'current') {
          src.delete('past');
        }
      });
      expect(visited.length).assertEqual(3);
      expect(map.has('past')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART03_TEST_1000
     * @tc.name readonlyMapForEachPart03Test010
     * @tc.desc Verify ReadonlyMap forEach key get key undefined (tests live-iteration semantics of underlying Map)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart03Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>();
      const map: ReadonlyMap<string, int> = src;
      src.set('gone', 999);
      src.set('keep', 888);
      let afterDel: int | undefined = -1;
      map.forEach((value: int, key: string, _m: ReadonlyMap<string, int>) => {
        src.delete('gone');
        afterDel = map.get('gone');
      });
      expect(afterDel).assertUndefined();
      expect(map.has('keep')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART03_TEST_1100
     * @tc.name readonlyMapForEachPart03Test011
     * @tc.desc Verify ReadonlyMap forEach delete nonexistent key has no effect on iteration (tests live-iteration semantics of underlying Map)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart03Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>();
      const map: ReadonlyMap<string, int> = src;
      src.set('real', 100);
      src.set('real2', 200);
      let callCount: int = 0;
      let visitedKeys: string = '';
      let sumValues: int = 0;
      map.forEach((value: int, key: string) => {
        callCount = callCount + 1;
        visitedKeys = visitedKeys + key;
        sumValues = sumValues + value;
        src.delete('fake');
      });
      expect(callCount).assertEqual(2);
      expect(visitedKeys).assertEqual('realreal2');
      expect(sumValues).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART03_TEST_1200
     * @tc.name readonlyMapForEachPart03Test012
     * @tc.desc Verify ReadonlyMap forEach K=int deletes key 2 then visits keys 1 3 (tests live-iteration semantics of underlying Map)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart03Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<int, string> = new Map<int, string>();
      const map: ReadonlyMap<int, string> = src;
      src.set(1, 'one');
      src.set(2, 'two');
      src.set(3, 'three');
      let visitedKeys: int[] = [];
      map.forEach((value: string, key: int, _m: ReadonlyMap<int, string>) => {
        visitedKeys.push(key);
        if (key === 1) {
          src.delete(2);
        }
      });
      expect(visitedKeys.length).assertEqual(2);
      expect(visitedKeys[0]).assertEqual(1);
      expect(visitedKeys[1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART03_TEST_1300
     * @tc.name readonlyMapForEachPart03Test013
     * @tc.desc Verify ReadonlyMap forEach visits newly added keys during live iteration
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart03Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>();
      const map: ReadonlyMap<string, int> = src;
      src.set('base', 0);
      let visitedKeys: string[] = [];
      map.forEach((value: int, key: string, _m: ReadonlyMap<string, int>) => {
        visitedKeys.push(key);
        src.set('new1', 111);
        src.set('new2', 222);
      });
      expect(visitedKeys.length).assertEqual(3);
      expect(visitedKeys[0]).assertEqual('base');
      expect(visitedKeys[1]).assertEqual('new1');
      expect(visitedKeys[2]).assertEqual('new2');
      expect(map.size).assertEqual(3);
      expect(map.get('new1')).assertEqual(111);
      expect(map.get('new2')).assertEqual(222);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART03_TEST_1400
     * @tc.name readonlyMapForEachPart03Test014
     * @tc.desc Verify forEach set current key callback reads old value (tests live-iteration semantics of underlying Map)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart03Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>();
      const map: ReadonlyMap<string, int> = src;
      src.set('dup', 10);
      src.set('other', 20);
      let valueAtDup: int = 0;
      map.forEach((value: int, key: string, _m: ReadonlyMap<string, int>) => {
        src.set('dup', 999);
        if (key === 'dup') {
          valueAtDup = value;
        }
      });
      expect(valueAtDup).assertEqual(10);
      expect(map.get('dup')).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART03_TEST_1500
     * @tc.name readonlyMapForEachPart03Test015
     * @tc.desc Verify forEach set new key and delete key state updates (tests live-iteration semantics of underlying Map)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart03Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>();
      const map: ReadonlyMap<string, int> = src;
      src.set('keep', 1);
      src.set('remove', 2);
      map.forEach((value: int, key: string, _m: ReadonlyMap<string, int>) => {
        src.set('inserted', 3);
        src.delete('remove');
      });
      expect(map.has('keep')).assertTrue();
      expect(map.has('inserted')).assertTrue();
      expect(map.has('remove')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART03_TEST_1600
     * @tc.name readonlyMapForEachPart03Test016
     * @tc.desc Verify ReadonlyMap forEach overwrites futureKey to 888 then sees 888 (tests live-iteration semantics of underlying Map)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart03Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>();
      const map: ReadonlyMap<string, int> = src;
      src.set('first', 10);
      src.set('futureKey', 20);
      let futureVal: int = 0;
      map.forEach((value: int, key: string, _m: ReadonlyMap<string, int>) => {
        if (key === 'first') {
          src.set('futureKey', 888);
        }
        if (key === 'futureKey') {
          futureVal = value;
        }
      });
      expect(futureVal).assertEqual(888);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART03_TEST_1700
     * @tc.name readonlyMapForEachPart03Test017
     * @tc.desc Verify ReadonlyMap forEach set key value (tests live-iteration semantics of underlying Map)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart03Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>();
      const map: ReadonlyMap<string, int> = src;
      src.set('pastKey', 100);
      src.set('nowKey', 200);
      let pastValObserved: int = 0;
      map.forEach((value: int, key: string, _m: ReadonlyMap<string, int>) => {
        if (key === 'pastKey') {
          pastValObserved = value;
        }
        if (key === 'nowKey') {
          src.set('pastKey', 777);
        }
      });
      expect(pastValObserved).assertEqual(100);
      expect(map.get('pastKey')).assertEqual(777);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART03_TEST_1800
     * @tc.name readonlyMapForEachPart03Test018
     * @tc.desc Verify ReadonlyMap forEach key set (tests live-iteration semantics of underlying Map)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart03Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>();
      const map: ReadonlyMap<string, int> = src;
      src.set('m1', 1);
      src.set('m2', 2);
      src.set('m3', 3);
      let callCount: int = 0;
      map.forEach((value: int, key: string, _m: ReadonlyMap<string, int>) => {
        callCount++;
        src.set('m1', 11);
        src.set('m2', 22);
        src.set('m3', 33);
      });
      expect(callCount).assertEqual(3);
      expect(map.get('m1')).assertEqual(11);
      expect(map.get('m2')).assertEqual(22);
      expect(map.get('m3')).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART03_TEST_1900
     * @tc.name readonlyMapForEachPart03Test019
     * @tc.desc Verify ReadonlyMap forEach set key (tests live-iteration semantics of underlying Map)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart03Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>();
      const map: ReadonlyMap<string, int> = src;
      src.set('A', 1);
      src.set('B', 2);
      src.set('C', 3);
      let keyOrder: string[] = [];
      map.forEach((value: int, key: string, _m: ReadonlyMap<string, int>) => {
        src.set('B', 200);
        keyOrder.push(key);
      });
      expect(keyOrder[0]).assertEqual('A');
      expect(keyOrder[1]).assertEqual('B');
      expect(keyOrder[2]).assertEqual('C');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART03_TEST_2000
     * @tc.name readonlyMapForEachPart03Test020
     * @tc.desc Verify ReadonlyMap forEach clear on first key stops iteration (tests live-iteration semantics of underlying Map)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart03Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>();
      const map: ReadonlyMap<string, int> = src;
      src.set('c1', 1);
      src.set('c2', 2);
      src.set('c3', 3);
      let callCount: int = 0;
      map.forEach((value: int, key: string, _m: ReadonlyMap<string, int>) => {
        callCount++;
        if (callCount === 1) {
          src.clear();
        }
      });
      expect(callCount).assertEqual(1);
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART03_TEST_2100
     * @tc.name readonlyMapForEachPart03Test021
     * @tc.desc Verify ReadonlyMap forEach clear has key false (tests live-iteration semantics of underlying Map)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart03Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>();
      const map: ReadonlyMap<string, int> = src;
      src.set('clrKey', 500);
      map.forEach((value: int, key: string, _m: ReadonlyMap<string, int>) => {
        src.clear();
      });
      expect(map.has('clrKey')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART03_TEST_2200
     * @tc.name readonlyMapForEachPart03Test022
     * @tc.desc Verify ReadonlyMap forEach on empty Map callback not invoked
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart03Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>();
      const map: ReadonlyMap<string, int> = src;
      let counter: int = 0;
      map.forEach((value: int, key: string, _m: ReadonlyMap<string, int>) => {
        counter++;
      });
      expect(counter).assertEqual(0);
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART03_TEST_2300
     * @tc.name readonlyMapForEachPart03Test023
     * @tc.desc Verify ReadonlyMap forEach callbackfn invoked once for a single entry
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart03Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>();
      const map: ReadonlyMap<string, int> = src;
      src.set('lonely', 404);
      let callCount: int = 0;
      let paramVal: int = 0;
      let paramKey: string = '';
      map.forEach((value: int, key: string, _m: ReadonlyMap<string, int>) => {
        callCount++;
        paramVal = value;
        paramKey = key;
      });
      expect(callCount).assertEqual(1);
      expect(paramVal).assertEqual(404);
      expect(paramKey).assertEqual('lonely');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART03_TEST_2400
     * @tc.name readonlyMapForEachPart03Test024
     * @tc.desc Verify ReadonlyMap forEach visits all entries with zero values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart03Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>();
      const map: ReadonlyMap<string, int> = src;
      src.set('kA', 0);
      src.set('kB', 0);
      src.set('kC', 0);
      let callCount: int = 0;
      map.forEach((value: int, key: string, _m: ReadonlyMap<string, int>) => {
        callCount++;
        expect(value).assertEqual(0);
      });
      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART03_TEST_2500
     * @tc.name readonlyMapForEachPart03Test025
     * @tc.desc Verify forEach delete all keys then get undefined and has false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart03Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>();
      const map: ReadonlyMap<string, int> = src;
      src.set('d1', 7);
      src.set('d2', 7);
      src.set('d3', 7);
      map.forEach((value: int, key: string, _m: ReadonlyMap<string, int>) => {
        src.delete(key);
      });
      expect(map.size).assertEqual(0);
      expect(map.get('d1')).assertUndefined();
      expect(map.has('d1')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART03_TEST_2600
     * @tc.name readonlyMapForEachPart03Test026
     * @tc.desc Verify nested forEach inner throw is caught as Error
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart03Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>();
      let outer: ReadonlyMap<string, int> = src;
      src.set('outerKey', 1);
      let inner: Map<string, int> = new Map<string, int>();
      inner.set('innerKey', 99);
      try {
        outer.forEach((value: int, key: string, _m: ReadonlyMap<string, int>) => {
          inner.forEach((iv: int, ik: string, _im: ReadonlyMap<string, int>) => {
            throw new Error('innerForEachThrow');
          });
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART03_TEST_2700
     * @tc.name readonlyMapForEachPart03Test027
     * @tc.desc Verify nested forEach inner runs 4 times for 2 outer keys
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart03Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>();
      let outer: ReadonlyMap<string, int> = src;
      src.set('o1', 10);
      src.set('o2', 20);
      let inner: Map<string, int> = new Map<string, int>();
      inner.set('i1', 1);
      inner.set('i2', 2);
      let outerVisits: string[] = [];
      let innerTotalCalls: int = 0;
      let innerKeys: string[] = [];
      outer.forEach((value: int, key: string, _m: ReadonlyMap<string, int>) => {
        outerVisits.push(key);
        inner.forEach((iv: int, ik: string, _im: ReadonlyMap<string, int>) => {
          innerTotalCalls++;
          innerKeys.push(ik);
        });
      });
      expect(outerVisits.length).assertEqual(2);
      expect(innerTotalCalls).assertEqual(4);
      expect(innerKeys.length).assertEqual(4);
      expect(innerKeys[0]).assertEqual('i1');
      expect(innerKeys[1]).assertEqual('i2');
      expect(innerKeys[2]).assertEqual('i1');
      expect(innerKeys[3]).assertEqual('i2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART03_TEST_2800
     * @tc.name readonlyMapForEachPart03Test028
     * @tc.desc Verify nested forEach inner delete C stops outer iteration at A B
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart03Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>();
      let outer: ReadonlyMap<string, int> = src;
      src.set('A', 1);
      src.set('B', 2);
      src.set('C', 3);
      let inner: Map<string, int> = new Map<string, int>();
      inner.set('x', 100);
      let outerVisited: string[] = [];
      outer.forEach((value: int, key: string, _m: ReadonlyMap<string, int>) => {
        outerVisited.push(key);
        inner.forEach((iv: int, ik: string, _im: ReadonlyMap<string, int>) => {
          src.delete('C');
        });
      });
      expect(outerVisited.length).assertEqual(2);
      expect(outerVisited[0]).assertEqual('A');
      expect(outerVisited[1]).assertEqual('B');
      expect(outer.has('C')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART03_TEST_2900
     * @tc.name readonlyMapForEachPart03Test029
     * @tc.desc Verify ReadonlyMap forEach Map<int,int> key int.MAX
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart03Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<int, int> = new Map<int, int>();
      const map: ReadonlyMap<int, int> = src;
      src.set(2147483647, 999);
      src.set(0, 1);
      let foundMax: boolean = false;
      map.forEach((value: int, key: int, _m: ReadonlyMap<int, int>) => {
        if (key === 2147483647) {
          foundMax = true;
        }
      });
      expect(foundMax).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART03_TEST_3000
     * @tc.name readonlyMapForEachPart03Test030
     * @tc.desc Verify ReadonlyMap forEach Map value NaN entry NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart03Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, double> = new Map<string, double>();
      const map: ReadonlyMap<string, double> = src;
      src.set('nanKey', Number.NaN);
      src.set('normalKey', 3.14);
      let nanDetected: boolean = false;
      map.forEach((value: double, key: string, _m: ReadonlyMap<string, double>) => {
        if (value !== value) {
          nanDetected = true;
        }
      });
      expect(nanDetected).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART03_TEST_3100
     * @tc.name readonlyMapForEachPart03Test031
     * @tc.desc Verify ReadonlyMap forEach Map value Number.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart03Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, double> = new Map<string, double>();
      const map: ReadonlyMap<string, double> = src;
      src.set('infKey', Number.POSITIVE_INFINITY);
      let infVal: double = 0;
      map.forEach((value: double, key: string, _m: ReadonlyMap<string, double>) => {
        infVal = value;
      });
      expect(infVal).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART03_TEST_3200
     * @tc.name readonlyMapForEachPart03Test032
     * @tc.desc Verify ReadonlyMap forEach visits null value entry alongside string entry
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart03Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, string | null> = new Map<string, string | null>();
      const map: ReadonlyMap<string, string | null> = src;
      src.set('hasNull', null);
      src.set('hasStr', 'text');
      let nullSeen: boolean = false;
      map.forEach((value: string | null, key: string, _m: ReadonlyMap<string, string | null>) => {
        if (value === null) {
          nullSeen = true;
        }
      });
      expect(nullSeen).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART03_TEST_3300
     * @tc.name readonlyMapForEachPart03Test033
     * @tc.desc Verify forEach records keys and values via function reference
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart03Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>();
      const map: ReadonlyMap<string, int> = src;
      src.set('paramA', 100);
      src.set('paramB', 200);
      let recordedKeys: string[] = [];
      let recordedValues: int[] = [];
      let recordAll: (v: int, k: string, m: ReadonlyMap<string, int>) => void = (
        v: int,
        k: string,
        m: ReadonlyMap<string, int>,
      ): void => {
        recordedKeys.push(k);
        recordedValues.push(v);
      };
      map.forEach(recordAll);
      expect(recordedKeys[0]).assertEqual('paramA');
      expect(recordedKeys[1]).assertEqual('paramB');
      expect(recordedValues[0]).assertEqual(100);
      expect(recordedValues[1]).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART03_TEST_3400
     * @tc.name readonlyMapForEachPart03Test034
     * @tc.desc Verify forEach order matches entries() iteration
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart03Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>();
      const map: ReadonlyMap<string, int> = src;
      src.set('m1', 10);
      src.set('m2', 20);
      src.set('m3', 30);
      let fromForEach: string[] = [];
      map.forEach((value: int, key: string, m: ReadonlyMap<string, int>): void => {
        fromForEach.push(key + '=' + value.toString());
      });
      let fromEntries: string[] = [];
      let iter: IterableIterator<[string, int]> = map.entries();
      let next: IteratorResult<[string, int]> = iter.next();
      while (!next.done) {
        const nv = next.value;
        if (nv !== undefined) {
          fromEntries.push(nv[0] + '=' + nv[1].toString());
        }
        next = iter.next();
      }
      expect(fromForEach.length).assertEqual(fromEntries.length);
      expect(fromForEach[0]).assertEqual(fromEntries[0]);
      expect(fromForEach[1]).assertEqual(fromEntries[1]);
      expect(fromForEach[2]).assertEqual(fromEntries[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART03_TEST_3500
     * @tc.name readonlyMapForEachPart03Test035
     * @tc.desc Verify forEach keys order matches keys() iteration
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart03Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>();
      const map: ReadonlyMap<string, int> = src;
      src.set('z', 26);
      src.set('y', 25);
      src.set('x', 24);
      let forEachKeys: string[] = [];
      map.forEach((value: int, key: string, m: ReadonlyMap<string, int>): void => {
        forEachKeys.push(key);
      });
      let iterKeys: string[] = [];
      let kit: IterableIterator<string> = map.keys();
      let r: IteratorResult<string> = kit.next();
      while (!r.done) {
        const rv = r.value;
        if (rv !== undefined) {
          iterKeys.push(rv);
        }
        r = kit.next();
      }
      expect(forEachKeys[0]).assertEqual(iterKeys[0]);
      expect(forEachKeys[1]).assertEqual(iterKeys[1]);
      expect(forEachKeys[2]).assertEqual(iterKeys[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART03_TEST_3600
     * @tc.name readonlyMapForEachPart03Test036
     * @tc.desc Verify chained set then forEach visits all 4 values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart03Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>();
      const map: ReadonlyMap<string, int> = src;
      src.set('ch1', 1).set('ch2', 2).set('ch3', 3).set('ch4', 4);
      let collected: int[] = [];
      map.forEach((value: int, key: string, m: ReadonlyMap<string, int>): void => {
        collected.push(value);
      });
      expect(collected.length).assertEqual(4);
      expect(collected[0]).assertEqual(1);
      expect(collected[1]).assertEqual(2);
      expect(collected[2]).assertEqual(3);
      expect(collected[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART03_TEST_3700
     * @tc.name readonlyMapForEachPart03Test037
     * @tc.desc Verify ReadonlyMap forEach delete key updates iteration count
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart03Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<int, int> = new Map<int, int>();
      const map: ReadonlyMap<int, int> = src;
      for (let i: int = 0; i < 50; i++) {
        src.set(i, i);
      }
      let seenCount: int = 0;
      map.forEach((value: int, key: int, m: ReadonlyMap<int, int>): void => {
        seenCount++;
        if (key === 25) {
          for (let j: int = 30; j < 40; j++) {
            src.delete(j);
          }
        }
      });
      let actualSeenCount: int = seenCount;
      let expectedSeenCount: int = 40;
      expect(actualSeenCount).assertEqual(expectedSeenCount);
      let actualMapSize: int = map.size;
      let expectedMapSize: int = 40;
      expect(actualMapSize).assertEqual(expectedMapSize);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART03_TEST_3800
     * @tc.name readonlyMapForEachPart03Test038
     * @tc.desc Verify ReadonlyMap forEach K=Date key reference equality
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart03Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: Date = new Date(2025, 5, 15);
      let d2: Date = new Date(2025, 10, 1);
      const src: Map<Date, int> = new Map<Date, int>();
      const map: ReadonlyMap<Date, int> = src;
      src.set(d1, 10);
      src.set(d2, 20);
      let refSameForD1: boolean = false;
      let refSameForD2: boolean = false;
      map.forEach((value: int, key: Date, m: ReadonlyMap<Date, int>): void => {
        if (key === d1) {
          refSameForD1 = true;
        }
        if (key === d2) {
          refSameForD2 = true;
        }
      });
      expect(refSameForD1).assertTrue();
      expect(refSameForD2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART03_TEST_3900
     * @tc.name readonlyMapForEachPart03Test039
     * @tc.desc Verify ReadonlyMap forEach V=int[] array value contents
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart03Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1: int[] = [1, 2, 3];
      let arr2: int[] = [4, 5];
      const src: Map<string, int[]> = new Map<string, int[]>();
      const map: ReadonlyMap<string, int[]> = src;
      src.set('a', arr1);
      src.set('b', arr2);
      let captured: int[][] = [];
      map.forEach((value: int[], key: string, m: ReadonlyMap<string, int[]>): void => {
        captured.push(value);
      });
      expect(captured[0][0]).assertEqual(1);
      expect(captured[0][1]).assertEqual(2);
      expect(captured[0][2]).assertEqual(3);
      expect(captured[1][0]).assertEqual(4);
      expect(captured[1][1]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART03_TEST_4000
     * @tc.name readonlyMapForEachPart03Test040
     * @tc.desc Verify ReadonlyMap forEach V=Map value nested size
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart03Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner1: Map<string, int> = new Map<string, int>([['i1', 10]]);
      let inner2: Map<string, int> = new Map<string, int>([['i2', 20]]);
      const srcOuter: Map<string, Map<string, int>> = new Map<string, Map<string, int>>();
      const outer: ReadonlyMap<string, Map<string, int>> = srcOuter;
      srcOuter.set('outer1', inner1);
      srcOuter.set('outer2', inner2);
      let capturedFirst: Map<string, int> | undefined = undefined;
      let capturedSecond: Map<string, int> | undefined = undefined;
      outer.forEach((value: Map<string, int>, key: string, m: ReadonlyMap<string, Map<string, int>>): void => {
        if (key === 'outer1') {
          capturedFirst = value;
        }
        if (key === 'outer2') {
          capturedSecond = value;
        }
      });
      expect(capturedFirst!.get('i1')).assertEqual(10);
      expect(capturedSecond!.get('i2')).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART03_TEST_4100
     * @tc.name readonlyMapForEachPart03Test041
     * @tc.desc Verify forEach callback m.clear aborts iteration and m.set postClear not visited (live iteration semantics)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart03Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>();
      const map: ReadonlyMap<string, int> = src;
      src.set('snap1', 10);
      src.set('snap2', 20);
      src.set('snap3', 30);
      let snapshot: string[] = [];
      map.forEach((value: int, key: string, m: ReadonlyMap<string, int>): void => {
        snapshot.push(key);
        if (key === 'snap2') {
          src.clear();
          src.set('postClear', 999);
        }
      });
      let firstSnap: string = snapshot[0];
      let expectedFirstSnap: string = 'snap1';
      expect(firstSnap).assertEqual(expectedFirstSnap);
      let secondSnap: string = snapshot[1];
      let expectedSecondSnap: string = 'snap2';
      expect(secondSnap).assertEqual(expectedSecondSnap);
      let actualMapSize: int = map.size;
      let expectedMapSize: int = 1;
      expect(actualMapSize).assertEqual(expectedMapSize);
      let postClearValue: int | undefined = map.get('postClear');
      let expectedPostClearValue: int = 999;
      expect(postClearValue).assertEqual(expectedPostClearValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART03_TEST_4200
     * @tc.name readonlyMapForEachPart03Test042
     * @tc.desc Verify two Maps forEach cross product yields 4 pairs
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart03Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const srcMapStrInt: Map<string, int> = new Map<string, int>();
      const mapStrInt: ReadonlyMap<string, int> = srcMapStrInt;
      srcMapStrInt.set('alpha', 100);
      srcMapStrInt.set('beta', 200);
      const srcMapIntStr: Map<int, string> = new Map<int, string>();
      const mapIntStr: ReadonlyMap<int, string> = srcMapIntStr;
      srcMapIntStr.set(1, 'one');
      srcMapIntStr.set(2, 'two');
      let crossResults: string[] = [];
      mapStrInt.forEach((v1: int, k1: string, m1: ReadonlyMap<string, int>): void => {
        mapIntStr.forEach((v2: string, k2: int, m2: ReadonlyMap<int, string>): void => {
          crossResults.push(k1 + ':' + v2);
        });
      });
      expect(crossResults.length).assertEqual(4);
      let firstResult: string = crossResults[0];
      let secondResult: string = crossResults[1];
      let thirdResult: string = crossResults[2];
      let fourthResult: string = crossResults[3];
      expect(firstResult).assertEqual('alpha:one');
      expect(secondResult).assertEqual('alpha:two');
      expect(thirdResult).assertEqual('beta:one');
      expect(fourthResult).assertEqual('beta:two');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART03_TEST_4300
     * @tc.name readonlyMapForEachPart03Test043
     * @tc.desc Verify forEach callback m.set inserts new key reflected in map (live iteration semantics)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart03Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>();
      const map: ReadonlyMap<string, int> = src;
      src.set('a', 1);
      src.set('b', 2);
      src.set('c', 3);
      let visitedKeys: string[] = [];
      let callCount: int = 0;
      map.forEach((value: int, key: string, m: ReadonlyMap<string, int>): void => {
        visitedKeys.push(key);
        callCount++;
        if (key === 'b') {
          src.set('newKey', 999);
        }
      });
      expect(visitedKeys).assertContain('newKey');
      expect(callCount).assertEqual(4);
      let hasNewKey: boolean = map.has('newKey');
      expect(hasNewKey).assertTrue();
      let newKeyValue: int | undefined = map.get('newKey');
      let expectedNewKeyValue: int = 999;
      expect(newKeyValue).assertEqual(expectedNewKeyValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART03_TEST_4400
     * @tc.name readonlyMapForEachPart03Test044
     * @tc.desc Verify forEach pairs from entries-constructed Map
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart03Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let entriesArr: [string, int][] = [
        ['e1', 11],
        ['e2', 22],
        ['e3', 33],
      ];
      const map: ReadonlyMap<string, int> = new Map<string, int>(entriesArr);
      let forEachPairs: string[] = [];
      map.forEach((value: int, key: string, m: ReadonlyMap<string, int>): void => {
        forEachPairs.push(key + ':' + value.toString());
      });
      expect(forEachPairs[0]).assertEqual('e1:11');
      expect(forEachPairs[1]).assertEqual('e2:22');
      expect(forEachPairs[2]).assertEqual('e3:33');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART03_TEST_4500
     * @tc.name readonlyMapForEachPart03Test045
     * @tc.desc Verify ReadonlyMap forEach catches RangeError thrown from callback
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart03Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['r', 1]]);
      try {
        map.forEach((value: int, key: string, _m: ReadonlyMap<string, int>) => {
          throw new RangeError('rangeIssue');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART03_TEST_4600
     * @tc.name readonlyMapForEachPart03Test046
     * @tc.desc Verify ReadonlyMap forEach throw message preserved
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart03Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['msg', 1]]);
      let errMsg: string = '';
      try {
        map.forEach((value: int, key: string, _m: ReadonlyMap<string, int>) => {
          throw new Error('customMessageXYZ');
        });
        expect().assertFail();
      } catch (e) {
        errMsg = e.message;
        expect(e.name).assertEqual('Error');
      }
      expect(errMsg).assertEqual('customMessageXYZ');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_FOR_EACH_PART03_TEST_4700
     * @tc.name readonlyMapForEachPart03Test047
     * @tc.desc Verify ReadonlyMap forEach reverses key-value into new Map
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('readonlyMapForEachPart03Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>();
      const original: ReadonlyMap<string, int> = src;
      src.set('abc', 123);
      src.set('def', 456);
      let reversed: Map<int, string> = new Map<int, string>();
      original.forEach((value: int, key: string, m: ReadonlyMap<string, int>): void => {
        reversed.set(value, key);
      });
      expect(reversed.size).assertEqual(2);
      expect(reversed.get(123)).assertEqual('abc');
      expect(reversed.get(456)).assertEqual('def');
    });
  });
}
