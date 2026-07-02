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

import { EditableTitleBarV2, EditableTitleBarStyleV2 } from '@ohos.arkui.advanced.EditableTitleBarV2';
import { Entry, ComponentV2, $r, Column, Text, Scroll, FontWeight, Padding, Color, ColumnOptions, LocalizedPadding, LengthMetrics } from '@kit.ArkUI';
import { SafeAreaType, SafeAreaEdge, BlurStyle } from '@ohos.arkui.component';

@Entry
@ComponentV2
struct EditableTitleBarV2Style {
  build(): void {
    Scroll() {
      Column({ space: 20 } as ColumnOptions) {
        Text('Style Options Test')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .padding({ top: 20, bottom: 20 })

        EditableTitleBarV2({
          title: 'Background Color',
          options: new EditableTitleBarStyleV2({ backgroundColor: Color.Blue })
        })

        EditableTitleBarV2({
          title: 'Blur Style',
          options: new EditableTitleBarStyleV2({ backgroundBlurStyle: BlurStyle.COMPONENT_ULTRA_THICK })
        })

        EditableTitleBarV2({
          title: 'Safe Area',
          options: new EditableTitleBarStyleV2({
            safeAreaTypes: [SafeAreaType.SYSTEM],
            safeAreaEdges: [SafeAreaEdge.TOP]
          })
        })

        EditableTitleBarV2({
          title: 'Content Margin',
          options: new EditableTitleBarStyleV2({
            contentMargin: { start: LengthMetrics.vp(30), end: LengthMetrics.vp(30) } as LocalizedPadding
          })
        })

        EditableTitleBarV2({
          title: 'Combined Style',
          options: new EditableTitleBarStyleV2({
            backgroundColor: Color.White,
            backgroundBlurStyle: BlurStyle.COMPONENT_THICK,
            safeAreaTypes: [SafeAreaType.SYSTEM],
            safeAreaEdges: [SafeAreaEdge.TOP],
            contentMargin: { start: LengthMetrics.vp(20), end: LengthMetrics.vp(20) } as LocalizedPadding
          })
        })
      }
      .width('100%')
      .padding({ left: 20, right: 20 })
    }
    .width('100%')
    .height('100%')
  }
}