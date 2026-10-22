'use static';

/**
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

import { Entry, Component, Column, Text, Color, LayoutPolicy } from '@kit.ArkUI';
import { ImmersiveStrategy } from '@kit.ArkUI';

@Entry
@Component
struct UIContextApplyDefaultImmersiveStrategyNonEmptyArray {
  aboutToAppear(): void {
    let strategies: ImmersiveStrategy[] = [ImmersiveStrategy.AVOID_CUTOUT, ImmersiveStrategy.AVOID_FLOAT_NAV];
    this.getUIContext().applyDefaultImmersiveStrategy(...strategies);
  }

  build() {
    Column() {
      Column() {
        Text('AC-2.5 non-empty array content')
      }
      .id('non_empty_array_content')
      .width(LayoutPolicy.matchParent)
      .height(LayoutPolicy.matchParent)
      .backgroundColor(Color.Red)
    }
    .width(LayoutPolicy.matchParent)
    .height(LayoutPolicy.matchParent)
  }
}
