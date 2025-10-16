/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 **     http://www.apache.org/licenses/LICENSE-2.0
 **
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import events_emitter from '@ohos.events.emitter';
import hilog from '@ohos.hilog';
import {
  $$,
  $r,
  Alignment,
  BindOptions,
  BlurStyle,
  Button,
  ButtonType,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  Configuration,
  ConstraintSizeOptions,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  FlexOptions,
  FontWeight,
  GradientDirection,
  HorizontalAlign,
  HoverEffect,
  Image,
  ItemAlign,
  KeyEvent,
  KeyType,
  Margin,
  Position,
  RepeatMode,
  Row,
  Scroll,
  SheetOptions,
  SheetType,
  TapGesture,
  Text,
  TextAlign,
  TextOverflow,
  TouchEvent,
  VerticalAlign
} from '@ohos.arkui.component'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage, Link, State } from '@ohos.arkui.stateManagement';
import { Hypium } from '../../../../../hypium/index';
import Log from '../../common/Log.ets';

const TAG = 'ets_apiLack_add';

@Entry
@Component
struct CommonColorMode {
  configuration: Configuration = {

    colorMode: "$000",

    fontScale: 23
  } as Configuration

  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear CommonColorMode start`)
  }

  aboutToDisappear() {
    Log.showInfo(TAG, `aboutToDisAppear CommonColorMode end`)
  }

  build() {
    Flex({
      direction: FlexDirection.Column,
      alignItems: ItemAlign.Center,
      justifyContent: FlexAlign.Center
    } as FlexOptions) {

      Text("common-FontScale")
        .width(320)
        .height(40)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("fontScaleText")


      Text("common-OnFinish")
        .width(320)
        .height(40)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("onFinishText")


      Text("common-MotionPath")
        .width(320)
        .height(40)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("motionPathText")
        .sharedTransition('motionPathText', {
          motionPath: {
            path: ''
          }
        })

      Text("common-Middle")
        .width(320)
        .height(40)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("middleText")
        .alignRules({
          middle: { anchor: 'string', align: HorizontalAlign.Center }
        })

      Text("common-Area")
        .width(320)
        .height(40)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("areaText")
        .onClick((event: ClickEvent) => {
          Log.showInfo(TAG, 'JSON.stringify area : ' + JSON.stringify(event.target.area))


          try {


            let backEvent: events_emitter.InnerEvent = {
              eventId: 60312,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("areaValue start to emit action state")

          } catch (err) {
            console.info("areaValue emit action state err: " + JSON.stringify((err as Error)?.message))
          }
        })
      Text("common-Repeat")
        .width(320)
        .height(40)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("RepeatText")
        .borderImage({
          source: {
            angle: 90,
            direction: GradientDirection.Left,
            colors: [[0xAEE1E1, 0.0], [0xD3E0DC, 0.3], [0xFCD1D1, 1.0]]
          },
          slice: {
            top: 10,
            bottom: 10,
            left: 10,
            right: 10
          },
          width: {
            top: "10px",
            bottom: "10px",
            left: "10px",
            right: "10px"
          },
          repeat: RepeatMode.Repeat,
          fill: false
        });

      Text("common-Space")
        .width(320)
        .height(40)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("SpaceText")
        .borderImage({
          source: {
            angle: 90,
            direction: GradientDirection.Left,
            colors: [[0xAEE1E1, 0.0], [0xD3E0DC, 0.3], [0xFCD1D1, 1.0]]
          },
          slice: {
            top: 10,
            bottom: 10,
            left: 10,
            right: 10
          },
          width: {
            top: "10px",
            bottom: "10px",
            left: "10px",
            right: "10px"
          },
          repeat: RepeatMode.Space,
          fill: false
        });

      Text("common-Thin")
        .width(320)
        .height(40)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("ThinText")
        .backgroundBlurStyle(BlurStyle.Thin)

      Text("common-Thick")
        .width(320)
        .height(40)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("ThickText")
        .backgroundBlurStyle(BlurStyle.Thick)

      Text("common-Slice")
        .width(320)
        .height(40)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("sliceText")
        .borderImage({
          source: {
            angle: 90,
            direction: GradientDirection.Left,
            colors: [[0xAEE1E1, 0.0], [0xD3E0DC, 0.3], [0xFCD1D1, 1.0]]
          },
          slice: {
            top: 10,
            bottom: 10,
            left: 10,
            right: 10
          },
          width: {
            top: "10px",
            bottom: "10px",
            left: "10px",
            right: "10px"
          },
          repeat: RepeatMode.Stretch,
          fill: false
        });

      Text("common-Outset")
        .width(320)
        .height(40)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("outsetText")
        .borderImage({
          source: {
            angle: 90,
            direction: GradientDirection.Left,
            colors: [[0xAEE1E1, 0.0], [0xD3E0DC, 0.3], [0xFCD1D1, 1.0]]
          },
          slice: {
            top: 10,
            bottom: 10,
            left: 10,
            right: 10
          },
          width: {
            top: "10px",
            bottom: "10px",
            left: "10px",
            right: "10px"
          },
          repeat: RepeatMode.Stretch,
          fill: false,
          outset: 2
        });


      Text("common-Touches")
        .width(320)
        .height(40)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("touchesText")
        .onTouch((event: TouchEvent) => {
          Log.showInfo(TAG, 'touches: ' + JSON.stringify(event.touches))
          const touchesValue = JSON.stringify(event.touches)
          console.info("touches value1 is: " + touchesValue)

          try {
            let backData1: events_emitter.EventData = {}
            let backEvent1: events_emitter.InnerEvent = {
              eventId: 60313,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("touchesValue start to emit action state")
            events_emitter.emit(backEvent1, backData1)
          } catch (err) {
            console.info("touchesValue emit action state err: " + JSON.stringify((err as Error)?.message))
          }
        })

      Text("common-ChangedTouches")
        .width(320)
        .height(40)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("changedTouchesText")
        .onTouch((event: TouchEvent) => {
          Log.showInfo(TAG, 'changedTouches: ' + JSON.stringify(event.changedTouches))
          const changedTouchesValue = JSON.stringify(event.changedTouches)
          console.info("changedTouchesValue value1 is: " + changedTouchesValue)

          try {
            let backData2: events_emitter.EventData = {
              data: {}
            }
            let backEvent2: events_emitter.InnerEvent = {
              eventId: 60314,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("touchesValue start to emit action state")
            events_emitter.emit(backEvent2, backData2)
          } catch (err) {
            console.info("touchesValue emit action state err: " + JSON.stringify((err as Error)?.message))
          }
        })

      Text("common-KeyCode")
        .width(320)
        .height(40)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("keyCodeText")
        .onKeyEvent((event: KeyEvent) => {
          Log.showInfo(TAG, 'keyCode: ' + event.keyCode)
          return false
        })

      Text("common-KeyText")
        .width(320)
        .height(40)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("keyTextText")
        .onKeyEvent((event: KeyEvent) => {
          Log.showInfo(TAG, 'keyText: ' + event.keyText)
          return false
        })

      Text("common-KeySource")
        .width(320)
        .height(40)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("keySourceText")
        .onKeyEvent((event: KeyEvent) => {
          Log.showInfo(TAG, 'keySource: ' + event.keySource)
          return false
        })

      Text("common-DeviceId")
        .width(320)
        .height(40)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("deviceIdText")
        .onKeyEvent((event: KeyEvent) => {
          Log.showInfo(TAG, 'deviceId: ' + event.deviceId)
          return false
        })

      Text("common-MetaKey")
        .width(320)
        .height(40)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("metaKeyText")
        .onKeyEvent((event: KeyEvent) => {
          Log.showInfo(TAG, 'metaKey: ' + event.metaKey)
          return false
        })

      Text("common-Normal")
        .width(320)
        .height(40)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("normalText")


      Text("common-Pressed")
        .width(320)
        .height(40)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("pressedText")


      Text("common-Focused")
        .width(320)
        .height(40)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("focusedText")


      Text("common-Clicked")
        .width(320)
        .height(40)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("clickedText")


    }.width("100%").height("100%")
  }
}


@Component
struct PreviewParamsLocale {
  build() {
    Flex() {
      Text("common-locale")
        .width(320)
        .height(40)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("LocaleText")
    }
  }
}


@Component
struct PreviewParamsColorMode {
  build() {
    Flex() {
      Text("common-colorMode")
        .width(320)
        .height(40)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("ColorModeText")
    }
  }
}


@Component
struct PreviewParamsDeviceType {
  build() {
    Flex() {
      Text("common-deviceType")
        .width(320)
        .height(40)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("DeviceTypeText")
    }
  }
}


@Component
struct PreviewParamsDpi {
  build() {
    Flex() {
      Text("common-dpi")
        .width(320)
        .height(40)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("DpiText")
    }
  }
}


@Component
struct PreviewParamsOrientation {
  build() {
    Flex() {
      Text("common-orientation")
        .width(320)
        .height(40)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("OrientationText")
    }
  }
}


@Component
struct PreviewParamsRoundScreen {
  build() {
    Flex() {
      Text("common-roundScreen")
        .width(320)
        .height(40)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("RoundScreenText")
    }
  }
}

