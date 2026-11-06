import { ArkTSUtils, collections } from '@kit.ArkTS';
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

import { BusinessError } from '@ohos.base';

export class SharedCounter {
  private sharedBuffer: collections.ArrayBuffer;
  private sharedArray: collections.Int32Array;

  constructor(initialValue: number) {
    this.sharedBuffer = new collections.ArrayBuffer(4);
    this.sharedArray = new collections.Int32Array(this.sharedBuffer);
    this.sharedArray[0] = initialValue;
  }

  getBuffer(): collections.ArrayBuffer {
    return this.sharedBuffer;
  }

  add(value: number): number {
    return ArkTSUtils.Atomics.add(this.sharedArray, 0, value);
  }

  subtract(value: number): number {
    return ArkTSUtils.Atomics.sub(this.sharedArray, 0, value);
  }

  and(mask: number): number {
    return ArkTSUtils.Atomics.and(this.sharedArray, 0, mask);
  }

  exchange(newValue: number): number {
    return ArkTSUtils.Atomics.exchange(this.sharedArray, 0, newValue);
  }

  getValue(): number {
    return ArkTSUtils.Atomics.load(this.sharedArray, 0);
  }
}

