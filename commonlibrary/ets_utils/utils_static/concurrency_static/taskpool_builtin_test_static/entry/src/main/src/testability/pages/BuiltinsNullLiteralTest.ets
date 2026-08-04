'use static';
/*
 * Copyright (c) 2026 RKH Corp.
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

export function BuiltinsNullLiteralTest0900(): void {
  let TAG='BuiltinsNullLiteralTest'
  try {
    let value1 = null;
    let value2 = 'notNull';
    let logicalOrResult = value1 || value2 || null;
    let logicalAndResult = value1 && value2 && null;
    if(logicalOrResult != 'notNull' || logicalAndResult != null){
      throw new Error(`${TAG} value.toString() invalid: ${logicalOrResult}`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}