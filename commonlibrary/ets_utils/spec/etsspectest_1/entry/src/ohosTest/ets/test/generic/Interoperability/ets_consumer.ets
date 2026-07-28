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
 * ETS 消费方模块 — 从 ets_producer 跨模块 import 泛型 API 并封装为可断言的返回值。
 *
 * Used By:
 *   - GTP-IO-001: ETS 导出泛型函数并由另一 ETS 模块导入
 *   - GTP-IO-002: ETS 导出泛型类并跨模块保持实例行为
 *   - GTP-IO-003: ETS 导出泛型接口/type-only contract
 */

import { etsIdentity, EtsBox, EtsStoreImpl } from './ets_producer'

// GTP-IO-001: 跨模块调用 ETS 导出的泛型函数
export function runEtsFunctionInterop(): number {
  return etsIdentity<number>(42)
}

// GTP-IO-002: 跨模块实例化 ETS 导出的泛型类
export function runEtsClassInterop(): string {
  const box = new EtsBox<string>('hello')
  return box.value
}

// GTP-IO-003: 跨模块使用 ETS 导出的泛型接口（经实现类）
export function runEtsInterfaceInterop(): string {
  const store = new EtsStoreImpl<number, string>()
  store.set(1, 'a')
  return store.get(1)
}
