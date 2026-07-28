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
 * TS 生产方模块 — 导出泛型函数 / Promise / 容器 / 异常供 .ets 消费。
 *
 * Used By:
 *   - GTP-IO-004 (genericInteropTsHelper): .ets 调用 TS 导出的泛型函数
 *   - GTP-IO-008: 跨语言 Promise<T> resolve/reject
 *   - GTP-IO-009: 跨语言 Array<T> / Map<K,V> 读写
 *   - GTP-IO-012: 跨语言异常传播
 */

export function tsIdentity<T>(value: T): T {
  return value
}

export function tsAsync<T>(value: T): Promise<T> {
  return Promise.resolve(value)
}

export function tsReject(msg: string): Promise<never> {
  return Promise.reject(new Error(msg))
}

export function tsArray<T>(...items: T[]): T[] {
  return items
}

export function tsReadMap<V>(m: Map<number, V>, key: number): V {
  return m.get(key) as V
}

export function tsThrower(msg: string): never {
  throw new Error(msg)
}
