/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { collections } from '@kit.ArkTS';

@Sendable
export class DataItem {
  id: number = 0
  name: string = ''
  value: number = 0
}

@Sendable
export class ComplexData {
  id: number = 0
  name: string = ''
  valueCount: number = 0
}

@Sendable
export class SharedCounter {
  count: number = 0
}

@Sendable
export class VsSharedData {
  value: number = 0
  name: string = ''
}
