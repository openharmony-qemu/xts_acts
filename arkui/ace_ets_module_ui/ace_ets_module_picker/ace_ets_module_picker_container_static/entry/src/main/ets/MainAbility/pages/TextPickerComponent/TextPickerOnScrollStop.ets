'use static';
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
import {
  Entry,
  Column,
  Component,
  Row,
  Color,
  Text,
  TextPicker,
  TextPickerRangeContent,
  $r
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct TextPickerOnScrollStop {
  private singleRange: string[] = ['apple1', 'orange2', 'peach3', 'grape4'];
  private multiRange: string[][] = [
    ['apple1', 'apple2', 'apple3', 'apple4'],
    ['orange1', 'orange2', 'orange3', 'orange4']
  ];
  private imageRange: TextPickerRangeContent[] = [
    { icon: $r('app.media.startIcon') },
    { icon: $r('app.media.startIcon') },
    { icon: $r('app.media.startIcon') },
    { icon: $r('app.media.startIcon') }
  ];
  @State onScrollStopSingleValue: string = 'init';
  @State onScrollStopSingleIndex: string = 'init';
  @State onScrollStopImageValue: string = 'init';
  @State onScrollStopImageIndex: string = 'init';
  @State onScrollStopMultiValue: string = 'init';
  @State onScrollStopMultiIndex: string = 'init';

  build() {
    Column(undefined) {
      TextPicker({ range: this.singleRange })
        .id('textpicker_onscrollstop_single')
        .height('18%')
        .onScrollStop((value: string | string[], index: number | number[]) => {
          this.onScrollStopSingleValue = JSON.stringify(value);
          this.onScrollStopSingleIndex = JSON.stringify(index);
        })
      Text('singleValue:' + this.onScrollStopSingleValue)
        .id('text_onscrollstop_single_value')
        .fontSize(12)
      Text('singleIndex:' + this.onScrollStopSingleIndex)
        .id('text_onscrollstop_single_index')
        .fontSize(12)

      TextPicker({ range: this.imageRange })
        .id('textpicker_onscrollstop_image')
        .height('18%')
        .onScrollStop((value: string | string[], index: number | number[]) => {
          this.onScrollStopImageValue = JSON.stringify(value);
          this.onScrollStopImageIndex = JSON.stringify(index);
        })
      Text('imageValue:' + this.onScrollStopImageValue)
        .id('text_onscrollstop_image_value')
        .fontSize(12)
      Text('imageIndex:' + this.onScrollStopImageIndex)
        .id('text_onscrollstop_image_index')
        .fontSize(12)

      TextPicker({ range: this.multiRange })
        .id('textpicker_onscrollstop_multi')
        .height('18%')
        .onScrollStop((value: string | string[], index: number | number[]) => {
          this.onScrollStopMultiValue = JSON.stringify(value);
          this.onScrollStopMultiIndex = JSON.stringify(index);
        })
      Text('multiValue:' + this.onScrollStopMultiValue)
        .id('text_onscrollstop_multi_value')
        .fontSize(12)
      Text('multiIndex:' + this.onScrollStopMultiIndex)
        .id('text_onscrollstop_multi_index')
        .fontSize(12)

      TextPicker({ range: this.singleRange })
        .id('textpicker_onscrollstop_undefined')
        .height('10%')
        .onScrollStop(undefined)
    }.width('100%').height('100%')
  }
}
