import { afterEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { ArkTSUtils, collections, worker, taskpool, ErrorEvent, MessageEvents } from '@kit.ArkTS';
import { sleep } from './utils';

import { ATOMIC_INDEX_ERROR, typeWait01, typeWait02, typeWait03, typeWait04, typeWait05,
  typeWait06, typeWait07, typeWait11 } from './atomics';


export default function atomicsWaitTest() {
  describe('atomicsWaitTest', () => {
    afterEach(async () => {
      await sleep(10)
    })


    /**
     * @tc.name   testArkTSUtilsAtomicsWait0001
     * @tc.number SUB_ARKTSUTILS_ATOMICS_WAIT_0100
     * @tc.desc   Return "not-equal" when collections.Int32Array value doesn't match expected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsWait0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Int32Array(sab);
      ta[0] = 10; // Actual value
      let finish = false;
      // Run in worker to avoid blocking main thread
      const result = await new Promise<string>((resolve) => {
        const workerInstance = new worker.ThreadWorker("./workers/Worker01.ets");
        workerInstance.postMessageWithSharedSendable({ ta, index: 0, value: 20 } as typeWait01)
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
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsWait0002
     * @tc.number SUB_ARKTSUTILS_ATOMICS_WAIT_0200
     * @tc.desc   Return "ok" when collections.Int32Array wait is woken by ArkTSUtils.Atomics.notify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsWait0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Int32Array(sab);
      ta[0] = 0; // Match expected value
      let finish = false;
      let finish2 = false;

      const waitResult = new Promise<string>(async (resolve) => {
        const workerInstance = new worker.ThreadWorker("./workers/Worker01.ets");
        workerInstance.postMessageWithSharedSendable({ ta, index: 0, value: 0 } as typeWait01)
        workerInstance.onmessage = (e) => {
          resolve(e.data)
          workerInstance.terminate()
        }
        workerInstance.onexit = () => {
          finish = true
        }

        await sleep(200)
        const workerInstance2 = new worker.ThreadWorker("./workers/Worker02.ets");
        workerInstance2.postMessageWithSharedSendable({ ta, index: 0 } as typeWait02)
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
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsWait0003
     * @tc.number SUB_ARKTSUTILS_ATOMICS_WAIT_0300
     * @tc.desc   Return "timed-out" when collections.Int32Array wait exceeds timeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsWait0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Int32Array(sab);
      ta[0] = 5; // Match expected value
      let finish = false;

      const result = await new Promise<string>((resolve) => {
        const workerInstance = new worker.ThreadWorker("./workers/Worker03.ets");
        workerInstance.postMessageWithSharedSendable({
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
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsWait0004
     * @tc.number SUB_ARKTSUTILS_ATOMICS_WAIT_0400
     * @tc.desc   ArkTSUtils.Atomics.wait with NaN timeout returns not-equal when current value differs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsWait0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Int32Array(sab); // Length 1
      let finish = false;

      const errorResult = await new Promise<string>((resolve) => {
        const workerInstance = new worker.ThreadWorker("./workers/Worker03.ets");
        workerInstance.postMessageWithSharedSendable({
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
        ArkTSUtils.Atomics.notify(ta, 0, 1);
      }, 100)
      while (!finish) {
        await sleep(100)
      }
      expect(errorResult).assertEqual('not-equal');
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsWait0005
     * @tc.number SUB_ARKTSUTILS_ATOMICS_WAIT_0500
     * @tc.desc   ArkTSUtils.Atomics.wait with fractional timeout returns not-equal when current value differs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsWait0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(8);
      const ta = new collections.Int32Array(sab);
      let finish = false;

      const errorResult = await new Promise<string>((resolve) => {
        const workerInstance = new worker.ThreadWorker("./workers/Worker03.ets");
        workerInstance.postMessageWithSharedSendable({
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
        ArkTSUtils.Atomics.notify(ta, 0, 1);
      }, 100)
      while (!finish) {
        await sleep(100)
      }
      expect(errorResult).assertEqual('not-equal');
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsWait0006
     * @tc.number SUB_ARKTSUTILS_ATOMICS_WAIT_0600
     * @tc.desc   ArkTSUtils.Atomics.wait with negative timeout returns not-equal when current value differs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsWait0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(8);
      const ta = new collections.Int32Array(sab);
      let finish = false;

      const errorResult = await new Promise<string>((resolve) => {
        const workerInstance = new worker.ThreadWorker("./workers/Worker03.ets");
        workerInstance.postMessageWithSharedSendable({
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
        ArkTSUtils.Atomics.notify(ta, 0, 1);
      }, 100)
      while (!finish) {
        await sleep(100)
      }
      expect(errorResult).assertEqual('not-equal');
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsWait0007
     * @tc.number SUB_ARKTSUTILS_ATOMICS_WAIT_0700
     * @tc.desc   ArkTSUtils.Atomics.notify with NaN count after a not-equal wait result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsWait0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(8);
      const ta = new collections.Int32Array(sab);
      let finish = false;

      const errorResult = await new Promise<string>((resolve) => {
        const workerInstance = new worker.ThreadWorker("./workers/Worker03.ets");
        workerInstance.postMessageWithSharedSendable({
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
        ArkTSUtils.Atomics.notify(ta, 0, NaN);
      }, 100)
      while (!finish) {
        await sleep(100)
      }
      expect(errorResult).assertEqual('not-equal');
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsWait0008
     * @tc.number SUB_ARKTSUTILS_ATOMICS_WAIT_0800
     * @tc.desc   ArkTSUtils.Atomics.notify with Infinity count after a not-equal wait result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsWait0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(8);
      const ta = new collections.Int32Array(sab);
      let finish = false;

      const errorResult = await new Promise<string>((resolve) => {
        const workerInstance = new worker.ThreadWorker("./workers/Worker03.ets");
        workerInstance.postMessageWithSharedSendable({
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
        ArkTSUtils.Atomics.notify(ta, 0, Infinity);
      }, 100)
      while (!finish) {
        await sleep(100)
      }
      expect(errorResult).assertEqual('not-equal');
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsWait0009
     * @tc.number SUB_ARKTSUTILS_ATOMICS_WAIT_0900
     * @tc.desc   ArkTSUtils.Atomics.notify wakes worker on index 0 while worker on index 1 times out
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsWait0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(20);
      const int32 = new collections.Int32Array(sab);
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

      ss.postMessageWithSharedSendable({ ta: int32 } as typeWait07);
      while (!flag) { await sleep(50); }
      flag = false;
      tt.postMessageWithSharedSendable({ ta: int32 } as typeWait07);
      while (!flag) { await sleep(50); }
      flag = false;
      uu.postMessageWithSharedSendable({ ta: int32 } as typeWait07);
      while (!flag) { await sleep(50); }

      ArkTSUtils.Atomics.notify(int32, 0, 1);
      ArkTSUtils.Atomics.notify(int32, 2, 1);
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
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsWait0010
     * @tc.number SUB_ARKTSUTILS_ATOMICS_WAIT_1000
     * @tc.desc   ArkTSUtils.Atomics.wait woken by notify, then add and load in worker
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testArkTSUtilsAtomicsWait0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(20);
      const int32 = new collections.Int32Array(sab);
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

      ss.postMessageWithSharedSendable({ ta: int32 } as typeWait07);
      while (!flag) { await sleep(50); }
      flag = false;
      ArkTSUtils.Atomics.store(int32, 0, 2);
      ArkTSUtils.Atomics.load(int32, 0);
      ArkTSUtils.Atomics.notify(int32, 0, 1);
      while (!flag) { await sleep(50); }
      flag = false;
      ss.terminate();
      while (!flag) { await sleep(50); }

      expect(res).assertEqual(3);
      done();
    });
    /**
     * @tc.name   testArkTSUtilsAtomicsWait0011
     * @tc.number SUB_ARKTSUTILS_ATOMICS_WAIT_1100
     * @tc.desc   ArkTSUtils.Atomics.add from multiple workers on collections.ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsWait0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(20);
      const int32 = new collections.Uint32Array(sab);
      int32[0] = 1;
      let flag = false;
      let count = 0;

      const ss = new worker.ThreadWorker("./workers/Worker11.ets");
      const tt = new worker.ThreadWorker("./workers/Worker12.ets");
      ss.onmessage = () => { count += 1; };
      tt.onmessage = () => { count += 1; };
      ss.onexit = () => { flag = true; };
      tt.onexit = () => { flag = true; };

      ss.postMessageWithSharedSendable({ sab: sab } as typeWait11);
      tt.postMessageWithSharedSendable({ sab: sab } as typeWait11);
      while (count != 2) { await sleep(50); }

      flag = false;
      ss.terminate();
      while (!flag) { await sleep(50); }
      flag = false;
      tt.terminate();
      while (!flag) { await sleep(50); }

      expect(int32[0]).assertEqual(21);
      done();
    });
/**
     * @tc.name   testArkTSUtilsAtomicsWait0012
     * @tc.number SUB_ARKTSUTILS_ATOMICS_WAIT_1200
     * @tc.desc   Verify wait reports BusinessError code 10200001 for an out-of-range index in a worker
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsWait0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Int32Array(sab); // Int32Array with length 1
      const workerInstance = new worker.ThreadWorker('./workers/Worker01.ets');
      const exited = new Promise<void>((resolve) => {
        workerInstance.onexit = (): void => { resolve(); };
      });
      try {
        const errorCode = await new Promise<number>((resolve, reject) => {
          workerInstance.onmessage = (event: MessageEvents): void => {
            resolve(event.data as number);
          };
          workerInstance.onerror = (event: ErrorEvent): void => {
            reject(new Error(event.message));
          };
          workerInstance.postMessageWithSharedSendable({ ta, index: 1, value: 0 } as typeWait01);
        });
        expect(errorCode).assertEqual(ATOMIC_INDEX_ERROR);
      } finally {
        workerInstance.terminate();
        await exited;
      }
      done();
    });
/**
     * @tc.name   testArkTSUtilsAtomicsWait0013
     * @tc.number SUB_ARKTSUTILS_ATOMICS_WAIT_1300
     * @tc.desc   Verify Atomics.wait with Infinity timeout returns not-equal when value differs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArkTSUtilsAtomicsWait0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(8);
      const ta = new collections.Int32Array(sab);
      let finish = false;

      const errorResult = await new Promise<string>((resolve) => {
        const workerInstance = new worker.ThreadWorker("./workers/Worker03.ets");
        workerInstance.postMessageWithSharedSendable({
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
        ArkTSUtils.Atomics.notify(ta, 0, 1);
      }, 100)
      while (!finish) {
        await sleep(100)
      }
      expect(errorResult).assertEqual('not-equal');
      done();
    });
/**
     * @tc.name   testArkTSUtilsAtomicsWait0014
     * @tc.number SUB_ARKTSUTILS_ATOMICS_WAIT_1400
     * @tc.desc   Verify Atomics.wait with Number.MAX_VALUE timeout returns not-equal when value differs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsWait0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(8);
      const ta = new collections.Int32Array(sab);
      let finish = false;

      const errorResult = await new Promise<string>((resolve) => {
        const workerInstance = new worker.ThreadWorker("./workers/Worker03.ets");
        workerInstance.postMessageWithSharedSendable({
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
        ArkTSUtils.Atomics.notify(ta, 0, 1);
      }, 100)
      while (!finish) {
        await sleep(100)
      }
      expect(errorResult).assertEqual('not-equal');
      done();
    });
/**
     * @tc.name   testArkTSUtilsAtomicsWait0015
     * @tc.number SUB_ARKTSUTILS_ATOMICS_WAIT_1500
     * @tc.desc   Verify Atomics.wait with finite timeout returns not-equal when value differs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkTSUtilsAtomicsWait0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(8);
      const ta = new collections.Int32Array(sab);
      let finish = false;

      const errorResult = await new Promise<string>((resolve) => {
        const workerInstance = new worker.ThreadWorker("./workers/Worker03.ets");
        workerInstance.postMessageWithSharedSendable({
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
        ArkTSUtils.Atomics.notify(ta, 0, Number.MAX_VALUE + 1);
      }, 100)
      while (!finish) {
        await sleep(100)
      }
      expect(errorResult).assertEqual('not-equal');
      done();
    });
  })
}
