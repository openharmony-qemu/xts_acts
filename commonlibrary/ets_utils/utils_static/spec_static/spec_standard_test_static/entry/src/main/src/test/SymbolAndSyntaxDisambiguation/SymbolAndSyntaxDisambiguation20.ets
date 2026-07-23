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

class A {
  bar(): String {
    return "A.bar";
  }
}

function bar<T extends Object>(this: T): String {
  return "bar";
}

interface HasBaseBar {}

class Base {
  inheritedBar(): String {
    return "Base.inheritedBar";
  }
}

class Derived extends Base implements HasBaseBar {}

function inheritedBar(this: HasBaseBar): String {
  return "extension.inheritedBar";
}

interface HasHidden {}

class HiddenBase {
  private hidden(): String {
    return "HiddenBase.hidden";
  }
}

class HiddenDerived extends HiddenBase implements HasHidden {}

function hidden(this: HasHidden): String {
  return "extension.hidden";
}

export let result20_1: string = (new A).bar();
export let result20_2: string = (new Derived).inheritedBar();
export let result20_3: string = (new HiddenDerived).hidden();
