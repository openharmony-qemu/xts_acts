'use static'
/*
* Copyright (c) 2024-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
*/
export class DcrAliasPrivateA {
  value: int = 1
}

export class DcrAliasPrivateB {
  value: int = 2
}

// @expect-error: ESE1236581 Type 'DcrAliasPrivateA' used in export declaration(s) is not exported.
// @expect-error: ESE1236581 Type 'DcrAliasPrivateB' used in export declaration(s) is not exported.
export type DcrPrivateUnion = DcrAliasPrivateA | DcrAliasPrivateB

export function dcrUseBadPrivateUnion(v: DcrPrivateUnion): int {
  return 1
}
