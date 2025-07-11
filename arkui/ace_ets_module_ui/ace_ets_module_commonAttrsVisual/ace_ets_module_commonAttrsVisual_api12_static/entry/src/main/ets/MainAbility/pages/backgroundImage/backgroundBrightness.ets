// xxx.ets
import {
  Entry,
  Component,
  Column,
  ColumnOptions,
  Text,
  Color,
  Image,
  SizeOptions,
  ImageSize,
  Position,
  Alignment,
  Row,
  Padding,
  ThemeColorMode,
  BlurStyle,
  ImageSize,
  AdaptiveColor,
  $r,
} from '@ohos.arkui.component';
import {
  State,
  Link,
  Prop,
} from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';
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
      .backgroundBlurStyle(BlurStyle.Thin, { colorMode: ThemeColorMode.LIGHT, adaptiveColor: AdaptiveColor.DEFAULT})
      .backgroundBrightness({rate:0.5,lightUpDegree:0.5})
    }
    .width('100%')
    .height('100%')
    .backgroundImage($r('app.media.icon'))
    .backgroundImageSize(ImageSize.Cover)
  }
}