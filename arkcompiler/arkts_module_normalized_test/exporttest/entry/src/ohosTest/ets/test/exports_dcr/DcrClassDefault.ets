/*
* Copyright (C) 2025 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { DcrStatus } from './DcrEnumSource'

export class DcrClassWithCtorDefault {
  public readonly name: string = 'DcrClassWithCtorDefault'
  public status: string
  constructor(status: string = DcrStatus.Pending) {
    this.status = status
  }
}

export class DcrClassWithMethodDefault {
  public readonly name: string = 'DcrClassWithMethodDefault'
  public method(status: string = DcrStatus.Inactive): string {
    return status
  }
}

export class DcrClassWithFieldDefault {
  public readonly name: string = 'DcrClassWithFieldDefault'
  public status: string = DcrStatus.Active
  public static staticStatus: string = DcrStatus.Active
}
