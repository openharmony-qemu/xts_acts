'use static';
/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
export default class Utils{
  static async msSleep(count:int) : Promise<int> {
    return new Promise<int>((resolve, reject) => {
      setTimeout(() => {
        resolve(0)
      }, count)
    })
  }

  /**
   * Read BusinessError.code from a catch payload without ESObject / BusinessError casts
   * (static ArkTS rejects (e as ESObject).code with ESE0087).
   * Use substring(i,i+1) not charAt: CI static charAt returns Char (ESE0105/ESE0318).
   */
  static errorCode(e: Object): number {
    let text: string = JSON.stringify(e);
    let key: string = '"code":';
    let at: int = text.indexOf(key);
    if (at < 0) {
      return 0;
    }
    let i: int = at + key.length;
    while (i < text.length && text.substring(i, i + 1) === ' ') {
      i++;
    }
    let code: number = 0;
    let hasDigit: boolean = false;
    while (i < text.length) {
      let ch: string = text.substring(i, i + 1);
      if (ch < '0' || ch > '9') {
        break;
      }
      hasDigit = true;
      code = code * 10 + Number(ch);
      i++;
    }
    if (!hasDigit) {
      return 0;
    }
    return code;
  }
}