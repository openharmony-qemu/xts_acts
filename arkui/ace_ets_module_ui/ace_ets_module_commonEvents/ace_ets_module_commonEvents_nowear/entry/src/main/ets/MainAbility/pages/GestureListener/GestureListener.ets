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
import { GestureTriggerInfo } from '@ohos.arkui.UIContext'
import { GestureActionPhase, GestureListenerType } from '@kit.ArkUI'

function tapGesture(info: GestureTriggerInfo) {
  console.info('aaa --- callback event' + JSON.stringify(info.event))
  console.info('aaa --- callback current' + JSON.stringify(info.current))
  console.info('aaa --- callback currentPhase' + JSON.stringify(info.currentPhase))
  console.info('aaa --- callback node' + JSON.stringify(info.node))
  AppStorage.setOrCreate('tapCallback', 'triggered')
}
function swipeGesture(info: GestureTriggerInfo) {
  console.info('aaa --- callback event' + JSON.stringify(info.event))
  console.info('aaa --- callback current' + JSON.stringify(info.current))
  console.info('aaa --- callback currentPhase' + JSON.stringify(info.currentPhase))
  console.info('aaa --- callback node' + JSON.stringify(info.node))
  AppStorage.setOrCreate('swipeCallback', 'triggered')
}
function longPressGesture(info: GestureTriggerInfo) {
  console.info('aaa --- callback event' + JSON.stringify(info.event))
  console.info('aaa --- callback current' + JSON.stringify(info.current))
  console.info('aaa --- callback currentPhase' + JSON.stringify(info.currentPhase))
  console.info('aaa --- callback node' + JSON.stringify(info.node))
  AppStorage.setOrCreate('longPressCallback', 'triggered')
}
function pinchGesture(info: GestureTriggerInfo) {
  console.info('aaa --- callback event' + JSON.stringify(info.event))
  console.info('aaa --- callback current' + JSON.stringify(info.current))
  console.info('aaa --- callback currentPhase' + JSON.stringify(info.currentPhase))
  console.info('aaa --- callback node' + JSON.stringify(info.node))
  AppStorage.setOrCreate('pinchCallback', 'triggered')
}
function rotationGesture(info: GestureTriggerInfo) {
  console.info('aaa --- callback event' + JSON.stringify(info.event))
  console.info('aaa --- callback current' + JSON.stringify(info.current))
  console.info('aaa --- callback currentPhase' + JSON.stringify(info.currentPhase))
  console.info('aaa --- callback node' + JSON.stringify(info.node))
  AppStorage.setOrCreate('rotationCallback', 'triggered')
}
function panGesture(info: GestureTriggerInfo) {
  console.info('aaa --- callback event' + JSON.stringify(info.event))
  console.info('aaa --- callback current' + JSON.stringify(info.current))
  console.info('aaa --- callback currentPhase' + JSON.stringify(info.currentPhase))
  console.info('aaa --- callback node' + JSON.stringify(info.node))
  AppStorage.setOrCreate('panCallback', 'triggered')
}

@Entry
@Component
struct GestureListenerPage {
  @State tapResult: string = 'none'
  @State swipeResult: string = 'none'
  @State longPressResult: string = 'none'
  @State pinchResult: string = 'none'
  @State rotationResult: string = 'none'
  @State panResult: string = 'none'
  private intervalNum: number = 0
  private panOption: PanGestureOptions = new PanGestureOptions({
    direction: PanDirection.All, distance: 50, fingers: 1
  })

  aboutToAppear(): void {
    AppStorage.setOrCreate('tapCallback', '')
    AppStorage.setOrCreate('swipeCallback', '')
    AppStorage.setOrCreate('longPressCallback', '')
    AppStorage.setOrCreate('pinchCallback', '')
    AppStorage.setOrCreate('rotationCallback', '')
    AppStorage.setOrCreate('panCallback', '')
  }

  onPageShow(): void {
    this.intervalNum = setInterval(() => {
      this.tapResult = AppStorage.get<string>('tapCallback') ?? ''
      this.swipeResult = AppStorage.get<string>('swipeCallback') ?? ''
      this.longPressResult = AppStorage.get<string>('longPressCallback') ?? ''
      this.pinchResult = AppStorage.get<string>('pinchCallback') ?? ''
      this.rotationResult = AppStorage.get<string>('rotationCallback') ?? ''
      this.panResult = AppStorage.get<string>('panCallback') ?? ''
    }, 500)
  }

  onPageHide(): void {
    clearInterval(this.intervalNum)
  }

  aboutToDisappear(): void {
    clearInterval(this.intervalNum)
  }

  build() {
    Scroll() {
      Column({ space: 1}) {
        Row({ space: 5 }) {
          Button('添加全部监听').height('5%').fontSize('3%').onClick(() => {
            let observer = this.getUIContext().getUIObserver()
            observer.addGlobalGestureListener(GestureListenerType.TAP, {
              actionPhases: [GestureActionPhase.WILL_START, GestureActionPhase.WILL_END]
            },tapGesture)
            observer.addGlobalGestureListener(GestureListenerType.SWIPE, {
              actionPhases: [GestureActionPhase.WILL_START, GestureActionPhase.WILL_END]
            },swipeGesture)
            observer.addGlobalGestureListener(GestureListenerType.LONG_PRESS, {
              actionPhases: [GestureActionPhase.WILL_START, GestureActionPhase.WILL_END]
            },longPressGesture)
            observer.addGlobalGestureListener(GestureListenerType.PINCH, {
              actionPhases: [GestureActionPhase.WILL_START, GestureActionPhase.WILL_END]
            },pinchGesture)
            observer.addGlobalGestureListener(GestureListenerType.ROTATION, {
              actionPhases: [GestureActionPhase.WILL_START, GestureActionPhase.WILL_END]
            },rotationGesture)
            observer.addGlobalGestureListener(GestureListenerType.PAN, {
              actionPhases: [GestureActionPhase.WILL_START, GestureActionPhase.WILL_END]
            },panGesture)
          })
          Button('移除全部监听').height('5%').fontSize('3%').onClick(() => {
            let observer = this.getUIContext().getUIObserver()
            observer.removeGlobalGestureListener(GestureListenerType.TAP, tapGesture)
            observer.removeGlobalGestureListener(GestureListenerType.SWIPE, swipeGesture)
            observer.removeGlobalGestureListener(GestureListenerType.LONG_PRESS, longPressGesture)
            observer.removeGlobalGestureListener(GestureListenerType.PINCH, pinchGesture)
            observer.removeGlobalGestureListener(GestureListenerType.ROTATION, rotationGesture)
            observer.removeGlobalGestureListener(GestureListenerType.PAN, panGesture)
          })
        }
        .width('100%')
        .justifyContent(FlexAlign.Center)

        Text('Tap').fontSize('3%').fontColor(Color.Black)
        Column() {
          Text('Click once').fontColor(Color.Black).fontSize('3%')
        }
        .width('80%').height('8%').border({ width: 1 }).justifyContent(FlexAlign.Center)
        .gesture(TapGesture({ count: 1, fingers: 1, isFingerCountLimited: false, distanceThreshold: 2 })
          .allowedTypes([SourceTool.Unknown, SourceTool.Finger, SourceTool.Pen,
          SourceTool.MOUSE, SourceTool.TOUCHPAD, SourceTool.JOYSTICK])
          .tag('tap')
          .onAction((event) => {
            console.info('aaa --- onAction tap')
          }))
        .id('tapTarget')
        Text(this.tapResult).fontSize('3%').fontColor(Color.Black)

        Text('Swipe').fontSize('3%').fontColor(Color.Black)
        Column() {
          Text('Swipe here').fontColor(Color.Black).fontSize('3%')
        }
        .width('80%').height('8%').border({ width: 1 }).justifyContent(FlexAlign.Center)
        .gesture(SwipeGesture({ fingers: 1, direction: SwipeDirection.Horizontal,
          speed: 100, isFingerCountLimited: true })
          .allowedTypes([SourceTool.Unknown, SourceTool.Finger, SourceTool.Pen,
          SourceTool.MOUSE, SourceTool.TOUCHPAD, SourceTool.JOYSTICK])
          .tag('swipe')
          .onAction((event) => {
            console.info('aaa --- onAction swipe')
          }))
        .id('swipeTarget')
        Text(this.swipeResult).fontSize('3%').fontColor(Color.Black)

        Text('LongPress').fontSize('3%').fontColor(Color.Black)
        Column() {
          Text('Long press here').fontColor(Color.Black).fontSize('3%')
        }
        .width('80%').height('8%').border({ width: 1 }).justifyContent(FlexAlign.Center)
        .gesture(LongPressGesture({ fingers: 1, duration: 20, repeat: true, isFingerCountLimited: true })
          .allowedTypes([SourceTool.Unknown, SourceTool.Finger, SourceTool.Pen,
          SourceTool.MOUSE, SourceTool.TOUCHPAD, SourceTool.JOYSTICK])
          .tag('longPress')
          .onAction((event) => {
            console.info('aaa --- onAction longPress')
          })
          .onActionEnd((event) => {
            console.info('aaa --- onActionEnd longPress')
          }))
        .id('longPressTarget')
        Text(this.longPressResult).fontSize('3%').fontColor(Color.Black)

        Text('Pinch').fontSize('3%').fontColor(Color.Black)
        Column() {
          Text('Pinch here').fontColor(Color.Black).fontSize('3%')
        }
        .width('80%').height('10%').border({ width: 1 }).justifyContent(FlexAlign.Center)
        .gesture(PinchGesture({ fingers: 2, distance: 5, isFingerCountLimited: true })
          .allowedTypes([SourceTool.Unknown, SourceTool.Finger, SourceTool.Pen,
          SourceTool.MOUSE, SourceTool.TOUCHPAD, SourceTool.JOYSTICK])
          .tag('pinch')
          .onActionStart(() => {
            console.info('aaa --- onActionStart pinch')
          })
          .onActionEnd(() => {
            console.info('aaa --- onActionEnd pinch')
          }))
        .id('pinchTarget')
        Text(this.pinchResult).fontSize('3%').fontColor(Color.Black)

        Text('Rotation').fontSize('3%').fontColor(Color.Black)
        Column() {
          Text('Rotate here').fontColor(Color.Black).fontSize('3%')
        }
        .width('80%').height('10%').border({ width: 1 }).justifyContent(FlexAlign.Center)
        .gesture(RotationGesture({ fingers: 2, angle: 5, isFingerCountLimited: false })
          .allowedTypes([SourceTool.Unknown, SourceTool.Finger, SourceTool.Pen,
          SourceTool.MOUSE, SourceTool.TOUCHPAD, SourceTool.JOYSTICK])
          .tag('rotation')
          .onActionStart(() => {
            console.info('aaa --- onActionStart rotation')
          })
          .onActionEnd(() => {
            console.info('aaa --- onActionEnd rotation')
          }))
        .id('rotationTarget')
        Text(this.rotationResult).fontSize('3%').fontColor(Color.Black)

        Text('Pan').fontSize('3%').fontColor(Color.Black)
        Column() {
          Text('Pan here').fontColor(Color.Black).fontSize('3%')
        }
        .width('80%').height('8%').border({ width: 1 }).justifyContent(FlexAlign.Center)
        .gesture(PanGesture(this.panOption)
          .allowedTypes([SourceTool.Unknown, SourceTool.Finger, SourceTool.Pen,
          SourceTool.MOUSE, SourceTool.TOUCHPAD, SourceTool.JOYSTICK])
          .tag('pan')
          .onActionStart(() => {
            console.info('aaa --- onActionStart pan')
          })
          .onActionEnd(() => {
            console.info('aaa --- onActionEnd pan')
          }))
        .id('panTarget')
        Text(this.panResult).fontSize('3%').fontColor(Color.Black)
      }
      .width('100%')
      .alignItems(HorizontalAlign.Center)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F1F3F5')
  }
}
