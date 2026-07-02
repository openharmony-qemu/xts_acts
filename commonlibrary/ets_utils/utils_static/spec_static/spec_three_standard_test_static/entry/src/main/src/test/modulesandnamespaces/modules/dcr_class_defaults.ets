'use static';
/*
* Copyright (c) 2024-2026 Huawei Device Co., Ltd.
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
import { DcrEnum } from "./dcr_enum"

export class DcrCtorDefaultClass {
  value: int

  constructor(v: DcrEnum = DcrEnum.one) {
    this.value = 1
  }
}

export class DcrFieldInitClass {
  private value: DcrEnum = DcrEnum.one
  private static staticValue: DcrEnum = DcrEnum.zero

  getValue(): int {
    return 1
  }

  static getStaticValue(): int {
    return 0
  }
}

export class DcrMethodDefaultClass {
  method(v: DcrEnum = DcrEnum.one): int {
    return 1
  }
}

export class DcrMethodOverrideBase {
  method(v: DcrEnum = DcrEnum.zero): int {
    return 0
  }
}

export class DcrMethodOverrideDerived extends DcrMethodOverrideBase {
  override method(v: DcrEnum = DcrEnum.one): int {
    return 1
  }
}

export class DcrExportedClassSymbol {
  value: int = 1
}

export interface DcrExportedInterfaceSymbol {
  getValue(): int
}

