'use static';
/*
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
// import { ArcSlider, ArcSliderOptions, ArcSliderPosition, ArcSliderValueOptions, ArcSliderLayoutOptions, ArcSliderStyleOptions,
//   ArcSliderValueOptionsConstructorOptions, ArcSliderLayoutOptionsConstructorOptions, ArcSliderStyleOptionsConstructorOptions,
//   ArcSliderOptionsConstructorOptions } from '@ohos.arkui.advanced.ArcSlider'
import { Entry, ComponentV2, Scroll, Scroller, Column, List, ListItem, Color, ColumnOptions } from '@ohos.arkui.component'

@Entry
@ComponentV2
struct ArcSlider1 {
  scroll: Scroller = new Scroller()

  // valueOptionsConstructorOptions: ArcSliderValueOptionsConstructorOptions = {
  //   progress: 50,
  //   min: 5,
  //   max: 95
  // }
  //
  // layoutOptionsConstructorOptions: ArcSliderLayoutOptionsConstructorOptions = {
  //   reverse: true,
	//   position: ArcSliderPosition.LEFT
  // }
  //
  // styleOptionsConstructorOptions: ArcSliderStyleOptionsConstructorOptions = {
  //   trackThickness: 8,
  //   activeTrackThickness: 20,
  //   trackColor: '#999999',
  //   selectedColor: '#00FF00',
  //   trackBlur: 20
  // }
  // valueOptions: ArcSliderValueOptions = new ArcSliderValueOptions(this.valueOptionsConstructorOptions)
  // layoutOptions: ArcSliderLayoutOptions = new ArcSliderLayoutOptions(this.layoutOptionsConstructorOptions)
  // styleOptions: ArcSliderStyleOptions = new ArcSliderStyleOptions(this.styleOptionsConstructorOptions)
  // arcSliderOptionsConstructorOptions: ArcSliderOptionsConstructorOptions = {
  //   valueOptions: this.valueOptions,
  //   layoutOptions: this.layoutOptions,
  //   styleOptions: this.styleOptions,
  //   digitalCrownSensitivity:CrownSensitivity.LOW,
  //   onTouch: (event: TouchEvent) => {
  //   },
  //   onChange: (value: number) => {
  //   }
  // }
  // arcSliderOptions: ArcSliderOptions = new ArcSliderOptions(this.arcSliderOptionsConstructorOptions)

  build() {
    Scroll(this.scroll) {
      Column({ space: 5 } as ColumnOptions) {
        List({ space: 5, initialIndex: 0 }) {
          ListItem() {
            // ArcSlider().key('arcSliderTest001')
          }.backgroundColor(Color.Black)
        }
      }
    }
  }
}