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

class TsUtilityProfile {
  public id: number
  public name: string
  public enabled: boolean

  public constructor(id: number, name: string, enabled: boolean) {
    this.id = id
    this.name = name
    this.enabled = enabled
  }
}

interface TsOptionalProfile {
  id?: number
  name?: string
  enabled?: boolean
}

type TsExcludeResult = Exclude<'id' | 'name' | 'enabled', 'enabled'>
type TsExtractResult = Extract<'id' | 'name' | 'value', 'name' | 'value'>
type TsNonNullableResult = NonNullable<string | null | undefined>
type TsParametersResult = Parameters<(value: number, label: string) => string>
type TsReturnTypeResult = ReturnType<(value: number) => string>
type TsAwaitedResult = Awaited<Promise<number>>
type TsProfileConstructor = new (id: number, name: string, enabled: boolean) => TsUtilityProfile
type TsInstanceTypeResult = InstanceType<TsProfileConstructor>

export function testRecordInTs(): number {
  const scores: Record<string, number> = {
    alpha: 10,
    beta: 20
  }
  return scores['alpha'] + scores['beta']
}

export function testPartialInTs(): string {
  const partialProfile: Partial<TsUtilityProfile> = {
    name: 'partial'
  }
  const optionalProfile: Partial<TsOptionalProfile> = {
    enabled: true
  }
  return partialProfile.name! + ':' + optionalProfile.enabled
}

export function testReadonlyRuntimeNonFreezeInTs(): boolean {
  const readonlyProfile: Readonly<TsUtilityProfile> = new TsUtilityProfile(9, 'readonly', true)
  return Object.isFrozen(readonlyProfile)
}

export function testUtilityTypeMatrixInTs(): string {
  const excluded: TsExcludeResult = 'id'
  const extracted: TsExtractResult = 'name'
  const nonNullable: TsNonNullableResult = 'value'
  const parameters: TsParametersResult = [11, 'param']
  const returned: TsReturnTypeResult = 'return'
  const awaited: TsAwaitedResult = 12
  const instance: TsInstanceTypeResult = new TsUtilityProfile(13, 'instance', true)
  return excluded + ':' + extracted + ':' + nonNullable + ':' + parameters[0] + ':' + returned + ':' + awaited + ':' +
    instance.name
}
