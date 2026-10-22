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

import { ArkTSUtils } from '@kit.ArkTS';

@Sendable
export class SupLruChildA001 extends ArkTSUtils.SendableLruCache<number, number> {
  createDefault(key: number): number | undefined {
    return -1;
  }
}

@Sendable
export class SupLruChildB001 extends SupLruChildA001 {
  createDefault(key: number): number | undefined {
    return -2;
  }
}
