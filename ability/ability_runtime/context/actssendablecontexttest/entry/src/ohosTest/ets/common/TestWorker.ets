/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import { worker } from '@kit.ArkTS';

function openWorker(plain: string, withEts: string): worker.ThreadWorker {
  try {
    return new worker.ThreadWorker(plain);
  } catch (err) {
    return new worker.ThreadWorker(withEts);
  }
}

export function openStageWorker(): worker.ThreadWorker {
  return openWorker('entry_test/ets/workers/Worker', 'entry_test/ets/workers/Worker.ets');
}

export function openStageWorker1(): worker.ThreadWorker {
  return openWorker('entry_test/ets/workers/Worker1', 'entry_test/ets/workers/Worker1.ets');
}

export function openWorkerTrans(): worker.ThreadWorker {
  return openWorker('entry_test/ets/workers/WorkerTrans', 'entry_test/ets/workers/WorkerTrans.ets');
}

export function openWorkerTrans2(): worker.ThreadWorker {
  return openWorker('entry_test/ets/workers/WorkerTrans2', 'entry_test/ets/workers/WorkerTrans2.ets');
}

export function openWorkerTrans3(): worker.ThreadWorker {
  return openWorker('entry_test/ets/workers/WorkerTrans3', 'entry_test/ets/workers/WorkerTrans3.ets');
}
