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
} from '@ohos/hypium-static/src/main/indexStatic';
import Utils from './Util.test';

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
  }).assertThrowError('RuntimeError');
  return true;
}

export default function EAWorkerExclusiveScopeTest(): void {
  describe('EAWorkerExclusiveScopeTest', (): void => {
    beforeAll((): void => {});
    beforeEach((): void => {});
    afterEach((): void => {});
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

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
          }).assertThrowError('RuntimeError');
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
      }).assertThrowError('RuntimeError');
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
        }).assertThrowError('RuntimeError');
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
        }).assertThrowError('RuntimeError');
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
        }).assertThrowError('RuntimeError');
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

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0233
     * @tc.name exclusiveScopeSuccess001
     * @tc.desc exclusiveScope callback returns value successfully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('exclusiveScopeSuccess001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let eaWorker = startReadyInteropWorker('exclusiveScopeSuccess001');
      let job = eaWorker.run<int>((): int => {
        return EAWorker.exclusiveScope<int>(() => 42);
      });
      try {
        expect(job.Await()).assertEqual(42);
      } finally {
        eaWorker.join().Await();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0234
     * @tc.name exclusiveScopeSuccess002
     * @tc.desc exclusiveScope callback returns string value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('exclusiveScopeSuccess002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let eaWorker = startReadyInteropWorker('exclusiveScopeSuccess002');
      let job = eaWorker.run<string>((): string => {
        return EAWorker.exclusiveScope<string>(() => 'hello');
      });
      try {
        expect(job.Await()).assertEqual('hello');
      } finally {
        eaWorker.join().Await();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0235
     * @tc.name exclusiveScopeExceptionPropagation001
     * @tc.desc exclusiveScope callback throws exception, exception propagates to caller
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('exclusiveScopeExceptionPropagation001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let eaWorker = startReadyInteropWorker('exclusiveScopeExceptionPropagation001');
      let job = eaWorker.run<void>((): void => {
        expect((): void => {
          EAWorker.exclusiveScope<void>((): void => { throw new Error('callback exception'); });
        }).assertThrowError('Error', 'callback exception');
      });
      try {
        job.Await();
      } finally {
        eaWorker.join().Await();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0236
     * @tc.name exclusiveScopeMainThreadError001
     * @tc.desc Call exclusiveScope from main thread, expect RuntimeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('exclusiveScopeMainThreadError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect((): void => {
        EAWorker.exclusiveScope<int>(() => 42);
      }).assertThrowError('RuntimeError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0237
     * @tc.name exclusiveScopeTaskPoolError001
     * @tc.desc Call exclusiveScope from TaskPool worker, expect RuntimeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('exclusiveScopeTaskPoolError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result = waitForCompletion<Any>((): Promise<Any> => taskpool.execute(callExclusiveScopeFromTaskpool));
      expect(result as boolean).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0238
     * @tc.name exclusiveScopeNeedInteropFalseError001
     * @tc.desc Call exclusiveScope in EAWorker with needInterop=false, expect RuntimeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('exclusiveScopeNeedInteropFalseError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let eaWorker = new EAWorker('needInteropFalse', false);
      eaWorker.start();
      let job = eaWorker.run<void>((): void => {
        expect((): void => {
          EAWorker.exclusiveScope<int>(() => 1);
        }).assertThrowError('RuntimeError');
      });
      try {
        job.Await();
      } finally {
        eaWorker.join().Await();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0239
     * @tc.name exclusiveScopeNestedError001
     * @tc.desc Nested exclusiveScope call in callback, expect RuntimeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('exclusiveScopeNestedError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let eaWorker = startReadyInteropWorker('exclusiveScopeNestedError001');
      let job = eaWorker.run<void>((): void => {
        EAWorker.exclusiveScope<void>((): void => {
          expect((): void => {
            EAWorker.exclusiveScope<int>(() => 1);
          }).assertThrowError('RuntimeError');
        });
      });
      try {
        job.Await();
      } finally {
        eaWorker.join().Await();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0240
     * @tc.name exclusiveScopeNotStartedError001
     * @tc.desc Call exclusiveScope in EAWorker not started, expect RuntimeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('exclusiveScopeNotStartedError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let eaWorker = new EAWorker('notStarted', true);
      expect((): void => {
        EAWorker.exclusiveScope<int>(() => 1);
      }).assertThrowError('RuntimeError');
      try { eaWorker.quit(); } catch (error) {}
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0241
     * @tc.name exclusiveScopeAlreadyExitedError001
     * @tc.desc Call exclusiveScope in already exited EAWorker, expect RuntimeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('exclusiveScopeAlreadyExitedError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let eaWorker = startReadyInteropWorker('alreadyExited');
      eaWorker.join().Await();
      expect((): void => {
        EAWorker.exclusiveScope<int>(() => 1);
      }).assertThrowError('RuntimeError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0242
     * @tc.name exclusiveScopePostToMainError001
     * @tc.desc Call exclusiveScope in postToMain callback (main thread), expect RuntimeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('exclusiveScopePostToMainError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let eaWorker = startReadyInteropWorker('postToMainError');
      let completion = new CompletableJob<string>();
      let job = eaWorker.run<void>((): void => {
        let mainJob = EAWorker.postToMain<string>((): string => {
          try {
            EAWorker.exclusiveScope<int>(() => 1);
            completion.finish('no-error');
          } catch (error) {
            completion.finish(error.message);
          }
          return '';
        });
        mainJob.Await();
      });
      try {
        job.Await();
        let msg = completion.Await();
        expect(msg.length).assertLarger(0);
        expect(msg !== 'no-error').assertTrue();
      } finally {
        eaWorker.join().Await();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0243
     * @tc.name exclusiveScopeAsyncJobAwaitError001
     * @tc.desc Call Job.Await in exclusiveScope callback, expect error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('exclusiveScopeAsyncJobAwaitError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let eaWorker = startReadyInteropWorker('asyncJobAwaitError');
      let job = eaWorker.run<void>((): void => {
        expect((): void => {
          EAWorker.exclusiveScope<void>((): void => { launch<int>(() => 1); });
        }).assertThrowError('InvalidJobOperationError');
      });
      try {
        job.Await();
      } finally {
        eaWorker.join().Await();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0244
     * @tc.name exclusiveScopeAsyncSetTimeoutError001
     * @tc.desc Call setTimeout in exclusiveScope callback, expect error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('exclusiveScopeAsyncSetTimeoutError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let eaWorker = startReadyInteropWorker('asyncSetTimeoutError');
      let job = eaWorker.run<void>((): void => {
        expect((): void => {
          EAWorker.exclusiveScope<void>((): void => { setTimeout(() => {}, 100); });
        }).assertThrowError('InvalidJobOperationError');
      });
      try {
        job.Await();
      } finally {
        eaWorker.join().Await();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0245
     * @tc.name exclusiveScopeAsyncPromiseError001
     * @tc.desc Use Promise in exclusiveScope callback, expect error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('exclusiveScopeAsyncPromiseError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let eaWorker = startReadyInteropWorker('asyncPromiseError');
      let job = eaWorker.run<void>((): void => {
        expect((): void => {
          EAWorker.exclusiveScope<void>((): void => {
            waitForCompletion<int>(() => Promise.resolve<int>(1));
          });
        }).assertThrowError('InvalidJobOperationError');
      });
      try {
        job.Await();
      } finally {
        eaWorker.join().Await();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0246
     * @tc.name exclusiveScopeShuttingDownError001
     * @tc.desc Call exclusiveScope while EAWorker is shutting down, expect RuntimeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('exclusiveScopeShuttingDownError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let eaWorker = startReadyInteropWorker('shuttingDown');
      let requesterEntered = new CompletableJob<void>();
      let requesterGate = new CompletableJob<void>();
      let rejectedJob = eaWorker.run<void>((): void => {
        requesterEntered.finish();
        requesterGate.Await();
        expect((): void => {
          EAWorker.exclusiveScope<int>(() => 1);
        }).assertThrowError('RuntimeError');
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0247
     * @tc.name exclusiveScopeConstructorTaskContext001
     * @tc.desc Call exclusiveScope in constructor task function context
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('exclusiveScopeConstructorTaskContext001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let completion = new CompletableJob<int>();
      let eaWorker = new EAWorker('constructorTaskCtx', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0248
     * @tc.name exclusiveScopeRunTaskContext001
     * @tc.desc Call exclusiveScope in run task context
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('exclusiveScopeRunTaskContext001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let eaWorker = startReadyInteropWorker('runTaskCtx');
      let job = eaWorker.run<int>((): int => {
        return EAWorker.exclusiveScope<int>(() => 100);
      });
      try {
        expect(job.Await()).assertEqual(100);
      } finally {
        eaWorker.join().Await();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0249
     * @tc.name exclusiveScopePostTaskContext001
     * @tc.desc Call exclusiveScope in postTask callback context
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('exclusiveScopePostTaskContext001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let eaWorker = startReadyInteropWorker('postTaskCtx');
      let completion = new CompletableJob<int>();
      eaWorker.postTask((): void => {
        try {
          completion.finish(EAWorker.exclusiveScope<int>(() => 42));
        } catch (error) {
          completion.fail(error);
        }
      });
      try {
        expect(completion.Await()).assertEqual(42);
      } finally {
        eaWorker.join().Await();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0250
     * @tc.name exclusiveScopeSyncExecution001
     * @tc.desc Verify exclusiveScope synchronous execution - code after call waits for callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('exclusiveScopeSyncExecution001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let eaWorker = startReadyInteropWorker('syncExecution');
      let job = eaWorker.run<string>((): string => {
        let log = 'before';
        let val = EAWorker.exclusiveScope<int>(() => 42);
        log = log + '_after';
        return log + '_' + val.toString();
      });
      try {
        expect(job.Await()).assertEqual('before_after_42');
      } finally {
        eaWorker.join().Await();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0253
     * @tc.name exclusiveScopeMessageHandlerContext001
     * @tc.desc Call exclusiveScope in MessageHandler handler context
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('exclusiveScopeMessageHandlerContext001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let eaWorker = startReadyInteropWorker('msgHandlerCtx');
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => { EAWorker.exclusiveScope<int>(() => msg.getWhat()); }, eaWorker);
      handler.sendEmptyMessage(42);
      let job = eaWorker.run<int>(() => EAWorker.exclusiveScope<int>(() => 42));
      try {
        expect(job.Await()).assertEqual(42);
      } finally {
        eaWorker.join().Await();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0254
     * @tc.name exclusiveScopeMessageHandlerPostContext001
     * @tc.desc Call exclusiveScope in MessageHandler post callback context
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('exclusiveScopeMessageHandlerPostContext001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let eaWorker = startReadyInteropWorker('msgHandlerPostCtx');
      let handler = new concurrency.MessageHandler((): void => {}, eaWorker);
      handler.post((): void => { EAWorker.exclusiveScope<int>(() => 42); });
      let job = eaWorker.run<int>(() => EAWorker.exclusiveScope<int>(() => 42));
      try {
        expect(job.Await()).assertEqual(42);
      } finally {
        eaWorker.join().Await();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0255
     * @tc.name exclusiveScopeMessageCallbackContext001
     * @tc.desc Call exclusiveScope in Message callback context
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('exclusiveScopeMessageCallbackContext001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let eaWorker = startReadyInteropWorker('msgCallbackCtx');
      let handler = new concurrency.MessageHandler((): void => {}, eaWorker);
      let callback = (): void => { EAWorker.exclusiveScope<int>(() => 42); };
      let msg = new concurrency.Message(callback, handler);
      msg.sendToTarget();
      let job = eaWorker.run<int>(() => EAWorker.exclusiveScope<int>(() => 42));
      try {
        expect(job.Await()).assertEqual(42);
      } finally {
        eaWorker.join().Await();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0256
     * @tc.name exclusiveScopeMultipleCalls001
     * @tc.desc Multiple sequential exclusiveScope calls in same callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('exclusiveScopeMultipleCalls001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let eaWorker = startReadyInteropWorker('multipleCalls');
      let job = eaWorker.run<string>((): string => {
        let v1 = EAWorker.exclusiveScope<int>(() => 1);
        let v2 = EAWorker.exclusiveScope<int>(() => 2);
        let v3 = EAWorker.exclusiveScope<int>(() => 3);
        return (v1 + v2 + v3).toString();
      });
      try {
        expect(job.Await()).assertEqual('6');
      } finally {
        eaWorker.join().Await();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0257
     * @tc.name exclusiveScopeReturnVoid001
     * @tc.desc exclusiveScope with void return type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('exclusiveScopeReturnVoid001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let eaWorker = startReadyInteropWorker('returnVoid');
      let executed = new AtomicInt(0);
      let job = eaWorker.run<void>((): void => {
        EAWorker.exclusiveScope<void>((): void => { executed.store(1); });
      });
      try {
        job.Await();
        expect(executed.load()).assertEqual(1);
      } finally {
        eaWorker.join().Await();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0258
     * @tc.name exclusiveScopeShuttingDownTaskCanceled001
     * @tc.desc Task canceled during worker shutdown in exclusiveScope
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('exclusiveScopeShuttingDownTaskCanceled001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let eaWorker = startReadyInteropWorker('taskCanceled');
      let requesterEntered = new CompletableJob<void>();
      let releaseCallback = new AtomicInt(0);
      let acceptedJob = eaWorker.run<int>((): int => {
        requesterEntered.finish();
        while (releaseCallback.load() == 0) {}
        try {
          EAWorker.exclusiveScope<int>(() => 42);
          return 42;
        } catch (error) {
          return -1;
        }
      });
      requesterEntered.Await();
      let joinJob = eaWorker.join();
      releaseCallback.store(1);
      try {
        let result = acceptedJob.Await();
        expect(result == 42 || result == -1).assertTrue();
      } finally {
        joinJob.Await();
      }
    });

    /**
     * @tc.name   EAWorkerExclusiveScopeTest1500
     * @tc.number SUB_BUILTINS_EAWORKER_EXCLUSIVE_SCOPE_TEST_1500
     * @tc.desc   Verify multiple EAWorkers can concurrently call exclusiveScope on shared atomic counter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('EAWorkerExclusiveScopeTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const iterations = 10;
      let sharedCounter = new AtomicInt(0);
      let ea1 = startReadyInteropWorker('concurrentShared1');
      let ea2 = startReadyInteropWorker('concurrentShared2');
      let job1 = ea1.run<int>((): int => {
        for (let i = 0; i < iterations; ++i) {
          EAWorker.exclusiveScope<void>((): void => { sharedCounter.fetchAdd(1); });
        }
        return iterations;
      });
      let job2 = ea2.run<int>((): int => {
        for (let i = 0; i < iterations; ++i) {
          EAWorker.exclusiveScope<void>((): void => { sharedCounter.fetchAdd(1); });
        }
        return iterations;
      });
      try {
        expect(job1.Await()).assertEqual(iterations);
        expect(job2.Await()).assertEqual(iterations);
        expect(sharedCounter.load()).assertEqual(iterations * 2);
      } finally {
        ea1.join().Await();
        ea2.join().Await();
      }
    });

    /**
     * @tc.name   EAWorkerExclusiveScopeTest1600
     * @tc.number SUB_BUILTINS_EAWORKER_EXCLUSIVE_SCOPE_TEST_1600
     * @tc.desc   Verify exclusiveScope under quit/join race condition with multiple tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('EAWorkerExclusiveScopeTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const taskCount = 10;
      let eaWorker = startReadyInteropWorker('raceQuitJoin');
      let completedCount = new AtomicInt(0);
      let errorCount = new AtomicInt(0);
      let jobs: Job<int>[] = [];
      for (let i = 0; i < taskCount; ++i) {
        jobs.push(eaWorker.run<int>((): int => {
          try {
            EAWorker.exclusiveScope<int>(() => 1);
            completedCount.fetchAdd(1);
            return 1;
          } catch (error) {
            errorCount.fetchAdd(1);
            return -1;
          }
        }));
      }
      eaWorker.quit();
      try {
        for (let job of jobs) {
          job.Await();
        }
        expect(completedCount.load() + errorCount.load()).assertEqual(taskCount);
      } finally {
        try { eaWorker.join().Await(); } catch (error) {}
      }
    });

    /**
     * @tc.name   EAWorkerExclusiveScopeTest1800
     * @tc.number SUB_BUILTINS_EAWORKER_EXCLUSIVE_SCOPE_TEST_1800
     * @tc.desc   Verify exclusiveScope executes synchronously under message backlog
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('EAWorkerExclusiveScopeTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const backlogCount = 100;
      let eaWorker = startReadyInteropWorker('messageBacklog');
      let backlogCounter = new AtomicInt(0);
      for (let i = 0; i < backlogCount; ++i) {
        eaWorker.postTask((): void => { backlogCounter.fetchAdd(1); });
      }
      let exclusiveJob = eaWorker.run<int>((): int => {
        return EAWorker.exclusiveScope<int>(() => 42);
      });
      try {
        expect(exclusiveJob.Await()).assertEqual(42);
        expect(backlogCounter.load()).assertEqual(backlogCount);
      } finally {
        eaWorker.join().Await();
      }
    });

    /**
     * @tc.name   EAWorkerExclusiveScopeTest1900
     * @tc.number SUB_BUILTINS_EAWORKER_EXCLUSIVE_SCOPE_TEST_1900
     * @tc.desc   Verify Mutex synchronous lock works in exclusiveScope callback without async violation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('EAWorkerExclusiveScopeTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let eaWorker = startReadyInteropWorker('mutexInCallback');
      let mutex = new Mutex();
      let counter = new AtomicInt(0);
      let job = eaWorker.run<int>((): int => {
        for (let i = 0; i < 10; ++i) {
          EAWorker.exclusiveScope<void>((): void => {
            mutex.lockGuard((): void => { counter.fetchAdd(1); });
          });
        }
        return counter.load();
      });
      try {
        expect(job.Await()).assertEqual(10);
      } finally {
        eaWorker.join().Await();
      }
    });

    /**
     * @tc.name   EAWorkerExclusiveScopeTest2000
     * @tc.number SUB_BUILTINS_EAWORKER_EXCLUSIVE_SCOPE_TEST_2000
     * @tc.desc   Verify AtomicInt operations in exclusiveScope callback under concurrent access
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('EAWorkerExclusiveScopeTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const workerCount = 2;
      const iterationsPerWorker = 10;
      let counter = new AtomicInt(0);
      let workers: EAWorker[] = [];
      let jobs: Job<int>[] = [];
      for (let w = 0; w < workerCount; ++w) {
        let ea = startReadyInteropWorker('atomicConcurrent-' + w);
        workers.push(ea);
        jobs.push(ea.run<int>((): int => {
          for (let i = 0; i < iterationsPerWorker; ++i) {
            EAWorker.exclusiveScope<void>((): void => {
              counter.fetchAdd(1);
            });
          }
          return iterationsPerWorker;
        }));
      }
      try {
        for (let job of jobs) {
          expect(job.Await()).assertEqual(iterationsPerWorker);
        }
        expect(counter.load()).assertEqual(workerCount * iterationsPerWorker);
      } finally {
        for (let ea of workers) {
          ea.join().Await();
        }
      }
    });

    /**
     * @tc.name   EAWorkerExclusiveScopeTest2100
     * @tc.number SUB_BUILTINS_EAWORKER_EXCLUSIVE_SCOPE_TEST_2100
     * @tc.desc   Verify RWLock read/write lock works in exclusiveScope callback without async violation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('EAWorkerExclusiveScopeTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let eaWorker = startReadyInteropWorker('rwlockInCallback');
      let rwlock = new RWLock();
      let readLock = rwlock.readLock();
      let writeLock = rwlock.writeLock();
      let counter = new AtomicInt(0);
      let job = eaWorker.run<int>((): int => {
        for (let i = 0; i < 5; ++i) {
          EAWorker.exclusiveScope<void>((): void => {
            writeLock.lock();
            try { counter.fetchAdd(1); } finally { writeLock.unlock(); }
          });
          EAWorker.exclusiveScope<void>((): void => {
            readLock.lock();
            try { counter.load(); } finally { readLock.unlock(); }
          });
        }
        return counter.load();
      });
      try {
        expect(job.Await()).assertEqual(5);
      } finally {
        eaWorker.join().Await();
      }
    });

    /**
     * @tc.name   EAWorkerExclusiveScopeTest2200
     * @tc.number SUB_BUILTINS_EAWORKER_EXCLUSIVE_SCOPE_TEST_2200
     * @tc.desc   Verify exclusiveScope callback can send message via MessageHandler without async violation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('EAWorkerExclusiveScopeTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let eaWorker = startReadyInteropWorker('callbackSendMessage');
      let handler = new concurrency.MessageHandler((): void => {}, eaWorker);
      let job = eaWorker.run<int>((): int => {
        return EAWorker.exclusiveScope<int>((): int => {
          handler.sendEmptyMessage(99);
          return 42;
        });
      });
      try {
        expect(job.Await()).assertEqual(42);
      } finally {
        eaWorker.join().Await();
      }
      });

    /**
     * @tc.name   EAWorkerExclusiveScopeTest2300
     * @tc.number SUB_BUILTINS_EAWORKER_EXCLUSIVE_SCOPE_TEST_2300
     * @tc.desc   Verify multiple tasks with exclusiveScope execute in serial submission order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('EAWorkerExclusiveScopeTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let eaWorker = startReadyInteropWorker('serialOrder');
      let order = new AtomicInt(0);
      let jobs: Job<int>[] = [];
      for (let i = 0; i < 5; ++i) {
        jobs.push(eaWorker.run<int>((): int => {
          return EAWorker.exclusiveScope<int>((): int => {
            return order.fetchAdd(1);
          });
        }));
      }
      try {
        for (let i = 0; i < 5; ++i) {
          expect(jobs[i].Await()).assertEqual(i);
        }
      } finally {
        eaWorker.join().Await();
      }
    });

    /**
     * @tc.name   EAWorkerExclusiveScopeTest2400
     * @tc.number SUB_BUILTINS_EAWORKER_EXCLUSIVE_SCOPE_TEST_2400
     * @tc.desc   Verify join does not wait for all pending tasks to complete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('EAWorkerExclusiveScopeTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let eaWorker = startReadyInteropWorker('joinPending');
      let executedCount = new AtomicInt(0);
      let gate = new CompletableJob<void>();
      let task1 = eaWorker.run<int>((): int => {
        gate.Await();
        EAWorker.exclusiveScope<void>((): void => { executedCount.fetchAdd(1); });
        return 1;
      });
      const pendingCount = 10;
      for (let i = 0; i < pendingCount; ++i) {
        eaWorker.run<void>((): void => {
          EAWorker.exclusiveScope<void>((): void => { executedCount.fetchAdd(1); });
        });
      }
      let joinJob = eaWorker.join();
      gate.finish();
      joinJob.Await();
      expect(executedCount.load() < pendingCount + 1).assertTrue();
    });

    /**
     * @tc.name   EAWorkerExclusiveScopeTest2800
     * @tc.number SUB_BUILTINS_EAWORKER_EXCLUSIVE_SCOPE_TEST_2800
     * @tc.desc   Verify serial execution order via array element sequence and string concatenation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('EAWorkerExclusiveScopeTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let eaWorker = startReadyInteropWorker('orderVerify');
      let order = new AtomicInt(0);
      let j0 = eaWorker.run<int>((): int => EAWorker.exclusiveScope<int>((): int => order.fetchAdd(1)));
      let j1 = eaWorker.run<int>((): int => EAWorker.exclusiveScope<int>((): int => order.fetchAdd(1)));
      let j2 = eaWorker.run<int>((): int => EAWorker.exclusiveScope<int>((): int => order.fetchAdd(1)));
      let j3 = eaWorker.run<int>((): int => EAWorker.exclusiveScope<int>((): int => order.fetchAdd(1)));
      let j4 = eaWorker.run<int>((): int => EAWorker.exclusiveScope<int>((): int => order.fetchAdd(1)));
      try {
        let p0 = j0.Await();
        let p1 = j1.Await();
        let p2 = j2.Await();
        let p3 = j3.Await();
        let p4 = j4.Await();
        expect(p0).assertEqual(0);
        expect(p1).assertEqual(1);
        expect(p2).assertEqual(2);
        expect(p3).assertEqual(3);
        expect(p4).assertEqual(4);
        let result = `${p0}${p1}${p2}${p3}${p4}`;
        expect(result).assertEqual('01234');
      } finally {
        eaWorker.join().Await();
      }
    });

    /**
     * @tc.name   EAWorkerExclusiveScopeTest2500
     * @tc.number SUB_BUILTINS_EAWORKER_EXCLUSIVE_SCOPE_TEST_2500
     * @tc.desc   Verify exclusiveScope works when EAWorker is created from TaskPool thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('EAWorkerExclusiveScopeTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result = waitForCompletion<Any>((): Promise<Any> => taskpool.execute((): int => {
        let ea = startReadyInteropWorker('taskpoolNestedEaw');
        let job = ea.run<int>((): int => {
          return EAWorker.exclusiveScope<int>(() => 42);
        });
        let val = job.Await();
        ea.join().Await();
        return val;
      }));
      expect(result as int).assertEqual(42);
    });

    /**
     * @tc.name   EAWorkerExclusiveScopeTest2600
     * @tc.number SUB_BUILTINS_EAWORKER_EXCLUSIVE_SCOPE_TEST_2600
     * @tc.desc   Verify exclusiveScope fails when called from TaskPool nested inside EAWorker task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('EAWorkerExclusiveScopeTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let eaWorker = startReadyInteropWorker('eawToTaskpool');
      let threw = new AtomicInt(0);
      let completion = new CompletableJob<void>();
      let job = eaWorker.run<void>((): void => {
        taskpool.execute((): void => {
          try {
            EAWorker.exclusiveScope<int>(() => 1);
          } catch (error) {
            threw.store(1);
          }
          completion.finish();
        });
        completion.Await();
      });
      try {
        job.Await();
        expect(threw.load()).assertEqual(1);
      } finally {
        eaWorker.join().Await();
      }
    });

    /**
     * @tc.name   EAWorkerExclusiveScopeTest2700
     * @tc.number SUB_BUILTINS_EAWORKER_EXCLUSIVE_SCOPE_TEST_2700
     * @tc.desc   Verify exclusiveScope works in a nested EAWorker created from another EAWorker
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('EAWorkerExclusiveScopeTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let ea1 = startReadyInteropWorker('nestedOuter');
      let job = ea1.run<int>((): int => {
        let ea2 = new EAWorker('nestedInner', true);
        ea2.start();
        ea2.run<void>((): void => {}).Await();
        let innerJob = ea2.run<int>((): int => {
          return EAWorker.exclusiveScope<int>(() => 42);
        });
        let result = innerJob.Await();
        ea2.join().Await();
        return result;
      });
      try {
        expect(job.Await()).assertEqual(42);
      } finally {
        ea1.join().Await();
      }
    });
  });
}
