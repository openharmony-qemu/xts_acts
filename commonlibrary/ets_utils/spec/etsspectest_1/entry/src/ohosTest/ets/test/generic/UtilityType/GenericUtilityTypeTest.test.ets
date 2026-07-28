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
import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '@ohos/hypium';
import {
  testPartialInTs,
  testReadonlyRuntimeNonFreezeInTs,
  testRecordInTs,
  testUtilityTypeMatrixInTs
} from './genericUtilityTypeTsHelper'

class UtilityPair<K, V> {
  public first: K
  public second: V

  public constructor(first: K, second: V) {
    this.first = first
    this.second = second
  }
}

class UtilityProfile {
  public id: number
  public name: string
  public enabled: boolean

  public constructor(id: number, name: string, enabled: boolean) {
    this.id = id
    this.name = name
    this.enabled = enabled
  }
}

interface UtilityOptionalProfile {
  id?: number
  name?: string
  enabled?: boolean
}

class UtilityNumberStore {
  private data: Map<string, number> = new Map<string, number>()

  public get(key: string): number {
    return this.data.get(key)!
  }

  public set(key: string, value: number): void {
    this.data.set(key, value)
  }
}

function firstElement<T>(values: T[]): T {
  return values[0]
}

function arrayCount<T>(values: Array<T>): number {
  return values.length
}

async function resolveGenericValue<T>(value: T): Promise<T> {
  return value
}

function maybeGenericValue<T>(value: T | null | undefined): T | null | undefined {
  return value
}

export default function GenericUtilityTypeTest() {
  describe('GenericUtilityTypeTest', () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.number    SUB_GENERIC_UT_UTILITY_0100
     * @tc.name      testArrayGenericContainer0001
     * @tc.desc      Verify T[] keeps number element type when reading first item (GTP-UT-001)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayGenericContainer0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const numbers: number[] = [1, 2, 3]
      expect(firstElement<number>(numbers)).assertEqual(1)
    })

    /**
     * @tc.number    SUB_GENERIC_UT_UTILITY_0200
     * @tc.name      testArrayGenericContainer0002
     * @tc.desc      Verify Array<T> keeps string element container length behavior (GTP-UT-001)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
      it('testArrayGenericContainer0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        const names: Array<string> = ['alpha', 'beta']
        expect(arrayCount<string>(names)).assertEqual(2)
        expect(names[0]).assertEqual('alpha')
        expect(names[1]).assertEqual('beta')
      })

    /**
     * @tc.number    SUB_GENERIC_UT_UTILITY_0300
     * @tc.name      testArrayGenericContainer0003
     * @tc.desc      Verify Array<UtilityPair<K,V>> keeps nested generic value type (GTP-UT-001)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayGenericContainer0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pairs: Array<UtilityPair<string, number>> = [new UtilityPair<string, number>('age', 18)]
      expect(pairs[0].second).assertEqual(18)
    })

    /**
     * @tc.number    SUB_GENERIC_UT_UTILITY_0400
     * @tc.name      testPromiseGeneric0001
     * @tc.desc      Verify Promise<T> resolve/await type and value in raw ETS (GTP-UT-002)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPromiseGeneric0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const resolved: number = await resolveGenericValue<number>(42)
      expect(resolved).assertEqual(42)
    })

    /**
     * @tc.number    SUB_GENERIC_UT_UTILITY_0500
     * @tc.name      testMapGeneric0001
     * @tc.desc      Verify Map<K,V> returns value by generic string key (GTP-UT-003)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMapGeneric0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const scores: Map<string, number> = new Map<string, number>()
      scores.set('one', 1)
      expect(scores.get('one')).assertEqual(1)
    })

    /**
     * @tc.number    SUB_GENERIC_UT_UTILITY_0600
     * @tc.name      testMapGeneric0002
     * @tc.desc      Verify Map<K,V> keeps generic key lookup behavior (GTP-UT-003)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMapGeneric0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const scores: Map<string, number> = new Map<string, number>()
      scores.set('two', 2)
      expect(scores.has('two')).assertTrue()
    })

    /**
     * @tc.number    SUB_GENERIC_UT_UTILITY_0700
     * @tc.name      testMapGeneric0003
     * @tc.desc      Verify local generic key/value store returns value by string key (GTP-UT-003)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMapGeneric0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const store: UtilityNumberStore = new UtilityNumberStore()
      store.set('stored', 7)
      expect(store.get('stored')).assertEqual(7)
    })

    /**
     * @tc.number    SUB_GENERIC_UT_UTILITY_0800
     * @tc.name      testRecordUtilityType0001
     * @tc.desc      Verify Record<K,V> utility type result through TS helper (GTP-UT-004)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRecordUtilityType0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testRecordInTs()).assertEqual(30)
    })

    /**
     * @tc.number    SUB_GENERIC_UT_UTILITY_0900
     * @tc.name      testPartialUtilityType0001
     * @tc.desc      Verify Partial<T> class/interface assignment result through TS helper (GTP-UT-005)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPartialUtilityType0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testPartialInTs()).assertEqual('partial:true')
    })

    /**
     * @tc.number    SUB_GENERIC_UT_UTILITY_1000
     * @tc.name      testRequiredUtilityType0001
     * @tc.desc      Verify Required<T> keeps required string member readable (GTP-UT-006)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRequiredUtilityType0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const completeProfile: Required<UtilityOptionalProfile> = {
        id: 7,
        name: 'required',
        enabled: true
      }
      expect(completeProfile.name).assertEqual('required')
    })

    /**
     * @tc.number    SUB_GENERIC_UT_UTILITY_1100
     * @tc.name      testRequiredUtilityType0002
     * @tc.desc      Verify Required<T> keeps converted boolean member required and readable (GTP-UT-006)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRequiredUtilityType0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const completeProfile: Required<UtilityOptionalProfile> = {
        id: 8,
        name: 'required-enabled',
        enabled: true
      }
      expect(completeProfile.enabled).assertTrue()
    })

    /**
     * @tc.number    SUB_GENERIC_UT_UTILITY_1200
     * @tc.name      testReadonlyUtilityType0001
     * @tc.desc      Verify Readonly<T> allows reading readonly member value (GTP-UT-007)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testReadonlyUtilityType0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const readonlyProfile: Readonly<UtilityProfile> = new UtilityProfile(9, 'readonly', true)
      expect(readonlyProfile.name).assertEqual('readonly')
    })

    /**
     * @tc.number    SUB_GENERIC_UT_UTILITY_1300
     * @tc.name      testReadonlyUtilityType0002
     * @tc.desc      Verify Readonly<T> does not imply Object.freeze at runtime through TS helper (GTP-UT-007)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testReadonlyUtilityType0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(!testReadonlyRuntimeNonFreezeInTs()).assertTrue()
    })

    /**
     * @tc.number    SUB_GENERIC_UT_UTILITY_1400
     * @tc.name      testUtilityTypeMatrix0001
     * @tc.desc      Verify Exclude/Extract/NonNullable/Parameters/ReturnType/Awaited/InstanceType matrix through TS helper (GTP-UT-011)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testUtilityTypeMatrix0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testUtilityTypeMatrixInTs()).assertEqual('id:name:value:11:return:12:instance')
    })

    /**
     * @tc.number    SUB_GENERIC_UT_UTILITY_1500
     * @tc.name      testNullishGenericReturn0001
     * @tc.desc      Verify generic return preserves concrete value in T | null | undefined union (GTP-UT-012)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNullishGenericReturn0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const present: number | null | undefined = maybeGenericValue<number>(21)
      expect(present).assertEqual(21)
    })

    /**
     * @tc.number    SUB_GENERIC_UT_UTILITY_1600
     * @tc.name      testNullishGenericReturn0002
     * @tc.desc      Verify generic return preserves null in T | null | undefined union (GTP-UT-012)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNullishGenericReturn0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const nullable: number | null | undefined = maybeGenericValue<number>(null)
      expect(nullable).assertEqual(null)
    })

    /**
     * @tc.number    SUB_GENERIC_UT_UTILITY_1700
     * @tc.name      testNullishGenericReturn0003
     * @tc.desc      Verify generic return preserves undefined in T | null | undefined union (GTP-UT-012)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNullishGenericReturn0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const missing: number | null | undefined = maybeGenericValue<number>(undefined)
      expect(missing).assertEqual(undefined)
    })
  })
}
