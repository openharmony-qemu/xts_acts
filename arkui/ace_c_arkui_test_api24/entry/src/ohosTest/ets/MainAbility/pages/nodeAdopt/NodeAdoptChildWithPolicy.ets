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

import nativeFunc from 'libnativefunc.so'

@Entry
@Component
struct NodeAdoptChildWithPolicy {
  private hasRun: boolean = false;

  build() {
    Column() {
      Text('NodeAdoptChildWithPolicy')
        .fontSize(20)
    }
    .width('100%')
    .height('100%')
    .onAppear(() => {
      if (this.hasRun) {
        return;
      }
      this.hasRun = true;
      try {
        globalThis.nodeAdoptChildWithPolicy003Result = nativeFunc.TestNodeAdoptChildWithPolicy003(this.getUIContext());
      } catch (error) {
        globalThis.nodeAdoptChildWithPolicy003Result = -1;
        console.error(`[NodeAdoptChildWithPolicy] 003 failed: ${String(error)}`);
      }
      try {
        globalThis.nodeAdoptChildWithPolicy004Result = nativeFunc.TestNodeAdoptChildWithPolicy004(this.getUIContext());
      } catch (error) {
        globalThis.nodeAdoptChildWithPolicy004Result = -1;
        console.error(`[NodeAdoptChildWithPolicy] 004 failed: ${String(error)}`);
      }
    })
  }
}
