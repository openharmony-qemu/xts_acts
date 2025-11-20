// xxx.ets
import {
  $r,
  AdaptiveColor,
  Alignment,
  BlurStyle,
  Color,
  Column,
  ColumnOptions,
  Component,
  Entry,
  Image,
  ImageSize,
  Padding,
  Position,
  Row,
  SizeOptions,
  Text,
  ThemeColorMode,
} from '@ohos.arkui.component';
import { AppStorage, Link, Prop, State, } from '@ohos.arkui.stateManagement';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';

@Entry
@Component
struct BackgroundBrightnessDemo {
  build() {
    Column() {
      Row() {
        Text("BackgroundBrightness")
      }
      .id("backgroundBrightness")
      .width(200)
      .height(100)
      .position({ x: 100, y: 100 } as Position)
      .backgroundBlurStyle(BlurStyle.Thin, { colorMode: ThemeColorMode.LIGHT, adaptiveColor: AdaptiveColor.DEFAULT })
      .backgroundBrightness({ rate: 0.5, lightUpDegree: 0.5 })
    }
    .width('100%')
    .height('100%')
    .backgroundImage($r('app.media.icon'))
    .backgroundImageSize(ImageSize.Cover)
  }
}