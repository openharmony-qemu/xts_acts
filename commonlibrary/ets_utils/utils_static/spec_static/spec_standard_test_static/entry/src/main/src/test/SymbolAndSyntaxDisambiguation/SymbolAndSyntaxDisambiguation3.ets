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

class C {
  foo(x: number): number {
    return x * 2;
  }
  
  foo(x: string): string {
    return x + " doubled";
  }
}

function foo<T extends Object>(this: T): string {
  return "extension.foo";
}

let c = new C();
export let result3_1: number = c.foo(5);
export let result3_2: string = c.foo("test");
