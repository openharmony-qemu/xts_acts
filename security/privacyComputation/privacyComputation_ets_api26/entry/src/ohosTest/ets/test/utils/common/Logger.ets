/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

const TAG: string = '[PRIVACY_COMPUTATION_XTS]';

export class Logger {
  static info(...args: string[]): void {
    console.info(TAG, ...args);
  }

  static log(...args: string[]): void {
    console.log(TAG, ...args);
  }

  static error(...args: string[]): void {
    console.error(TAG, ...args);
  }
}
