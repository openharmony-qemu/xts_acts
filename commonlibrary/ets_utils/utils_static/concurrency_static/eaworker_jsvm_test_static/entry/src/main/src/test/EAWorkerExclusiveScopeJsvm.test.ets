'use static';
/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
  describe,
  expect,
  it,
  TestType,
  Level,
  Size
} from "../../../hypium/index";

class ExclusiveJsvmNative {
  native jsvmCreate(): int;
  native jsvmRun(): int;
  native jsvmStackPosition(): int;
  native jsvmDestroy(): int;
}

function runExclusiveScopeJsvmTest(): void {
  let initialized = new CompletableJob<int>();
  let worker = new EAWorker('exclusiveScopeJsvm', (): void => {
    try {
      initialized.finish(new ExclusiveJsvmNative().jsvmCreate());
    } catch (error) {
      initialized.fail(error);
    }
  }, true);
  worker.start();
  try {
    // Wait until the initial task has returned and queued OS work is accepted.
    worker.run<void>(() => {}).Await();
    worker.run<void>(() => {}).Await();
    expect(initialized.Await()).assertEqual(0);
    worker.run<void>((): void => {
      for (let i = 0; i < 20; ++i) {
        EAWorker.exclusiveScope<void>((): void => {
          let nativeApi = new ExclusiveJsvmNative();
          expect(nativeApi.jsvmStackPosition()).assertEqual(0);
          expect(nativeApi.jsvmRun()).assertEqual(42);
        });
      }
    }).Await();
  } finally {
    try {
      worker.run<void>((): void => {
        EAWorker.exclusiveScope<void>((): void => {
          let nativeApi = new ExclusiveJsvmNative();
          expect(nativeApi.jsvmStackPosition()).assertEqual(0);
          expect(nativeApi.jsvmDestroy()).assertEqual(0);
        });
      }).Await();
    } finally {
      worker.join().Await();
    }
  }
}

export default function exclusiveScopeJsvmTest(): void {
  describe('EAWorkerExclusiveScopeJsvmTest', (): void => {
    try {
      loadLibrary('entry');
    } catch (e) {
      let err = e as Error;
      console.log('loadFailed', err.message);
    }

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWORKER_JSVM_EXCLUSIVE_SCOPE_0100
     * @tc.name testExclusiveScopeJsvmRun001
     * @tc.desc OS 栈上创建 JSVM，exclusiveScope 中执行 20 次有限递归
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testExclusiveScopeJsvmRun001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      runExclusiveScopeJsvmTest();
    });
  });
}
