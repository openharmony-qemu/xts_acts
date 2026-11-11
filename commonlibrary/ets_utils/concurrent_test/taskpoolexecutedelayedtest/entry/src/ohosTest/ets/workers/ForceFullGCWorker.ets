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
import { MessageEvents, ThreadWorkerGlobalScope, worker } from '@kit.ArkTS';

declare class ArkTools {
  static forceFullGC(): void;
}

const workerPort: ThreadWorkerGlobalScope = worker.workerPort;

// Runs the full GC on this dedicated worker thread so that neither the
// application main thread nor the shared TaskPool threads ever execute
// ArkTools.forceFullGC():
// - main-thread ForceFullGC froze the main event loop for more than 6s
//   (THREAD_BLOCK_6S in the native faultlogger);
// - a TaskPool-hosted ForceFullGC could deadlock with concurrent TaskPool
//   scheduling and poison every later TaskPool result.
workerPort.onmessage = (e: MessageEvents) => {
  const request = e.data as string;
  if (request === 'forceFullGC') {
    ArkTools.forceFullGC();
  }
  workerPort.postMessage(request);
};

workerPort.onmessageerror = (e: MessageEvents) => {
  workerPort.postMessage('messageError');
};
