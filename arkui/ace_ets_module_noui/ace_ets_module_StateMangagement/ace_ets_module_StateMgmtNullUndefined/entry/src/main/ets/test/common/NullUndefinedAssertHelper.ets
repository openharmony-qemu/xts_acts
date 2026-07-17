/**
 * Copyright (c) 2026 Kaihong Digital Industry Development Co., Ltd.
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

import { expect } from '@ohos/hypium';

export function assertCallCompleted(): void {
  expect(true).assertTrue();
}

export function assertExpectedError(action: () => void, tag: string): void {
  try {
    action();
  } catch (err) {
    console.error('[' + tag + '] Expected error: ' + JSON.stringify(err));
    expect(true).assertTrue();
    return;
  }
  expect().assertFail();
}

export function assertUnexpectedError(): void {
  expect().assertFail();
}
