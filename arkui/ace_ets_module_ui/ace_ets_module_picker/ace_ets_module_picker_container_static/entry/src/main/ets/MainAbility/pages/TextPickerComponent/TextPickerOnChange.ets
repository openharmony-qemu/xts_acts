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
struct TextPickerOnChange {
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
  @State onChangeSingleValue: string = 'init';
  @State onChangeSingleIndex: string = 'init';
  @State onChangeImageValue: string = 'init';
  @State onChangeImageIndex: string = 'init';
  @State onChangeMultiValue: string = 'init';
  @State onChangeMultiIndex: string = 'init';

  build() {
    Column(undefined) {
      TextPicker({ range: this.singleRange })
        .id('textpicker_onchange_single')
        .height('18%')
        .onChange((selectItem: string | string[], index: number | number[]) => {
          this.onChangeSingleValue = JSON.stringify(selectItem);
          this.onChangeSingleIndex = JSON.stringify(index);
        })
      Text('singleValue:' + this.onChangeSingleValue)
        .id('text_onchange_single_value')
        .fontSize(12)
      Text('singleIndex:' + this.onChangeSingleIndex)
        .id('text_onchange_single_index')
        .fontSize(12)

      TextPicker({ range: this.imageRange })
        .id('textpicker_onchange_image')
        .height('18%')
        .onChange((selectItem: string | string[], index: number | number[]) => {
          this.onChangeImageValue = JSON.stringify(selectItem);
          this.onChangeImageIndex = JSON.stringify(index);
        })
      Text('imageValue:' + this.onChangeImageValue)
        .id('text_onchange_image_value')
        .fontSize(12)
      Text('imageIndex:' + this.onChangeImageIndex)
        .id('text_onchange_image_index')
        .fontSize(12)

      TextPicker({ range: this.multiRange })
        .id('textpicker_onchange_multi')
        .height('18%')
        .onChange((selectItem: string | string[], index: number | number[]) => {
          this.onChangeMultiValue = JSON.stringify(selectItem);
          this.onChangeMultiIndex = JSON.stringify(index);
        })
      Text('multiValue:' + this.onChangeMultiValue)
        .id('text_onchange_multi_value')
        .fontSize(12)
      Text('multiIndex:' + this.onChangeMultiIndex)
        .id('text_onchange_multi_index')
        .fontSize(12)

      TextPicker({ range: this.singleRange })
        .id('textpicker_onchange_undefined')
        .height('10%')
        .onChange(undefined)
    }.width('100%').height('100%')
  }
}
