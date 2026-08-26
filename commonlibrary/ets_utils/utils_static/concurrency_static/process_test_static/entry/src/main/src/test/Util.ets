'use static';
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

export class WaitFlag {
  ready: boolean = false;
}

export class WaitCounter {
  count: int = 0;
}

export default class Utils {
  static async msSleep(count: int): Promise<int> {
    return new Promise<int>((resolve, reject) => {
      setTimeout(() => {
        resolve(0);
      }, count);
    });
  }

  /**
   * Poll until flag.ready becomes true or timeout.
   * Used for StdProcess listener / TaskPool async event readiness.
   */
  static async waitReady(flag: WaitFlag, timeoutMs: int, intervalMs: int = 100): Promise<boolean> {
    let elapsed: int = 0;
    while (!flag.ready && elapsed < timeoutMs) {
      await Utils.msSleep(intervalMs);
      elapsed += intervalMs;
    }
    return flag.ready;
  }

  /**
   * Poll until counter.count >= minCount or timeout; returns final count.
   */
  static async waitCountAtLeast(counter: WaitCounter, minCount: int, timeoutMs: int,
    intervalMs: int = 100): Promise<int> {
    let elapsed: int = 0;
    while (counter.count < minCount && elapsed < timeoutMs) {
      await Utils.msSleep(intervalMs);
      elapsed += intervalMs;
    }
    return counter.count;
  }
}
