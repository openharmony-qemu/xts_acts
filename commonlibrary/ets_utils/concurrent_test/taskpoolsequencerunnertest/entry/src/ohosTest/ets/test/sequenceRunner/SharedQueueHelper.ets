/*
 * Copyright (c) 2026 RKH Corp.
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

import taskpool from '@ohos.taskpool';

// Cross-module (cross-file) shared named global serial queue asset.
// Different test files import this helper module and thereby share the exact
// same named SequenceRunner instance (module singleton) and the same
// underlying global queue (SDK d.ts: same-name SequenceRunner construction
// returns the same serial queue, bottom layer uses the singleton mode).

export const SHARED_QUEUE_NAME: string = 'crossModuleSharedQueueW4';

export const sharedQueueRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner(SHARED_QUEUE_NAME);

// Returns the exported shared instance so that importing files can verify
// reference equality with the module singleton.
export function peekSharedQueueRunner(): taskpool.SequenceRunner {
  return sharedQueueRunner;
}

// Returns a same-name SequenceRunner wrapper created in the importing file.
// Per SDK contract it shares the same underlying global queue with the
// exported instance.
export function getSameNameQueueRunner(): taskpool.SequenceRunner {
  return new taskpool.SequenceRunner(SHARED_QUEUE_NAME);
}
