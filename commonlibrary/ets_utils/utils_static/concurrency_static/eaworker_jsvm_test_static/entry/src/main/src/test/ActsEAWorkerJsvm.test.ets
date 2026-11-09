'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  describe,
  expect,
  it,
  TestType,
  Level,
  Size
} from "@ohos/hypium-static/src/main/indexStatic";

class JsvmStackLimitNative {
  native createAndCompile(): int;
  native createSetThenCompile(): int;
  native setLimitAndRunAdd(): int;
  native runAdd(a: int, b: int): int;
  native roundTrip(): int;
  native loopSetRestore(index: int): int;
  native getLimitValid(): int;
  native getLimitTimesEqual(times: int): int;
  native getThenCompileGetEqual(): int;
  native setNullVm(): int;
  native setZeroLimit(): int;
  native getNullVm(): int;
  native sameStackSetRunRestore(): int;
  native sameStackRunNoSet(): int;
  native destroyVm(): int;
}

class SetupResult {
  code: int = -1;
}

function waitStarted(worker: EAWorker, setup: SetupResult): void {
  worker.start();
  const readyJob = worker.run<int>(() => {
    return setup.code;
  });
  readyJob.Await();
}

function startCompiledWorker(jsvm: JsvmStackLimitNative, setup: SetupResult): EAWorker {
  const worker = new EAWorker('JsvmStackLimit', () => {
    setup.code = jsvm.createAndCompile();
  });
  waitStarted(worker, setup);
  return worker;
}

function cleanupWorker(jsvm: JsvmStackLimitNative, worker: EAWorker): void {
  try {
    const destroyJob = worker.run<int>(() => {
      return jsvm.destroyVm();
    });
    destroyJob.Await();
  } catch (e) {
    let err = e as Error;
    console.warn(`destroyVm error: ${err.message}`);
  }
  try {
    worker.join().Await();
  } catch (e) {
    let err = e as Error;
    console.warn(`join error: ${err.message}`);
  }
}

export default function EAWorkerJsvmTest(): void {
  describe('ActsEAWorkerJsvmTest', (): void => {
    try {
      loadLibrary('entry');
    } catch (e) {
      let err = e as Error;
      console.log('loadFailed', err.message);
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWORKER_JSVM_SETSTACKLIMIT_0100
     * @tc.name testSetStackLimitOnEAWorkerRun001
     * @tc.desc 异栈 start 编译 + run 开头 Set 栈边界后执行已编译 JS add(1,2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSetStackLimitOnEAWorkerRun001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'testSetStackLimitOnEAWorkerRun001';
        console.info(`${TAG} test start`);
        let jsvm = new JsvmStackLimitNative();
        let setup = new SetupResult();
        const worker = startCompiledWorker(jsvm, setup);
        try {
          expect(setup.code).assertEqual(0);
          const job = worker.run<int>(() => {
            return jsvm.setLimitAndRunAdd();
          });
          const result = await job.Await();
          expect(result).assertEqual(3);
        } catch (e) {
          let err = e as Error;
          console.info(`${TAG} catch error: ${err.message}`);
          expect(false).assertFail();
        } finally {
          cleanupWorker(jsvm, worker);
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWORKER_JSVM_SETSTACKLIMIT_0200
     * @tc.name testSetNullVm002
     * @tc.desc 传入空 vm 指针调用 Set → 失败但不崩溃
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetNullVm002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let jsvm = new JsvmStackLimitNative();
      let ret = jsvm.setNullVm();
      expect(ret != 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWORKER_JSVM_SETSTACKLIMIT_0300
     * @tc.name testSetZeroLimit003
     * @tc.desc 传入 0 作为栈边界地址 → 失败但不崩溃
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetZeroLimit003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let jsvm = new JsvmStackLimitNative();
      let setup = new SetupResult();
      const worker = new EAWorker('JsvmStackLimit', () => {
        if (jsvm.createAndCompile() != 0) {
          setup.code = -1;
        } else {
          setup.code = jsvm.setZeroLimit();
          jsvm.destroyVm();
        }
      });
      try {
        waitStarted(worker, setup);
        expect(setup.code != 0).assertTrue();
      } finally {
        cleanupWorker(jsvm, worker);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWORKER_JSVM_SETSTACKLIMIT_0400
     * @tc.name testSameStackSetThenRun004
     * @tc.desc 同栈现编现跑 + Set 栈边界 → add(1,2)==3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSameStackSetThenRun004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let jsvm = new JsvmStackLimitNative();
      let setup = new SetupResult();
      const worker = new EAWorker('JsvmStackLimit', () => {
        setup.code = jsvm.sameStackSetRunRestore();
      });
      try {
        waitStarted(worker, setup);
        expect(setup.code).assertEqual(3);
      } finally {
        cleanupWorker(jsvm, worker);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWORKER_JSVM_SETSTACKLIMIT_0500
     * @tc.name testSetRestoreLoop005
     * @tc.desc 100 次 run：每次 Set 新边界→add(i,i)→恢复 originalLimit→Get 与 saved 一致
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetRestoreLoop005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'testSetRestoreLoop005';
        console.info(`${TAG} test start`);
        let jsvm = new JsvmStackLimitNative();
        let setup = new SetupResult();
        const worker = startCompiledWorker(jsvm, setup);
        try {
          expect(setup.code).assertEqual(0);
          for (let i = 0; i < 100; i++) {
            let index = i;
            const job = worker.run<int>(() => {
              return jsvm.loopSetRestore(index);
            });
            const result = await job.Await();
            expect(result).assertEqual(0);
          }
        } catch (e) {
          let err = e as Error;
          console.info(`${TAG} catch error: ${err.message}`);
          expect(false).assertFail();
        } finally {
          cleanupWorker(jsvm, worker);
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWORKER_JSVM_GETSTACKLIMIT_0100
     * @tc.name testGetSetRestoreRoundTrip001
     * @tc.desc Get→Set→调用→Set恢复→往返一致性
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testGetSetRestoreRoundTrip001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'testGetSetRestoreRoundTrip001';
        console.info(`${TAG} test start`);
        let jsvm = new JsvmStackLimitNative();
        let setup = new SetupResult();
        const worker = startCompiledWorker(jsvm, setup);
        try {
          expect(setup.code).assertEqual(0);
          const job = worker.run<int>(() => {
            return jsvm.roundTrip();
          });
          const result = await job.Await();
          expect(result).assertEqual(0);
        } catch (e) {
          let err = e as Error;
          console.info(`${TAG} catch error: ${err.message}`);
          expect(false).assertFail();
        } finally {
          cleanupWorker(jsvm, worker);
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWORKER_JSVM_GETSTACKLIMIT_0200
     * @tc.name testGetNullVm002
     * @tc.desc 传入空 vm 指针调用 Get → 失败但不崩溃
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testGetNullVm002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let jsvm = new JsvmStackLimitNative();
      expect(jsvm.getNullVm() != 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWORKER_JSVM_GETSTACKLIMIT_0300
     * @tc.name testGetLimitRange003
     * @tc.desc Get 返回值在合理栈地址范围内
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testGetLimitRange003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let jsvm = new JsvmStackLimitNative();
      let setup = new SetupResult();
      const worker = new EAWorker('JsvmStackLimit', () => {
        if (jsvm.createAndCompile() != 0) {
          setup.code = -1;
        } else {
          setup.code = jsvm.getLimitValid();
          jsvm.destroyVm();
        }
      });
      try {
        waitStarted(worker, setup);
        expect(setup.code).assertEqual(0);
      } finally {
        cleanupWorker(jsvm, worker);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWORKER_JSVM_GETSTACKLIMIT_0400
     * @tc.name testGetSameVmRepeated004
     * @tc.desc 多次 Get 同一 VM → 返回值一致
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetSameVmRepeated004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let jsvm = new JsvmStackLimitNative();
      let setup = new SetupResult();
      const worker = new EAWorker('JsvmStackLimit', () => {
        if (jsvm.createAndCompile() != 0) {
          setup.code = -1;
        } else {
          setup.code = jsvm.getLimitTimesEqual(10);
          jsvm.destroyVm();
        }
      });
      try {
        waitStarted(worker, setup);
        expect(setup.code).assertEqual(0);
      } finally {
        cleanupWorker(jsvm, worker);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWORKER_JSVM_GETSTACKLIMIT_0500
     * @tc.name testGetAfterCreateThenCompile005
     * @tc.desc 新建 VM 后立即 Get，编译后 Get 不变
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetAfterCreateThenCompile005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let jsvm = new JsvmStackLimitNative();
      let setup = new SetupResult();
      const worker = new EAWorker('JsvmStackLimit', () => {
        setup.code = jsvm.getThenCompileGetEqual();
        jsvm.destroyVm();
      });
      try {
        waitStarted(worker, setup);
        expect(setup.code).assertEqual(0);
      } finally {
        cleanupWorker(jsvm, worker);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWORKER_JSVM_BASELINE_0100
     * @tc.name testSameStackNoSet001
     * @tc.desc 同栈不设栈边界 → add(1,2)==3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSameStackNoSet001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let jsvm = new JsvmStackLimitNative();
      let setup = new SetupResult();
      const worker = new EAWorker('JsvmStackLimit', () => {
        setup.code = jsvm.sameStackRunNoSet();
      });
      try {
        waitStarted(worker, setup);
        expect(setup.code).assertEqual(3);
      } finally {
        cleanupWorker(jsvm, worker);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWORKER_JSVM_MAINTHREAD_0100
     * @tc.name testMainThreadPromiseRun001
     * @tc.desc 主线程建 VM：it 协程上先 Set 再编译，Promise 回调里再 Set 后执行 add(1,2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMainThreadPromiseRun001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'testMainThreadPromiseRun001';
        console.info(`${TAG} test start`);
        let jsvm = new JsvmStackLimitNative();
        try {
          expect(jsvm.createSetThenCompile()).assertEqual(0);
          const result = await new Promise<int>((resolve, reject) => {
            Promise.resolve().then(() => {
              resolve(jsvm.setLimitAndRunAdd());
            }, (err: Error) => {
              reject(err);
            });
          });
          expect(result).assertEqual(3);
        } catch (e) {
          let err = e as Error;
          console.info(`${TAG} catch error: ${err.message}`);
          expect(false).assertFail();
        } finally {
          jsvm.destroyVm();
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWORKER_JSVM_MAINTHREAD_0200
     * @tc.name testMainThreadSetTimeoutRun002
     * @tc.desc 主线程建 VM：it 协程上先 Set 再编译，setTimeout 回调里再 Set 后执行 add(1,2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMainThreadSetTimeoutRun002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'testMainThreadSetTimeoutRun002';
        console.info(`${TAG} test start`);
        let jsvm = new JsvmStackLimitNative();
        try {
          expect(jsvm.createSetThenCompile()).assertEqual(0);
          const result = await new Promise<int>((resolve, reject) => {
            setTimeout(() => {
              try {
                resolve(jsvm.setLimitAndRunAdd());
              } catch (err) {
                reject(err);
              }
            }, 0);
          });
          expect(result).assertEqual(3);
        } catch (e) {
          let err = e as Error;
          console.info(`${TAG} catch error: ${err.message}`);
          expect(false).assertFail();
        } finally {
          jsvm.destroyVm();
          console.info(`${TAG} test end`);
          done();
        }
      });
  });
}
