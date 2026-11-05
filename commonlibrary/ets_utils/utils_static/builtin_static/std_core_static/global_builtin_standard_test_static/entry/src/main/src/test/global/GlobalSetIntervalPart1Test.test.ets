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

class Worker {
  count: int = 0;
  work(): void {
    this.count = this.count + 1;
  }
}

export default function GlobalSetIntervalPart_1Test(): void {
  describe('GlobalSetIntervalPart_1Test', (): void => {
    beforeAll(() => {});

    beforeEach(async () => {
      await Utils.msSleep(30);
    });
    afterEach(() => {});

    afterAll(() => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_0100
     * @tc.name testGlobalSetIntervalTest001
     * @tc.desc Verify Callback using args for boolean logic result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let andResult: boolean = true;
      const id: int = setInterval(
        (a: boolean, b: boolean): void => {
          andResult = a && b;
        },
        0,
        true,
        false,
      );
      await new Promise<void>((resolve: (value: void) => void, _reject: (reason: Error) => void): void => {
        setTimeout((): void => {
          clearInterval(id);
          resolve(undefined);
        }, 100);
      });
      expect(andResult).assertFalse();
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_0200
     * @tc.name testGlobalSetIntervalTest002
     * @tc.desc Verify Callback modifying integer array element by index using arg
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let arr: int[] = [0, 0, 0];
      const id: int = setInterval(
        (idx: int, val: int): void => {
          arr[idx] = val;
        },
        0,
        1,
        99,
      );
      await new Promise<void>((resolve: (value: void) => void, _reject: (reason: Error) => void): void => {
        setTimeout((): void => {
          clearInterval(id);
          resolve(undefined);
        }, 100);
      });
      expect(arr[1]).assertEqual(99);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_0300
     * @tc.name testGlobalSetIntervalTest003
     * @tc.desc Verify Callback computing power using repeated multiplication via arg
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let result: int = 0;
      let id: int = setInterval(
        (base: int, exp: int): void => {
          let r: int = 1;
          for (let i: int = 0; i < exp; i++) {
            r = r * base;
          }
          result = r;
        },
        0,
        3,
        4,
      );
      await new Promise<void>((resolve: (value: void) => void, _reject: (reason: Error) => void): void => {
        setTimeout((): void => {
          clearInterval(id);
          resolve(undefined);
        }, 100);
      });
      expect(result).assertEqual(81);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_0400
     * @tc.name testGlobalSetIntervalTest004
     * @tc.desc Verify setInterval callback execution count monotonic increase
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let counts: int[] = [0, 0, 0];
      let idx: int = 0;
      let id: int = 0;
      id = setInterval((): void => {
        if (idx < 3) {
          counts[idx] = idx + 1;
          idx = idx + 1;
        }
      }, 0);
      await new Promise<int>((resolve: (v: int) => void, _reject: (reason: Error) => void): void => {
        setTimeout((): void => {
          clearInterval(id);
          resolve(0);
        }, 150);
      });
      expect(counts[0]).assertEqual(1);
      expect(counts[1]).assertEqual(2);
      expect(counts[2]).assertEqual(3);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_0500
     * @tc.name testGlobalSetIntervalTest005
     * @tc.desc Verify delayMs=200 for async verification of callback execution
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let flag: boolean = false;
      let id: int = 0;
      id = setInterval((): void => {
        flag = true;
      }, 200);
      await new Promise<int>((resolve: (v: int) => void, _reject: (reason: Error) => void): void => {
        setTimeout((): void => {
          resolve(0);
        }, 500);
      });
      const result: void = clearInterval(id);
      expect(result).assertUndefined();
      expect(flag).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_0600
     * @tc.name testGlobalSetIntervalTest006
     * @tc.desc Verify Returned ID is usable in clearInterval to stop timer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let counter: int = 0;
      let id: int = 0;
      id = setInterval((): void => {
        counter = counter + 1;
      }, 10);
      const clearResult: void = clearInterval(id);
      expect(clearResult).assertUndefined();
      const snap: int = counter;
      await new Promise<int>((resolve: (v: int) => void, _reject: (reason: Error) => void): void => {
        setTimeout((): void => {
          resolve(0);
        }, 100);
      });
      expect(counter).assertEqual(snap);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_0700
     * @tc.name testGlobalSetIntervalTest007
     * @tc.desc Verify After clearInterval on ID, callback stops incrementing
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let count: int = 0;
      let id: int = 0;
      id = setInterval((): void => {
        count = count + 1;
      }, 5);
      await new Promise<int>((resolve: (v: int) => void, _reject: (reason: Error) => void): void => {
        setTimeout((): void => {
          clearInterval(id);
          resolve(0);
        }, 30);
      });
      const finalCount: int = count;
      await new Promise<int>((resolve: (v: int) => void, _reject: (reason: Error) => void): void => {
        setTimeout((): void => {
          resolve(0);
        }, 50);
      });
      expect(count).assertEqual(finalCount);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_0800
     * @tc.name testGlobalSetIntervalTest008
     * @tc.desc setInterval calls named callback and sets flag
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const namedCallback = (): void => {};
      let flag: boolean = false;
      let id: int = 0;
      id = setInterval((): void => {
        namedCallback();
        flag = true;
      }, 0);
      await new Promise<int>((resolve: (v: int) => void, _reject: (reason: Error) => void): void => {
        setTimeout((): void => {
          clearInterval(id);
          resolve(0);
        }, 30);
      });
      expect(flag).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_0900
     * @tc.name testGlobalSetIntervalTest009
     * @tc.desc Verify Method reference with delayMs=0 verifies callback fires
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const w: Worker = new Worker();
      let id: int = 0;
      id = setInterval((): void => {
        w.work();
      }, 0);
      try {
        await new Promise<int>((resolve: (v: int) => void, _reject: (reason: Error) => void): void => {
          setTimeout((): void => {
            clearInterval(id);
            resolve(0);
          }, 80);
        });
      } catch (e) {
        expect(false).assertFail();
      }
      const countPositive: boolean = w.count > 0;
      expect(countPositive).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_1000
     * @tc.name testGlobalSetIntervalTest010
     * @tc.desc setInterval + clearInterval returns valid positive timer ID
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const id: int = setInterval('');
      const isIdPositive: boolean = id > 0;
      expect(isIdPositive).assertTrue();
      const result: void = clearInterval(id);
      expect(result).assertUndefined();
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_1100
     * @tc.name testGlobalSetIntervalTest011
     * @tc.desc setInterval with JSON string returns valid ID > 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const id: int = setInterval('{"key":"value"}');
      const isIdPositive: boolean = id > 0;
      expect(isIdPositive).assertTrue();
      const result: void = clearInterval(id);
      expect(result).assertUndefined();
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_1200
     * @tc.name testGlobalSetIntervalTest012
     * @tc.desc setInterval with quoted string returns valid ID > 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const id: int = setInterval('he said "hello"');
      const isIdPositive: boolean = id > 0;
      expect(isIdPositive).assertTrue();
      const result: void = clearInterval(id);
      expect(result).assertUndefined();
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_1300
     * @tc.name testGlobalSetIntervalTest013
     * @tc.desc Verify Clear one of two intervals, verify the other is unaffected
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let countA: int = 0;
      let countB: int = 0;
      let handleA: int = 0;
      handleA = setInterval((): void => {
        countA = countA + 1;
      }, 5);
      let handleB: int = 0;
      handleB = setInterval((): void => {
        countB = countB + 1;
      }, 5);
      const clearResult: void = clearInterval(handleA);
      expect(clearResult).assertUndefined();
      const snapA: int = countA;
      const snapB: int = countB;
      try {
        await new Promise<int>((resolve: (v: int) => void, _reject: (reason: Error) => void): void => {
          setTimeout((): void => {
            clearInterval(handleB);
            resolve(0);
          }, 30);
        });
      } catch (e) {
        expect(false).assertFail();
      }
      expect(countB).assertLarger(snapB);
      expect(countA).assertEqual(snapA);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_1400
     * @tc.name testGlobalSetIntervalTest014
     * @tc.desc setInterval with callback capturing value 88 via closure
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let captured: int = 0;
      let id: int = 0;
      id = setInterval((): void => {
        captured = 88;
      }, 30);
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_1500
     * @tc.name testGlobalSetIntervalTest015
     * @tc.desc setInterval with int arg 77 captures value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let captured: int = 0;
      let id: int = 0;
      id = setInterval(
        (a: int): void => {
          captured = a;
        },
        30,
        77,
      );
      try {
        await new Promise<int>((resolve: (r: int) => void, _reject: (reason: Error) => void): void => {
          setTimeout((): void => {
            resolve(0);
          }, 80);
        });
      } catch (e) {
        expect(false).assertFail();
      }
      const clearResult: void = clearInterval(id);
      expect(clearResult).assertUndefined();
      expect(captured).assertEqual(77);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_1600
     * @tc.name testGlobalSetIntervalTest016
     * @tc.desc setInterval with undefined delay triggers callback, clearInterval returns undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let called: boolean = false;
      let id: int = 0;
      id = setInterval((): void => {
        called = true;
      }, undefined);
      await new Promise<int>((resolve: (r: int) => void, _reject: (reason: Error) => void): void => {
        setTimeout((): void => {
          resolve(0);
        }, 100);
      });
      const clearResult: void = clearInterval(id);
      expect(clearResult).assertUndefined();
      expect(called).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_1700
     * @tc.name testGlobalSetIntervalTest017
     * @tc.desc setInterval with -1 delay triggers callback, cleared after wait
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let val: int = 0;
      let id: int = 0;
      id = setInterval((): void => {
        val = 55;
      }, -1);
      await new Promise<int>((resolve: (r: int) => void, _reject: (reason: Error) => void): void => {
        setTimeout((): void => {
          resolve(0);
        }, 100);
      });
      const clearResult: void = clearInterval(id);
      expect(clearResult).assertUndefined();
      expect(val).assertEqual(55);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_1800
     * @tc.name testGlobalSetIntervalTest018
     * @tc.desc setInterval captures two args and clears after
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let capturedA: int = 0;
      let capturedB: int = 0;
      let id: int = 0;
      id = setInterval(
        (a: int, b: int): void => {
          capturedA = a;
          capturedB = b;
        },
        30,
        11,
        22,
      );
      await new Promise<int>((resolve: (r: int) => void, _reject: (reason: Error) => void): void => {
        setTimeout((): void => {
          resolve(0);
        }, 80);
      });
      const clearResult: void = clearInterval(id);
      expect(clearResult).assertUndefined();
      expect(capturedA).assertEqual(11);
      expect(capturedB).assertEqual(22);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_1900
     * @tc.name testGlobalSetIntervalTest019
     * @tc.desc setInterval with 3 args (7, 14, 21), callback captures array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let captured: int[] = [0, 0, 0];
      let id: int = 0;
      id = setInterval(
        (a: int, b: int, c: int): void => {
          captured[0] = a;
          captured[1] = b;
          captured[2] = c;
        },
        30,
        7,
        14,
        21,
      );
      await new Promise<int>((resolve: (r: int) => void, _reject: (reason: Error) => void): void => {
        setTimeout((): void => {
          resolve(0);
        }, 80);
      });
      const clearResult: void = clearInterval(id);
      expect(clearResult).assertUndefined();
      expect(captured[0]).assertEqual(7);
      expect(captured[1]).assertEqual(14);
      expect(captured[2]).assertEqual(21);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_2000
     * @tc.name testGlobalSetIntervalTest020
     * @tc.desc setInterval callback writes constant 33, clearInterval(null) returns undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let captured: int = 0;
      let id: int = 0;
      id = setInterval((): void => {
        captured = 33;
      }, 30);
      const clearResult: void = clearInterval(null);
      expect(clearResult).assertUndefined();
      await new Promise<int>((resolve: (r: int) => void, _reject: (reason: Error) => void): void => {
        setTimeout((): void => {
          clearInterval(id);
          resolve(0);
        }, 80);
      });
      expect(captured).assertEqual(33);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_2100
     * @tc.name testGlobalSetIntervalTest021
     * @tc.desc clearInterval(undefined) returns undefined, interval unaffected
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let captured: int = 0;
      let id: int = 0;
      id = setInterval((): void => {
        captured = 44;
      }, 30);
      const clearResult: void = clearInterval(undefined);
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
      expect(captured).assertEqual(44);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_2200
     * @tc.name testGlobalSetIntervalTest022
     * @tc.desc clearInterval(-1) returns undefined, interval unaffected
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let captured: int = 0;
      let id: int = 0;
      id = setInterval((): void => {
        captured = 55;
      }, 30);
      const clearResult: void = clearInterval(-1);
      expect(clearResult).assertUndefined();
      await new Promise<int>((resolve: (r: int) => void, _reject: (reason: Error) => void): void => {
        setTimeout((): void => {
          clearInterval(id);
          resolve(0);
        }, 80);
      });
      expect(captured).assertEqual(55);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_2300
     * @tc.name testGlobalSetIntervalTest023
     * @tc.desc clearInterval(0) returns undefined, interval unaffected
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let captured: int = 0;
      let id: int = 0;
      id = setInterval((): void => {
        captured = 66;
      }, 30);
      const clearResult: void = clearInterval(0);
      expect(clearResult).assertUndefined();
      await new Promise<int>((resolve: (r: int) => void, _reject: (reason: Error) => void): void => {
        setTimeout((): void => {
          clearInterval(id);
          resolve(0);
        }, 80);
      });
      expect(captured).assertEqual(66);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_2400
     * @tc.name testGlobalSetIntervalTest024
     * @tc.desc clearInterval returns undefined, other interval unaffected
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let otherCount: int = 0;
      let mainId: int = 0;
      mainId = setInterval((): void => {}, 30);
      const otherId: int = setInterval((): void => {
        otherCount = otherCount + 1;
      }, 20);
      const clearResult: void = clearInterval(mainId);
      expect(clearResult).assertUndefined();
      await new Promise<int>((resolve: (r: int) => void, _reject: (reason: Error) => void): void => {
        setTimeout((): void => {
          clearInterval(otherId);
          resolve(0);
        }, 80);
      });
      expect(otherCount).assertLarger(0);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_2500
     * @tc.name testGlobalSetIntervalTest025
     * @tc.desc Clear string interval, function interval continues running
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let funcCount: int = 0;
      const funcId: int = setInterval((): void => {
        funcCount = funcCount + 1;
      }, 20);
      let strId: int = 0;
      strId = setInterval('leave func intact', 30);
      const clearResult: void = clearInterval(strId);
      expect(clearResult).assertUndefined();
      await new Promise<int>((resolve: (r: int) => void, _reject: (reason: Error) => void): void => {
        setTimeout((): void => {
          clearInterval(funcId);
          resolve(0);
        }, 80);
      });
      expect(funcCount >= 1).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_2600
     * @tc.name testGlobalSetIntervalTest026
     * @tc.desc Clear one interval, other interval keeps running
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let survivor: int = 0;
      let idA: int = 0;
      idA = setInterval((): void => {}, 30);
      const idB: int = setInterval((): void => {
        survivor = 88;
      }, 30);
      const clearResult: void = clearInterval(idA);
      expect(clearResult).assertUndefined();
      await new Promise<int>((resolve: (r: int) => void, _reject: (reason: Error) => void): void => {
        setTimeout((): void => {
          clearInterval(idB);
          resolve(0);
        }, 80);
      });
      expect(survivor).assertEqual(88);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_2700
     * @tc.name testGlobalSetIntervalTest027
     * @tc.desc Clear first interval, create two more with callback args, clear both after await
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let firstId: int = 0;
      firstId = setInterval((): void => {}, 30);
      const clearResult: void = clearInterval(firstId);
      expect(clearResult).assertUndefined();
      const secondId: int = setInterval((): void => {}, 30);
      let captured: int = 0;
      const thirdId: int = setInterval(
        (a: int): void => {
          captured = a;
        },
        30,
        99,
      );
      await new Promise<int>((resolve: (r: int) => void, _reject: (reason: Error) => void): void => {
        setTimeout((): void => {
          clearInterval(secondId);
          clearInterval(thirdId);
          resolve(0);
        }, 80);
      });
      expect(captured).assertEqual(99);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_2800
     * @tc.name testGlobalSetIntervalTest028
     * @tc.desc Verify clearInterval
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let executed: boolean = false;
      let selfId: int = 0;
      selfId = setInterval((): void => {
        executed = true;
        const clearResult: void = clearInterval(selfId);
        expect(clearResult).assertUndefined();
      }, 30);
      await new Promise<int>((resolve: (r: int) => void, _reject: (reason: Error) => void): void => {
        setTimeout((): void => {
          resolve(0);
        }, 100);
      });
      expect(executed).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_2900
     * @tc.name testGlobalSetIntervalTest029
     * @tc.desc Two intervals sharing a counter, clear both
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let shared: int = 0;
      let idA: int = 0;
      idA = setInterval((): void => {
        shared = shared + 1;
      }, 30);
      let idB: int = 0;
      idB = setInterval((): void => {
        shared = shared + 1;
      }, 30);
      await new Promise<int>((resolve: (r: int) => void, _reject: (reason: Error) => void): void => {
        setTimeout((): void => {
          resolve(0);
        }, 80);
      });
      const clearResult: void = clearInterval(idA);
      expect(clearResult).assertUndefined();
      const clearResult2: void = clearInterval(idB);
      expect(clearResult2).assertUndefined();
      expect(shared).assertLarger(0);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_3000
     * @tc.name testGlobalSetIntervalTest030
     * @tc.desc Function, string, and no-op intervals coexist, clear all three
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let shared: int = 0;
      let fId: int = 0;
      fId = setInterval((): void => {
        shared = shared + 1;
      }, 30);
      let sId: int = 0;
      sId = setInterval('coexist message', 50);
      let id: int = 0;
      id = setInterval((): void => {}, 0);
      await new Promise<int>((resolve: (r: int) => void, _reject: (reason: Error) => void): void => {
        setTimeout((): void => {
          resolve(0);
        }, 80);
      });
      const clearResult: void = clearInterval(fId);
      expect(clearResult).assertUndefined();
      const clearResult2: void = clearInterval(sId);
      expect(clearResult2).assertUndefined();
      const clearResult3: void = clearInterval(id);
      expect(clearResult3).assertUndefined();
      expect(shared).assertLarger(0);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_3100
     * @tc.name testGlobalSetIntervalTest031
     * @tc.desc setInterval with shared variable and int arg captures same value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let sharedA: int = 0;
      let idA: int = 0;
      idA = setInterval(
        (a: int): void => {
          sharedA = a;
        },
        30,
        11,
      );
      let sharedB: int = 0;
      let idB: int = 0;
      idB = setInterval(
        (a: int): void => {
          sharedB = a;
        },
        30,
        22,
      );
      let id: int = 0;
      id = setInterval((): void => {}, 0);
      await new Promise<int>((resolve: (r: int) => void, _reject: (reason: Error) => void): void => {
        setTimeout((): void => {
          resolve(0);
        }, 80);
      });
      const clearResult: void = clearInterval(idA);
      expect(clearResult).assertUndefined();
      const clearResult2: void = clearInterval(idB);
      expect(clearResult2).assertUndefined();
      const clearResult3: void = clearInterval(id);
      expect(clearResult3).assertUndefined();
      expect(sharedA).assertEqual(11);
      expect(sharedB).assertEqual(22);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_3200
     * @tc.name testGlobalSetIntervalTest032
     * @tc.desc setInterval captures external const (42) via closure
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let external: int = 42;
      let captured: int = 0;
      let id: int = 0;
      id = setInterval((): void => {
        captured = external;
      }, 30);
      await new Promise<int>((resolve: (r: int) => void, _reject: (reason: Error) => void): void => {
        setTimeout((): void => {
          resolve(0);
        }, 80);
      });
      const clearResult: void = clearInterval(id);
      expect(clearResult).assertUndefined();
      expect(captured).assertEqual(42);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_3300
     * @tc.name testGlobalSetIntervalTest033
     * @tc.desc Two intervals sharing counter, clear one, other continues
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let count: int = 0;
      let idA: int = 0;
      idA = setInterval((): void => {
        count = count + 1;
      }, 50);
      const idB: int = setInterval((): void => {
        count = count + 1;
      }, 50);
      const clearResult: void = clearInterval(idA);
      expect(clearResult).assertUndefined();
      await new Promise<int>((resolve: (r: int) => void, _reject: (reason: Error) => void): void => {
        setTimeout((): void => {
          clearInterval(idB);
          resolve(0);
        }, 120);
      });
      expect(count).assertLarger(0);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_3400
     * @tc.name testGlobalSetIntervalTest034
     * @tc.desc setInterval with nested interval creation and clear
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let messageSent: boolean = false;
      let innerId: int = 0;
      let outerId: int = 0;
      outerId = setInterval((): void => {
        clearInterval(innerId);
        innerId = setInterval('nested message', 30);
        messageSent = true;
      }, 30);
      let id: int = 0;
      id = setInterval((): void => {}, 0);
      await new Promise<int>((resolve: (r: int) => void, _reject: (reason: Error) => void): void => {
        setTimeout((): void => {
          resolve(0);
        }, 80);
      });
      const clearResult: void = clearInterval(outerId);
      expect(clearResult).assertUndefined();
      const clearResult2: void = clearInterval(id);
      expect(clearResult2).assertUndefined();
      const clearResult3: void = clearInterval(innerId);
      expect(clearResult3).assertUndefined();
      expect(messageSent).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_3500
     * @tc.name testGlobalSetIntervalTest035
     * @tc.desc setInterval with callback that increments counter via closure, clear target interval
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let targetCount: int = 0;
      let targetId: int = 0;
      targetId = setInterval((): void => {
        targetCount = targetCount + 1;
      }, 30);
      let controllerId: int = setInterval((): void => {
        const clearResult: void = clearInterval(targetId);
        expect(clearResult).assertUndefined();
      }, 50);
      await new Promise<int>((resolve: (r: int) => void, _reject: (reason: Error) => void): void => {
        setTimeout((): void => {
          clearInterval(controllerId);
          resolve(0);
        }, 120);
      });
      expect(targetCount >= 1).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_3600
     * @tc.name testGlobalSetIntervalTest036
     * @tc.desc setInterval with arg (42) modifies array element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const arr: int[] = [0];
      let id: int = 0;
      id = setInterval(
        (v: int): void => {
          arr[0] = v;
        },
        30,
        42,
      );
      await new Promise<int>((resolve: (r: int) => void, _reject: (reason: Error) => void): void => {
        setTimeout((): void => {
          resolve(0);
        }, 80);
      });
      const clearResult: void = clearInterval(id);
      expect(clearResult).assertUndefined();
      expect(arr[0]).assertEqual(42);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_3700
     * @tc.name testGlobalSetIntervalTest037
     * @tc.desc setInterval with string arg ("hello"), callback captures it
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let captured: string = '';
      let id: int = 0;
      id = setInterval(
        (s: string): void => {
          captured = s;
        },
        30,
        'hello',
      );
      await new Promise<int>((resolve: (r: int) => void, _reject: (reason: Error) => void): void => {
        setTimeout((): void => {
          resolve(0);
        }, 80);
      });
      const clearResult: void = clearInterval(id);
      expect(clearResult).assertUndefined();
      expect(captured).assertEqual('hello');
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_3800
     * @tc.name testGlobalSetIntervalTest038
     * @tc.desc setInterval with boolean arg (true), callback captures it
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let captured: boolean = false;
      let id: int = 0;
      id = setInterval(
        (b: boolean): void => {
          captured = b;
        },
        30,
        true,
      );
      await new Promise<int>((resolve: (r: int) => void, _reject: (reason: Error) => void): void => {
        setTimeout((): void => {
          resolve(0);
        }, 80);
      });
      const clearResult: void = clearInterval(id);
      expect(clearResult).assertUndefined();
      expect(captured).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_3900
     * @tc.name testGlobalSetIntervalTest039
     * @tc.desc setInterval callback uses inner const, assigns to outer variable
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let outer: int = 0;
      let id: int = 0;
      id = setInterval((): void => {
        const inner: int = 5;
        outer = inner;
      }, 30);
      await new Promise<int>((resolve: (r: int) => void, _reject: (reason: Error) => void): void => {
        setTimeout((): void => {
          resolve(0);
        }, 80);
      });
      const clearResult: void = clearInterval(id);
      expect(clearResult).assertUndefined();
      expect(outer).assertEqual(5);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_4000
     * @tc.name testGlobalSetIntervalTest040
     * @tc.desc Verify setInterval state callback and string-message interval coexist, clearInterval returns undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let state: int = 0;
      let ids: int[] = [0, 0];
      ids[0] = setInterval((): void => {
        state = state + 1;
      }, 30);
      ids[1] = setInterval('mixed state msg', 50);
      await new Promise<int>((resolve: (r: int) => void, _reject: (reason: Error) => void): void => {
        setTimeout((): void => {
          resolve(0);
        }, 50);
      });
      expect(state).assertLarger(0);
      expect(clearInterval(ids[0])).assertUndefined();
      expect(clearInterval(ids[1])).assertUndefined();
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_4100
     * @tc.name testGlobalSetIntervalTest041
     * @tc.desc Interval throws, catches, then cleared in setTimeout
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let threw: boolean = false;
      let id: int = setInterval((): void => {
        try {
          throw new Error('post throw clear');
        } catch (e) {
          threw = true;
          expect(e.name).assertEqual('Error');
        }
      }, 30);
      try {
        await new Promise<void>((resolve: (value: void) => void, _reject: (reason: Error) => void): void => {
          setTimeout((): void => {
            clearInterval(id);
            resolve(undefined);
          }, 60);
        });
      } catch (e) {
        expect(false).assertFail();
      }
      expect(threw).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_4200
     * @tc.name testGlobalSetIntervalTest042
     * @tc.desc Isolated throw interval does not affect normal interval execution
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let normalCount: int = 0;
      let throwHandled: boolean = false;
      let throwId: int = setInterval((): void => {
        try {
          throw new Error('isolated throw');
        } catch (e) {
          throwHandled = true;
          expect(e.name).assertEqual('Error');
        }
      }, 30);
      const normalId: int = setInterval((): void => {
        normalCount = normalCount + 1;
      }, 30);
      await new Promise<void>((resolve: (value: void) => void, _reject: (reason: Error) => void): void => {
        setTimeout((): void => {
          resolve(undefined);
        }, 120);
      });
      clearInterval(throwId);
      clearInterval(normalId);
      expect(throwHandled).assertTrue();
      const isCountSnap: boolean = normalCount >= 2;
      expect(isCountSnap).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_4300
     * @tc.name testGlobalSetIntervalTest043
     * @tc.desc Conditional throw (count>=2) inside interval, caught and verified
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let count: int = 0;
      let threw: boolean = false;
      let id: int = 0;
      id = setInterval((): void => {
        count = count + 1;
        if (count >= 2) {
          try {
            throw new Error('conditional');
          } catch (e) {
            expect(e.name).assertEqual('Error');
            threw = true;
          }
        }
      }, 20);
      await new Promise<int>((resolve: (r: int) => void, _reject: (reason: Error) => void): void => {
        setTimeout((): void => {
          resolve(0);
        }, 80);
      });
      const clearResult: void = clearInterval(id);
      expect(clearResult).assertUndefined();
      expect(threw).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_4400
     * @tc.name testGlobalSetIntervalTest044
     * @tc.desc Self-clearing interval with try-catch, verify error handled
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let handled: boolean = false;
      let id: int = 0;
      id = setInterval((): void => {
        try {
          throw new Error('test');
        } catch (e) {
          expect(e.name).assertEqual('Error');
          handled = true;
        }
        clearInterval(id);
      }, 30);
      await new Promise<int>((resolve: (r: int) => void, _reject: (reason: Error) => void): void => {
        setTimeout((): void => {
          resolve(0);
        }, 80);
      });
      const clearResult: void = clearInterval(id);
      expect(clearResult).assertUndefined();
      expect(handled).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_4500
     * @tc.name testGlobalSetIntervalTest045
     * @tc.desc First interval throws, second interval captures value (99)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let threw: boolean = false;
      let firstId: int = 0;
      firstId = setInterval((): void => {
        try {
          throw new Error('first error');
        } catch (e) {
          expect(e.name).assertEqual('Error');
          threw = true;
        }
      }, 20);
      await new Promise<int>((resolve: (r: int) => void, _reject: (reason: Error) => void): void => {
        setTimeout((): void => {
          resolve(0);
        }, 50);
      });
      const clearResult: void = clearInterval(firstId);
      expect(clearResult).assertUndefined();
      let captured: int = 0;
      let secondId: int = 0;
      secondId = setInterval((): void => {
        captured = 99;
      }, 30);
      await new Promise<int>((resolve: (r: int) => void, _reject: (reason: Error) => void): void => {
        setTimeout((): void => {
          resolve(0);
        }, 80);
      });
      const clearResult2: void = clearInterval(secondId);
      expect(clearResult2).assertUndefined();
      expect(threw).assertTrue();
      expect(captured).assertEqual(99);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_4600
     * @tc.name testGlobalSetIntervalTest046
     * @tc.desc Repetitive throw each cycle, count tracks iterations >= 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let count: int = 0;
      let threw: boolean = false;
      let id: int = setInterval((): void => {
        count = count + 1;
        try {
          throw new Error('repeat ' + count);
        } catch (e) {
          threw = true;
          expect(e.name).assertEqual('Error');
        }
      }, 20);
      try {
        await new Promise<void>((resolve: (value: void) => void, _reject: (reason: Error) => void): void => {
          setTimeout((): void => {
            clearInterval(id);
            resolve(undefined);
          }, 80);
        });
      } catch (e) {
        expect(false).assertFail();
      }
      expect(threw).assertTrue();
      const isCountSnap: boolean = count >= 2;
      expect(isCountSnap).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_4700
     * @tc.name testGlobalSetIntervalTest047
     * @tc.desc Verify setInterval function and string-message intervals coexist, thrown error caught in callback
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let funcState: int = 0;
      let threw: boolean = false;
      const sId: int = setInterval('safe string', 30);
      let fId: int = setInterval((): void => {
        funcState = 55;
        try {
          throw new Error('func error');
        } catch (e) {
          threw = true;
          expect(e.name).assertEqual('Error');
        }
      }, 30);
      try {
        await new Promise<void>((resolve: (value: void) => void, _reject: (reason: Error) => void): void => {
          setTimeout((): void => {
            resolve(undefined);
          }, 80);
        });
      } catch (e) {
        expect(false).assertFail();
      }
      clearInterval(fId);
      clearInterval(sId);
      expect(threw).assertTrue();
      expect(funcState).assertEqual(55);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_4800
     * @tc.name testGlobalSetIntervalTest048
     * @tc.desc Throw inside setInterval is caught, new ID is distinct
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let threw: boolean = false;
      let id: int = setInterval((): void => {
        try {
          throw new Error('corrupt check');
        } catch (e) {
          threw = true;
          expect(e.name).assertEqual('Error');
        }
      }, 30);
      try {
        await new Promise<void>((resolve: (value: void) => void, _reject: (reason: Error) => void): void => {
          setTimeout((): void => {
            resolve(undefined);
          }, 50);
        });
      } catch (e) {
        expect(false).assertFail();
      }
      expect(threw).assertTrue();
      const newId: int = setInterval((): void => {}, 100);
      const distinct: boolean = id !== newId;
      clearInterval(id);
      clearInterval(newId);
      expect(distinct).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_4900
     * @tc.name testGlobalSetIntervalTest049
     * @tc.desc Verify safe and throwing intervals coexist, both cleared, thrown error caught
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let safeVal: int = 0;
      let threw: boolean = false;
      const safeId: int = setInterval((): void => {
        safeVal = 77;
      }, 30);
      let throwId: int = setInterval((): void => {
        try {
          throw new Error('coexist throw');
        } catch (e) {
          threw = true;
          expect(e.name).assertEqual('Error');
        }
      }, 30);
      try {
        await new Promise<void>((resolve: (value: void) => void, _reject: (reason: Error) => void): void => {
          setTimeout((): void => {
            resolve(undefined);
          }, 80);
        });
      } catch (e) {
        expect(false).assertFail();
      }
      clearInterval(safeId);
      clearInterval(throwId);
      expect(threw).assertTrue();
      expect(safeVal).assertEqual(77);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_5000
     * @tc.name testGlobalSetIntervalTest050
     * @tc.desc setInterval with 3 timers and selective clear
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let val: int = 0;
      let ids: int[] = [0, 0, 0];
      ids[0] = setInterval((): void => {
        val = 1;
      }, 50);
      clearInterval(ids[0]);
      ids[1] = setInterval('seq msg', 50);
      ids[2] = setInterval((): void => {
        val = 2;
      }, 50);
      await new Promise<int>((resolve: (r: int) => void, _reject: (reason: Error) => void): void => {
        setTimeout((): void => {
          resolve(0);
        }, 80);
      });
      expect(val).assertEqual(2);
      clearInterval(ids[1]);
      clearInterval(ids[2]);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_5100
     * @tc.name testGlobalSetIntervalTest051
     * @tc.desc setInterval with multi-timer and clear after first
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let val: int = 0;
      let idA: int = 0;
      idA = setInterval((): void => {
        val = 10;
      }, 30);
      const clearResult: void = clearInterval(idA);
      expect(clearResult).assertUndefined();
      const idB: int = setInterval((): void => {
        val = 20;
      }, 30);
      try {
        await new Promise<int>((resolve: (r: int) => void, _reject: (reason: Error) => void): void => {
          setTimeout((): void => {
            resolve(0);
          }, 80);
        });
      } catch (e) {
        expect(false).assertFail();
      }
      clearInterval(idB);
      expect(val).assertEqual(20);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_5200
     * @tc.name testGlobalSetIntervalTest052
     * @tc.desc setInterval with delayMs=null and two args (30, 12), sum=42
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let sum: int = 0;
      let id: int = 0;
      id = setInterval(
        (a: int, b: int): void => {
          sum = a + b;
        },
        null,
        30,
        12,
      );
      try {
        await new Promise<int>((resolve: (r: int) => void, _reject: (reason: Error) => void): void => {
          setTimeout((): void => {
            resolve(0);
          }, 100);
        });
      } catch (e) {
        expect(false).assertFail();
      }
      const clearResult: void = clearInterval(id);
      expect(clearResult).assertUndefined();
      expect(sum).assertEqual(42);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_5300
     * @tc.name testGlobalSetIntervalTest053
     * @tc.desc setInterval with Double.toInt(Float.NaN) as delayMs, callback fires
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let count: int = 0;
      const id: int = setInterval((): void => {
        count = count + 1;
      }, Double.toInt(Float.NaN));
      try {
        await Utils.msSleep(100);
      } catch (e) {
        expect(false).assertFail();
      }
      clearInterval(id);
      expect(count).assertLarger(0);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_5400
     * @tc.name testGlobalSetIntervalTest054
     * @tc.desc setInterval with error handling throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        setInterval(null as () => void, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_5500
     * @tc.name testGlobalSetIntervalTest055
     * @tc.desc setInterval(undefined as () => void, 0) with undefined callback via type cast throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        setInterval(undefined as () => void, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_5600
     * @tc.name testGlobalSetIntervalTest056
     * @tc.desc setInterval passes null and undefined as rest args to the callback
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let receivedNull: boolean = false;
      let receivedUndefined: boolean = false;
      const timerId: int = setInterval(
        (a: Object | null, b: string | undefined): void => {
          receivedNull = a === null;
          receivedUndefined = b === undefined;
        },
        20,
        null,
        undefined,
      );
      expect(timerId).assertLarger(0);
      await Utils.msSleep(80);
      clearInterval(timerId);
      expect(receivedNull).assertTrue();
      expect(receivedUndefined).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_5700
     * @tc.name testGlobalSetIntervalTest057
     * @tc.desc Verify setInterval with long string msg (10000 chars) returns valid timer id
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let longStr: string = '';
      for (let i: int = 0; i < 10000; i++) {
        longStr += 'a';
      }
      const timerId: int = setInterval(longStr, 0);
      expect(timerId).assertLarger(0);
      clearInterval(timerId);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_5800
     * @tc.name testGlobalSetIntervalTest058
     * @tc.desc Verify setInterval with unicode and emoji msg returns valid timer id
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const timerId: int = setInterval('你好世界你好', 0);
      expect(timerId).assertLarger(0);
      clearInterval(timerId);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_5900
     * @tc.name testGlobalSetIntervalTest059
     * @tc.desc Verify setInterval with whitespace msg returns valid timer id
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const timerId: int = setInterval('   ', 0);
      expect(timerId).assertLarger(0);
      clearInterval(timerId);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_6000
     * @tc.name testGlobalSetIntervalTest060
     * @tc.desc Verify setInterval with special symbols in msg returns valid timer id
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const timerId: int = setInterval('!@#$%^&*()_+-=[]{}|;:, .<>?/~`', 0);
      expect(timerId).assertLarger(0);
      clearInterval(timerId);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_6100
     * @tc.name testGlobalSetIntervalTest061
     * @tc.desc Verify setInterval with delayMs from variable returns valid timer id
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let delay: int = 500;
      const timerId: int = setInterval((): void => {}, delay);
      expect(timerId).assertLarger(0);
      clearInterval(timerId);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_6200
     * @tc.name testGlobalSetIntervalTest062
     * @tc.desc Verify setInterval with ternary delayMs expression returns valid timer id
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let cond: boolean = true;
      const timerId: int = setInterval((): void => {}, cond ? 100 : 200);
      expect(timerId).assertLarger(0);
      clearInterval(timerId);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_6300
     * @tc.name testGlobalSetIntervalTest063
     * @tc.desc Verify setInterval with delayMs from function return returns valid timer id
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let getDelay = (): int => {
        return 100;
      };
      const timerId: int = setInterval((): void => {}, getDelay());
      expect(timerId).assertLarger(0);
      clearInterval(timerId);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_6400
     * @tc.name testGlobalSetIntervalTest064
     * @tc.desc Verify setInterval msg overload with delayMs 0 returns valid timer id
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const timerId: int = setInterval('zero delay msg', 0);
      expect(timerId).assertLarger(0);
      clearInterval(timerId);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_6500
     * @tc.name testGlobalSetIntervalTest065
     * @tc.desc Verify setInterval msg overload with negative delayMs -1 returns valid timer id
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const timerId: int = setInterval('negative delay msg', -1);
      expect(timerId).assertLarger(0);
      clearInterval(timerId);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_6600
     * @tc.name testGlobalSetIntervalTest066
     * @tc.desc Verify setInterval msg overload with Float.NaN delayMs returns valid timer id
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const timerId: int = setInterval('nan delay msg', Double.toInt(Float.NaN));
      expect(timerId).assertLarger(0);
      clearInterval(timerId);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_6700
     * @tc.name testGlobalSetIntervalTest067
     * @tc.desc Verify setInterval msg overload with Float.POSITIVE_INFINITY delayMs returns valid timer id
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const timerId: int = setInterval('inf delay msg', Double.toInt(Float.POSITIVE_INFINITY));
      expect(timerId).assertLarger(0);
      clearInterval(timerId);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_6800
     * @tc.name testGlobalSetIntervalTest068
     * @tc.desc Verify multiple timer IDs are all unique via Set
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const ids: Set<int> = new Set<int>();
      ids.add(setInterval((): void => {}, 100));
      ids.add(setInterval('msg', 100));
      ids.add(setInterval((): void => {}, 200));
      ids.add(setInterval((a: int): void => {}, 100, 1));
      expect(ids.size).assertEqual(4);
      for (let id of ids) {
        clearInterval(id);
      }
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_6900
     * @tc.name testGlobalSetIntervalTest069
     * @tc.desc Verify creating and clearing 50 timers in order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let ids: int[] = [];
      for (let i: int = 0; i < 50; i++) {
        ids.push(setInterval((): void => {}, 100));
      }
      for (let j: int = 0; j < 50; j++) {
        const clearRes: void = clearInterval(ids[j]);
        expect(clearRes).assertUndefined();
      }
      expect(ids.length).assertEqual(50);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_7000
     * @tc.name testGlobalSetIntervalTest070
     * @tc.desc Verify setInterval nested for loop 3x3 timers
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let ids: int[][] = [];
      for (let i: int = 0; i < 3; i++) {
        ids.push([]);
        for (let j: int = 0; j < 3; j++) {
          ids[i].push(setInterval((): void => {}, 100));
        }
      }
      for (let i: int = 0; i < 3; i++) {
        for (let j: int = 0; j < 3; j++) {
          const clearRes: void = clearInterval(ids[i][j]);
          expect(clearRes).assertUndefined();
        }
      }
      expect(ids.length).assertEqual(3);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_7100
     * @tc.name testGlobalSetIntervalTest071
     * @tc.desc Verify setInterval do-while 5 timers
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let ids: int[] = [];
      let idx: int = 0;
      do {
        ids.push(setInterval((): void => {}, 100));
        idx++;
      } while (idx < 5);
      idx = 0;
      do {
        const clearRes: void = clearInterval(ids[idx]);
        expect(clearRes).assertUndefined();
        idx++;
      } while (idx < 5);
      expect(ids.length).assertEqual(5);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_7200
     * @tc.name testGlobalSetIntervalTest072
     * @tc.desc Verify setInterval timer stored in Map
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let timerMap: Map<string, int> = new Map<string, int>();
      let tid: int = setInterval((): void => {}, 100);
      timerMap.set('t1', tid);
      let timerId: int | undefined = timerMap.get('t1');
      if (timerId !== undefined) {
        clearInterval(timerId);
      }
      expect(tid).assertLarger(0);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_7300
     * @tc.name testGlobalSetIntervalTest073
     * @tc.desc Verify setInterval in if-false branch does not create timer, if-true branch creates timer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let flag: boolean = false;
      let timerId: int = 0;
      if (flag) {
        timerId = setInterval((): void => {}, 100);
      }
      expect(timerId).assertEqual(0);
      flag = true;
      if (flag) {
        timerId = setInterval((): void => {}, 100);
      }
      expect(timerId).assertLarger(0);
      clearInterval(timerId);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_7400
     * @tc.name testGlobalSetIntervalTest074
     * @tc.desc Verify setInterval callback with ternary expression inside
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let flag: boolean = true;
      let captured: int = 0;
      const timerId: int = setInterval((): void => {
        captured = flag ? 1 : 0;
      }, 20);
      try {
        try {
          await Utils.msSleep(60);
        } catch (e) {
          expect(false).assertFail();
        }
      } catch (e) {
        expect(false).assertFail();
      }
      clearInterval(timerId);
      expect(captured).assertEqual(1);
      expect(timerId).assertLarger(0);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_7500
     * @tc.name testGlobalSetIntervalTest075
     * @tc.desc Verify setInterval with number cast as func throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let num: int = 123;
        setInterval(num as Function, 100);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_7600
     * @tc.name testGlobalSetIntervalTest076
     * @tc.desc Verify setInterval with string cast as func throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let str: string = 'not a function';
        setInterval(str as Function, 100);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_7700
     * @tc.name testGlobalSetIntervalTest077
     * @tc.desc Verify setInterval with null msg as string throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        setInterval(null as string, 100);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_7800
     * @tc.name testGlobalSetIntervalTest078
     * @tc.desc setInterval with long type delay parameter, callback fires then cleared
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let count: int = 0;
      const delay: long = 10;
      const id: int = setInterval((): void => {
        count = count + 1;
      }, Long.toInt(delay));
      await Utils.msSleep(50);
      clearInterval(id);
      expect(count).assertLarger(0);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_7900
     * @tc.name testGlobalSetIntervalTest079
     * @tc.desc Verify setInterval with 6 args returns valid timer id
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const timerId: int = setInterval(
        (a: int, b: int, c: int, d: int, e: int, f: int): void => {},
        100,
        1,
        2,
        3,
        4,
        5,
        6,
      );
      expect(timerId).assertLarger(0);
      clearInterval(timerId);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_8000
     * @tc.name testGlobalSetIntervalTest080
     * @tc.desc Verify setInterval with double arg returns valid timer id
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const timerId: int = setInterval((d: number): void => {}, 100, 3.14);
      expect(timerId).assertLarger(0);
      clearInterval(timerId);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_8100
     * @tc.name testGlobalSetIntervalTest081
     * @tc.desc Verify setInterval with byte arg returns valid timer id
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const timerId: int = setInterval((b: byte): void => {}, 100, 127);
      expect(timerId).assertLarger(0);
      clearInterval(timerId);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_8200
     * @tc.name testGlobalSetIntervalTest082
     * @tc.desc Verify setInterval msg overload with multiple timers all produce valid ids
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const id0: int = setInterval('msg', 0);
      const id1: int = setInterval('msg', 100);
      const id2: int = setInterval('msg', 500);
      expect(id0).assertLarger(0);
      expect(id1).assertLarger(0);
      expect(id2).assertLarger(0);
      clearInterval(id0);
      clearInterval(id1);
      clearInterval(id2);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_8300
     * @tc.name testGlobalSetIntervalTest083
     * @tc.desc setInterval with delayMs=null, callback fires then cleared
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let count: int = 0;
      const id: int = setInterval((): void => {
        count = count + 1;
      }, null);
      expect(id).assertLarger(0);
      try {
        await Utils.msSleep(100);
      } catch (e) {
        expect(false).assertFail();
      }
      clearInterval(id);
      expect(count).assertLarger(0);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_8400
     * @tc.name testGlobalSetIntervalTest084
     * @tc.desc Verify setInterval self-clear with counter condition stops after limit
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let count: int = 0;
      let id: int = 0;
      id = setInterval((): void => {
        count = count + 1;
        if (count >= 3) {
          clearInterval(id);
        }
      }, 10);
      try {
        await Utils.msSleep(80);
      } catch (e) {
        expect(false).assertFail();
      }
      expect(count).assertEqual(3);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_8500
     * @tc.name testGlobalSetIntervalTest085
     * @tc.desc setInterval with number type delay parameter, callback fires then cleared
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let count: int = 0;
      const delay: byte = 10;
      const id: int = setInterval((): void => {
        count = count + 1;
      }, Double.toInt(delay));
      await Utils.msSleep(50);
      clearInterval(id);
      expect(count).assertLarger(0);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_8600
     * @tc.name testGlobalSetIntervalTest086
     * @tc.desc Verify setInterval callback creates nested setInterval
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let nestedCount: int = 0;
      let nestedId: int = 0;
      let outerId: int = 0;
      outerId = setInterval((): void => {
        nestedId = setInterval((): void => {
          nestedCount = nestedCount + 1;
        }, 10);
        clearInterval(outerId);
      }, 30);
      try {
        await Utils.msSleep(80);
      } catch (e) {
        expect(false).assertFail();
      }
      clearInterval(nestedId);
      expect(nestedCount).assertLarger(0);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_8700
     * @tc.name testGlobalSetIntervalTest087
     * @tc.desc Verify setInterval msg overload with null delay returns valid ID
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const id: int = setInterval('msg', null);
      expect(id).assertLarger(0);
      clearInterval(id);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_8800
     * @tc.name testGlobalSetIntervalTest088
     * @tc.desc Verify setInterval with Map as arg parameter, callback accesses Map
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('key', 0);
      const id: int = setInterval(
        (m: Map<string, int>): void => {
          m.set('key', 42);
        },
        20,
        map,
      );
      await Utils.msSleep(50);
      clearInterval(id);
      expect(map.get('key')).assertEqual(42);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_8900
     * @tc.name testGlobalSetIntervalTest089
     * @tc.desc setInterval with short type delay parameter, callback fires then cleared
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let count: int = 91;
      const delay: short = 100;
      const id: int = setInterval((): void => {
        count = count + 1;
      }, delay);
      try {
        try {
          await Utils.msSleep(150);
        } catch (e) {
          expect(false).assertFail();
        }
      } catch (e) {
        expect(false).assertFail();
      }
      clearInterval(id);
      expect(count).assertLarger(91);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_9000
     * @tc.name testGlobalSetIntervalTest090
     * @tc.desc setInterval with int type delay parameter, callback fires then cleared
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let count: int = 42;
      const delay: int = 10;
      const id: int = setInterval((): void => {
        count = count + 1;
      }, delay);
      try {
        await Utils.msSleep(50);
      } catch (e) {
        expect(false).assertFail();
      }
      clearInterval(id);
      expect(count).assertLarger(42);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_9100
     * @tc.name testGlobalSetIntervalTest091
     * @tc.desc setInterval with float type delay parameter, callback fires then cleared
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let count: int = 33;
      const delay: float = 10;
      const id: int = setInterval((): void => {
        count = count + 1;
      }, Float.toInt(delay));
      try {
        await Utils.msSleep(50);
      } catch (e) {
        expect(false).assertFail();
      }
      clearInterval(id);
      expect(count).assertLarger(33);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETINTERVAL_TEST_9200
     * @tc.name testGlobalSetIntervalTest092
     * @tc.desc setInterval with negative delayMs, callback fires (treated as 0)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetIntervalTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let count: int = 65;
      const id: int = setInterval((): void => {
        count = count + 1;
      }, -100);
      expect(id).assertLarger(0);
      try {
        await Utils.msSleep(100);
      } catch (e) {
        expect().assertFail();
      }
      clearInterval(id);
      expect(count).assertLarger(65);
      done();
    });
  });
}
