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

import { etsIdentity, EtsBox, EtsStoreImpl } from './ets_producer'

export function runEtsFunctionInterop(): number {
  return etsIdentity<number>(42)
}

export function runEtsClassInterop(): string {
  const box = new EtsBox<string>('hello')
  return box.value
}

export function runEtsInterfaceInterop(): string {
  const store = new EtsStoreImpl<number, string>()
  store.set(1, 'a')
  return store.get(1)
}
