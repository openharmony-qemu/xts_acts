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

// Shared @Concurrent task functions used only by worker scripts (workers/*.ets).
// Host-side tests consume these functions indirectly through the worker script
// loaded via the ThreadWorker path; no host-side test file imports this file
// directly. Module-level declarations only; no closure capture.

@Concurrent
export function workerEchoNameFunc(): number {
  return 42
}
