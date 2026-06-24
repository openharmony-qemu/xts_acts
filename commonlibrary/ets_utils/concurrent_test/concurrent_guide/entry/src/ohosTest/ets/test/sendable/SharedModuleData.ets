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

import { collections, ArkTSUtils } from '@kit.ArkTS';

"use shared"

@Sendable
export class SharedDataStore {
  items: collections.Array<string> = new collections.Array<string>()
  lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()

  async addItem(item: string): Promise<void> {
    await this.lock.lockAsync(() => {
      this.items.push(item)
    })
  }

  getItemCount(): number {
    return this.items.length
  }

  getItem(index: number): string {
    return this.items[index]
  }
}

export const dataStore: SharedDataStore = new SharedDataStore()
