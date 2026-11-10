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
} from '@ohos/hypium-static/src/main/indexStatic';
import Utils from '../Util.test';

export default function GlobalClearTimeoutPart_1Test(): void {
  describe('GlobalClearTimeoutPart_1Test', (): void => {
    beforeAll(() => {});

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(async () => {});

    afterAll(() => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEARTIMEOUT_TEST_0100
     * @tc.name testGlobalClearTimeoutTest001
     * @tc.desc clearTimeout() twice then setTimeout() then clearTimeout(id) returns undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalClearTimeoutTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const r1: void = clearTimeout();
      expect(r1).assertUndefined();
      const r2: void = clearTimeout();
      expect(r2).assertUndefined();
      const id: int = setTimeout((): void => {}, 10);
      const r3: void = clearTimeout(id);
      expect(r3).assertUndefined();
      const gtid0: boolean = id > 0;
      expect(gtid0).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEARTIMEOUT_TEST_0200
     * @tc.name testGlobalClearTimeoutTest002
     * @tc.desc setTimeout() then clearTimeout() then clearTimeout(id) returns undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalClearTimeoutTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const id: int = setTimeout((): void => {}, 40);
      const r1: void = clearTimeout();
      expect(r1).assertUndefined();
      const r2: void = clearTimeout(id);
      expect(r2).assertUndefined();
      const gtid0: boolean = id > 0;
      expect(gtid0).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEARTIMEOUT_TEST_0300
     * @tc.name testGlobalClearTimeoutTest003
     * @tc.desc clearTimeout(42) returns undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalClearTimeoutTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: void = clearTimeout(42);
      expect(v).assertUndefined();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEARTIMEOUT_TEST_0400
     * @tc.name testGlobalClearTimeoutTest004
     * @tc.desc clearTimeout(null/undefined/0/-1) returns undefined, no exception
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalClearTimeoutTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const args: (int | null | undefined)[] = [null, undefined, 0, -1];
      for (let i: int = 0; i < args.length; i++) {
        const result: void = clearTimeout(args[i]);
        expect(result).assertUndefined();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEARTIMEOUT_TEST_0500
     * @tc.name testGlobalClearTimeoutTest005
     * @tc.desc clearTimeout cancels setTimeout, callback does not fire
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalClearTimeoutTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let count: int = 0;
      let id: int = setTimeout((): void => {
        count++;
      }, 50);
      clearTimeout(id);
      try {
        await Utils.msSleep(100);
      } catch (e) {
        expect(false).assertFail();
      }
      expect(count).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEARTIMEOUT_TEST_0600
     * @tc.name testGlobalClearTimeoutTest006
     * @tc.desc clearTimeout inside setInterval callback cancels pending timeout
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalClearTimeoutTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let timeoutFired: boolean = false;
      let intervalCount: int = 0;
      const timeoutTid: int = setTimeout((): void => {
        timeoutFired = true;
      }, 200);
      let intervalId: int = setInterval((): void => {
        intervalCount++;
        clearTimeout(timeoutTid);
      }, 50);
      try {
        await Utils.msSleep(300);
      } catch (e) {
        expect(false).assertFail();
      }
      clearInterval(intervalId);
      expect(timeoutFired).assertFalse();
      expect(intervalCount).assertLarger(0);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEARTIMEOUT_TEST_0700
     * @tc.name testGlobalClearTimeoutTest007
     * @tc.desc clearTimeout(-4) returns undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalClearTimeoutTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: void = clearTimeout(-4);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEARTIMEOUT_TEST_0800
     * @tc.name testGlobalClearTimeoutTest008
     * @tc.desc clearTimeout with mixed args [targetId, controllerId] behavior verified
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalClearTimeoutTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let targetFired: boolean = false;
      const targetId: int = setTimeout((): void => {
        targetFired = true;
      }, 150);
      let nestedDone: boolean = false;
      const controllerId: int = setTimeout((): void => {
        clearTimeout(targetId);
        nestedDone = true;
      }, 30);
      try {
        await Utils.msSleep(250);
      } catch (e) {
        expect(false).assertFail();
      }
      clearTimeout(controllerId);
      expect(nestedDone).assertTrue();
      expect(targetFired).assertFalse();
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEARTIMEOUT_TEST_0900
     * @tc.name testGlobalClearTimeoutTest009
     * @tc.desc clearTimeout with invalid timer ID (-1) does not affect active timer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalClearTimeoutTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let fired: boolean = false;
      const id: int = setTimeout((): void => {
        fired = true;
      }, 20);
      const invalidId: int = -1;
      clearTimeout(invalidId);
      try {
        await Utils.msSleep(80);
      } catch (e) {
        expect(false).assertFail();
      }
      clearTimeout(id);
      expect(fired).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEARTIMEOUT_TEST_1000
     * @tc.name testGlobalClearTimeoutTest010
     * @tc.desc clearTimeout() with no parameters does not cancel an active timer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalClearTimeoutTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let executed: boolean = false;
      const timerId: int = setTimeout((): void => {
        executed = true;
      }, 20);
      clearTimeout();
      try {
        await Utils.msSleep(80);
      } catch (e) {
        expect(false).assertFail();
      }
      clearTimeout(timerId);
      expect(executed).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEARTIMEOUT_TEST_1100
     * @tc.name testGlobalClearTimeoutTest011
     * @tc.desc clearTimeout cancels 3 timers before any callback executes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalClearTimeoutTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let count: int = 0;
      let id1: int = setTimeout((): void => {
        count = count + 1;
      }, 20);
      const id2: int = setTimeout((): void => {
        count = count + 1;
      }, 20);
      const id3: int = setTimeout((): void => {
        count = count + 1;
      }, 20);
      clearTimeout(id1);
      clearTimeout(id2);
      clearTimeout(id3);
      try {
        await Utils.msSleep(80);
      } catch (e) {
        expect(false).assertFail();
      }
      expect(count).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEARTIMEOUT_TEST_1200
     * @tc.name testGlobalClearTimeoutTest012
     * @tc.desc clearTimeout cancels one of two timers, the other fires normally
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalClearTimeoutTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let marker: int = 0;
      const firstId: int = setTimeout((): void => {
        marker = 1;
      }, 70);
      let secondId: int = setTimeout((): void => {
        marker = 2;
      }, 20);
      clearTimeout(firstId);
      try {
        await Utils.msSleep(120);
      } catch (e) {
        expect(false).assertFail();
      }
      clearTimeout(secondId);
      expect(marker).assertEqual(2);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEARTIMEOUT_TEST_1300
     * @tc.name testGlobalClearTimeoutTest013
     * @tc.desc Verify clearTimeout with string message setTimeout does not throw
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalClearTimeoutTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const timerId: int = setTimeout('timeout message', 5000);
      const ret: void = clearTimeout(timerId);
      expect(ret).assertUndefined();
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEARTIMEOUT_TEST_1400
     * @tc.name testGlobalClearTimeoutTest014
     * @tc.desc Verify clearTimeout with setInterval timer ID does not throw (cross-timer)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalClearTimeoutTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const intervalId: int = setInterval((): void => {}, 100000);
      const ret: void = clearTimeout(intervalId);
      clearInterval(intervalId);
      expect(ret).assertUndefined();
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEARTIMEOUT_TEST_1500
     * @tc.name testGlobalClearTimeoutTest015
     * @tc.desc Verify clearing 200 timer IDs in a loop does not throw
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalClearTimeoutTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const ids: int[] = [];
      for (let i: int = 0; i < 200; i++) {
        ids.push(setTimeout((): void => {}, 5000));
      }
      for (let i: int = 0; i < ids.length; i++) {
        const ret: void = clearTimeout(ids[i]);
        expect(ret).assertUndefined();
      }
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEARTIMEOUT_TEST_1600
     * @tc.name testGlobalClearTimeoutTest016
     * @tc.desc Verify callback clearing its own timer ID does not throw on setup
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalClearTimeoutTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let selfCleared: boolean = false;
      let selfId: int = 0;
      selfId = setTimeout((): void => {
        selfCleared = true;
        clearTimeout(selfId);
      }, 400);
      expect(selfId).assertLarger(0);
      try {
        await Utils.msSleep(450);
      } catch (e) {
        expect(false).assertFail();
      }
      expect(selfCleared).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEARTIMEOUT_TEST_1700
     * @tc.name testGlobalClearTimeoutTest017
     * @tc.desc clearTimeout(Int.MIN_VALUE) returns undefined, active timer unaffected
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalClearTimeoutTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let captured: int = 0;
      const id: int = setTimeout((): void => {
        captured = 88;
      }, 30);
      const clearResult: void = clearTimeout(Int.MIN_VALUE);
      expect(clearResult).assertUndefined();
      await new Promise<int>((resolve: (r: int) => void, _reject: (reason: Error) => void): void => {
        setTimeout((): void => {
          clearTimeout(id);
          resolve(0);
        }, 80);
      });
      expect(captured).assertEqual(88);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEARTIMEOUT_TEST_1800
     * @tc.name testGlobalClearTimeoutTest018
     * @tc.desc clearTimeout(Int.MAX_VALUE) returns undefined, active timer unaffected
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalClearTimeoutTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let captured: int = 0;
      const id: int = setTimeout((): void => {
        captured = 99;
      }, 30);
      const clearResult: void = clearTimeout(Int.MAX_VALUE);
      expect(clearResult).assertUndefined();
      await new Promise<int>((resolve: (r: int) => void, _reject: (reason: Error) => void): void => {
        setTimeout((): void => {
          clearTimeout(id);
          resolve(0);
        }, 80);
      });
      expect(captured).assertEqual(99);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEARTIMEOUT_TEST_1900
     * @tc.name testGlobalClearTimeoutTest019
     * @tc.desc clearTimeout with Double.toInt(Float.NaN) as ID returns undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalClearTimeoutTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let captured: int = 0;
      const id: int = setTimeout((): void => {
        captured = 77;
      }, 30);
      const nanId: int = Double.toInt(Float.NaN);
      const clearResult: void = clearTimeout(nanId);
      expect(clearResult).assertUndefined();
      await new Promise<int>((resolve: (r: int) => void, _reject: (reason: Error) => void): void => {
        setTimeout((): void => {
          clearTimeout(id);
          resolve(0);
        }, 80);
      });
      expect(captured).assertEqual(77);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEARTIMEOUT_TEST_2000
     * @tc.name testGlobalClearTimeoutTest020
     * @tc.desc clearTimeout twice on same timer ID does not throw
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalClearTimeoutTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const id: int = setTimeout((): void => {}, 30);
      const r1: void = clearTimeout(id);
      expect(r1).assertUndefined();
      const r2: void = clearTimeout(id);
      expect(r2).assertUndefined();
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEARTIMEOUT_TEST_2100
     * @tc.name testGlobalClearTimeoutTest021
     * @tc.desc clearTimeout with Double.toInt(Float.POSITIVE_INFINITY) returns undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalClearTimeoutTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let captured: int = 0;
      const id: int = setTimeout((): void => {
        captured = 66;
      }, 30);
      const infId: int = Double.toInt(Float.POSITIVE_INFINITY);
      const clearResult: void = clearTimeout(infId);
      expect(clearResult).assertUndefined();
      try {
        await new Promise<int>((resolve: (r: int) => void, _reject: (reason: Error) => void): void => {
          setTimeout((): void => {
            clearTimeout(id);
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEARTIMEOUT_TEST_2200
     * @tc.name testGlobalClearTimeoutTest022
     * @tc.desc clearTimeout with byte type timer ID returns undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalClearTimeoutTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const id: int = setTimeout((): void => {}, 30);
      const byteId: byte = 10;
      const r: void = clearTimeout(byteId);
      expect(r).assertUndefined();
      clearTimeout(id);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEARTIMEOUT_TEST_2300
     * @tc.name testGlobalClearTimeoutTest023
     * @tc.desc clearTimeout with short type timer ID returns undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalClearTimeoutTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const id: int = setTimeout((): void => {}, 30);
      const shortId: short = 100;
      const r: void = clearTimeout(shortId);
      expect(r).assertUndefined();
      clearTimeout(id);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEARTIMEOUT_TEST_2400
     * @tc.name testGlobalClearTimeoutTest024
     * @tc.desc clearTimeout with zero-base representations 0x0 0o0 0b0 returns undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalClearTimeoutTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let captured: int = 0;
      const id: int = setTimeout((): void => {
        captured = 55;
      }, 30);
      const r1: void = clearTimeout(0x0);
      expect(r1).assertUndefined();
      const r2: void = clearTimeout(0o0);
      expect(r2).assertUndefined();
      const r3: void = clearTimeout(0b0);
      expect(r3).assertUndefined();
      try {
        await new Promise<int>((resolve: (r: int) => void, _reject: (reason: Error) => void): void => {
          setTimeout((): void => {
            clearTimeout(id);
            resolve(0);
          }, 80);
        });
      } catch (e) {
        expect(false).assertFail();
      }
      expect(captured).assertEqual(55);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEARTIMEOUT_TEST_2500
     * @tc.name testGlobalClearTimeoutTest025
     * @tc.desc clearTimeout on already-fired timer does not throw
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalClearTimeoutTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let fired: boolean = false;
      const id: int = setTimeout((): void => {
        fired = true;
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
      const r: void = clearTimeout(id);
      expect(r).assertUndefined();
      expect(fired).assertTrue();
      done();
    });
  });
}
