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
import { Entry,Component,$r,Column,ColumnOptions,BorderImageOption,BorderOptions,AdaptiveColor,BackgroundEffectOptions,BorderStyle,RepeatMode,GradientDirection,Image,Checkbox,Blank,MarkStyle,ResourceColor,CheckboxGroup,Text,Toggle,ToggleType,FlexAlign,Color,Flex,ButtonType,FlexDirection,ItemAlign,Row,Button,ClickEvent,Week,FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle, CalendarAlign, Date, CalendarPicker,EdgeEffect,Curve,SwiperDisplayMode,ArrowPosition, Select,BlurStyle,MenuAlignType,TextInputController,TextAlign,AlphabetIndexer} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,
} from '@ohos.arkui.stateManagement';








@Entry
@Component
struct CommonExample {
  private arr: number[] = new Array<number>(0, 1, 2, 3, 4, 5, 6, 7)
  private mBorderImage: BorderImageOption = {
    source: { angle: 90,
      direction: GradientDirection.Right,
      colors: [[0xAEE1E1, 0.5], [0xD3E0DC, 0.7], [0xFCD1D1, 1.0]]
    },
    slice: 12,
    width: 21,
    repeat: RepeatMode.Repeat,
    outset: 3,
    fill: false
  } as BorderImageOption

  private mBorder: BorderOptions = {
		width: { left: 3, right: 6, top: 10, bottom: 15 },
		color: { left: '#FF000000', right: '#FF000000', top: '#FF0F0F0F', bottom: '#FFF0F0F0' },
		radius: { topLeft: 10, topRight: 20, bottomLeft: 40, bottomRight: 80 },
		style: {
			left: BorderStyle.Dashed,
			right: BorderStyle.Dotted,
			top: BorderStyle.Solid,
			bottom: BorderStyle.Dashed
		}
  } as BorderOptions

  private mBackgroundEffect:
    BackgroundEffectOptions = {
      radius: 50,
      saturation: 20,
      brightness: 200,
      color: Color.Green,
      adaptiveColor: AdaptiveColor.DEFAULT,
      blurOptions: { grayscale: [1, 1] }
    } as BackgroundEffectOptions

































































  build() {
    Column({ space: 5 } as ColumnOptions) {

      Button('First Button')
        .key("buttonModifier")
        
        


      Text("Modifier自定义")
        .key("textModifier")
        
        
        


      Text("Modifier自定义2")
        .key("textModifier2")
        
        


      Text("Modifier自定义3")
        .key("textModifier3")
        
        


      Image($r('app.media.icon'))
        .key("imageModifier")
        
        
        


      Row()
        .key("rowModifier")
        .width(144)
        .height(144)
        
        


      Button("2nd button")
        .key("buttonModifier2")
        

        

    }
    .margin({ top: 5 } as Margin)
  }
}