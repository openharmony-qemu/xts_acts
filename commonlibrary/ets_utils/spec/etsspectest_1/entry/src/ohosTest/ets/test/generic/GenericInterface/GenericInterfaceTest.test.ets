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
import { invokeCallbackIface } from './genericInterfaceTsHelper'


interface Store<K, V> {
  get(key: K): V

  set(key: K, value: V): void
}


interface DefaultContainer<T = string> {
  value: T
}

class StringContainer implements DefaultContainer {
  value: string = 'default-string'
}

function makeDefaultContainer(): StringContainer {
  return new StringContainer()
}

interface MyStore<K, V> {
  get(key: K): V

  set(key: K, value: V): void
}

class MyStoreImpl<K, V> implements MyStore<K, V> {
  private map: Map<K, V> = new Map()

  get(key: K): V {
    return this.map.get(key)!
  }

  set(key: K, value: V): void {
    this.map.set(key, value)
  }
}

interface Holder<T> {
  value: T
}

class HolderImpl<T> implements Holder<T> {
  value: T

  constructor(value: T) {
    this.value = value
  }
}

interface Transformer<T, R> {
  transform(input: T): R
}

class NumberToStringTransformer implements Transformer<number, string> {
  transform(input: number): string {
    return input.toString()
  }
}

class FixtureStoreImpl implements Store<number, string> {
  private map: Map<number, string> = new Map()

  get(key: number): string {
    return this.map.get(key)!
  }

  set(key: number, value: string): void {
    this.map.set(key, value)
  }
}

interface Service {
  process<T>(data: T): T
}

class EchoService implements Service {
  process<T>(data: T): T {
    return data
  }
}

interface SubStore<T> extends Store<number, T> {}

class SubStoreImpl<T> implements SubStore<T> {
  private map: Map<number, T> = new Map()

  get(key: number): T {
    return this.map.get(key)!
  }

  set(key: number, value: T): void {
    this.map.set(key, value)
  }
}

export default function GenericInterfaceTest() {
  describe('GenericInterfaceTest', () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.number    SUB_GENERIC_GI_INTERFACE_0100
     * @tc.name      testgeneric0001
     * @tc.desc      Verify generic interface basic declaration (GTP-GI-001)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testGenericIfaceBasicDecl0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const store = new MyStoreImpl<number, string>()
      store.set(1, 'a')
      expect(store.get(1)).assertEqual('a')
    })

    /**
     * @tc.number    SUB_GENERIC_GI_INTERFACE_0200
     * @tc.name      testgeneric0002
     * @tc.desc      Verify generic interface property uses T (GTP-GI-002)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testGenericIfaceProperty0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const h = new HolderImpl<number>(42)
      expect(h.value).assertEqual(42)
    })

    /**
     * @tc.number    SUB_GENERIC_GI_INTERFACE_0300
     * @tc.name      testgeneric0003
     * @tc.desc      Verify generic interface method params and return use T/R (GTP-GI-003)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testGenericIfaceMethod0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const t = new NumberToStringTransformer()
      expect(t.transform(42)).assertEqual('42')
    })

    /**
     * @tc.number    SUB_GENERIC_GI_INTERFACE_0400
     * @tc.name      testgeneric0004
     * @tc.desc      Verify class implements generic interface (GTP-GI-004)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testClassImplementsGenericIface0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const store = new FixtureStoreImpl()
      store.set(7, 'seven')
      expect(store.get(7)).assertEqual('seven')
    })

    /**
     * @tc.number    SUB_GENERIC_GI_INTERFACE_0500
     * @tc.name      testgeneric0005
     * @tc.desc      Verify non-generic interface declares generic method (GTP-GI-005)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNonGenericIfaceGenericMethod0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const s = new EchoService()
      expect(s.process<number>(42)).assertEqual(42)
    })

    /**
     * @tc.number    SUB_GENERIC_GI_INTERFACE_0600
     * @tc.name      testgeneric0006
     * @tc.desc      Verify generic callback interface constrains invocation (GTP-GI-006). Verified: call signature interface `interface CB<T>{(v:T):void}` in .ets is rejected (arkts-no-call-signatures: Use "class" instead of a type with call signature); CallbackIface moved to .ts helper, .ets calls invokeCallbackIface for runtime assertion.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCallbackIface0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let captured: number = 0
      invokeCallbackIface<number>((v: number) => {
        captured = v
      }, 7)
      expect(captured).assertEqual(7)
    })

    /**
     * @tc.number    SUB_GENERIC_GI_INTERFACE_0700
     * @tc.name      testgeneric0007
     * @tc.desc      Verify generic interface extends and passes T (GTP-GI-007). Boundary: ArkTS support for interface extends with mixed fixed/passed type args TBD. Verify: compile SubStoreImpl usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testIfaceExtendsPassT0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const store = new SubStoreImpl<string>()
      store.set(1, 'a')
      expect(store.get(1)).assertEqual('a')
    })

    /**
     * @tc.number    SUB_GENERIC_GI_INTERFACE_0800
     * @tc.name      testgeneric0008
     * @tc.desc      Verify generic interface default type parameter takes effect (GTP-GI-008). Verified: ArkTS 1.1 supports `interface C<T=string>` in .ets; StringContainer implements DefaultContainer without type arg (default=string).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIfaceDefaultTypeParam0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(makeDefaultContainer().value).assertEqual('default-string')
    })
  })
}
