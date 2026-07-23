'use static'
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

class D14 {
  async fetchData(): Promise<string> {
    return "member.data";
  }
}

function fetchData<T extends Object>(this: T): string {
  return "extension.data";
}

export async function symbolAndSyntaxDisambiguation14(): Promise<string> {
  let d14 = new D14();
  let result = await d14.fetchData();
  return result;
}
