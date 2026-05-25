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
export class SmartGestureLogStore {
  private serial: number = 0;
  public records: Array<string> = [];

  push(message: string): Array<string> {
    this.serial += 1;
    const nextLogs = this.records.concat([`${this.serial}. ${message}`]);
    this.records = nextLogs.length > 80 ? nextLogs.slice(nextLogs.length - 80) : nextLogs;
    return this.records;
  }

  clear(): Array<string> {
    this.serial = 0;
    this.records = [];
    return this.push('logs cleared');
  }
}