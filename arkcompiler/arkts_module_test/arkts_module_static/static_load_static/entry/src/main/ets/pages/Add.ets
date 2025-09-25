'use static'
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import hilog from '@ohos.hilog'

export class Calc {
  native add(arg1: int, arg2: int): int;
  native addDouble(arg1: double, arg2: double): double;
  native addNumber(arg1: number, arg2: number): number;
  native addString(arg1: string): string;
}

export function loadLibraryEntry(){
  try {
    loadLibrary('entry');
    return true;
  } catch (e: Error) {
    hilog.error(0x0000, 'ModuleTest', `loadLibrary [entry] Failed,e = ${e.message}`);
  }
  return false;
}
