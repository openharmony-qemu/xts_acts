'use static'
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

export default class Utils {
  static async msSleep(count: int): Promise<int> {
    return new Promise<int>((resolve, reject) => {
      setTimeout(() => {
        resolve(0);
      }, count);
    });
  }

  /** BigInt from int (asIntN/asUintN cases within int range). */
  static biInt(n: int): BigInt {
    return BigInt(n);
  }

  /** BigInt from decimal string (values beyond int). */
  static biStr(s: string): BigInt {
    return BigInt(s);
  }

  /** Reconstruct unsigned long string via getULong / fromULong round-trip. */
  static ulongRoundTrip(bi: BigInt): string {
    return BigInt.fromULong(bi.getULong()).toString();
  }

  /** Return a new Record with the given key removed (delete is unsupported in static ArkTS). */
  static recordWithoutKey(target: Record<string, Any>, key: string): Record<string, Any> {
    let result: Record<string, Any> = {} as Record<string, Any>;
    let keys: string[] = Object.keys(target);
    for (let i: int = 0; i < keys.length; i++) {
      let k: string = keys[i];
      if (k !== key) {
        result[k] = target[k];
      }
    }
    return result;
  }

}
