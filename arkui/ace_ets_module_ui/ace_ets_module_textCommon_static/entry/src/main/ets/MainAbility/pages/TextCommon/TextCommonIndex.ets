/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

'use static'

import {
  Entry,
  Component,
  Column,
  Text,
  TextArea,
  Scroll,
  Color,
  MaxLinesMode,
  MaxLinesOptions,
  LineSpacingOptions,
  SelectedDragPreviewStyle
} from '@ohos.arkui.component';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';
import { LengthMetrics } from '@ohos.arkui.node';

@Entry
@Component
struct TextCommonIndex {
  aboutToAppear() {
    try {
      let routerInstance = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', routerInstance);
    } catch (error) {
      console.log('TextCommonIndex error ' + error);
    }
  }

  build() {
    Scroll() {
      Column() {
        // SelectedDragPreviewStyle.color: Color.Blue
        Text('Drag Preview Blue')
          .selectedDragPreviewStyle({ color: Color.Blue } as SelectedDragPreviewStyle)
          .key('textCommonDragPreviewBlue')

        // SelectedDragPreviewStyle.color: undefined
        Text('Drag Preview Undefined')
          .selectedDragPreviewStyle(undefined)
          .key('textCommonDragPreviewUndef')

        // LineSpacingOptions.onlyBetweenLines = true
        Text('Line Spacing onlyBetweenLines true')
          .lineSpacing(LengthMetrics.vp(8), { onlyBetweenLines: true } as LineSpacingOptions)
          .key('textCommonLineSpacingTrue')

        // LineSpacingOptions.onlyBetweenLines = false
        Text('Line Spacing onlyBetweenLines false')
          .lineSpacing(LengthMetrics.vp(8), { onlyBetweenLines: false } as LineSpacingOptions)
          .key('textCommonLineSpacingFalse')

        // MaxLinesOptions.overflowMode = MaxLinesMode.CLIP (0)
        TextArea({ text: 'line1\nline2\nline3\nline4\nline5' })
          .maxLines(3, { overflowMode: MaxLinesMode.CLIP } as MaxLinesOptions)
          .key('textCommonMaxLinesClip')

        // MaxLinesOptions.overflowMode = MaxLinesMode.SCROLL (1)
        TextArea({ text: 'line1\nline2\nline3\nline4\nline5' })
          .maxLines(3, { overflowMode: MaxLinesMode.SCROLL } as MaxLinesOptions)
          .key('textCommonMaxLinesScroll')
      }
      .width('100%')
      .padding({ top: 10, bottom: 10, left: 10, right: 10 })
    }
    .width('100%')
    .height('100%')
  }
}
