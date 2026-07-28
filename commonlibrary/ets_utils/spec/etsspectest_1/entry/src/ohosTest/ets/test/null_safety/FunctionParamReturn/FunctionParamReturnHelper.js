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

/*
 * JavaScript helper for FunctionParamReturn tests
 * ECMA-262 FunctionDeclarationInstantiation §10.2.11, ClassFieldDefinitionEvaluation §15.7.10
 * ArkTS/TS strict: null as string assertion
 * JS: all patterns execute as specified by ECMA-262
 */

export function defaultParamWithNull(a) {
  function combine(a, b = 'default') { return a + b }
  return combine(a, null)
}
