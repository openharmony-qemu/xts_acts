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

class Dog { name: string = "Dog" }
class Cat { name: string = "Cat" }

function whoAmI<T extends Object>(this: T): string {
  return "extension." + (this as (Dog | Cat)).name;
}

let dog = new Dog();
let cat = new Cat();
export let result15_1: string = dog.whoAmI();
export let result15_2: string = cat.whoAmI();

