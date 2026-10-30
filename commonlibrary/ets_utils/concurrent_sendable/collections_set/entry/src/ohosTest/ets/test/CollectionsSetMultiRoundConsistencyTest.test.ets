/*
 * Copyright (c) 2026 RKH Corp.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size} from '@ohos/hypium';
import { collections } from '@kit.ArkTS';
import { BusinessError } from '@kit.BasicServicesKit';
import Utils from './Util.test';

@Sendable
class TestValue {
  value: number;
  constructor(value: number) {
    this.value = value;
  }
}

// A plain (non-@Sendable) class used to exercise the runtime sendable check
// on Set.add. It is fed through an `as Object as TestValue` double cast so
// that the compile-time sendable guard is bypassed and the runtime rejection
// (BusinessError 401) can be observed consistently across rounds.
class NonSendableValue {
  value: number;
  constructor(value: number) {
    this.value = value;
  }
}

export default function CollectionsSetMultiRoundConsistencyTest() {
  describe('CollectionsSetMultiRoundConsistencyTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only all test cases start.
    })
    beforeEach(async () => {
      await Utils.msSleep(30);
      // Presets an action, which is performed before each unit test case starts.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases end.
    })

    /**
     * @tc.name    collectionsSetMultiRoundConsistencyTest072
     * @tc.number  SUB_COMMONLIBRARY_ETSUTILS_COLLECTIONS_SET_MULTI_ROUND_CONSISTENCY_0072
     * @tc.desc    add(sendable) multi-round: returns self + idempotent across rounds
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetMultiRoundConsistencyTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName = 'collectionsSetMultiRoundConsistencyTest072';
        console.info(`${caseName}, test start`);
        const runRound: () => Array<string> = (): Array<string> => {
          const capture: Array<string> = [];
          const set: collections.Set<TestValue> = new collections.Set<TestValue>();
          const v1: TestValue = new TestValue(1);
          const v2: TestValue = new TestValue(2);
          const v3: TestValue = new TestValue(3);
          const r1: collections.Set<TestValue> = set.add(v1);
          capture.push('addReturnsSelf:' + String(r1 === set));
          capture.push('size1:' + String(set.size));
          const r2: collections.Set<TestValue> = set.add(v2).add(v3);
          capture.push('chainReturnsSelf:' + String(r2 === set));
          capture.push('size3:' + String(set.size));
          const r3: collections.Set<TestValue> = set.add(v1);
          capture.push('readdReturnsSelf:' + String(r3 === set));
          capture.push('sizeStill3:' + String(set.size));
          capture.push('has1:' + String(set.has(v1)));
          capture.push('has2:' + String(set.has(v2)));
          capture.push('has3:' + String(set.has(v3)));
          return capture;
        };
        const r1: Array<string> = runRound();
        const r2: Array<string> = runRound();
        const r3: Array<string> = runRound();
        expect(r1).assertDeepEquals(r2);
        expect(r1).assertDeepEquals(r3);
        console.info(`${caseName}, test end`);
        done();
      });

    /**
     * @tc.name    collectionsSetMultiRoundConsistencyTest073
     * @tc.number  SUB_COMMONLIBRARY_ETSUTILS_COLLECTIONS_SET_MULTI_ROUND_CONSISTENCY_0073
     * @tc.desc    delete+has multi-round: consistent results across rounds
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetMultiRoundConsistencyTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName = 'collectionsSetMultiRoundConsistencyTest073';
        console.info(`${caseName}, test start`);
        const runRound: () => Array<string> = (): Array<string> => {
          const capture: Array<string> = [];
          const t1: TestValue = new TestValue(1);
          const t2: TestValue = new TestValue(2);
          const t3: TestValue = new TestValue(3);
          const set: collections.Set<TestValue> = new collections.Set<TestValue>([t1, t2, t3]);
          const d1: boolean = set.delete(t2);
          capture.push('delExisting:' + String(d1));
          capture.push('has2after:' + String(set.has(t2)));
          capture.push('size2:' + String(set.size));
          const d2: boolean = set.delete(new TestValue(99));
          capture.push('delMissing:' + String(d2));
          capture.push('sizeStill2:' + String(set.size));
          capture.push('has1:' + String(set.has(t1)));
          capture.push('has3:' + String(set.has(t3)));
          return capture;
        };
        const r1: Array<string> = runRound();
        const r2: Array<string> = runRound();
        const r3: Array<string> = runRound();
        expect(r1).assertDeepEquals(r2);
        expect(r1).assertDeepEquals(r3);
        console.info(`${caseName}, test end`);
        done();
      });

    /**
     * @tc.name    collectionsSetMultiRoundConsistencyTest074
     * @tc.number  SUB_COMMONLIBRARY_ETSUTILS_COLLECTIONS_SET_MULTI_ROUND_CONSISTENCY_0074
     * @tc.desc    size after add/delete multi-round: consistent size sequence across rounds
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetMultiRoundConsistencyTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName = 'collectionsSetMultiRoundConsistencyTest074';
        console.info(`${caseName}, test start`);
        const runRound: () => Array<string> = (): Array<string> => {
          const capture: Array<string> = [];
          const set: collections.Set<number> = new collections.Set<number>();
          capture.push('size0:' + String(set.size));
          set.add(1);
          set.add(2);
          set.add(3);
          capture.push('size3:' + String(set.size));
          set.delete(2);
          capture.push('size2:' + String(set.size));
          set.delete(99);
          capture.push('size2afterMiss:' + String(set.size));
          set.add(1);
          capture.push('size2afterDup:' + String(set.size));
          return capture;
        };
        const r1: Array<string> = runRound();
        const r2: Array<string> = runRound();
        const r3: Array<string> = runRound();
        expect(r1).assertDeepEquals(r2);
        expect(r1).assertDeepEquals(r3);
        console.info(`${caseName}, test end`);
        done();
      });

    /**
     * @tc.name    collectionsSetMultiRoundConsistencyTest075
     * @tc.number  SUB_COMMONLIBRARY_ETSUTILS_COLLECTIONS_SET_MULTI_ROUND_CONSISTENCY_0075
     * @tc.desc    forEach multi-type multi-round: callback count + members consistent across rounds
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetMultiRoundConsistencyTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName = 'collectionsSetMultiRoundConsistencyTest075';
        console.info(`${caseName}, test start`);
        const runRound: () => Array<string> = (): Array<string> => {
          const capture: Array<string> = [];
          const numSet: collections.Set<number> = new collections.Set<number>([10, 20, 30]);
          let numCount: number = 0;
          const numMembers: Array<string> = [];
          numSet.forEach((value: number) => {
            numCount++;
            numMembers.push(String(value));
          });
          capture.push('numCount:' + String(numCount));
          capture.push('numMembers:' + numMembers.join(','));
          const objSet: collections.Set<TestValue> =
            new collections.Set<TestValue>([new TestValue(100), new TestValue(200), new TestValue(300)]);
          let objCount: number = 0;
          const objMembers: Array<string> = [];
          objSet.forEach((value: TestValue) => {
            objCount++;
            objMembers.push(String(value.value));
          });
          capture.push('objCount:' + String(objCount));
          capture.push('objMembers:' + objMembers.join(','));
          return capture;
        };
        const r1: Array<string> = runRound();
        const r2: Array<string> = runRound();
        const r3: Array<string> = runRound();
        expect(r1).assertDeepEquals(r2);
        expect(r1).assertDeepEquals(r3);
        console.info(`${caseName}, test end`);
        done();
      });

    /**
     * @tc.name    collectionsSetMultiRoundConsistencyTest076
     * @tc.number  SUB_COMMONLIBRARY_ETSUTILS_COLLECTIONS_SET_MULTI_ROUND_CONSISTENCY_0076
     * @tc.desc    values/keys 3-member multi-round: sequence consistent across rounds
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetMultiRoundConsistencyTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName = 'collectionsSetMultiRoundConsistencyTest076';
        console.info(`${caseName}, test start`);
        const runRound: () => Array<string> = (): Array<string> => {
          const capture: Array<string> = [];
          const set: collections.Set<string> = new collections.Set<string>(['x', 'y', 'z']);
          const vals: Array<string> = [];
          let it = set.values();
          let result = it.next();
          while (!result.done) {
            vals.push(result.value as string);
            result = it.next();
          }
          capture.push('values:' + vals.join(','));
          const keys: Array<string> = [];
          it = set.keys();
          result = it.next();
          while (!result.done) {
            keys.push(result.value as string);
            result = it.next();
          }
          capture.push('keys:' + keys.join(','));
          capture.push('size:' + String(set.size));
          return capture;
        };
        const r1: Array<string> = runRound();
        const r2: Array<string> = runRound();
        const r3: Array<string> = runRound();
        expect(r1).assertDeepEquals(r2);
        expect(r1).assertDeepEquals(r3);
        console.info(`${caseName}, test end`);
        done();
      });

    /**
     * @tc.name    collectionsSetMultiRoundConsistencyTest077
     * @tc.number  SUB_COMMONLIBRARY_ETSUTILS_COLLECTIONS_SET_MULTI_ROUND_CONSISTENCY_0077
     * @tc.desc    entries 3-member multi-round: [m,m] sequence consistent across rounds
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetMultiRoundConsistencyTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName = 'collectionsSetMultiRoundConsistencyTest077';
        console.info(`${caseName}, test start`);
        const runRound: () => Array<string> = (): Array<string> => {
          const capture: Array<string> = [];
          const set: collections.Set<string> = new collections.Set<string>(['a', 'b', 'c']);
          const ents: Array<string> = [];
          const it = set.entries();
          let result = it.next();
          while (!result.done) {
            const pair = result.value as [string, string];
            ents.push(pair[0] + '|' + pair[1]);
            result = it.next();
          }
          capture.push('entries:' + ents.join(','));
          capture.push('size:' + String(set.size));
          return capture;
        };
        const r1: Array<string> = runRound();
        const r2: Array<string> = runRound();
        const r3: Array<string> = runRound();
        expect(r1).assertDeepEquals(r2);
        expect(r1).assertDeepEquals(r3);
        console.info(`${caseName}, test end`);
        done();
      });

    /**
     * @tc.name    collectionsSetMultiRoundConsistencyTest078
     * @tc.number  SUB_COMMONLIBRARY_ETSUTILS_COLLECTIONS_SET_MULTI_ROUND_CONSISTENCY_0078
     * @tc.desc    clear+add multi-round: size+has consistent across rounds
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetMultiRoundConsistencyTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName = 'collectionsSetMultiRoundConsistencyTest078';
        console.info(`${caseName}, test start`);
        const runRound: () => Array<string> = (): Array<string> => {
          const capture: Array<string> = [];
          const set: collections.Set<number> = new collections.Set<number>([1, 2, 3]);
          capture.push('size3:' + String(set.size));
          set.clear();
          capture.push('size0:' + String(set.size));
          capture.push('has1afterClear:' + String(set.has(1)));
          set.add(10);
          set.add(20);
          capture.push('size2:' + String(set.size));
          capture.push('has10:' + String(set.has(10)));
          capture.push('has20:' + String(set.has(20)));
          capture.push('has1still:' + String(set.has(1)));
          return capture;
        };
        const r1: Array<string> = runRound();
        const r2: Array<string> = runRound();
        const r3: Array<string> = runRound();
        expect(r1).assertDeepEquals(r2);
        expect(r1).assertDeepEquals(r3);
        console.info(`${caseName}, test end`);
        done();
      });

    /**
     * @tc.name    collectionsSetMultiRoundConsistencyTest079
     * @tc.number  SUB_COMMONLIBRARY_ETSUTILS_COLLECTIONS_SET_MULTI_ROUND_CONSISTENCY_0079
     * @tc.desc    has+forEach+size across 3 states multi-round: consistent across rounds
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetMultiRoundConsistencyTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName = 'collectionsSetMultiRoundConsistencyTest079';
        console.info(`${caseName}, test start`);
        const runRound: () => Array<string> = (): Array<string> => {
          const capture: Array<string> = [];
          const set: collections.Set<number> = new collections.Set<number>();
          capture.push('s1size:' + String(set.size));
          capture.push('s1has1:' + String(set.has(1)));
          let c1: number = 0;
          set.forEach(() => {
            c1++;
          });
          capture.push('s1count:' + String(c1));
          set.add(1);
          capture.push('s2size:' + String(set.size));
          capture.push('s2has1:' + String(set.has(1)));
          let c2: number = 0;
          set.forEach(() => {
            c2++;
          });
          capture.push('s2count:' + String(c2));
          set.add(2);
          set.add(3);
          capture.push('s3size:' + String(set.size));
          capture.push('s3has1:' + String(set.has(1)));
          capture.push('s3has2:' + String(set.has(2)));
          capture.push('s3has3:' + String(set.has(3)));
          let c3: number = 0;
          set.forEach(() => {
            c3++;
          });
          capture.push('s3count:' + String(c3));
          return capture;
        };
        const r1: Array<string> = runRound();
        const r2: Array<string> = runRound();
        const r3: Array<string> = runRound();
        expect(r1).assertDeepEquals(r2);
        expect(r1).assertDeepEquals(r3);
        console.info(`${caseName}, test end`);
        done();
      });

    /**
     * @tc.name    collectionsSetMultiRoundConsistencyTest080
     * @tc.number  SUB_COMMONLIBRARY_ETSUTILS_COLLECTIONS_SET_MULTI_ROUND_CONSISTENCY_0080
     * @tc.desc    empty+single-element multi-round reads: consistent across rounds
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetMultiRoundConsistencyTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName = 'collectionsSetMultiRoundConsistencyTest080';
        console.info(`${caseName}, test start`);
        const runRound: () => Array<string> = (): Array<string> => {
          const capture: Array<string> = [];
          const empty: collections.Set<number> = new collections.Set<number>();
          capture.push('emptySize:' + String(empty.size));
          capture.push('emptyHas:' + String(empty.has(0)));
          let ec: number = 0;
          empty.forEach(() => {
            ec++;
          });
          capture.push('emptyCount:' + String(ec));
          const evIt = empty.values();
          const evR = evIt.next();
          capture.push('emptyValuesDone:' + String(evR.done));
          const single: collections.Set<number> = new collections.Set<number>([42]);
          capture.push('singleSize:' + String(single.size));
          capture.push('singleHas42:' + String(single.has(42)));
          capture.push('singleHas99:' + String(single.has(99)));
          let sc: number = 0;
          single.forEach(() => {
            sc++;
          });
          capture.push('singleCount:' + String(sc));
          const svIt = single.values();
          const svR = svIt.next();
          capture.push('singleValue:' + String(svR.value));
          capture.push('singleDone:' + String(svR.done));
          return capture;
        };
        const r1: Array<string> = runRound();
        const r2: Array<string> = runRound();
        const r3: Array<string> = runRound();
        expect(r1).assertDeepEquals(r2);
        expect(r1).assertDeepEquals(r3);
        console.info(`${caseName}, test end`);
        done();
      });

    /**
     * @tc.name    collectionsSetMultiRoundConsistencyTest081
     * @tc.number  SUB_COMMONLIBRARY_ETSUTILS_COLLECTIONS_SET_MULTI_ROUND_CONSISTENCY_0081
     * @tc.desc    add(non-Sendable) multi-round: exception code+message consistent across rounds
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetMultiRoundConsistencyTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName = 'collectionsSetMultiRoundConsistencyTest081';
        console.info(`${caseName}, test start`);
        const runRound: () => Array<string> = (): Array<string> => {
          const capture: Array<string> = [];
          const set: collections.Set<TestValue> = new collections.Set<TestValue>();
          let errCode: number = -1;
          let errMsg: string = '';
          try {
            set.add(new NonSendableValue(1) as Object as TestValue);
          } catch (e) {
            const err = e as BusinessError;
            errCode = err.code;
            errMsg = err.message;
          }
          capture.push('code:' + String(errCode));
          capture.push('msg:' + errMsg);
          capture.push('sizeUnchanged:' + String(set.size));
          return capture;
        };
        const r1: Array<string> = runRound();
        const r2: Array<string> = runRound();
        const r3: Array<string> = runRound();
        expect(r1).assertDeepEquals(r2);
        expect(r1).assertDeepEquals(r3);
        // The non-Sendable add must be rejected every round with BusinessError 401.
        expect(r1[0]).assertEqual('code:401');
        console.info(`${caseName}, test end`);
        done();
      });

    /**
     * @tc.name    collectionsSetMultiRoundConsistencyTest082
     * @tc.number  SUB_COMMONLIBRARY_ETSUTILS_COLLECTIONS_SET_MULTI_ROUND_CONSISTENCY_0082
     * @tc.desc    mixed op-sequence (add/delete/has/clear) multi-round: returns+final-state consistent
     * @tc.type    Function
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('collectionsSetMultiRoundConsistencyTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName = 'collectionsSetMultiRoundConsistencyTest082';
        console.info(`${caseName}, test start`);
        const runRound: () => Array<string> = (): Array<string> => {
          const capture: Array<string> = [];
          const set: collections.Set<number> = new collections.Set<number>();
          const addRet: collections.Set<number> = set.add(1);
          capture.push('addReturnsSelf:' + String(addRet === set));
          capture.push('sizeAfterAdd1:' + String(set.size));
          capture.push('has1:' + String(set.has(1)));
          const delExisting: boolean = set.delete(1);
          capture.push('delExisting:' + String(delExisting));
          capture.push('sizeAfterDel:' + String(set.size));
          set.add(2);
          set.add(3);
          capture.push('has2:' + String(set.has(2)));
          capture.push('has3:' + String(set.has(3)));
          const delMissing: boolean = set.delete(99);
          capture.push('delMissing:' + String(delMissing));
          capture.push('sizeBeforeClear:' + String(set.size));
          set.clear();
          capture.push('sizeAfterClear:' + String(set.size));
          capture.push('has2afterClear:' + String(set.has(2)));
          return capture;
        };
        const r1: Array<string> = runRound();
        const r2: Array<string> = runRound();
        const r3: Array<string> = runRound();
        expect(r1).assertDeepEquals(r2);
        expect(r1).assertDeepEquals(r3);
        console.info(`${caseName}, test end`);
        done();
      });

  })
}
