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

abstract class AbstractLevelOne {
  abstract getLevel(): string

  concreteBase(): string {
    return "base-concrete"
  }
}

abstract class AbstractLevelTwo extends AbstractLevelOne {
  abstract getExtra(): number
}

class ConcreteLeaf extends AbstractLevelTwo {
  getLevel(): string {
    return "leaf-level"
  }

  getExtra(): number {
    return 42
  }
}

export function testMultiAbstractChain(): string {
  let obj = new ConcreteLeaf()
  return obj.getLevel() + "|" + String(obj.getExtra()) + "|" + obj.concreteBase()
}
