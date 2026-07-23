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

  static get ["status"](): string {
    return StaticComputedAccessor._internal
  }

  static set ["status"](v: string) {
    StaticComputedAccessor._internal = v
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
 * Multiple static blocks -- ArkTS-Dyn/ECMAScript (ArkTS Static permits a single block)
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

/*
 * Static block inheritance: child access triggers parent static block
 * NOTE: StaticBlockChild.parentValue accesses inherited static field,
 * which may be rejected by ArkTS static mode. Works in dynamic mode (XTS).
 */
class StaticBlockParent {
  static parentValue: number = 0
  static {
    StaticBlockParent.parentValue = 100
  }
}

class StaticBlockChild extends StaticBlockParent {
  static childValue: number = 0
  static {
    StaticBlockChild.childValue = StaticBlockParent.parentValue + 50
  }
}

export function testStaticBlockInheritance(): string {
  return String(StaticBlockChild.parentValue) + "|" + String(StaticBlockChild.childValue)
}

/*
 * Static field + static block mixed order
 */
class MixedStaticOrder {
  static first: number = 10
  static second: number = 0
  static {
    MixedStaticOrder.second = MixedStaticOrder.first * 2
  }
  static third: number = MixedStaticOrder.second + 5
}

export function testStaticMixedOrder(): string {
  return String(MixedStaticOrder.first) + "|" + String(MixedStaticOrder.second) + "|" + String(MixedStaticOrder.third)
}

/*
 * Static inheritance -- moved from .ets to avoid compile rejection in ArkTS static mode.
 * TS/ArkTS-Dyn: Child class references parent static members via child class name.
 */
class StaticParent {
  static parentField: string = 'parent-field'
  static parentMethod(): string {
    return 'parent-method'
  }
}

class StaticChild extends StaticParent {
}

export function testStaticInheritance(): string {
  return StaticChild.parentField + "|" + StaticChild.parentMethod()
}
