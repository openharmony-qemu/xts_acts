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

export default function GlobalClearIntervalPart_1Test(): void {
  describe('GlobalClearIntervalPart_1Test', (): void => {
    beforeAll(() => {});

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(async () => {});

    afterAll(() => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEARINTERVAL_TEST_0100
     * @tc.name testGlobalClearIntervalTest001
     * @tc.desc clearInterval() then clearInterval(validId) returns undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalClearIntervalTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const clearResult: void = clearInterval();
      expect(clearResult).assertUndefined();
      const id: int = setInterval((): void => {}, 100);
      const result: void = clearInterval(id);
      expect(result).assertUndefined();
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEARINTERVAL_TEST_0200
     * @tc.name testGlobalClearIntervalTest002
     * @tc.desc clearInterval(undefined) after setInterval returns undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalClearIntervalTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const id: int = setInterval((): void => {}, 100);
      const result: void = clearInterval(undefined);
      expect(result).assertUndefined();
      clearInterval(id);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEARINTERVAL_TEST_0300
     * @tc.name testGlobalClearIntervalTest003
     * @tc.desc clearInterval(0/-1/null/undefined) returns undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalClearIntervalTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testArgs: (int | null | undefined)[] = [0, -1, null, undefined];
      for (let j: int = 0; j < 4; j++) {
        const result: void = clearInterval(testArgs[j]);
        expect(result).assertUndefined();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEARINTERVAL_TEST_0400
     * @tc.name testGlobalClearIntervalTest004
     * @tc.desc clearInterval with arbitrary integers returns undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalClearIntervalTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const args: int[] = [5, -5, 444444, -444444, 5000, -50, 99999, 65536];
      for (let i: int = 0; i < args.length; i++) {
        const result: void = clearInterval(args[i]);
        expect(result).assertUndefined();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEARINTERVAL_TEST_0500
     * @tc.name testGlobalClearIntervalTest005
     * @tc.desc clearInterval(0) with numeric bases 0x0 0o0 0b0 returns undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalClearIntervalTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const clearHex: void = clearInterval(0x0);
      const clearOct: void = clearInterval(0o0);
      const clearBin: void = clearInterval(0b0);
      expect(clearHex).assertUndefined();
      expect(clearOct).assertUndefined();
      expect(clearBin).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEARINTERVAL_TEST_0600
     * @tc.name testGlobalClearIntervalTest006
     * @tc.desc clearInterval inside a setTimeout callback cancels a pending interval before its first tick
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalClearIntervalTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let targetCount: int = 0;
      const targetId: int = setInterval((): void => {
        targetCount = targetCount + 1;
      }, 150);
      let controllerDone: boolean = false;
      setTimeout((): void => {
        clearInterval(targetId);
        controllerDone = true;
      }, 30);
      try {
        await Utils.msSleep(250);
      } catch (e) {
        expect(false).assertFail();
      }
      expect(controllerDone).assertTrue();
      expect(targetCount).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEARINTERVAL_TEST_0700
     * @tc.name testGlobalClearIntervalTest007
     * @tc.desc clearInterval with Double.toInt(parseFloat("NaN")) as timer ID does not affect active interval
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalClearIntervalTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let count: int = 0;
      const id: int = setInterval((): void => {
        count = count + 1;
      }, 20);
      const nanId: int = Double.toInt(parseFloat('NaN'));
      clearInterval(nanId);
      try {
        await Utils.msSleep(80);
      } catch (e) {
        expect(false).assertFail();
      }
      clearInterval(id);
      expect(count).assertLarger(0);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEARINTERVAL_TEST_0800
     * @tc.name testGlobalClearIntervalTest008
     * @tc.desc clearInterval cancels two active intervals before callbacks fire
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalClearIntervalTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let count1: int = 0;
      let count2: int = 0;
      const timerId1: int = setInterval((): void => {
        count1 = count1 + 1;
      }, 20);
      const timerId2: int = setInterval((): void => {
        count2 = count2 + 1;
      }, 20);
      clearInterval(timerId1);
      clearInterval(timerId2);
      try {
        await Utils.msSleep(80);
      } catch (e) {
        expect(false).assertFail();
      }
      expect(count1).assertEqual(0);
      expect(count2).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEARINTERVAL_TEST_0900
     * @tc.name testGlobalClearIntervalTest009
     * @tc.desc clearInterval with setTimeout ID (cross-timer) returns undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalClearIntervalTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const timeoutId: int = setTimeout((): void => {}, 1000);
      const ret: void = clearInterval(timeoutId);
      expect(ret).assertUndefined();
      clearTimeout(timeoutId);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEARINTERVAL_TEST_1000
     * @tc.name testGlobalClearIntervalTest010
     * @tc.desc clearInterval with timer ID from Map returns undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalClearIntervalTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const timerMap: Map<string, int> = new Map<string, int>();
      const tid: int = setInterval((): void => {}, 1000);
      timerMap.set('t1', tid);
      const result: void = clearInterval(timerMap.get('t1'));
      expect(result).assertUndefined();
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEARINTERVAL_TEST_1100
     * @tc.name testGlobalClearIntervalTest011
     * @tc.desc clearInterval loop 200 timers each returns undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalClearIntervalTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const timers: int[] = [];
      for (let i: int = 0; i < 200; i++) {
        timers.push(setInterval((): void => {}, 1000));
      }
      for (let j: int = 0; j < 200; j++) {
        const ret: void = clearInterval(timers[j]);
        expect(ret).assertUndefined();
      }
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEARINTERVAL_TEST_1200
     * @tc.name testGlobalClearIntervalTest012
     * @tc.desc clearInterval(undefined) does not cancel active interval
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalClearIntervalTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let count: int = 0;
      const id: int = setInterval((): void => {
        count = count + 1;
      }, 30);
      clearInterval(undefined);
      try {
        await Utils.msSleep(120);
      } catch (e) {
        expect(false).assertFail();
      }
      clearInterval(id);
      expect(count).assertLarger(0);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEARINTERVAL_TEST_1300
     * @tc.name testGlobalClearIntervalTest013
     * @tc.desc clearInterval with Int.MIN_VALUE does not affect active interval
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalClearIntervalTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let count: int = 0;
      const id: int = setInterval((): void => {
        count = count + 1;
      }, 30);
      clearInterval(-2147483648);
      await Utils.msSleep(120);
      clearInterval(id);
      expect(count).assertLarger(0);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEARINTERVAL_TEST_1400
     * @tc.name testGlobalClearIntervalTest014
     * @tc.desc clearInterval cancels setInterval with callback args
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalClearIntervalTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let count: int = 0;
      const id: int = setInterval(
        (a: int, b: int): void => {
          count = count + a + b;
        },
        30,
        1,
        2,
      );
      clearInterval(id);
      await Utils.msSleep(120);
      expect(count).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEARINTERVAL_TEST_1500
     * @tc.name testGlobalClearIntervalTest015
     * @tc.desc clearInterval cancels setInterval with delay=0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalClearIntervalTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let count: int = 0;
      const id: int = setInterval((): void => {
        count = count + 1;
      }, 0);
      clearInterval(id);
      try {
        await Utils.msSleep(80);
      } catch (e) {
        expect(false).assertFail();
      }
      expect(count).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEARINTERVAL_TEST_1600
     * @tc.name testGlobalClearIntervalTest016
     * @tc.desc clearInterval cancels setInterval with negative delay
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalClearIntervalTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let count: int = 0;
      const id: int = setInterval((): void => {
        count = count + 1;
      }, -100);
      clearInterval(id);
      await Utils.msSleep(120);
      expect(count).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEARINTERVAL_TEST_1700
     * @tc.name testGlobalClearIntervalTest017
     * @tc.desc self-clearing interval: clearInterval inside callback executes only once
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalClearIntervalTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let count: int = 0;
      let id: int = 0;
      let selfCleared: boolean = false;
      id = setInterval((): void => {
        count = count + 1;
        if (!selfCleared) {
          clearInterval(id);
          selfCleared = true;
        }
      }, 20);
      await Utils.msSleep(120);
      expect(count).assertEqual(1);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEARINTERVAL_TEST_1800
     * @tc.name testGlobalClearIntervalTest018
     * @tc.desc clearInterval one interval during another interval callback execution
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalClearIntervalTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let aCount: int = 0;
      let bCount: int = 0;
      let bCountAtClear: int = 0;
      let idA: int = 0;
      const idB: int = setInterval((): void => {
        bCount = bCount + 1;
      }, 20);
      idA = setInterval((): void => {
        aCount = aCount + 1;
        bCountAtClear = bCount;
        clearInterval(idB);
        clearInterval(idA);
      }, 60);
      try {
        await Utils.msSleep(100);
      } catch (e) {
        expect(false).assertFail();
      }
      expect(bCountAtClear).assertLarger(0);
      try {
        await Utils.msSleep(150);
      } catch (e) {
        expect(false).assertFail();
      }
      expect(bCount).assertEqual(bCountAtClear);
      expect(aCount).assertEqual(1);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEARINTERVAL_TEST_1900
     * @tc.name testGlobalClearIntervalTest019
     * @tc.desc rapid create-clear-create-clear cycle, no ID conflict
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalClearIntervalTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      for (let i: int = 0; i < 10; i++) {
        const id: int = setInterval((): void => {}, 1000);
        const result: void = clearInterval(id);
        expect(result).assertUndefined();
      }
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEARINTERVAL_TEST_2000
     * @tc.name testGlobalClearIntervalTest020
     * @tc.desc clear then create new interval, new interval works normally after ID reuse
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalClearIntervalTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let count1: int = 0;
      let count2: int = 0;
      const id1: int = setInterval((): void => {
        count1 = count1 + 1;
      }, 1000);
      clearInterval(id1);
      const id2: int = setInterval((): void => {
        count2 = count2 + 1;
      }, 30);
      try {
        await Utils.msSleep(120);
      } catch (e) {
        expect(false).assertFail();
      }
      clearInterval(id2);
      expect(count1).assertEqual(0);
      expect(count2).assertLarger(0);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEARINTERVAL_TEST_2100
     * @tc.name testGlobalClearIntervalTest021
     * @tc.desc batch create 5 intervals and clear all, all callbacks not executed
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalClearIntervalTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const COUNT: int = 5;
      const counts: int[] = [0, 0, 0, 0, 0];
      const ids: int[] = [];
      for (let i: int = 0; i < COUNT; i++) {
        const idx: int = i;
        ids.push(
          setInterval((): void => {
            counts[idx] = counts[idx] + 1;
          }, 30),
        );
      }
      for (let i: int = 0; i < COUNT; i++) {
        clearInterval(ids[i]);
      }
      await Utils.msSleep(120);
      for (let i: int = 0; i < COUNT; i++) {
        expect(counts[i]).assertEqual(0);
      }
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEARINTERVAL_TEST_2200
     * @tc.name testGlobalClearIntervalTest022
     * @tc.desc cross create and clear: A->B->clearA->C->clearB->clearC, each stage correct
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalClearIntervalTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let aCount: int = 0;
      let bCount: int = 0;
      let cCount: int = 0;
      const idA: int = setInterval((): void => {
        aCount = aCount + 1;
      }, 30);
      const idB: int = setInterval((): void => {
        bCount = bCount + 1;
      }, 30);
      clearInterval(idA);
      const idC: int = setInterval((): void => {
        cCount = cCount + 1;
      }, 30);
      clearInterval(idB);
      clearInterval(idC);
      await Utils.msSleep(120);
      expect(aCount).assertEqual(0);
      expect(bCount).assertEqual(0);
      expect(cCount).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEARINTERVAL_TEST_2300
     * @tc.name testGlobalClearIntervalTest023
     * @tc.desc clearInterval twice on same real timer ID, no exception, other timers unaffected
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalClearIntervalTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let count: int = 0;
      let otherCount: int = 0;
      const id: int = setInterval((): void => {
        count = count + 1;
      }, 30);
      const otherId: int = setInterval((): void => {
        otherCount = otherCount + 1;
      }, 30);
      clearInterval(id);
      const result: void = clearInterval(id);
      expect(result).assertUndefined();
      try {
        await Utils.msSleep(120);
      } catch (e) {
        expect(false).assertFail();
      }
      clearInterval(otherId);
      expect(count).assertEqual(0);
      expect(otherCount).assertLarger(0);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEARINTERVAL_TEST_2400
     * @tc.name testGlobalClearIntervalTest024
     * @tc.desc clearInterval with unregistered random int, active interval unaffected
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalClearIntervalTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let count: int = 0;
      const id: int = setInterval((): void => {
        count = count + 1;
      }, 30);
      clearInterval(77777);
      try {
        await Utils.msSleep(120);
      } catch (e) {
        expect(false).assertFail();
      }
      clearInterval(id);
      expect(count).assertLarger(0);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEARINTERVAL_TEST_2500
     * @tc.name testGlobalClearIntervalTest025
     * @tc.desc clearInterval called twice on same timer ID does not throw
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalClearIntervalTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let count: int = 0;
      const id: int = setInterval((): void => {
        count = count + 1;
      }, 1000);
      const r1: void = clearInterval(id);
      expect(r1).assertUndefined();
      const r2: void = clearInterval(id);
      expect(r2).assertUndefined();
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEARINTERVAL_TEST_2600
     * @tc.name testGlobalClearIntervalTest026
     * @tc.desc clearInterval(Int.MAX_VALUE) returns undefined, active interval unaffected
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalClearIntervalTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let captured: int = 0;
      const id: int = setInterval((): void => {
        captured = 88;
      }, 30);
      const clearResult: void = clearInterval(Int.MAX_VALUE);
      expect(clearResult).assertUndefined();
      await new Promise<int>((resolve: (r: int) => void, _reject: (reason: Error) => void): void => {
        setTimeout((): void => {
          clearInterval(id);
          resolve(0);
        }, 80);
      });
      expect(captured).assertEqual(88);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEARINTERVAL_TEST_2700
     * @tc.name testGlobalClearIntervalTest027
     * @tc.desc clearInterval with Double.toInt(Float.NaN) as ID returns undefined, interval unaffected
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalClearIntervalTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let captured: int = 0;
      const id: int = setInterval((): void => {
        captured = 77;
      }, 30);
      const nanId: int = Double.toInt(Float.NaN);
      const clearResult: void = clearInterval(nanId);
      expect(clearResult).assertUndefined();
      try {
        await new Promise<int>((resolve: (r: int) => void, _reject: (reason: Error) => void): void => {
          setTimeout((): void => {
            clearInterval(id);
            resolve(0);
          }, 80);
        });
      } catch (e) {
        expect(false).assertFail();
      }
      expect(captured).assertEqual(77);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEARINTERVAL_TEST_2800
     * @tc.name testGlobalClearIntervalTest028
     * @tc.desc clearInterval with Double.toInt(Float.POSITIVE_INFINITY) returns undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalClearIntervalTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let captured: int = 0;
      const id: int = setInterval((): void => {
        captured = 66;
      }, 30);
      const infId: int = Double.toInt(Float.POSITIVE_INFINITY);
      const clearResult: void = clearInterval(infId);
      expect(clearResult).assertUndefined();
      try {
        await new Promise<int>((resolve: (r: int) => void, _reject: (reason: Error) => void): void => {
          setTimeout((): void => {
            clearInterval(id);
            resolve(0);
          }, 80);
        });
      } catch (e) {
        expect(false).assertFail();
      }
      expect(captured).assertEqual(66);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEARINTERVAL_TEST_2900
     * @tc.name testGlobalClearIntervalTest029
     * @tc.desc clearInterval with byte type timer ID returns undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalClearIntervalTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const id: int = setInterval((): void => {}, 30);
      const byteId: byte = 10;
      const r: void = clearInterval(byteId);
      expect(r).assertUndefined();
      clearInterval(id);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEARINTERVAL_TEST_3000
     * @tc.name testGlobalClearIntervalTest030
     * @tc.desc clearInterval with short type timer ID returns undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalClearIntervalTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const id: int = setInterval((): void => {}, 30);
      const shortId: short = 100;
      const r: void = clearInterval(shortId);
      expect(r).assertUndefined();
      clearInterval(id);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEARINTERVAL_TEST_3100
     * @tc.name testGlobalClearIntervalTest031
     * @tc.desc clearInterval on already-fired interval does not throw
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalClearIntervalTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let count: int = 0;
      let id: int = 0;
      id = setInterval((): void => {
        count = count + 1;
        clearInterval(id);
      }, 10);
      try {
        await new Promise<int>((resolve: (r: int) => void, _reject: (reason: Error) => void): void => {
          setTimeout((): void => {
            resolve(0);
          }, 50);
        });
      } catch (e) {
        expect(false).assertFail();
      }
      const r: void = clearInterval(id);
      expect(r).assertUndefined();
      expect(count).assertLarger(0);
      done();
    });
  });
}
