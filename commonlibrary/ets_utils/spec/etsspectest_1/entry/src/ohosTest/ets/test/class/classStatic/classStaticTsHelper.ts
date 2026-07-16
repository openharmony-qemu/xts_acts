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

class StaticThisAccess {
  static baseValue: number = 10

  static getValue(): number {
    return this.baseValue
  }

  static multiply(factor: number): number {
    return this.baseValue * factor
  }
}

export function getStaticThisValue(): number {
  return StaticThisAccess.getValue()
}

export function getStaticThisMultiplied(factor: number): number {
  return StaticThisAccess.multiply(factor)
}

/*
* Static computed getter/setter -- computed
 */
class StaticComputedAccessor {
  private static _internal: string = "init-value"
  private static _flag: boolean = false

  static get ["status"](): string {
    return StaticComputedAccessor._internal
  }

  static set ["status"](v: string) {
    StaticComputedAccessor._internal = v
  }

  static get ["active"](): boolean {
    return StaticComputedAccessor._flag
  }

  static set ["active"](v: boolean) {
    StaticComputedAccessor._flag = v
  }
}

export function testStaticComputedGet(): string {
  return StaticComputedAccessor.status
}

export function testStaticComputedSet(): string {
  StaticComputedAccessor.status = "new-value"
  return StaticComputedAccessor.status
}

/*
* Multiple static blocks -- ArkTS only
 */
class MultiStaticBlock {
  static step1: number = 0
  static step2: number = 0
  static step3: number = 0
  static {
    MultiStaticBlock.step1 = 10
  }
  static {
    MultiStaticBlock.step2 = MultiStaticBlock.step1 * 2
  }
  static {
    MultiStaticBlock.step3 = MultiStaticBlock.step2 + 5
  }
}

export function testMultiStaticBlockResult(): string {
  return String(MultiStaticBlock.step1) + "|" + String(MultiStaticBlock.step2) + "|" + String(MultiStaticBlock.step3)
}
