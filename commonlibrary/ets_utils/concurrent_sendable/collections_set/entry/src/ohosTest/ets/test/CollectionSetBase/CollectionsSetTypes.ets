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

// ============================================================================
// 测试数据定义
// ============================================================================

// 特殊字符字符串（含 NUL）：NUL 用 String.fromCharCode(0) 运行时构造，避免源码转义被工具渲染成真实字节
export const SPECIAL_STR_WITH_NUL: string = "a\n\t\u200B" + String.fromCharCode(0);

// 基础类型测试值
export const BASIC_VALUES: (number | string | boolean | undefined | null)[] = [
  100,
  1.5e-10,
  Number.MAX_SAFE_INTEGER,
  NaN,
  "test测试123",
  SPECIAL_STR_WITH_NUL,
  "测试😀🎉🔥",
  "",
  true,
  false,
  undefined,
  null
];

// ============================================================================
// Sendable 辅助类型定义（供 Set 泛型参数使用）
// ============================================================================

/** 基本 Sendable 类 — 包含基础类型字段 */
@Sendable
export class SendableClassBasic {
  id: number;
  name: string;
  constructor(id: number, name: string) {
    this.id = id;
    this.name = name;
  }
}

/** 复杂 Sendable 类 — 包含嵌套 SendableClassBasic + 多个基础类型字段 */
@Sendable
export class SendableClassComplex {
  basic: SendableClassBasic;
  nestedId: number;
  tags: string;
  constructor() {
    this.basic = new SendableClassBasic(1, "complex_inner");
    this.nestedId = 42;
    this.tags = "tag_a,tag_b,tag_c";
  }
}

/** Sendable 继承类 —— extends SendableClassBasic（2026-07-26 验证编译通过） */
@Sendable
export class SendableClassExtended extends SendableClassBasic {
  name: string;
  constructor() {
    super(0, 'extended');
    this.name = '';
  }
}

/*
 * [SKIP] sendableFunction — @Sendable 装饰函数
 * 原因: (1) arkts-sendable-beta-compatible — @Sendable 不可用于函数
 *       (2) arkts-sendable-generic-types — 函数类型非 Sendable，不可作 Set<T> 泛型参数
 * 原始定义:
 * @Sendable
 * function sendableFunction(): string { return "sendable_result"; }
 * 替代方案: 使用 SendableEnum / SendableClassBasic 等 Sendable 类型覆盖函数场景
 */

/** Sendable const enum */
export const enum SendableEnum {
  Success = 0,
  Failed = 1,
  Pending = 2
}

/** 自引用 Sendable 类 —— 循环引用边界测试 */
@Sendable
export class CircularNode {
  next: CircularNode | undefined;
  constructor() { this.next = undefined; }
}
