/*
 * Copyright (c) 2026 SwanLink (Jiangsu) Technology Development Co., LTD.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/*
 * TypeScript helper for M04 Generic Interface tests.
 *
 * 仅持有 .ets 不支持、被迫落 .ts 的语法（质检标准 3.2）。
 *
 * Used By:
 *   - GTP-GI-006: CallbackIface / invokeCallbackIface
 *
 * 被迫落 .ts 的语法:
 *   call signature 接口 `interface CB<T> { (v: T): void }` 在 .ets 报
 *   arkts-no-call-signatures（Use "class" instead of a type with call signature），
 *   故整体移至 .ts。.ets 通过 invokeCallbackIface 调用做运行时断言。
 */

// GTP-GI-006: call signature 接口（.ets 报 arkts-no-call-signatures，被迫落 .ts）
export interface CallbackIface<T> {
  (value: T): void
}

export function invokeCallbackIface<T>(cb: CallbackIface<T>, value: T): void {
  cb(value)
}
