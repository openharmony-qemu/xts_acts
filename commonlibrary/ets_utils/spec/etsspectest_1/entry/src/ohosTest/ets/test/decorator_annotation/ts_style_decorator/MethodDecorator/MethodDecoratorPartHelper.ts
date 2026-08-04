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

class MethodDecoratorTsTrace {
  public value: string = ''
  public key: string = ''
  public count: number = 0

  public record(value: string, key: string): void {
    this.value = value
    this.key = key
    this.count++
  }
}

function methodDecoratorTsResult(trace: MethodDecoratorTsTrace, methodValue: string): string {
  return trace.value + ':' + trace.key + ':' + trace.count.toString() + ':' + methodValue
}

export function testMethodDecoratorSymbolComputedMethodKeyInTs(): string {
  const symbolComputedKeyTrace: MethodDecoratorTsTrace = new MethodDecoratorTsTrace()
  const symbolMethodKey: unique symbol = Symbol('testMethod')

  function symbolComputedMethodKeyDecorator(
    _target: Object,
    key: string | symbol,
    _descriptor: PropertyDescriptor
  ): void {
    symbolComputedKeyTrace.record('symbolComputedKey', String(key))
  }

  class MethodDecoratorSymbolComputedMethodKeyTsCase {
    @symbolComputedMethodKeyDecorator
    public [symbolMethodKey](): string {
      return 'symbolComputedKeyReturn'
    }
  }

  const obj: MethodDecoratorSymbolComputedMethodKeyTsCase = new MethodDecoratorSymbolComputedMethodKeyTsCase()
  return methodDecoratorTsResult(symbolComputedKeyTrace, obj[symbolMethodKey]())
}
