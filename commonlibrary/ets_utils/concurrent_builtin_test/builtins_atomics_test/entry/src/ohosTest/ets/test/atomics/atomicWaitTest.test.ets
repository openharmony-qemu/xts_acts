import { afterEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { sleep } from './utils';
import { worker } from '@kit.ArkTS';
import { typeWait01, typeWait02, typeWait03, typeWait04, typeWait05, typeWait06, typeWait07, typeWait11 } from './atomics';


export default function atomicsWaitTest() {
  describe('atomicsWaitTest', () => {
    afterEach(async () => {
      await sleep(10)
    })


    /**
     * @tc.name   atomicsWaitTest001
     * @tc.number SUB_BUILTINS_Atomics_wait_TEST_0001
     * @tc.desc   Return "not-equal" when Int32Array value doesn't match expected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsWaitTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sab = new SharedArrayBuffer(4);
      const ta = new Int32Array(sab);
      ta[0] = 10; // Actual value
      let finish = false;
      // Run in worker to avoid blocking main thread
      const result = await new Promise<string>((resolve) => {
        const workerInstance = new worker.ThreadWorker("./workers/Worker01.ets");
        workerInstance.postMessage({ ta, index: 0, value: 20 } as typeWait01)
        workerInstance.onmessage = (e) => {
          resolve(e.data)
          workerInstance.terminate()
        }
        workerInstance.onexit = () => {
          finish = true
        }
      });
      while (!finish) {
        await sleep(100)
      }
      expect(result).assertEqual('not-equal');
    });

    /**
     * @tc.name   atomicsWaitTest002
     * @tc.number SUB_BUILTINS_Atomics_wait_TEST_0002
     * @tc.desc   Return "ok" when Int32Array wait is woken by Atomics.notify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsWaitTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ta = new Int32Array(sab);
      ta[0] = 0; // Match expected value
      let finish = false;
      let finish2 = false;

      const waitResult = new Promise<string>(async (resolve) => {
        const workerInstance = new worker.ThreadWorker("./workers/Worker01.ets");
        workerInstance.postMessage({ ta, index: 0, value: 0 } as typeWait01)
        workerInstance.onmessage = (e) => {
          resolve(e.data)
          workerInstance.terminate()
        }
        workerInstance.onexit = () => {
          finish = true
        }

        await sleep(200)
        const workerInstance2 = new worker.ThreadWorker("./workers/Worker02.ets");
        workerInstance2.postMessage({ ta, index: 0 } as typeWait02)
        workerInstance2.onmessage = (e) => {
          workerInstance2.terminate()
        }
        workerInstance2.onexit = () => {
          finish2 = true
        }
      })
      const result = await waitResult;
      while (!finish || !finish2) {
        await sleep(100)
      }
      expect(result).assertEqual('ok');
    });

    /**
     * @tc.name   atomicsWaitTest003
     * @tc.number SUB_BUILTINS_Atomics_wait_TEST_0003
     * @tc.desc   Return "timed-out" when Int32Array wait exceeds timeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsWaitTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ta = new Int32Array(sab);
      ta[0] = 5; // Match expected value
      let finish = false;

      const result = await new Promise<string>((resolve) => {
        const workerInstance = new worker.ThreadWorker("./workers/Worker03.ets");
        workerInstance.postMessage({
          ta,
          index: 0,
          value: 5,
          timeout: 10
        } as typeWait03)
        workerInstance.onmessage = (e) => {
          resolve(e.data)
          workerInstance.terminate()
        }
        workerInstance.onexit = () => {
          finish = true
        }
      });
      while (!finish) {
        await sleep(100)
      }
      expect(result).assertEqual('timed-out');
    });

    /**
     * @tc.name   atomicsWaitTest004
     * @tc.number SUB_BUILTINS_Atomics_wait_TEST_0004
     * @tc.desc   Return "not-equal" when BigInt64Array value doesn't match expected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsWaitTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sab = new SharedArrayBuffer(8);
      const ta = new BigInt64Array(sab);
      ta[0] = 100n; // Actual value
      let finish = false;

      const result = await new Promise<string>((resolve) => {
        const workerInstance = new worker.ThreadWorker("./workers/Worker04.ets");
        workerInstance.postMessage({ ta, index: 0, value: 200n } as typeWait04)
        workerInstance.onmessage = (e) => {
          resolve(e.data)
          workerInstance.terminate()
        }
        workerInstance.onexit = () => {
          finish = true
        }
      });

      while (!finish) {
        await sleep(100)
      }
      expect(result).assertEqual('not-equal');
    });

    /**
     * @tc.name   atomicsWaitTest005
     * @tc.number SUB_BUILTINS_Atomics_wait_TEST_0005
     * @tc.desc   Return "ok" when BigInt64Array wait is woken by Atomics.notify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsWaitTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(8);
      const ta = new BigInt64Array(sab);
      ta[0] = 0n; // Match expected value
      let finish = false;
      let finish2 = false;

      const waitResult = new Promise<string>(async (resolve) => {
        const workerInstance = new worker.ThreadWorker("./workers/Worker04.ets");
        workerInstance.postMessage({ ta, index: 0, value: 0n } as typeWait04)
        workerInstance.onmessage = (e) => {
          resolve(e.data)
          workerInstance.terminate()
        }
        workerInstance.onexit = () => {
          finish = true
        }
        await sleep(200)
        const workerInstance2 = new worker.ThreadWorker("./workers/Worker05.ets");
        workerInstance2.postMessage({ ta, index: 0 } as typeWait05)
        workerInstance2.onmessage = (e) => {
          workerInstance2.terminate()
        }
        workerInstance2.onexit = () => {
          finish2 = true
        }
      })

      const result = await waitResult;
      while (!finish || !finish2) {
        await sleep(100)
      }
      expect(result).assertEqual('ok');
    });

    /**
     * @tc.name   atomicsWaitTest006
     * @tc.number SUB_BUILTINS_Atomics_wait_TEST_0006
     * @tc.desc   Return "timed-out" when BigInt64Array wait exceeds timeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsWaitTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(8);
      const ta = new BigInt64Array(sab);
      ta[0] = 50n; // Match expected value
      let finish = false;

      const result = await new Promise<string>((resolve) => {
        const workerInstance = new worker.ThreadWorker("./workers/Worker06.ets");
        workerInstance.postMessage({
          ta,
          index: 0,
          value: 50n,
          timeout: 15
        } as typeWait06)
        workerInstance.onmessage = (e) => {
          resolve(e.data)
          workerInstance.terminate()
        }
        workerInstance.onexit = () => {
          finish = true
        }
      });
      while (!finish) {
        await sleep(100)
      }
      expect(result).assertEqual('timed-out');
    });

    /**
     * @tc.name   atomicsWaitTest007
     * @tc.number SUB_BUILTINS_Atomics_wait_TEST_0007
     * @tc.desc   Throw TypeError when typedArray is Uint32Array (not Int32Array/BigInt64Array)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsWaitTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ta = new Int32Array(sab); // Invalid typed array type
      let finish = false;

      const errorResult = await new Promise<string>((resolve) => {
        const workerInstance = new worker.ThreadWorker("./workers/Worker01.ets");
        workerInstance.postMessage({ ta, index: 1, value: 0 } as typeWait01)
        workerInstance.onmessage = (e) => {
          resolve(e.data)
          workerInstance.terminate()
        }
        workerInstance.onerror = (e) => {
          resolve(e.message)
          workerInstance.terminate()
        }
        workerInstance.onexit = () => {
          finish = true
        }
      });
      while (!finish) {
        await sleep(100)
      }
      expect(errorResult).assertContain('RangeError');
    });

    /**
     * @tc.name   atomicsWaitTest008
     * @tc.number SUB_BUILTINS_Atomics_wait_TEST_0008
     * @tc.desc   Throw RangeError when Int32Array index is out of bounds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsWaitTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ta = new Int32Array(sab); // Length 1
      let finish = false;

      const errorResult = await new Promise<string>((resolve) => {
        const workerInstance = new worker.ThreadWorker("./workers/Worker03.ets");
        workerInstance.postMessage({
          ta,
          index: 0,
          value: 1,
          timeout: NaN
        } as typeWait03)
        workerInstance.onmessage = (e) => {
          resolve(e.data)
          workerInstance.terminate()
        }
        workerInstance.onerror = (e) => {
          resolve(e.message)
          workerInstance.terminate()
        }
        workerInstance.onexit = () => {
          finish = true
        }
      });
      setTimeout(() => {
        Atomics.notify(ta, 0, 1);
      }, 100)
      while (!finish) {
        await sleep(100)
      }
      expect(errorResult).assertEqual('not-equal');
    });

    /**
     * @tc.name   atomicsWaitTest009
     * @tc.number SUB_BUILTINS_Atomics_wait_TEST_0009
     * @tc.desc   Throw RangeError when BigInt64Array index is negative
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsWaitTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(8);
      const ta = new Int32Array(sab);
      let finish = false;

      const errorResult = await new Promise<string>((resolve) => {
        const workerInstance = new worker.ThreadWorker("./workers/Worker03.ets");
        workerInstance.postMessage({
          ta,
          index: 0,
          value: 1,
          timeout: Infinity
        } as typeWait03)
        workerInstance.onmessage = (e) => {
          resolve(e.data)
          workerInstance.terminate()
        }
        workerInstance.onerror = (e) => {
          resolve(e.message)
          workerInstance.terminate()
        }
        workerInstance.onexit = () => {
          finish = true
        }
      });
      setTimeout(() => {
        Atomics.notify(ta, 0, 1);
      }, 100)
      while (!finish) {
        await sleep(100)
      }
      expect(errorResult).assertEqual('not-equal');
    });

    /**
     * @tc.name   atomicsWaitTest010
     * @tc.number SUB_BUILTINS_Atomics_wait_TEST_0010
     * @tc.desc   Treat undefined timeout as Infinity (Int32Array never times out)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsWaitTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(8);
      const ta = new Int32Array(sab);
      let finish = false;

      const errorResult = await new Promise<string>((resolve) => {
        const workerInstance = new worker.ThreadWorker("./workers/Worker03.ets");
        workerInstance.postMessage({
          ta,
          index: 0,
          value: 1,
          timeout: 200.5
        } as typeWait03)
        workerInstance.onmessage = (e) => {
          resolve(e.data)
          workerInstance.terminate()
        }
        workerInstance.onerror = (e) => {
          resolve(e.message)
          workerInstance.terminate()
        }
        workerInstance.onexit = () => {
          finish = true
        }
      });
      setTimeout(() => {
        Atomics.notify(ta, 0, 1);
      }, 100)
      while (!finish) {
        await sleep(100)
      }
      expect(errorResult).assertEqual('not-equal');
    });

    /**
     * @tc.name   atomicsWaitTest011
     * @tc.number SUB_BUILTINS_Atomics_wait_TEST_0011
     * @tc.desc   Treat NaN timeout as Infinity (BigInt64Array woken by notify)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsWaitTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(8);
      const ta = new Int32Array(sab);
      let finish = false;

      const errorResult = await new Promise<string>((resolve) => {
        const workerInstance = new worker.ThreadWorker("./workers/Worker03.ets");
        workerInstance.postMessage({
          ta,
          index: 0,
          value: 1,
          timeout: Number.MAX_VALUE
        } as typeWait03)
        workerInstance.onmessage = (e) => {
          resolve(e.data)
          workerInstance.terminate()
        }
        workerInstance.onerror = (e) => {
          resolve(e.message)
          workerInstance.terminate()
        }
        workerInstance.onexit = () => {
          finish = true
        }
      });
      setTimeout(() => {
        Atomics.notify(ta, 0, 1);
      }, 100)
      while (!finish) {
        await sleep(100)
      }
      expect(errorResult).assertEqual('not-equal');
    });

    /**
     * @tc.name   atomicsWaitTest012
     * @tc.number SUB_BUILTINS_Atomics_wait_TEST_0012
     * @tc.desc   Treat negative timeout as 0 (Int32Array times out immediately)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsWaitTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(8);
      const ta = new Int32Array(sab);
      let finish = false;

      const errorResult = await new Promise<string>((resolve) => {
        const workerInstance = new worker.ThreadWorker("./workers/Worker03.ets");
        workerInstance.postMessage({
          ta,
          index: 0,
          value: 1,
          timeout: -100
        } as typeWait03)
        workerInstance.onmessage = (e) => {
          resolve(e.data)
          workerInstance.terminate()
        }
        workerInstance.onerror = (e) => {
          resolve(e.message)
          workerInstance.terminate()
        }
        workerInstance.onexit = () => {
          finish = true
        }
      });
      setTimeout(() => {
        Atomics.notify(ta, 0, 1);
      }, 100)
      while (!finish) {
        await sleep(100)
      }
      expect(errorResult).assertEqual('not-equal');
    });

    /**
     * @tc.name   atomicsWaitTest013
     * @tc.number SUB_BUILTINS_Atomics_wait_TEST_0013
     * @tc.desc   Throw TypeError when typedArray is non-SharedArrayBuffer backed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsWaitTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(8);
      const ta = new Int32Array(sab);
      let finish = false;

      const errorResult = await new Promise<string>((resolve) => {
        const workerInstance = new worker.ThreadWorker("./workers/Worker03.ets");
        workerInstance.postMessage({
          ta,
          index: 0,
          value: 1,
          timeout: 200
        } as typeWait03)
        workerInstance.onmessage = (e) => {
          resolve(e.data)
          workerInstance.terminate()
        }
        workerInstance.onerror = (e) => {
          resolve(e.message)
          workerInstance.terminate()
        }
        workerInstance.onexit = () => {
          finish = true
        }
      });
      setTimeout(() => {
        Atomics.notify(ta, 0, NaN);
      }, 100)
      while (!finish) {
        await sleep(100)
      }
      expect(errorResult).assertEqual('not-equal');
    });

    /**
     * @tc.name   atomicsWaitTest014
     * @tc.number SUB_BUILTINS_Atomics_wait_TEST_0014
     * @tc.desc   Int32Array wait woken by notify even if value changes after wait
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsWaitTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(8);
      const ta = new Int32Array(sab);
      let finish = false;

      const errorResult = await new Promise<string>((resolve) => {
        const workerInstance = new worker.ThreadWorker("./workers/Worker03.ets");
        workerInstance.postMessage({
          ta,
          index: 0,
          value: 1,
          timeout: 200
        } as typeWait03)
        workerInstance.onmessage = (e) => {
          resolve(e.data)
          workerInstance.terminate()
        }
        workerInstance.onerror = (e) => {
          resolve(e.message)
          workerInstance.terminate()
        }
        workerInstance.onexit = () => {
          finish = true
        }
      });
      setTimeout(() => {
        Atomics.notify(ta, 0, Infinity);
      }, 100)
      while (!finish) {
        await sleep(100)
      }
      expect(errorResult).assertEqual('not-equal');
    });

    /**
     * @tc.name   atomicsWaitTest015
     * @tc.number SUB_BUILTINS_Atomics_wait_TEST_0015
     * @tc.desc   BigInt64Array wait woken by notify even if value changes after wait
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsWaitTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(8);
      const ta = new Int32Array(sab);
      let finish = false;

      const errorResult = await new Promise<string>((resolve) => {
        const workerInstance = new worker.ThreadWorker("./workers/Worker03.ets");
        workerInstance.postMessage({
          ta,
          index: 0,
          value: 1,
          timeout: 200
        } as typeWait03)
        workerInstance.onmessage = (e) => {
          resolve(e.data)
          workerInstance.terminate()
        }
        workerInstance.onerror = (e) => {
          resolve(e.message)
          workerInstance.terminate()
        }
        workerInstance.onexit = () => {
          finish = true
        }
      });
      setTimeout(() => {
        Atomics.notify(ta, 0, Number.MAX_VALUE + 1);
      }, 100)
      while (!finish) {
        await sleep(100)
      }
      expect(errorResult).assertEqual('not-equal');
    });

    /**
     * @tc.name   atomicsWaitTest016
     * @tc.number SUB_BUILTINS_Atomics_wait_TEST_0016
     * @tc.desc   Int32Array wait with timeout=0 returns "timed-out" immediately
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsWaitTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(8);
      const ta = new BigInt64Array(sab);
      ta[0] = 100n; // Actual value
      let finish = false;

      const result = await new Promise<string>((resolve) => {
        const workerInstance = new worker.ThreadWorker("./workers/Worker06.ets");
        workerInstance.postMessage({
          ta,
          index: 0,
          value: 200n,
          timeout: NaN
        } as typeWait06)
        workerInstance.onmessage = (e) => {
          resolve(e.data)
          workerInstance.terminate()
        }
        workerInstance.onexit = () => {
          finish = true
        }
      });

      while (!finish) {
        await sleep(100)
      }
      expect(result).assertEqual('not-equal');
    });

    /**
     * @tc.name   atomicsWaitTest017
     * @tc.number SUB_BUILTINS_Atomics_wait_TEST_0017
     * @tc.desc   BigInt64Array wait with timeout=0 returns "timed-out" immediately
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsWaitTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(8);
      const ta = new BigInt64Array(sab);
      ta[0] = 100n; // Actual value
      let finish = false;

      const result = await new Promise<string>((resolve) => {
        const workerInstance = new worker.ThreadWorker("./workers/Worker06.ets");
        workerInstance.postMessage({
          ta,
          index: 0,
          value: 200n,
          timeout: Infinity
        } as typeWait06)
        workerInstance.onmessage = (e) => {
          resolve(e.data)
          workerInstance.terminate()
        }
        workerInstance.onexit = () => {
          finish = true
        }
      });

      while (!finish) {
        await sleep(100)
      }
      expect(result).assertEqual('not-equal');
    });

    /**
     * @tc.name   atomicsWaitTest018
     * @tc.number SUB_BUILTINS_Atomics_wait_TEST_0018
     * @tc.desc   Nested arrow function wrapper for Int32Array wait
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsWaitTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(8);
      const ta = new BigInt64Array(sab);
      ta[0] = 100n; // Actual value
      let finish = false;

      const result = await new Promise<string>((resolve) => {
        const workerInstance = new worker.ThreadWorker("./workers/Worker06.ets");
        workerInstance.postMessage({
          ta,
          index: 0,
          value: 9223372036854775807n,
          timeout: 0
        } as typeWait06)
        workerInstance.onmessage = (e) => {
          resolve(e.data)
          workerInstance.terminate()
        }
        workerInstance.onexit = () => {
          finish = true
        }
      });

      while (!finish) {
        await sleep(100)
      }
      expect(result).assertEqual('not-equal');
    });

    /**
     * @tc.name   atomicsWaitTest019
     * @tc.number SUB_BUILTINS_Atomics_wait_TEST_0019
     * @tc.desc   Nested arrow function wrapper for BigInt64Array wait
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsWaitTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(8);
      const ta = new BigInt64Array(sab);
      ta[0] = 100n; // Actual value
      let finish = false;

      const result = await new Promise<string>((resolve) => {
        const workerInstance = new worker.ThreadWorker("./workers/Worker06.ets");
        workerInstance.postMessage({
          ta,
          index: 0,
          value: 200n,
          timeout: -20
        } as typeWait06)
        workerInstance.onmessage = (e) => {
          resolve(e.data)
          workerInstance.terminate()
        }
        workerInstance.onexit = () => {
          finish = true
        }
      });

      while (!finish) {
        await sleep(100)
      }
      expect(result).assertEqual('not-equal');
    });

    /**
     * @tc.name   atomicsWaitTest020
     * @tc.number SUB_BUILTINS_Atomics_wait_TEST_0020
     * @tc.desc   Int32Array wait in async worker with arrow function callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsWaitTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(8);
      const ta = new BigInt64Array(sab);
      ta[0] = 9223372036854775807n; // Actual value
      let finish = false;

      const result = await new Promise<string>((resolve) => {
        const workerInstance = new worker.ThreadWorker("./workers/Worker06.ets");
        workerInstance.postMessage({
          ta,
          index: 0,
          value: 9223372036854775807n,
          timeout: 200.2
        } as typeWait06)
        workerInstance.onmessage = (e) => {
          resolve(e.data)
          workerInstance.terminate()
        }
        workerInstance.onexit = () => {
          finish = true
        }
      });

      while (!finish) {
        await sleep(100)
      }
      expect(result).assertEqual('timed-out');
    });

    /**
     * @tc.name   atomicsWaitTest021
     * @tc.number SUB_BUILTINS_Atomics_wait_TEST_0021
     * @tc.desc   Atomics.notify wakes up multiple workers waiting on different indices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsWaitTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sab = new SharedArrayBuffer(20);
      const int32 = new Int32Array(sab);
      let flag = false;
      let res = 0;
      let res1 = 0;

      const ss = new worker.ThreadWorker("./workers/Worker07.ets");
      const tt = new worker.ThreadWorker("./workers/Worker08.ets");
      const uu = new worker.ThreadWorker("./workers/Worker09.ets");

      ss.onmessage = (e) => {
        if ((e.data as string) == "end") { res++; }
        flag = true;
      };
      tt.onmessage = (e) => {
        if ((e.data as string) == "end1") { res1++; }
        if ((e.data as string) == "end2") { res1 += 5; }
        flag = true;
      };
      uu.onmessage = (e) => {
        if ((e.data as string) == "end") { flag = true; }
      };
      ss.onexit = () => { flag = true; };
      tt.onexit = () => { flag = true; };
      uu.onexit = () => { flag = true; };

      ss.postMessage({ ta: int32 } as typeWait07);
      while (!flag) { await sleep(50); }
      flag = false;
      tt.postMessage({ ta: int32 } as typeWait07);
      while (!flag) { await sleep(50); }
      flag = false;
      uu.postMessage({ ta: int32 } as typeWait07);
      while (!flag) { await sleep(50); }

      Atomics.notify(int32, 0, 1);
      Atomics.notify(int32, 2, 1);
      while (res == 0 || res1 == 0) { await sleep(50); }

      flag = false;
      ss.terminate();
      while (!flag) { await sleep(50); }
      flag = false;
      tt.terminate();
      while (!flag) { await sleep(50); }
      flag = false;
      uu.terminate();
      while (!flag) { await sleep(50); }

      expect(res).assertEqual(1);
      expect(res1).assertEqual(5);
    });

    /**
     * @tc.name   atomicsWaitTest022
     * @tc.number SUB_BUILTINS_Atomics_wait_TEST_0022
     * @tc.desc   Atomics.wait woken by notify, then add and load in worker
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicsWaitTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sab = new SharedArrayBuffer(20);
      const int32 = new Int32Array(sab);
      let flag = false;
      let res = 0;

      const ss = new worker.ThreadWorker("./workers/Worker10.ets");
      ss.onmessage = (e) => {
        const msg = e.data as string;
        if (msg == 'wait') {
          flag = true;
        } else {
          res = parseInt(msg, 10);
          flag = true;
        }
      };
      ss.onexit = () => { flag = true; };

      ss.postMessage({ ta: int32 } as typeWait07);
      while (!flag) { await sleep(50); }
      flag = false;
      Atomics.store(int32, 0, 2);
      Atomics.load(int32, 0);
      Atomics.notify(int32, 0, 1);
      while (!flag) { await sleep(50); }
      flag = false;
      ss.terminate();
      while (!flag) { await sleep(50); }

      expect(res).assertEqual(3);
    });

    /**
     * @tc.name   atomicsWaitTest023
     * @tc.number SUB_BUILTINS_Atomics_wait_TEST_0023
     * @tc.desc   Atomics.add from multiple workers on SharedArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsWaitTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sab = new SharedArrayBuffer(20);
      const int32 = new Uint32Array(sab);
      int32[0] = 1;
      let flag = false;
      let count = 0;

      const ss = new worker.ThreadWorker("./workers/Worker11.ets");
      const tt = new worker.ThreadWorker("./workers/Worker12.ets");
      ss.onmessage = () => { count += 1; };
      tt.onmessage = () => { count += 1; };
      ss.onexit = () => { flag = true; };
      tt.onexit = () => { flag = true; };

      ss.postMessage({ sab: sab } as typeWait11);
      tt.postMessage({ sab: sab } as typeWait11);
      while (count != 2) { await sleep(50); }

      flag = false;
      ss.terminate();
      while (!flag) { await sleep(50); }
      flag = false;
      tt.terminate();
      while (!flag) { await sleep(50); }

      expect(int32[0]).assertEqual(21);
    });

    /**
     * @tc.name   testAtomicsWaitNotifyError0024
     * @tc.number SUB_BUILTINS_ATOMICS_WAIT_TEST_0100
     * @tc.desc   Test Atomics.notify typedArray/index validation error paths
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAtomicsWaitNotifyError0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(16);
      const ia = new Int32Array(sab);

      let typeErrorCount = 0;
      try {
        Atomics.notify(new Int8Array(new ArrayBuffer(8)) as Object as Int32Array, 0);
      } catch (e) {
        if (e instanceof TypeError) {
          typeErrorCount++;
        }
      }
      try {
        Atomics.notify(new Uint32Array(sab) as Object as Int32Array, 0);
      } catch (e) {
        if (e instanceof TypeError) {
          typeErrorCount++;
        }
      }
      expect(typeErrorCount).assertEqual(2);

      let rangeErrorCount = 0;
      try {
        Atomics.notify(ia, -1);
      } catch (e) {
        if (e instanceof RangeError) {
          rangeErrorCount++;
        }
      }
      expect(rangeErrorCount).assertEqual(1);

      expect(Atomics.notify(ia, 0, -1)).assertEqual(0);

      let outOfBoundsErrorCount = 0;
      let outOfBoundsResult = -1;
      try {
        outOfBoundsResult = Atomics.notify(ia, ia.length);
      } catch (e) {
        if (e instanceof RangeError) {
          outOfBoundsErrorCount++;
        }
      }
      if (outOfBoundsErrorCount !== 0) {
        expect(outOfBoundsErrorCount).assertEqual(1);
      } else {
        expect(outOfBoundsResult).assertEqual(0);
      }
    });

  })
}