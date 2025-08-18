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
import {
  Entry,
  Column,
  Component,
  Button,
  Text,
  Row,
  Color,
  $r,
  PixelMap,
  ImageSpan,
  TextArea,
  ImageSpanAttribute,
  AttributeModifier,
  ColumnOptions
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';








@Entry
@Component
struct ImageSpanModifier1 {
  @State value: string = 'init'
  @State imageAlt: PixelMap | undefined = undefined

  

  aboutToAppear(): void {
    
  }

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Text() {
        ImageSpan($r('app.media.icon'))
        
          .id('ImageSpanModifier_get_Size_width')
          .alt(this.imageAlt)
          .height('20%')
      }

      TextArea({ text: this.value })
        .id('ImageSpanModifier_get_type')
        .height('10%')
    }
  }
}