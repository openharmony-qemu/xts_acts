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
struct TextPickerOnEnterSelectedArea {
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
  @State onEnterSingleValue: string = 'init';
  @State onEnterSingleIndex: string = 'init';
  @State onEnterImageValue: string = 'init';
  @State onEnterImageIndex: string = 'init';
  @State onEnterMultiValue: string = 'init';
  @State onEnterMultiIndex: string = 'init';

  build() {
    Column(undefined) {
      TextPicker({ range: this.singleRange })
        .id('textpicker_onenter_single')
        .height('18%')
        .onEnterSelectedArea((value: string | string[], index: number | number[]) => {
          this.onEnterSingleValue = JSON.stringify(value);
          this.onEnterSingleIndex = JSON.stringify(index);
        })
      Text('singleValue:' + this.onEnterSingleValue)
        .id('text_onenter_single_value')
        .fontSize(12)
      Text('singleIndex:' + this.onEnterSingleIndex)
        .id('text_onenter_single_index')
        .fontSize(12)

      TextPicker({ range: this.imageRange })
        .id('textpicker_onenter_image')
        .height('18%')
        .onEnterSelectedArea((value: string | string[], index: number | number[]) => {
          this.onEnterImageValue = JSON.stringify(value);
          this.onEnterImageIndex = JSON.stringify(index);
        })
      Text('imageValue:' + this.onEnterImageValue)
        .id('text_onenter_image_value')
        .fontSize(12)
      Text('imageIndex:' + this.onEnterImageIndex)
        .id('text_onenter_image_index')
        .fontSize(12)

      TextPicker({ range: this.multiRange })
        .id('textpicker_onenter_multi')
        .height('18%')
        .onEnterSelectedArea((value: string | string[], index: number | number[]) => {
          this.onEnterMultiValue = JSON.stringify(value);
          this.onEnterMultiIndex = JSON.stringify(index);
        })
      Text('multiValue:' + this.onEnterMultiValue)
        .id('text_onenter_multi_value')
        .fontSize(12)
      Text('multiIndex:' + this.onEnterMultiIndex)
        .id('text_onenter_multi_index')
        .fontSize(12)

      TextPicker({ range: this.singleRange })
        .id('textpicker_onenter_undefined')
        .height('10%')
        .onEnterSelectedArea(undefined)
    }.width('100%').height('100%')
  }
}
