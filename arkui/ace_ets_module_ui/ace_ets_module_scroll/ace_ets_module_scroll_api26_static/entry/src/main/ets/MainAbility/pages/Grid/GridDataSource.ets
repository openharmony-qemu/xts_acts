'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { IDataSource, DataChangeListener } from '@ohos.arkui.component';

// 此示例的数据固定不变，不需要发送数据变更通知。
export class GridDataSource implements IDataSource<string> {
  private items: string[] = [];
  private listeners: DataChangeListener[] = [];

  constructor(count: int) {
    for (let index: int = 0; index < count; index++) {
      this.items.push(index.toString());
    }
  }

  totalCount(): int {
    return this.items.length;
  }

  getData(index: int): string {
    return this.items[index];
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      this.listeners.push(listener);
    }
  }

  unregisterDataChangeListener(listener: DataChangeListener): void {
    const index: int = this.listeners.indexOf(listener);
    if (index >= 0) {
      this.listeners.splice(index, 1);
    }
  }
}
