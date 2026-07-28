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
 * js_producer.js 的类型声明文件 — 为 .ets / .ts 消费方提供泛型契约。
 *
 * Used By:
 *   - GTP-IO-006: jsIdentity / jsDynamicValue 的类型契约
 *   - GTP-IO-011: lengthBounded 的泛型约束契约（与 JS 实际导出对照）
 */

export declare function jsIdentity<T>(v: T): T

export declare const jsDynamicValue: number

export declare function lengthBounded<T extends { length: number }>(v: T): number
