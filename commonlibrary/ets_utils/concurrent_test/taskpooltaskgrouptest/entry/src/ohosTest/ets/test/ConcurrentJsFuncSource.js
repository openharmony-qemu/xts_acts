/*
 * Copyright (c) 2026 RKH Corp.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * 'use concurrent' functions defined in a .js source file.
 * Exercises extended support for 'use concurrent' in .js files.
 */
export function jsConcurrentDouble(input) {
  'use concurrent'
  return input * 2
}

export function jsConcurrentAdd(a, b) {
  'use concurrent'
  return a + b
}

export function jsConcurrentStringLength(s) {
  'use concurrent'
  return s.length
}
