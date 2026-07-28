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
 * JS 生产方模块 — 导出无类型标注的动态值/函数，供 .ets 跨语言消费。
 *
 * Used By:
 *   - GTP-IO-006: ETS 泛型函数接收 JS 动态值
 *   - GTP-IO-011: .d.ts 声明契约与实际 JS 导出一致性
 *
 * 注意: lengthBounded 的 .d.ts 声明约束 `<T extends { length: number }>`，
 *       而 JS 实现忽略约束（运行时对任意 v 取 v.length）。这正是契约 vs 实际的差异点。
 */

export function jsIdentity(v) {
    return v
}

export const jsDynamicValue = 42

export function lengthBounded(v) {
    return v.length
}
