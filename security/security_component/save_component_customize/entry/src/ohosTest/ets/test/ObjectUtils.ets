/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

export interface EventDataValue {
  positionX?: string;
  buWidth?: string;
  buHeight?: string;
  rowWidth?: string;
  rowHeight?: string;
}

export class ObjectUtils {
  static assign(target: EventDataValue, source: EventDataValue): EventDataValue {
    if (source.positionX !== undefined) {
      target.positionX = source.positionX;
    }
    if (source.buWidth !== undefined) {
      target.buWidth = source.buWidth;
    }
    if (source.buHeight !== undefined) {
      target.buHeight = source.buHeight;
    }
    if (source.rowWidth !== undefined) {
      target.rowWidth = source.rowWidth;
    }
    if (source.rowHeight !== undefined) {
      target.rowHeight = source.rowHeight;
    }
    return target;
  }
}
