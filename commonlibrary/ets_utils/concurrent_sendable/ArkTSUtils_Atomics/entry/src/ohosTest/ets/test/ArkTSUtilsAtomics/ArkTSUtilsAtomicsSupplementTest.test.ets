import { afterEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { ArkTSUtils, collections, worker, taskpool } from '@kit.ArkTS';
import { BusinessError } from '@kit.BasicServicesKit';
import { ATOMIC_PARAMETER_ERROR } from '../ArkTSUtilsAtomicsErrorAssert';
import { typeWait01, typeWait03 } from './atomics';
import { sleep } from './utils';

const TASK_INDEX: number = 0;
const EXCHANGE_TASK_COUNT: number = 4;
const EXCHANGE_ITERATIONS: number = 200;
const EXCHANGE_STEP: number = 1000;
const EXCHANGE_INITIAL: number = -1;
const AND_MASK_A: number = 0x0F0F0F0F;
const AND_MASK_B: number = 0x00FF00FF;
const AND_ITERATIONS: number = 50;
const AND_INITIAL: number = 0xFFFFFFFF;
const AND_EXPECTED: number = 0x000F000F;
const XOR_MASK: number = 0x12345678;
const XOR_ITERATIONS: number = 50;
const BUFFER_BYTES: number = 8;
const SENTINEL_VALUE: number = 13579;
const INT32_MAX: number = 2147483647;
const INT32_MIN: number = -2147483648;
const HOP1_BUFFER_BYTELENGTH: number = 0;
const HOP1_ARRAY_BYTELENGTH: number = 1;
const HOP1_SUBARRAY_VALUE: number = 2;
const HOP1_INDEX_VALUE: number = 3;
const HOP2_BUFFER_BYTELENGTH: number = 4;
const HOP2_ARRAY_BYTELENGTH: number = 5;
const HOP2_ADD_RETURN: number = 6;
const HOP2_FINAL_LOAD: number = 7;
const HOP2_SUBARRAY_VALUE: number = 8;
const HOP2_INDEX_VALUE: number = 9;
const HOP_REPORT_LENGTH: number = 10;
const WAIT_SHORT_TIMEOUT_MS: number = 300;
const NONATOMIC_TASK_COUNT: number = 2;
const NONATOMIC_ITERATIONS: number = 200;

@Concurrent
async function concurrentExchangeTask(array: collections.Int32Array, results: collections.Int32Array,
  offset: number, taskId: number, iterations: number, step: number): Promise<number> {
  const index: number = 0;
  for (let i: number = 0; i < iterations; i++) {
    const value: number = taskId * step + i;
    const previous: number = ArkTSUtils.Atomics.exchange(array, index, value);
    ArkTSUtils.Atomics.store(results, offset + i, previous);
  }
  return iterations;
}

@Concurrent
async function concurrentAndTask(array: collections.Int32Array, mask: number, iterations: number): Promise<number> {
  const index: number = 0;
  for (let i: number = 0; i < iterations; i++) {
    ArkTSUtils.Atomics.and(array, index, mask);
  }
  return iterations;
}

@Concurrent
async function concurrentXorTask(array: collections.Int32Array, mask: number, iterations: number): Promise<number> {
  const index: number = 0;
  for (let i: number = 0; i < iterations; i++) {
    ArkTSUtils.Atomics.xor(array, index, mask);
  }
  return iterations;
}

@Concurrent
async function multiHop1Task(buffer: collections.ArrayBuffer, array: collections.Int32Array,
  report: collections.Int32Array): Promise<void> {
  const index: number = 0;
  const HOP1_BUFFER_BYTELENGTH: number = 0;
  const HOP1_ARRAY_BYTELENGTH: number = 1;
  const HOP1_SUBARRAY_VALUE: number = 2;
  const HOP1_INDEX_VALUE: number = 3;
  const HOP2_BUFFER_BYTELENGTH: number = 4;
  const HOP2_ARRAY_BYTELENGTH: number = 5;
  const HOP2_ADD_RETURN: number = 6;
  const HOP2_FINAL_LOAD: number = 7;
  const HOP2_SUBARRAY_VALUE: number = 8;
  const HOP2_INDEX_VALUE: number = 9;
  const INT32_MAX: number = 2147483647;
  const INT32_MIN: number = -2147483648;
  ArkTSUtils.Atomics.store(report, HOP1_BUFFER_BYTELENGTH, buffer.byteLength);
  ArkTSUtils.Atomics.store(report, HOP1_ARRAY_BYTELENGTH, array.byteLength);
  const sub: collections.Int32Array = array.subarray(0, 1);
  ArkTSUtils.Atomics.store(report, HOP1_SUBARRAY_VALUE, sub[0]);
  ArkTSUtils.Atomics.store(report, HOP1_INDEX_VALUE, array[0]);
  ArkTSUtils.Atomics.store(report, HOP2_BUFFER_BYTELENGTH, buffer.byteLength);
  ArkTSUtils.Atomics.store(report, HOP2_ARRAY_BYTELENGTH, array.byteLength);
  ArkTSUtils.Atomics.store(array, index, INT32_MAX);
  const previous: number = ArkTSUtils.Atomics.add(array, index, 1);
  ArkTSUtils.Atomics.store(report, HOP2_ADD_RETURN, previous);
  const finalValue: number = ArkTSUtils.Atomics.load(array, index);
  ArkTSUtils.Atomics.store(report, HOP2_FINAL_LOAD, finalValue);
  const sub2: collections.Int32Array = array.subarray(0, 1);
  ArkTSUtils.Atomics.store(report, HOP2_SUBARRAY_VALUE, sub2[0]);
  ArkTSUtils.Atomics.store(report, HOP2_INDEX_VALUE, array[0]);
}

@Concurrent
async function noSavedWakeupWaitTask(array: collections.Int32Array): Promise<string> {
  const index: number = 0;
  const expected: number = 0;
  const timeout: number = 300;
  return ArkTSUtils.Atomics.wait(array, index, expected, timeout);
}

@Concurrent
async function atomicIncrementRecordTask(array: collections.Int32Array, results: collections.Int32Array,
  offset: number, iterations: number): Promise<number> {
  const index: number = 0;
  for (let i: number = 0; i < iterations; i++) {
    const previous: number = ArkTSUtils.Atomics.add(array, index, 1);
    ArkTSUtils.Atomics.store(results, offset + i, previous);
  }
  return iterations;
}

@Concurrent
async function nonAtomicIncrementTask(array: collections.Int32Array, iterations: number): Promise<number> {
  const index: number = 0;
  for (let i: number = 0; i < iterations; i++) {
    const current: number = ArkTSUtils.Atomics.load(array, index);
    ArkTSUtils.Atomics.store(array, index, current + 1);
  }
  return iterations;
}

@Concurrent
async function mainThreadNotifyTask(array: collections.Int32Array): Promise<number> {
  const index: number = 0;
  return ArkTSUtils.Atomics.notify(array, index, 1);
}

export default function atomicsSupplementTest() {
  describe('atomicsSupplementTest', () => {
    afterEach(async () => { await sleep(10); });

    // ===== Group A: IsLockFree ToInt32 spec deviation (P0) =====

    /**
     * @tc.name   testArkTSUtilsAtomicsSupplementIsLockFree001
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUPPLEMENT_ISLOCKFREE_0100
     * @tc.desc   isLockFree(2^32+1) returns true due to ToInt32 wrap to 1 (spec deviation: ToIntegerOrInfinity should return false)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testArkTSUtilsAtomicsSupplementIsLockFree001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (done: () => void) => {
      expect(ArkTSUtils.Atomics.isLockFree(4294967297)).assertTrue();
      done();
    });

    /**
     * @tc.name   testArkTSUtilsAtomicsSupplementIsLockFree002
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUPPLEMENT_ISLOCKFREE_0200
     * @tc.desc   isLockFree(2^32+2) returns true due to ToInt32 wrap to 2 (spec deviation)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testArkTSUtilsAtomicsSupplementIsLockFree002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (done: () => void) => {
      expect(ArkTSUtils.Atomics.isLockFree(4294967298)).assertTrue();
      done();
    });

    /**
     * @tc.name   testArkTSUtilsAtomicsSupplementIsLockFree003
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUPPLEMENT_ISLOCKFREE_0300
     * @tc.desc   isLockFree(2^32+4) returns true due to ToInt32 wrap to 4 (spec deviation)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testArkTSUtilsAtomicsSupplementIsLockFree003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (done: () => void) => {
      expect(ArkTSUtils.Atomics.isLockFree(4294967300)).assertTrue();
      done();
    });

    /**
     * @tc.name   testArkTSUtilsAtomicsSupplementIsLockFree004
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUPPLEMENT_ISLOCKFREE_0400
     * @tc.desc   isLockFree(2^32+8) returns true due to ToInt32 wrap to 8 (spec deviation)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testArkTSUtilsAtomicsSupplementIsLockFree004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (done: () => void) => {
      expect(ArkTSUtils.Atomics.isLockFree(4294967304)).assertTrue();
      done();
    });

    /**
     * @tc.name   testArkTSUtilsAtomicsSupplementIsLockFree005
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUPPLEMENT_ISLOCKFREE_0500
     * @tc.desc   isLockFree(2^32+3) returns false (ToInt32=3, not in {1,2,4,8})
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testArkTSUtilsAtomicsSupplementIsLockFree005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (done: () => void) => {
      expect(ArkTSUtils.Atomics.isLockFree(4294967299)).assertFalse();
      done();
    });

    /**
     * @tc.name   testArkTSUtilsAtomicsSupplementIsLockFree006
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUPPLEMENT_ISLOCKFREE_0600
     * @tc.desc   isLockFree(2^33+4) returns true due to ToInt32 wrap to 4 (spec deviation)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testArkTSUtilsAtomicsSupplementIsLockFree006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (done: () => void) => {
      expect(ArkTSUtils.Atomics.isLockFree(8589934596)).assertTrue();
      done();
    });

    // ===== Group B: GetAgentCanSuspend check (P0) — moved to worker, see Wait006/007 =====
    // Main thread allows blocking in test environment (agentCanSuspend_=true by default).
    // Wait001/002 removed: cannot reliably trigger GetAgentCanSuspend=false from ArkTS.

    // ===== Group D: Worker termination during wait — UAF verification (P0) =====

    /**
     * @tc.name   testArkTSUtilsAtomicsSupplementWait003
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUPPLEMENT_WAIT_0300
     * @tc.desc   worker wait then terminate — worker exits via timeout, onexit confirms cleanup, no crash
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testArkTSUtilsAtomicsSupplementWait003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Int32Array(sab);
      ta[0] = 0;
      let exited = false;
      const workerInstance = new worker.ThreadWorker("./workers/Worker03.ets");
      workerInstance.postMessageWithSharedSendable({ ta, index: 0, value: 0, timeout: 500 } as typeWait03);
      workerInstance.onmessage = () => { };
      workerInstance.onexit = () => { exited = true; };
      await sleep(200);
      workerInstance.terminate();
      let waitCount = 0;
      while (!exited && waitCount < 150) { await sleep(100); waitCount++; }
      expect(exited).assertTrue();
      done();
    });

    /**
     * @tc.name   testArkTSUtilsAtomicsSupplementWait004
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUPPLEMENT_WAIT_0400
     * @tc.desc   worker wait then terminate then notify — after onexit confirms worker destroyed, notify should return 0 (spec: dead thread is not a waiting thread)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testArkTSUtilsAtomicsSupplementWait004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Int32Array(sab);
      ta[0] = 0;
      let exited = false;
      const workerInstance = new worker.ThreadWorker("./workers/Worker03.ets");
      workerInstance.postMessageWithSharedSendable({ ta, index: 0, value: 0, timeout: 500 } as typeWait03);
      workerInstance.onmessage = () => { };
      workerInstance.onexit = () => { exited = true; };
      await sleep(200);
      workerInstance.terminate();
      let waitCount = 0;
      while (!exited && waitCount < 150) { await sleep(100); waitCount++; }
      expect(exited).assertTrue();
      const woken = ArkTSUtils.Atomics.notify(ta, 0, 1);
      expect(woken).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testArkTSUtilsAtomicsSupplementWait005
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUPPLEMENT_WAIT_0500
     * @tc.desc   two workers wait, terminate one (onexit confirms), notify — surviving worker wakes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testArkTSUtilsAtomicsSupplementWait005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Int32Array(sab);
      ta[0] = 0;
      let w1Exited = false;
      let w2Result: string = '';
      let w2Done = false;
      let w2Exited = false;
      const w1 = new worker.ThreadWorker("./workers/Worker03.ets");
      w1.postMessageWithSharedSendable({ ta, index: 0, value: 0, timeout: 500 } as typeWait03);
      w1.onmessage = () => { };
      w1.onexit = () => { w1Exited = true; };
      const w2 = new worker.ThreadWorker("./workers/Worker03.ets");
      w2.postMessageWithSharedSendable({ ta, index: 0, value: 0, timeout: 10000 } as typeWait03);
      w2.onmessage = (e) => { w2Result = e.data as string; w2Done = true; w2.terminate(); };
      w2.onexit = () => { w2Exited = true; };
      await sleep(200);
      w1.terminate();
      let waitCount = 0;
      while (!w1Exited && waitCount < 150) { await sleep(100); waitCount++; }
      expect(w1Exited).assertTrue();
      const woken = ArkTSUtils.Atomics.notify(ta, 0, 1);
      waitCount = 0;
      while (!w2Done && waitCount < 30) { await sleep(100); waitCount++; }
      expect(w2Done).assertTrue();
      expect(w2Result).assertEqual('ok');
      waitCount = 0;
      while (!w2Exited && waitCount < 30) { await sleep(100); waitCount++; }
      expect(w2Exited).assertTrue();
      done();
    });

    // ===== Group E: Non-aligned byteOffset — constructor defense verification (P0) =====

    /**
     * @tc.name   testArkTSUtilsAtomicsSupplementAlign001
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUPPLEMENT_ALIGN_0100
     * @tc.desc   Int32Array constructor rejects byteOffset=1 (not multiple of BYTES_PER_ELEMENT=4) — defense against alignment UB
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testArkTSUtilsAtomicsSupplementAlign001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (done: () => void) => {
      const sab = new collections.ArrayBuffer(8);
      let didThrow = false;
      try {
        new collections.Int32Array(sab, 1, 1);
      } catch (error) {
        didThrow = true;
      }
      expect(didThrow).assertTrue();
      done();
    });

    /**
     * @tc.name   testArkTSUtilsAtomicsSupplementAlign002
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUPPLEMENT_ALIGN_0200
     * @tc.desc   Int16Array constructor rejects byteOffset=1 (not multiple of BYTES_PER_ELEMENT=2)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testArkTSUtilsAtomicsSupplementAlign002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (done: () => void) => {
      const sab = new collections.ArrayBuffer(8);
      let didThrow = false;
      try {
        new collections.Int16Array(sab, 1, 3);
      } catch (error) {
        didThrow = true;
      }
      expect(didThrow).assertTrue();
      done();
    });

    /**
     * @tc.name   testArkTSUtilsAtomicsSupplementAlign003
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUPPLEMENT_ALIGN_0300
     * @tc.desc   Int32Array constructor rejects byteOffset=2 (not multiple of 4)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testArkTSUtilsAtomicsSupplementAlign003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (done: () => void) => {
      const sab = new collections.ArrayBuffer(8);
      let didThrow = false;
      try {
        new collections.Int32Array(sab, 2, 1);
      } catch (error) {
        didThrow = true;
      }
      expect(didThrow).assertTrue();
      done();
    });

    /**
     * @tc.name   testArkTSUtilsAtomicsSupplementAlign004
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUPPLEMENT_ALIGN_0400
     * @tc.desc   Int32Array constructor rejects byteOffset=3 (not multiple of 4)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testArkTSUtilsAtomicsSupplementAlign004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (done: () => void) => {
      const sab = new collections.ArrayBuffer(8);
      let didThrow = false;
      try {
        new collections.Int32Array(sab, 3, 1);
      } catch (error) {
        didThrow = true;
      }
      expect(didThrow).assertTrue();
      done();
    });

    /**
     * @tc.name   testArkTSUtilsAtomicsSupplementAlign005
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUPPLEMENT_ALIGN_0500
     * @tc.desc   Int32Array constructor accepts byteOffset=4 (aligned, multiple of 4) — normal path
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testArkTSUtilsAtomicsSupplementAlign005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (done: () => void) => {
      const sab = new collections.ArrayBuffer(8);
      const ta = new collections.Int32Array(sab, 4, 1);
      const old = ArkTSUtils.Atomics.add(ta, 0, 1);
      expect(old).assertEqual(0);
      expect(ArkTSUtils.Atomics.load(ta, 0)).assertEqual(1);
      done();
    });

    // ===== Group F: notify dedicated tests (P1) =====

    /**
     * @tc.name   testArkTSUtilsAtomicsSupplementNotify001
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUPPLEMENT_NOTIFY_0100
     * @tc.desc   notify with no waiters returns 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsSupplementNotify001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: () => void) => {
      const ta = new collections.Int32Array(1);
      expect(ArkTSUtils.Atomics.notify(ta, 0, 1)).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testArkTSUtilsAtomicsSupplementNotify002
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUPPLEMENT_NOTIFY_0200
     * @tc.desc   notify count=0 wakes nobody
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsSupplementNotify002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: () => void) => {
      const ta = new collections.Int32Array(1);
      expect(ArkTSUtils.Atomics.notify(ta, 0, 0)).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testArkTSUtilsAtomicsSupplementNotify003
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUPPLEMENT_NOTIFY_0300
     * @tc.desc   notify count=-1 wakes nobody
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsSupplementNotify003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: () => void) => {
      const ta = new collections.Int32Array(1);
      expect(ArkTSUtils.Atomics.notify(ta, 0, -1)).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testArkTSUtilsAtomicsSupplementNotify004
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUPPLEMENT_NOTIFY_0400
     * @tc.desc   notify count=1.9 truncates to 1 (no waiters, returns 0)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsSupplementNotify004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: () => void) => {
      const ta = new collections.Int32Array(1);
      expect(ArkTSUtils.Atomics.notify(ta, 0, 1.9)).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testArkTSUtilsAtomicsSupplementNotify005
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUPPLEMENT_NOTIFY_0500
     * @tc.desc   notify on different index does not wake waiter on index 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsSupplementNotify005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(8);
      const ta = new collections.Int32Array(sab);
      ta[0] = 0;
      let gotResult = false;
      let workerResult: string = '';
      const workerInstance = new worker.ThreadWorker("./workers/Worker01.ets");
      workerInstance.postMessageWithSharedSendable({ ta, index: 0, value: 0 } as typeWait01);
      workerInstance.onmessage = (e) => { workerResult = e.data as string; gotResult = true; workerInstance.terminate(); };
      workerInstance.onexit = () => { };
      await sleep(200);
      const woken = ArkTSUtils.Atomics.notify(ta, 1, 1);
      expect(woken).assertEqual(0);
      await sleep(100);
      ArkTSUtils.Atomics.store(ta, 0, 1);
      ArkTSUtils.Atomics.notify(ta, 0, 1);
      let waitCount = 0;
      while (!gotResult && waitCount < 30) { await sleep(100); waitCount++; }
      expect(gotResult).assertTrue();
      expect(workerResult).assertEqual('ok');
      done();
    });

    /**
     * @tc.name   testArkTSUtilsAtomicsSupplementNotify006
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUPPLEMENT_NOTIFY_0600
     * @tc.desc   notify on different backing buffer does not wake waiter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsSupplementNotify006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: () => void) => {
      const sab1 = new collections.ArrayBuffer(4);
      const ta1 = new collections.Int32Array(sab1);
      const sab2 = new collections.ArrayBuffer(4);
      const ta2 = new collections.Int32Array(sab2);
      expect(ArkTSUtils.Atomics.notify(ta2, 0, 1)).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testArkTSUtilsAtomicsSupplementNotify007
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUPPLEMENT_NOTIFY_0700
     * @tc.desc   notify wakes exactly 1 waiter when count=1 (2 waiters present)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsSupplementNotify007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Int32Array(sab);
      ta[0] = 0;
      let gotMsg1 = false;
      let gotMsg2 = false;
      const w1 = new worker.ThreadWorker("./workers/Worker01.ets");
      w1.postMessageWithSharedSendable({ ta, index: 0, value: 0 } as typeWait01);
      w1.onmessage = () => { gotMsg1 = true; w1.terminate(); };
      w1.onexit = () => { };
      const w2 = new worker.ThreadWorker("./workers/Worker01.ets");
      w2.postMessageWithSharedSendable({ ta, index: 0, value: 0 } as typeWait01);
      w2.onmessage = () => { gotMsg2 = true; w2.terminate(); };
      w2.onexit = () => { };
      await sleep(200);
      const woken = ArkTSUtils.Atomics.notify(ta, 0, 1);
      expect(woken).assertEqual(1);
      let waitCount = 0;
      while (!(gotMsg1 || gotMsg2) && waitCount < 30) { await sleep(100); waitCount++; }
      expect(gotMsg1 || gotMsg2).assertTrue();
      expect(gotMsg1 && gotMsg2).assertFalse();
      ArkTSUtils.Atomics.notify(ta, 0, 1);
      waitCount = 0;
      while (!(gotMsg1 && gotMsg2) && waitCount < 30) { await sleep(100); waitCount++; }
      done();
    });

    /**
     * @tc.name   testArkTSUtilsAtomicsSupplementNotify008
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUPPLEMENT_NOTIFY_0800
     * @tc.desc   notify with omitted count wakes all waiters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsSupplementNotify008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Int32Array(sab);
      ta[0] = 0;
      let gotMsg1 = false;
      let gotMsg2 = false;
      const w1 = new worker.ThreadWorker("./workers/Worker01.ets");
      w1.postMessageWithSharedSendable({ ta, index: 0, value: 0 } as typeWait01);
      w1.onmessage = () => { gotMsg1 = true; w1.terminate(); };
      w1.onexit = () => { };
      const w2 = new worker.ThreadWorker("./workers/Worker01.ets");
      w2.postMessageWithSharedSendable({ ta, index: 0, value: 0 } as typeWait01);
      w2.onmessage = () => { gotMsg2 = true; w2.terminate(); };
      w2.onexit = () => { };
      await sleep(200);
      const woken = ArkTSUtils.Atomics.notify(ta, 0);
      expect(woken).assertEqual(2);
      let waitCount = 0;
      while (!(gotMsg1 && gotMsg2) && waitCount < 30) { await sleep(100); waitCount++; }
      expect(gotMsg1).assertTrue();
      expect(gotMsg2).assertTrue();
      done();
    });

    // ===== Group G: load/store boundary values (P1) =====

    /**
     * @tc.name   testArkTSUtilsAtomicsSupplementLoad001
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUPPLEMENT_LOAD_0100
     * @tc.desc   load Int32Array max value (0x7FFFFFFF)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsSupplementLoad001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: () => void) => {
      const ta = new collections.Int32Array(1);
      ArkTSUtils.Atomics.store(ta, 0, 0x7FFFFFFF);
      expect(ArkTSUtils.Atomics.load(ta, 0)).assertEqual(2147483647);
      done();
    });

    /**
     * @tc.name   testArkTSUtilsAtomicsSupplementLoad002
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUPPLEMENT_LOAD_0200
     * @tc.desc   load Int32Array min value (-0x80000000)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsSupplementLoad002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: () => void) => {
      const ta = new collections.Int32Array(1);
      ArkTSUtils.Atomics.store(ta, 0, -0x80000000);
      expect(ArkTSUtils.Atomics.load(ta, 0)).assertEqual(-2147483648);
      done();
    });

    /**
     * @tc.name   testArkTSUtilsAtomicsSupplementLoad003
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUPPLEMENT_LOAD_0300
     * @tc.desc   load Int8Array max (127) and min (-128)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsSupplementLoad003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: () => void) => {
      const ta = new collections.Int8Array(2);
      ArkTSUtils.Atomics.store(ta, 0, 127);
      ArkTSUtils.Atomics.store(ta, 1, -128);
      expect(ArkTSUtils.Atomics.load(ta, 0)).assertEqual(127);
      expect(ArkTSUtils.Atomics.load(ta, 1)).assertEqual(-128);
      done();
    });

    /**
     * @tc.name   testArkTSUtilsAtomicsSupplementLoad004
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUPPLEMENT_LOAD_0400
     * @tc.desc   load at index=length-1 boundary
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsSupplementLoad004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: () => void) => {
      const ta = new collections.Int32Array(10);
      ArkTSUtils.Atomics.store(ta, 9, 42);
      expect(ArkTSUtils.Atomics.load(ta, 9)).assertEqual(42);
      done();
    });

    /**
     * @tc.name   testArkTSUtilsAtomicsSupplementStore001
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUPPLEMENT_STORE_0100
     * @tc.desc   store Int32Array max value — return value equals stored value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsSupplementStore001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: () => void) => {
      const ta = new collections.Int32Array(1);
      const ret = ArkTSUtils.Atomics.store(ta, 0, 0x7FFFFFFF);
      expect(ret).assertEqual(2147483647);
      expect(ta[0]).assertEqual(2147483647);
      done();
    });

    /**
     * @tc.name   testArkTSUtilsAtomicsSupplementStore002
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUPPLEMENT_STORE_0200
     * @tc.desc   store Int32Array min value — return value equals stored value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsSupplementStore002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: () => void) => {
      const ta = new collections.Int32Array(1);
      const ret = ArkTSUtils.Atomics.store(ta, 0, -0x80000000);
      expect(ret).assertEqual(-2147483648);
      expect(ta[0]).assertEqual(-2147483648);
      done();
    });

    /**
     * @tc.name   testArkTSUtilsAtomicsSupplementStore003
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUPPLEMENT_STORE_0300
     * @tc.desc   store Uint8Array 256 — return 256 (ToInteger), actual stored 0 (ToUint8 wrap)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsSupplementStore003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: () => void) => {
      const ta = new collections.Uint8Array(1);
      const ret = ArkTSUtils.Atomics.store(ta, 0, 256);
      expect(ret).assertEqual(256);
      expect(ta[0]).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testArkTSUtilsAtomicsSupplementStore004
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUPPLEMENT_STORE_0400
     * @tc.desc   store Uint8Array 255 — return 255, actual stored 255
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsSupplementStore004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: () => void) => {
      const ta = new collections.Uint8Array(1);
      const ret = ArkTSUtils.Atomics.store(ta, 0, 255);
      expect(ret).assertEqual(255);
      expect(ta[0]).assertEqual(255);
      done();
    });

    /**
     * @tc.name   testArkTSUtilsAtomicsSupplementStore005
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUPPLEMENT_STORE_0500
     * @tc.desc   store Uint8Array -1 — return -1 (ToInteger), actual stored 255 (ToUint8)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsSupplementStore005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: () => void) => {
      const ta = new collections.Uint8Array(1);
      const ret = ArkTSUtils.Atomics.store(ta, 0, -1);
      expect(ret).assertEqual(-1);
      expect(ta[0]).assertEqual(255);
      done();
    });

    /**
     * @tc.name   testArkTSUtilsAtomicsSupplementStore006
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUPPLEMENT_STORE_0600
     * @tc.desc   store Int8Array 128 — return 128 (ToInteger), actual stored -128 (ToInt8 wrap)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsSupplementStore006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: () => void) => {
      const ta = new collections.Int8Array(1);
      const ret = ArkTSUtils.Atomics.store(ta, 0, 128);
      expect(ret).assertEqual(128);
      expect(ta[0]).assertEqual(-128);
      done();
    });

    /**
     * @tc.name   testArkTSUtilsAtomicsSupplementStore007
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUPPLEMENT_STORE_0700
     * @tc.desc   store Uint16Array 65536 — return 65536, actual stored 0 (wrap)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsSupplementStore007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: () => void) => {
      const ta = new collections.Uint16Array(1);
      const ret = ArkTSUtils.Atomics.store(ta, 0, 65536);
      expect(ret).assertEqual(65536);
      expect(ta[0]).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testArkTSUtilsAtomicsSupplementStore008
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUPPLEMENT_STORE_0800
     * @tc.desc   store Uint32Array 4294967296 — return 4294967296, actual stored 0 (wrap)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsSupplementStore008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: () => void) => {
      const ta = new collections.Uint32Array(1);
      const ret = ArkTSUtils.Atomics.store(ta, 0, 4294967296);
      expect(ret).assertEqual(4294967296);
      expect(ta[0]).assertEqual(0);
      done();
    });

    // ===== Group J: Doc conformance (P1) =====

    /**
     * @tc.name   testArkTSUtilsAtomicsSupplementDoc001
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUPPLEMENT_DOC_0100
     * @tc.desc   Doc example: add — before=10, return=10, after=13
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsSupplementDoc001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: () => void) => {
      const array = new collections.Int32Array(1);
      array[0] = 10;
      const result = ArkTSUtils.Atomics.add(array, 0, 3);
      expect(result).assertEqual(10);
      expect(array[0]).assertEqual(13);
      done();
    });

    /**
     * @tc.name   testArkTSUtilsAtomicsSupplementDoc002
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUPPLEMENT_DOC_0200
     * @tc.desc   Doc example: store Uint8Array 257 — return=257, actual=1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsSupplementDoc002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: () => void) => {
      const uint8Array = new collections.Uint8Array(1);
      uint8Array[0] = 10;
      const converted = ArkTSUtils.Atomics.store(uint8Array, 0, 257);
      expect(converted).assertEqual(257);
      expect(uint8Array[0]).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testArkTSUtilsAtomicsSupplementDoc003
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUPPLEMENT_DOC_0300
     * @tc.desc   Doc example: compareExchange match and mismatch
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsSupplementDoc003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: () => void) => {
      const array = new collections.Int32Array(1);
      array[0] = 10;
      const result = ArkTSUtils.Atomics.compareExchange(array, 0, 10, 3);
      expect(result).assertEqual(10);
      expect(array[0]).assertEqual(3);
      const unmatched = ArkTSUtils.Atomics.compareExchange(array, 0, 10, 20);
      expect(unmatched).assertEqual(3);
      expect(array[0]).assertEqual(3);
      done();
    });

    /**
     * @tc.name   testArkTSUtilsAtomicsSupplementDoc004
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUPPLEMENT_DOC_0400
     * @tc.desc   Doc example: and — 10 & 3 = 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsSupplementDoc004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: () => void) => {
      const array = new collections.Int32Array(1);
      array[0] = 10;
      const result = ArkTSUtils.Atomics.and(array, 0, 3);
      expect(result).assertEqual(10);
      expect(array[0]).assertEqual(2);
      done();
    });

    /**
     * @tc.name   testArkTSUtilsAtomicsSupplementDoc005
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUPPLEMENT_DOC_0500
     * @tc.desc   Doc example: or — 10 | 3 = 11
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsSupplementDoc005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: () => void) => {
      const array = new collections.Int32Array(1);
      array[0] = 10;
      const result = ArkTSUtils.Atomics.or(array, 0, 3);
      expect(result).assertEqual(10);
      expect(array[0]).assertEqual(11);
      done();
    });

    /**
     * @tc.name   testArkTSUtilsAtomicsSupplementDoc006
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUPPLEMENT_DOC_0600
     * @tc.desc   Doc example: xor — 10^3=9; sub — 10-3=7; exchange 10→3; load=10
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testArkTSUtilsAtomicsSupplementDoc006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: () => void) => {
      const array = new collections.Int32Array(1);
      array[0] = 10;
      expect(ArkTSUtils.Atomics.xor(array, 0, 3)).assertEqual(10);
      expect(array[0]).assertEqual(9);

      array[0] = 10;
      expect(ArkTSUtils.Atomics.sub(array, 0, 3)).assertEqual(10);
      expect(array[0]).assertEqual(7);

      array[0] = 10;
      expect(ArkTSUtils.Atomics.exchange(array, 0, 3)).assertEqual(10);
      expect(array[0]).assertEqual(3);

      array[0] = 10;
      expect(ArkTSUtils.Atomics.load(array, 0)).assertEqual(10);
      done();
    });

    // ===== Group K: wait timeout=0 / -1 with value match → timed-out (from C++ SharedWaitTimeoutAndMismatchCombinations) =====

    /**
     * @tc.name   testArkTSUtilsAtomicsSupplementWait006
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUPPLEMENT_WAIT_0600
     * @tc.desc   wait timeout=0 with value matching returns 'timed-out' immediately (WaitOnNode line 349 branch)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testArkTSUtilsAtomicsSupplementWait006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Int32Array(sab);
      ta[0] = 5;
      let gotResult = false;
      let result: string = '';
      const workerInstance = new worker.ThreadWorker("./workers/Worker03.ets");
      workerInstance.postMessageWithSharedSendable({ ta, index: 0, value: 5, timeout: 0 } as typeWait03);
      workerInstance.onmessage = (e) => { result = e.data as string; gotResult = true; workerInstance.terminate(); };
      workerInstance.onexit = () => { };
      let waitCount = 0;
      while (!gotResult && waitCount < 30) { await sleep(100); waitCount++; }
      expect(gotResult).assertTrue();
      expect(result).assertEqual('timed-out');
      done();
    });

    /**
     * @tc.name   testArkTSUtilsAtomicsSupplementWait007
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUPPLEMENT_WAIT_0700
     * @tc.desc   wait timeout=-1 with value matching returns 'timed-out' (ConvertTimeout(-1)→0, then timed-out)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testArkTSUtilsAtomicsSupplementWait007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const sab = new collections.ArrayBuffer(4);
      const ta = new collections.Int32Array(sab);
      ta[0] = 5;
      let gotResult = false;
      let result: string = '';
      const workerInstance = new worker.ThreadWorker("./workers/Worker03.ets");
      workerInstance.postMessageWithSharedSendable({ ta, index: 0, value: 5, timeout: -1 } as typeWait03);
      workerInstance.onmessage = (e) => { result = e.data as string; gotResult = true; workerInstance.terminate(); };
      workerInstance.onexit = () => { };
      let waitCount = 0;
      while (!gotResult && waitCount < 30) { await sleep(100); waitCount++; }
      expect(gotResult).assertTrue();
      expect(result).assertEqual('timed-out');
      done();
    });

    // ===== Group L: Systematic wraparound for all 6 TypedArray types (from C++ SharedIntegerTypedArrayWraparound) =====

    /**
     * @tc.name   testArkTSUtilsAtomicsSupplementWrap001
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUPPLEMENT_WRAP_0100
     * @tc.desc   Int8Array add 127+1 wraps to -128 (signed overflow)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testArkTSUtilsAtomicsSupplementWrap001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (done: () => void) => {
      const ta = new collections.Int8Array(1);
      ta[0] = 127;
      const old = ArkTSUtils.Atomics.add(ta, 0, 1);
      expect(old).assertEqual(127);
      expect(ta[0]).assertEqual(-128);
      done();
    });

    /**
     * @tc.name   testArkTSUtilsAtomicsSupplementWrap002
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUPPLEMENT_WRAP_0200
     * @tc.desc   Uint8Array add 255+1 wraps to 0 (unsigned overflow)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testArkTSUtilsAtomicsSupplementWrap002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (done: () => void) => {
      const ta = new collections.Uint8Array(1);
      ta[0] = 255;
      const old = ArkTSUtils.Atomics.add(ta, 0, 1);
      expect(old).assertEqual(255);
      expect(ta[0]).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testArkTSUtilsAtomicsSupplementWrap003
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUPPLEMENT_WRAP_0300
     * @tc.desc   Int16Array add 32767+1 wraps to -32768
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testArkTSUtilsAtomicsSupplementWrap003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (done: () => void) => {
      const ta = new collections.Int16Array(1);
      ta[0] = 32767;
      const old = ArkTSUtils.Atomics.add(ta, 0, 1);
      expect(old).assertEqual(32767);
      expect(ta[0]).assertEqual(-32768);
      done();
    });

    /**
     * @tc.name   testArkTSUtilsAtomicsSupplementWrap004
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUPPLEMENT_WRAP_0400
     * @tc.desc   Uint16Array add 65535+1 wraps to 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testArkTSUtilsAtomicsSupplementWrap004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (done: () => void) => {
      const ta = new collections.Uint16Array(1);
      ta[0] = 65535;
      const old = ArkTSUtils.Atomics.add(ta, 0, 1);
      expect(old).assertEqual(65535);
      expect(ta[0]).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testArkTSUtilsAtomicsSupplementWrap005
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUPPLEMENT_WRAP_0500
     * @tc.desc   Int32Array add 2147483647+1 wraps to -2147483648
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testArkTSUtilsAtomicsSupplementWrap005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (done: () => void) => {
      const ta = new collections.Int32Array(1);
      ta[0] = 2147483647;
      const old = ArkTSUtils.Atomics.add(ta, 0, 1);
      expect(old).assertEqual(2147483647);
      expect(ta[0]).assertEqual(-2147483648);
      done();
    });

    /**
     * @tc.name   testArkTSUtilsAtomicsSupplementWrap006
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUPPLEMENT_WRAP_0600
     * @tc.desc   Uint32Array add 4294967295+1 wraps to 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testArkTSUtilsAtomicsSupplementWrap006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (done: () => void) => {
      const ta = new collections.Uint32Array(1);
      ta[0] = 4294967295;
      const old = ArkTSUtils.Atomics.add(ta, 0, 1);
      expect(old).assertEqual(4294967295);
      expect(ta[0]).assertEqual(0);
      done();
    });

    // ===== Group N: Concurrent stress tests (from earlier snapshot) =====

    /**
     * @tc.name   testArkTSUtilsAtomicsSupplementConcurrentExchange001
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUPPLEMENT_CONC_EXCHANGE_0100
     * @tc.desc   Four taskpool tasks each perform 200 concurrent exchange operations on a single Int32Array slot; verify no data tearing, all return values unique, and final load is the one written value not observed as a return.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testArkTSUtilsAtomicsSupplementConcurrentExchange001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const array: collections.Int32Array = new collections.Int32Array(1);
        const total: number = EXCHANGE_TASK_COUNT * EXCHANGE_ITERATIONS;
        const results: collections.Int32Array = new collections.Int32Array(total);
        ArkTSUtils.Atomics.store(array, TASK_INDEX, EXCHANGE_INITIAL);
        const tasks: Promise<Object>[] = [];
        for (let w: number = 0; w < EXCHANGE_TASK_COUNT; w++) {
          tasks.push(taskpool.execute(concurrentExchangeTask, array, results, w * EXCHANGE_ITERATIONS,
            w, EXCHANGE_ITERATIONS, EXCHANGE_STEP));
        }
        const counts: Object[] = await Promise.all(tasks);
        let totalExchanges: number = 0;
        for (let w: number = 0; w < counts.length; w++) {
          expect(counts[w] as number).assertEqual(EXCHANGE_ITERATIONS);
          totalExchanges += counts[w] as number;
        }
        expect(totalExchanges).assertEqual(total);
        const writtenSet: Set<number> = new Set<number>();
        writtenSet.add(EXCHANGE_INITIAL);
        for (let w: number = 0; w < EXCHANGE_TASK_COUNT; w++) {
          for (let i: number = 0; i < EXCHANGE_ITERATIONS; i++) {
            writtenSet.add(w * EXCHANGE_STEP + i);
          }
        }
        const returnSet: Set<number> = new Set<number>();
        for (let k: number = 0; k < total; k++) {
          const previous: number = ArkTSUtils.Atomics.load(results, k);
          expect(writtenSet.has(previous)).assertTrue();
          returnSet.add(previous);
        }
        expect(returnSet.size).assertEqual(total);
        const finalValue: number = ArkTSUtils.Atomics.load(array, TASK_INDEX);
        expect(writtenSet.has(finalValue)).assertTrue();
        expect(returnSet.has(finalValue)).assertFalse();
        done();
      });

    /**
     * @tc.name   testArkTSUtilsAtomicsSupplementConcurrentAnd002
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUPPLEMENT_CONC_AND_0200
     * @tc.desc   Two taskpool tasks concurrently and complementary masks 0x0F0F0F0F and 0x00FF00FF onto an all-ones slot; final value is order-independent and equals 0x000F000F.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testArkTSUtilsAtomicsSupplementConcurrentAnd002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const array: collections.Int32Array = new collections.Int32Array(1);
        ArkTSUtils.Atomics.store(array, TASK_INDEX, AND_INITIAL);
        const counts: Object[] = await Promise.all([
          taskpool.execute(concurrentAndTask, array, AND_MASK_A, AND_ITERATIONS),
          taskpool.execute(concurrentAndTask, array, AND_MASK_B, AND_ITERATIONS)
        ]);
        expect(counts[0] as number).assertEqual(AND_ITERATIONS);
        expect(counts[1] as number).assertEqual(AND_ITERATIONS);
        expect(ArkTSUtils.Atomics.load(array, TASK_INDEX)).assertEqual(AND_EXPECTED);
        done();
      });

    /**
     * @tc.name   testArkTSUtilsAtomicsSupplementConcurrentXor003
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUPPLEMENT_CONC_XOR_0300
     * @tc.desc   Two taskpool tasks each xor the same mask 50 times onto a zero slot; even total flips cancel and final value is 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testArkTSUtilsAtomicsSupplementConcurrentXor003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const array: collections.Int32Array = new collections.Int32Array(1);
        ArkTSUtils.Atomics.store(array, TASK_INDEX, 0);
        const counts: Object[] = await Promise.all([
          taskpool.execute(concurrentXorTask, array, XOR_MASK, XOR_ITERATIONS),
          taskpool.execute(concurrentXorTask, array, XOR_MASK, XOR_ITERATIONS)
        ]);
        expect(counts[0] as number).assertEqual(XOR_ITERATIONS);
        expect(counts[1] as number).assertEqual(XOR_ITERATIONS);
        expect(ArkTSUtils.Atomics.load(array, TASK_INDEX)).assertEqual(0);
        done();
      });

    /**
     * @tc.name   testArkTSUtilsAtomicsSupplementMultihopTransfer004
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUPPLEMENT_MULTIHOP_0400
     * @tc.desc   Transfer Sendable ArrayBuffer + Int32Array through nested taskpool hops (main -> hop1 -> hop2); verify byteLength, subarray, index access survive each hop and hop2 add overflow wraps INT32_MAX+1 to INT32_MIN.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testArkTSUtilsAtomicsSupplementMultihopTransfer004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const buffer: collections.ArrayBuffer = new collections.ArrayBuffer(BUFFER_BYTES);
        const array: collections.Int32Array = new collections.Int32Array(buffer);
        const report: collections.Int32Array = new collections.Int32Array(HOP_REPORT_LENGTH);
        ArkTSUtils.Atomics.store(array, TASK_INDEX, SENTINEL_VALUE);
        await taskpool.execute(multiHop1Task, buffer, array, report);
        expect(ArkTSUtils.Atomics.load(report, HOP1_BUFFER_BYTELENGTH)).assertEqual(BUFFER_BYTES);
        expect(ArkTSUtils.Atomics.load(report, HOP1_ARRAY_BYTELENGTH)).assertEqual(BUFFER_BYTES);
        expect(ArkTSUtils.Atomics.load(report, HOP1_SUBARRAY_VALUE)).assertEqual(SENTINEL_VALUE);
        expect(ArkTSUtils.Atomics.load(report, HOP1_INDEX_VALUE)).assertEqual(SENTINEL_VALUE);
        expect(ArkTSUtils.Atomics.load(report, HOP2_BUFFER_BYTELENGTH)).assertEqual(BUFFER_BYTES);
        expect(ArkTSUtils.Atomics.load(report, HOP2_ARRAY_BYTELENGTH)).assertEqual(BUFFER_BYTES);
        expect(ArkTSUtils.Atomics.load(report, HOP2_ADD_RETURN)).assertEqual(INT32_MAX);
        expect(ArkTSUtils.Atomics.load(report, HOP2_FINAL_LOAD)).assertEqual(INT32_MIN);
        expect(ArkTSUtils.Atomics.load(report, HOP2_SUBARRAY_VALUE)).assertEqual(INT32_MIN);
        expect(ArkTSUtils.Atomics.load(report, HOP2_INDEX_VALUE)).assertEqual(INT32_MIN);
        expect(ArkTSUtils.Atomics.load(array, TASK_INDEX)).assertEqual(INT32_MIN);
        done();
      });

    /**
     * @tc.name   testArkTSUtilsAtomicsSupplementNoSavedWakeup005
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUPPLEMENT_NOSAVEDWAKEUP_0500
     * @tc.desc   A notify with no waiters returns 0 and leaves no saved wakeup; a subsequent taskpool wait on matching value with short timeout must time out.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testArkTSUtilsAtomicsSupplementNoSavedWakeup005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const array: collections.Int32Array = new collections.Int32Array(1);
        ArkTSUtils.Atomics.store(array, TASK_INDEX, 0);
        const notified: number = ArkTSUtils.Atomics.notify(array, TASK_INDEX, 1);
        expect(notified).assertEqual(0);
        const waitTask: Promise<Object> = taskpool.execute(noSavedWakeupWaitTask, array);
        const result: string = (await waitTask) as string;
        expect(result).assertEqual('timed-out');
        done();
      });

    /**
     * @tc.name   testArkTSUtilsAtomicsSupplementAtomicVsNonatomic006
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUPPLEMENT_ATOMIC_VS_NONATOMIC_0600
     * @tc.desc   Two taskpool tasks each perform 200 increments: atomic add gives exactly 400 with all return values unique (0..399), while non-atomic load+store may lose updates and yields at most 400.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testArkTSUtilsAtomicsSupplementAtomicVsNonatomic006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const atomicArray: collections.Int32Array = new collections.Int32Array(1);
        const nonAtomicArray: collections.Int32Array = new collections.Int32Array(1);
        const total: number = NONATOMIC_TASK_COUNT * NONATOMIC_ITERATIONS;
        const atomicResults: collections.Int32Array = new collections.Int32Array(total);
        ArkTSUtils.Atomics.store(atomicArray, TASK_INDEX, 0);
        ArkTSUtils.Atomics.store(nonAtomicArray, TASK_INDEX, 0);
        const atomicTasks: Promise<Object>[] = [];
        for (let w: number = 0; w < NONATOMIC_TASK_COUNT; w++) {
          atomicTasks.push(taskpool.execute(atomicIncrementRecordTask, atomicArray, atomicResults,
            w * NONATOMIC_ITERATIONS, NONATOMIC_ITERATIONS));
        }
        const nonAtomicTasks: Promise<Object>[] = [
          taskpool.execute(nonAtomicIncrementTask, nonAtomicArray, NONATOMIC_ITERATIONS),
          taskpool.execute(nonAtomicIncrementTask, nonAtomicArray, NONATOMIC_ITERATIONS)
        ];
        await Promise.all(atomicTasks);
        await Promise.all(nonAtomicTasks);
        const atomicFinal: number = ArkTSUtils.Atomics.load(atomicArray, TASK_INDEX);
        const nonAtomicFinal: number = ArkTSUtils.Atomics.load(nonAtomicArray, TASK_INDEX);
        expect(atomicFinal).assertEqual(total);
        expect(nonAtomicFinal <= total).assertTrue();
        const returnSet: Set<number> = new Set<number>();
        for (let k: number = 0; k < total; k++) {
          const previous: number = ArkTSUtils.Atomics.load(atomicResults, k);
          expect(previous >= 0 && previous < total).assertTrue();
          returnSet.add(previous);
        }
        expect(returnSet.size).assertEqual(total);
        done();
      });

    /**
     * @tc.name   testArkTSUtilsAtomicsSupplementMainThreadWaitNonblocking007
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUPPLEMENT_MAIN_WAIT_NONBLOCK_0700
     * @tc.desc   Pre-notify with no waiters returns 0 and leaves no saved wakeup; subsequent main-thread wait on matching value with short timeout must time out (spec: 通知只作用于当前已进入等待的线程，不会为后续wait调用保留)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testArkTSUtilsAtomicsSupplementMainThreadWaitNonblocking007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const array: collections.Int32Array = new collections.Int32Array(1);
        ArkTSUtils.Atomics.store(array, TASK_INDEX, 0);
        const notifyResult: number = ArkTSUtils.Atomics.notify(array, TASK_INDEX, 1);
        expect(notifyResult).assertEqual(0);
        const mainResult: string = ArkTSUtils.Atomics.wait(array, TASK_INDEX, 0, WAIT_SHORT_TIMEOUT_MS);
        expect(mainResult).assertEqual('timed-out');
        done();
      });

    // ===== Group O: Error code verification (from ArkTSUtilsAtomicsSupplementTest.test.ets) =====

    /**
     * @tc.name   testArkTSUtilsAtomicsSupplementErrorCodeOutOfRange008
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUPPLEMENT_ERR_OUT_OF_RANGE_0800
     * @tc.desc   verify out-of-range index throws BusinessError 10200001 for all 9 RMW operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testArkTSUtilsAtomicsSupplementErrorCodeOutOfRange008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        const array: collections.Int32Array = new collections.Int32Array(new collections.ArrayBuffer(8));
        const methods: Array<(arr: collections.Int32Array, idx: number) => number> = [
          (arr, idx): number => ArkTSUtils.Atomics.add(arr, idx, 1),
          (arr, idx): number => ArkTSUtils.Atomics.and(arr, idx, 1),
          (arr, idx): number => ArkTSUtils.Atomics.or(arr, idx, 1),
          (arr, idx): number => ArkTSUtils.Atomics.xor(arr, idx, 1),
          (arr, idx): number => ArkTSUtils.Atomics.sub(arr, idx, 1),
          (arr, idx): number => ArkTSUtils.Atomics.exchange(arr, idx, 1),
          (arr, idx): number => ArkTSUtils.Atomics.load(arr, idx),
          (arr, idx): number => ArkTSUtils.Atomics.store(arr, idx, 1),
          (arr, idx): number => ArkTSUtils.Atomics.compareExchange(arr, idx, 0, 1),
        ];
        for (let i: number = 0; i < methods.length; i++) {
          let didThrow1 = false;
          try {
            methods[i](array, -1);
          } catch (error) {
            didThrow1 = true;
            expect((error as BusinessError).code).assertEqual(10200001);
          }
          expect(didThrow1).assertTrue();
          let didThrow2 = false;
          try {
            methods[i](array, array.length);
          } catch (error) {
            didThrow2 = true;
            expect((error as BusinessError).code).assertEqual(10200001);
          }
          expect(didThrow2).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   testArkTSUtilsAtomicsSupplementErrorCodeWaitNotifyOutOfRange009
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUPPLEMENT_ERR_WN_OOR_0900
     * @tc.desc   verify wait/notify out-of-range index throws BusinessError 10200001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testArkTSUtilsAtomicsSupplementErrorCodeWaitNotifyOutOfRange009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        const array: collections.Int32Array = new collections.Int32Array(new collections.ArrayBuffer(8));
        let didThrow = false;
        try {
          ArkTSUtils.Atomics.wait(array, -1, 0, 0);
        } catch (error) {
          didThrow = true;
          expect((error as BusinessError).code).assertEqual(10200001);
        }
        expect(didThrow).assertTrue();
        didThrow = false;
        try {
          ArkTSUtils.Atomics.wait(array, array.length, 0, 0);
        } catch (error) {
          didThrow = true;
          expect((error as BusinessError).code).assertEqual(10200001);
        }
        expect(didThrow).assertTrue();
        didThrow = false;
        try {
          ArkTSUtils.Atomics.notify(array, -1, 1);
        } catch (error) {
          didThrow = true;
          expect((error as BusinessError).code).assertEqual(10200001);
        }
        expect(didThrow).assertTrue();
        didThrow = false;
        try {
          ArkTSUtils.Atomics.notify(array, array.length, 1);
        } catch (error) {
          didThrow = true;
          expect((error as BusinessError).code).assertEqual(10200001);
        }
        expect(didThrow).assertTrue();
        done();
      });

    /**
     * @tc.name   testArkTSUtilsAtomicsSupplementErrorCodeWrongType010
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUPPLEMENT_ERR_WRONG_TYPE_1000
     * @tc.desc   verify Float32Array/Uint8ClampedArray throws BusinessError 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testArkTSUtilsAtomicsSupplementErrorCodeWrongType010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        const float32Array: collections.Float32Array = new collections.Float32Array(new collections.ArrayBuffer(8));
        const clampedArray: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(new collections.ArrayBuffer(8));
        const wrongArrays: Object[] = [float32Array, clampedArray];
        for (let i: number = 0; i < wrongArrays.length; i++) {
          const arr = wrongArrays[i] as collections.Int32Array;
          let didThrow = false;
          try {
            ArkTSUtils.Atomics.add(arr, 0, 1);
          } catch (error) {
            didThrow = true;
            expect((error as BusinessError).code).assertEqual(401);
          }
          expect(didThrow).assertTrue();
          didThrow = false;
          try {
            ArkTSUtils.Atomics.load(arr, 0);
          } catch (error) {
            didThrow = true;
            expect((error as BusinessError).code).assertEqual(401);
          }
          expect(didThrow).assertTrue();
          didThrow = false;
          try {
            ArkTSUtils.Atomics.store(arr, 0, 1);
          } catch (error) {
            didThrow = true;
            expect((error as BusinessError).code).assertEqual(401);
          }
          expect(didThrow).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   testArkTSUtilsAtomicsSupplementErrorCodeWaitNotifyWrongType011
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUPPLEMENT_ERR_WN_WRONG_TYPE_1100
     * @tc.desc   verify wait/notify on non-Int32Array types throws BusinessError 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testArkTSUtilsAtomicsSupplementErrorCodeWaitNotifyWrongType011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        const int8Array: collections.Int8Array = new collections.Int8Array(new collections.ArrayBuffer(4));
        const uint8Array: collections.Uint8Array = new collections.Uint8Array(new collections.ArrayBuffer(4));
        const int16Array: collections.Int16Array = new collections.Int16Array(new collections.ArrayBuffer(4));
        const uint16Array: collections.Uint16Array = new collections.Uint16Array(new collections.ArrayBuffer(4));
        const uint32Array: collections.Uint32Array = new collections.Uint32Array(new collections.ArrayBuffer(4));
        const wrongArrays: Object[] = [int8Array, uint8Array, int16Array, uint16Array, uint32Array];
        for (let i: number = 0; i < wrongArrays.length; i++) {
          const arr = wrongArrays[i] as collections.Int32Array;
          let didThrow = false;
          try {
            ArkTSUtils.Atomics.wait(arr, 0, 0, 0);
          } catch (error) {
            didThrow = true;
            expect((error as BusinessError).code).assertEqual(401);
          }
          expect(didThrow).assertTrue();
          didThrow = false;
          try {
            ArkTSUtils.Atomics.notify(arr, 0, 1);
          } catch (error) {
            didThrow = true;
            expect((error as BusinessError).code).assertEqual(401);
          }
          expect(didThrow).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   testArkTSUtilsAtomicsSupplementErrorCodeNullUndefined012
     * @tc.number SUB_ARKTSUTILS_ATOMICS_SUPPLEMENT_ERR_NULL_UNDEF_1200
     * @tc.desc   verify null/undefined as typedArray parameter throws BusinessError 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testArkTSUtilsAtomicsSupplementErrorCodeNullUndefined012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        const nullArr: collections.Int32Array = null as ESObject as collections.Int32Array;
        const undefArr: collections.Int32Array = undefined as ESObject as collections.Int32Array;
        const wrongValues: collections.Int32Array[] = [nullArr, undefArr];
        for (let i: number = 0; i < wrongValues.length; i++) {
          let didThrow = false;
          try {
            ArkTSUtils.Atomics.add(wrongValues[i], 0, 1);
          } catch (error) {
            didThrow = true;
            expect((error as BusinessError).code).assertEqual(401);
          }
          expect(didThrow).assertTrue();
          didThrow = false;
          try {
            ArkTSUtils.Atomics.wait(wrongValues[i], 0, 0, 0);
          } catch (error) {
            didThrow = true;
            expect((error as BusinessError).code).assertEqual(401);
          }
          expect(didThrow).assertTrue();
          didThrow = false;
          try {
            ArkTSUtils.Atomics.notify(wrongValues[i], 0, 1);
          } catch (error) {
            didThrow = true;
            expect((error as BusinessError).code).assertEqual(401);
          }
          expect(didThrow).assertTrue();
        }
        done();
      });
  });
}
