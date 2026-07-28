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
 * ETS 生产方模块 — 导出泛型函数 / 类 / 接口供跨模块（ETS / TS）消费。
 *
 * Used By:
 *   - GTP-IO-001 (ets_consumer): ETS 导出泛型函数
 *   - GTP-IO-002 (ets_consumer): ETS 导出泛型类
 *   - GTP-IO-003 (ets_consumer): ETS 导出泛型接口
 *   - GTP-IO-005 (ts_consumer): TS 调用 ETS 导出的泛型函数/类
 *   - GTP-IO-007 (ts_consumer): ETS 泛型返回值传给 TS
 *   - GTP-IO-010 (ts_consumer): 泛型类实例跨语言 constructor 身份
 *
 * 说明: .ts 消费方（ts_consumer.ts）原通过 .d.ts 解析 .ets，但 .ts→.ets import 被
 *       ArkTS 10605999 禁止；现改由 .ets 主文件 import 本模块后注入 ts_consumer（见
 *       known_issues.md M12-ISSUE-001）。
 */

// 泛型函数
export function etsIdentity<T>(value: T): T {
  return value
}

// 泛型类
export class EtsBox<T> {
  value: T

  constructor(value: T) {
    this.value = value
  }
}

// 泛型接口 + 实现
export interface EtsStore<K, V> {
  get(key: K): V

  set(key: K, value: V): void
}

export class EtsStoreImpl<K, V> implements EtsStore<K, V> {
  private map: Map<K, V> = new Map()

  get(key: K): V {
    return this.map.get(key)!
  }

  set(key: K, value: V): void {
    this.map.set(key, value)
  }
}
