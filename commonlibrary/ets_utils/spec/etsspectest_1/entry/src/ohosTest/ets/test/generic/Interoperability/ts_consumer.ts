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
 * TS 消费方模块 — TS 调用 ETS 导出的泛型函数/类，验证跨语言值传递与身份。
 *
 * Used By:
 *   - GTP-IO-005: TS 调用 ETS 导出的泛型函数/类
 *   - GTP-IO-007: ETS 泛型返回值传给 TS 后保持值和身份
 *   - GTP-IO-010: generic class 实例跨语言后 constructor/prototype 身份
 *
 * 发现项（已确认，ArkTS 1.1 / DevEco 6.1.1）:
 *   .ts 直接 import .ets（`import ... from './ets_producer'`）被 ArkTS 禁止，
 *   报 10605999: Importing ArkTS files in JS and TS files is forbidden。
 *
 * 解决方案（绕开 10605999 + arkts-no-classes-as-obj）:
 *   不在 .ts 中 import .ets，改由 .ets 主文件 import ets_producer 后，
 *   将其导出（etsIdentity 函数、createEtsBox 工厂）作为参数注入 ts_consumer 的包装函数。
 *   .ts 侧用本地声明的结构类型（EtsIdentityFn / EtsBoxFactory）描述注入值的形状，
 *   不再触发 .ts→.ets import。EtsBox 构造器用工厂函数包裹避免 arkts-no-classes-as-obj。
 *   验证目标不变（TS 消费 ETS 泛型产物）。
 *   详见 known_issues.md M12-ISSUE-001。
 */

// 注入值的结构类型（.ts 本地声明，不 import .ets）
export type EtsIdentityFn = <T>(value: T) => T

export interface EtsBoxLike<T> {
  value: T
}

export type EtsBoxFactory = <T>(value: T) => EtsBoxLike<T>

// 注入容器：由 .ets 主文件填充
export interface EtsProducerApi {
  etsIdentity: EtsIdentityFn
  createEtsBox: EtsBoxFactory
}

// GTP-IO-005: TS 调用 ETS 导出的泛型函数（经注入）
export function tsCallsEtsIdentity(api: EtsProducerApi): number {
  return api.etsIdentity<number>(42)
}

// GTP-IO-007: ETS 泛型返回值传给 TS 后保持值（经注入）
export function tsReceivesEtsReturn(api: EtsProducerApi): string {
  const box = api.createEtsBox<string>('ets-value')
  return box.value
}

// GTP-IO-010: 泛型类实例跨语言后 constructor 身份（不同实参共享构造器，验证擦除）
export function tsCheckClassIdentity(api: EtsProducerApi): boolean {
  const a = api.createEtsBox<number>(1)
  const b = api.createEtsBox<string>('x')
  return a.constructor === b.constructor
}
