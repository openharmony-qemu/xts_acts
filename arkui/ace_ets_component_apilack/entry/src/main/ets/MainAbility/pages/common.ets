/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import Log from '../common/Log';
import inputEventClient from '@ohos.multimodalInput.inputEventClient';

const TAG = 'ets_apiLack_add';

@Entry
@Component
struct CommonBackgroundBlurStyle {
  @State value: string = ''

  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear CommonBackgroundBlurStyle start`)
  }

  aboutToDisappear() {
    Log.showInfo(TAG, `aboutToDisAppear CommonBackgroundBlurStyle end`)
  }

  onPageHide(): void {
    Log.showInfo(TAG, `onPageHide CommonBackgroundBlurStyle start`)
  }

  onBackPress(): void {
    Log.showInfo(TAG, `onBackPress CommonBackgroundBlurStyle start`)
  }

  @Styles
  pressedStyles() {
    .backgroundColor('red')
    .opacity(1)
  }

  buttonTab() {
    let keyEventDown: inputEventClient.KeyEvent = {
      isPressed: true,
      keyCode: 2049,
      keyDownDuration: 0,
      isIntercepted: false
    }
    

    let keyEventUp: inputEventClient.KeyEvent = {
      isPressed: false,
      keyCode: 2049,
      keyDownDuration: 0,
      isIntercepted: false
    }
    
  }


  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {

      Text("common-BackgroundBlurStyle")
        .width(320)
        .height(50)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("common_backgroundBlurStyleText")
        .backgroundBlurStyle(BlurStyle.Thick)

      Text("common-BorderImage")
        .width(320)
        .height(50)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("common_borderImageText")
        .borderImage({
          source: {
            angle: 90,
            direction: GradientDirection.Left,
            colors: [[0xAEE1E1, 0.0], [0xD3E0DC, 0.3], [0xFCD1D1, 1.0]]
          },
          slice: { top: 10, bottom: 10, left: 10, right: 10 },
          width: { top: "10px", bottom: "10px", left: "10px", right: "10px" },
          repeat: RepeatMode.Stretch,
          fill: false
        })

      Text("common-HoverEffectHighlight")
        .width(320)
        .height(50)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("common_hoverEffectText")
        .hoverEffect(HoverEffect.Highlight)

      Text("common-HoverEffectScale")
        .width(320)
        .height(50)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("common_hoverEffectScaleText")
        .hoverEffect(HoverEffect.Scale)

      Text("common-OnKeyEvent")
        .width(320)
        .height(50)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("common_onKeyEventText")


      Text("common-TabIndex")
        .width(320)
        .height(50)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("common_tabIndexText")
        .tabIndex(1)

      Text("common-ParallelGesture" + '\n' + this.value)
        .width(320)
        .height(100)
        .fontSize(12)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(15)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("common_parallelGestureText")
        .parallelGesture(TapGesture().onAction(() => {
          // 并行手势
          this.value = 'gesture onAction'
        }))

      Text("common-Sepia")
        .width(320)
        .height(50)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("common_sepiaText")
        .backgroundColor('#E78282')
        .sepia(1)

      Button('Button 1')
        .id('target')

      Text("common-AlignRules")
        .width(260)
        .height(50)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("common_alignRulesText")
        .alignRules({
          top: { anchor: 'target', align: VerticalAlign.Bottom },
          right: { anchor: "target", align: HorizontalAlign.Center }
        })

      Text("common-StateStyles")
        .width(320)
        .height(50)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("common_stateStylesText")
        .stateStyles({
          pressed: this.pressedStyles
        })

      Text("common-OnVisibleAreaChange")
        .width(320)
        .height(50)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("common_onVisibleAreaChangeText")

      Text("common-OnPageHide")
        .width(320)
        .height(50)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("common_onPageHideText")

      Text("common-OnBackPress")
        .width(320)
        .height(50)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("common_onBackPressText")

    }.width("100%").height("100%")
  }
}

