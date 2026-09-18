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
  describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level
} from '../../../hypium/index';

const NESTED_ERROR = 'EAWorker:: nested exclusiveScope is not allowed';
const WORKER_CONTEXT_ERROR = 'EAWorker:: exclusiveScope can only be called in EAWorker';
const NON_INTEROP_ERROR = 'EAWorker:: exclusiveScope requires an EAWorker created with needInterop=true';
const TASKPOOL_ERROR = 'EAWorker:: exclusiveScope is not supported in taskpool workers';
const SHUTDOWN_ERROR = 'EAWorker:: exclusiveScope cannot be started while the worker is shutting down';

class ExclusiveScopePayload {
  public value: int;
  public label: string;

  public constructor(value: int, label: string) {
    this.value = value;
    this.label = label;
  }
}

class ExclusiveScopeCustomError extends Error {}

function startReadyInteropWorker(name: string): EAWorker {
  let eaWorker = new EAWorker(name, true);
  eaWorker.start();
  // If the first task was pending, it may run inline while initialization finishes.
  // The second task is admitted normally and cannot complete before OS-stack work is ready.
  eaWorker.run<void>(() => {}).Await();
  eaWorker.run<void>(() => {}).Await();
  return eaWorker;
}

function callExclusiveScopeFromTaskpool(): boolean {
  expect((): void => {
    EAWorker.exclusiveScope<int>(() => 1);
  }).assertThrowError('RuntimeError', TASKPOOL_ERROR);
  return true;
}

export default function EAWorkerExclusiveScopeTest(): void {
  describe('EAWorkerExclusiveScopeTest', (): void => {
    beforeAll((): void => {});
    beforeEach((): void => {});
    afterEach((): void => {});
    afterAll((): void => {});

    /**
     * @tc.name   EAWorkerExclusiveScopeTest0100
     * @tc.number SUB_BUILTINS_EAWORKER_EXCLUSIVE_SCOPE_TEST_0100
     * @tc.desc   Verify exclusiveScope can execute from an EAWorker initial task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('EAWorkerExclusiveScopeTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let completion = new CompletableJob<int>();
      let eaWorker = new EAWorker('exclusiveScopeInitialTask', (): void => {
        try {
          completion.finish(EAWorker.exclusiveScope<int>(() => 42));
        } catch (error) {
          completion.fail(error);
        }
      }, true);
      eaWorker.start();
      try {
        expect(completion.Await()).assertEqual(42);
      } finally {
        eaWorker.join().Await();
      }
    });

    /**
     * @tc.name   EAWorkerExclusiveScopeTest0200
     * @tc.number SUB_BUILTINS_EAWORKER_EXCLUSIVE_SCOPE_TEST_0200
     * @tc.desc   Verify exclusiveScope propagates return types and supports serial calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('EAWorkerExclusiveScopeTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let eaWorker = startReadyInteropWorker('exclusiveScopeReturnTypes');
      let job = eaWorker.run<int>((): int => {
        let text = EAWorker.exclusiveScope<string>(() => 'exclusive-string');
        expect(text).assertEqual('exclusive-string');

        let payload = EAWorker.exclusiveScope<ExclusiveScopePayload>(
          () => new ExclusiveScopePayload(42, 'exclusive-object'));
        expect(payload.value).assertEqual(42);
        expect(payload.label).assertEqual('exclusive-object');

        let boxed = EAWorker.exclusiveScope<Object>(() => 17);
        expect(boxed as int).assertEqual(17);

        let nullable = EAWorker.exclusiveScope<ExclusiveScopePayload | null>(() => null);
        expect(nullable).assertNull();

        let sideEffect = new AtomicInt(0);
        EAWorker.exclusiveScope<void>((): void => { sideEffect.store(9); });
        expect(sideEffect.load()).assertEqual(9);

        let sum = 0;
        for (let i = 1; i <= 20; ++i) {
          sum += EAWorker.exclusiveScope<int>(() => i);
        }
        expect(sum).assertEqual(210);
        return payload.value;
      });
      try {
        expect(job.Await()).assertEqual(42);
      } finally {
        eaWorker.join().Await();
      }
    });

    /**
     * @tc.name   EAWorkerExclusiveScopeTest0300
     * @tc.number SUB_BUILTINS_EAWORKER_EXCLUSIVE_SCOPE_TEST_0300
     * @tc.desc   Verify callback exception identity and worker state recovery
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('EAWorkerExclusiveScopeTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let eaWorker = startReadyInteropWorker('exclusiveScopeException');
      let job = eaWorker.run<int>((): int => {
        let expected = new ExclusiveScopeCustomError();
        let sameError = false;
        try {
          EAWorker.exclusiveScope<void>(() => { throw expected; });
        } catch (error) {
          sameError = error === expected;
        }
        expect(sameError).assertTrue();
        return EAWorker.exclusiveScope<int>(() => 99);
      });
      try {
        expect(job.Await()).assertEqual(99);
      } finally {
        eaWorker.join().Await();
      }
    });

    /**
     * @tc.name   EAWorkerExclusiveScopeTest0400
     * @tc.number SUB_BUILTINS_EAWORKER_EXCLUSIVE_SCOPE_TEST_0400
     * @tc.desc   Verify nested exclusiveScope is rejected and the following call succeeds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('EAWorkerExclusiveScopeTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let eaWorker = startReadyInteropWorker('exclusiveScopeNested');
      let job = eaWorker.run<int>((): int => {
        EAWorker.exclusiveScope<void>((): void => {
          expect((): void => {
            EAWorker.exclusiveScope<void>(() => {});
          }).assertThrowError('RuntimeError', NESTED_ERROR);
        });
        return EAWorker.exclusiveScope<int>(() => 73);
      });
      try {
        expect(job.Await()).assertEqual(73);
      } finally {
        eaWorker.join().Await();
      }
    });

    /**
     * @tc.name   EAWorkerExclusiveScopeTest0500
     * @tc.number SUB_BUILTINS_EAWORKER_EXCLUSIVE_SCOPE_TEST_0500
     * @tc.desc   Verify exclusiveScope is rejected outside an EAWorker
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('EAWorkerExclusiveScopeTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect((): void => {
        EAWorker.exclusiveScope<int>(() => 1);
      }).assertThrowError('RuntimeError', WORKER_CONTEXT_ERROR);
    });

    /**
     * @tc.name   EAWorkerExclusiveScopeTest0600
     * @tc.number SUB_BUILTINS_EAWORKER_EXCLUSIVE_SCOPE_TEST_0600
     * @tc.desc   Verify exclusiveScope is rejected by an EAWorker without interop support
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('EAWorkerExclusiveScopeTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let eaWorker = new EAWorker('exclusiveScopeNoInterop', false);
      eaWorker.start();
      let job = eaWorker.run<void>((): void => {
        expect((): void => {
          EAWorker.exclusiveScope<int>(() => 1);
        }).assertThrowError('RuntimeError', NON_INTEROP_ERROR);
      });
      try {
        job.Await();
      } finally {
        eaWorker.join().Await();
      }
    });

    /**
     * @tc.name   EAWorkerExclusiveScopeTest0700
     * @tc.number SUB_BUILTINS_EAWORKER_EXCLUSIVE_SCOPE_TEST_0700
     * @tc.desc   Verify coroutine switching is rejected while an exclusiveScope callback is active
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('EAWorkerExclusiveScopeTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        let eaWorker = startReadyInteropWorker('exclusiveScopeNoSwitch');
        let job = eaWorker.run<void>((): void => {
          expect((): void => {
            EAWorker.exclusiveScope<void>(() => { launch<int>(() => 1); });
          }).assertThrowError('InvalidJobOperationError');
          expect(EAWorker.exclusiveScope<int>(() => 73)).assertEqual(73);

          let completed = new CompletableJob<int>();
          completed.finish(1);
          expect((): void => {
            EAWorker.exclusiveScope<void>(() => { completed.Await(); });
          }).assertThrowError('InvalidJobOperationError');
          expect(EAWorker.exclusiveScope<int>(() => 73)).assertEqual(73);

          expect((): void => {
            EAWorker.exclusiveScope<void>(() => {
              waitForCompletion<int>(() => Promise.resolve<int>(1));
            });
          }).assertThrowError('InvalidJobOperationError');
          expect(EAWorker.exclusiveScope<int>(() => 73)).assertEqual(73);

          expect((): void => {
            EAWorker.exclusiveScope<void>(() => { setTimeout(() => {}, 1); });
          }).assertThrowError('InvalidJobOperationError');
          expect(EAWorker.exclusiveScope<int>(() => 73)).assertEqual(73);

          expect((): void => {
            EAWorker.exclusiveScope<void>(() => { Coroutine.Schedule(); });
          }).assertThrowError('InvalidJobOperationError');
          expect(EAWorker.exclusiveScope<int>(() => 73)).assertEqual(73);
        });
        try {
          job.Await();
        } finally {
          try {
            eaWorker.join().Await();
          } finally {
            done();
          }
        }
      });

    /**
     * @tc.name   EAWorkerExclusiveScopeTest0800
     * @tc.number SUB_BUILTINS_EAWORKER_EXCLUSIVE_SCOPE_TEST_0800
     * @tc.desc   Verify multiple requester coroutines execute exclusiveScope callbacks in FIFO order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('EAWorkerExclusiveScopeTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const requesterCount = 8;
      let eaWorker = startReadyInteropWorker('exclusiveScopeFifo');
      let submitted = new AtomicInt(0);
      let executed = new AtomicInt(0);
      let jobs: Job<int>[] = [];
      for (let i = 0; i < requesterCount; ++i) {
        jobs.push(eaWorker.run<int>((): int => {
          let ticket = submitted.fetchAdd(1);
          return EAWorker.exclusiveScope<int>((): int => {
            let position = executed.fetchAdd(1);
            return ticket == position ? ticket : -1;
          });
        }));
      }

      try {
        let seen: boolean[] = [];
        for (let i = 0; i < requesterCount; ++i) {
          seen.push(false);
        }
        for (let job of jobs) {
          let result = job.Await();
          expect(result >= 0 && result < requesterCount).assertTrue();
          expect(seen[result]).assertFalse();
          seen[result] = true;
        }
        expect(executed.load()).assertEqual(requesterCount);
      } finally {
        eaWorker.join().Await();
      }
    });

    /**
     * @tc.name   EAWorkerExclusiveScopeTest0900
     * @tc.number SUB_BUILTINS_EAWORKER_EXCLUSIVE_SCOPE_TEST_0900
     * @tc.desc   Verify exclusiveScope is rejected from a general worker
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('EAWorkerExclusiveScopeTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let job = launch<void>((): void => {
        expect((): void => {
          EAWorker.exclusiveScope<int>(() => 1);
        }).assertThrowError('RuntimeError', WORKER_CONTEXT_ERROR);
      });
      job.Await();
    });

    /**
     * @tc.name   EAWorkerExclusiveScopeTest1000
     * @tc.number SUB_BUILTINS_EAWORKER_EXCLUSIVE_SCOPE_TEST_1000
     * @tc.desc   Verify exclusiveScope is rejected from a taskpool worker
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('EAWorkerExclusiveScopeTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rejected = waitForCompletion<Any>(() => taskpool.execute(callExclusiveScopeFromTaskpool)) as boolean;
      expect(rejected).assertTrue();
    });

    /**
     * @tc.name   EAWorkerExclusiveScopeTest1100
     * @tc.number SUB_BUILTINS_EAWORKER_EXCLUSIVE_SCOPE_TEST_1100
     * @tc.desc   Verify shutdown drains an accepted exclusiveScope callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('EAWorkerExclusiveScopeTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let eaWorker = startReadyInteropWorker('exclusiveScopeShutdownDrain');
      let callbackStarted = new CompletableJob<void>();
      let releaseCallback = new AtomicInt(0);
      let acceptedJob = eaWorker.run<int>((): int => {
        return EAWorker.exclusiveScope<int>((): int => {
          callbackStarted.finish();
          while (releaseCallback.load() == 0) {
            // Keep the accepted callback on the executor OS stack until join starts.
          }
          return 42;
        });
      });
      callbackStarted.Await();
      let joinJob = eaWorker.join();
      releaseCallback.store(1);
      try {
        expect(acceptedJob.Await()).assertEqual(42);
      } finally {
        joinJob.Await();
      }
    });

    /**
     * @tc.name   EAWorkerExclusiveScopeTest1200
     * @tc.number SUB_BUILTINS_EAWORKER_EXCLUSIVE_SCOPE_TEST_1200
     * @tc.desc   Verify exclusiveScope rejects a request submitted after shutdown starts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('EAWorkerExclusiveScopeTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let eaWorker = startReadyInteropWorker('exclusiveScopePostClose');
      let requesterEntered = new CompletableJob<void>();
      let requesterGate = new CompletableJob<void>();
      let rejectedJob = eaWorker.run<void>((): void => {
        requesterEntered.finish();
        requesterGate.Await();
        expect((): void => {
          EAWorker.exclusiveScope<int>(() => 1);
        }).assertThrowError('RuntimeError', SHUTDOWN_ERROR);
      });
      requesterEntered.Await();
      let joinJob = eaWorker.join();
      requesterGate.finish();
      try {
        rejectedJob.Await();
      } finally {
        joinJob.Await();
      }
    });

    /**
     * @tc.name   EAWorkerExclusiveScopeTest1300
     * @tc.number SUB_BUILTINS_EAWORKER_EXCLUSIVE_SCOPE_TEST_1300
     * @tc.desc   Verify callback captures and returned objects remain valid across GC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('EAWorkerExclusiveScopeTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let eaWorker = startReadyInteropWorker('exclusiveScopeGcRoots');
      let job = eaWorker.run<ExclusiveScopePayload>((): ExclusiveScopePayload => {
        let captured = new ExclusiveScopePayload(41, 'captured-root');
        return EAWorker.exclusiveScope<ExclusiveScopePayload>((): ExclusiveScopePayload => {
          let garbage: ExclusiveScopePayload[] = [];
          for (let i = 0; i < 20000; ++i) {
            garbage.push(new ExclusiveScopePayload(i, 'garbage-' + i));
          }
          expect(garbage.length).assertEqual(20000);
          GC.startGC(GC.Cause.FULL, GC.IN_PLACE_MODE);
          expect(captured.value).assertEqual(41);
          expect(captured.label).assertEqual('captured-root');
          return new ExclusiveScopePayload(captured.value + 1, 'result-root');
        });
      });
      try {
        let result = job.Await();
        GC.startGC(GC.Cause.FULL, GC.IN_PLACE_MODE);
        expect(result.value).assertEqual(42);
        expect(result.label).assertEqual('result-root');
      } finally {
        eaWorker.join().Await();
      }
    });

    /**
     * @tc.name   EAWorkerExclusiveScopeTest1400
     * @tc.number SUB_BUILTINS_EAWORKER_EXCLUSIVE_SCOPE_TEST_1400
     * @tc.desc   Verify repeated return and exception state cleanup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('EAWorkerExclusiveScopeTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const count = 100;
      let eaWorker = startReadyInteropWorker('exclusiveScopeStress');
      let job = eaWorker.run<int>((): int => {
        let sum = 0;
        for (let i = 0; i < count; ++i) {
          if (i % 3 != 0) {
            expect(EAWorker.exclusiveScope<int>(() => i)).assertEqual(i);
          } else {
            let expected = new Error('stress-' + i);
            let sameError = false;
            try {
              EAWorker.exclusiveScope<void>(() => { throw expected; });
            } catch (error) {
              sameError = error === expected;
            }
            expect(sameError).assertTrue();
          }
          sum += i;
        }
        return sum;
      });
      try {
        expect(job.Await()).assertEqual(4950);
      } finally {
        eaWorker.join().Await();
      }
    });
  });
}
