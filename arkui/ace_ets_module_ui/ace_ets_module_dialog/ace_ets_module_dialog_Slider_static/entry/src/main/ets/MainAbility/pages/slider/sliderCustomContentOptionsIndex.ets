'use static';

import {
  Entry,
  Component,
  Column,
  Slider,
  ColumnOptions,
  SliderCustomContentOptions,
  SliderStyle,
  Color,
  Text,
  TextAlign,
  FlexAlign,
  $r,
  wrapBuilder,
  SliderOptions,
  Scroll
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { ComponentContent } from '@kit.ArkUI';
import { UIContext } from '@ohos.arkui.UIContext';

@Builder
function preTextBuilder() {
  Text('低')
    .fontSize($r('sys.float.Caption_L'))
    .clip(true)
    .textAlign(TextAlign.Center)
    .fontColor(Color.Black)
}

@Entry
@Component
struct SliderCustomContentOptionsIndex {
  @State value1: number = 50;
  @State value2: number = 60;

  private uiContext: UIContext = this.getUIContext();
  private preNode1: ComponentContent = new ComponentContent(this.uiContext, wrapBuilder(preTextBuilder));

  aboutToAppear() {
    try {
      let router = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', router);
    } catch (error) {
      console.log('error ' + error);
    }
  }

  build() {
    Scroll() {
      Column({ space: 10 } as ColumnOptions) {
        // SliderCustomContentOptions - accessibilityDescription
        Slider({
          value: this.value1,
          min: 0,
          max: 100,
          step: 1,
          style: SliderStyle.InSet
        } as SliderOptions)
          .id('sliderDescription')
          .width('90%')
          .prefix(this.preNode1, {
            accessibilityDescription: 'accessibilityDescription'
          })
          .onChange((value: number) => {
            this.value1 = value;
          })

        // SliderCustomContentOptions - accessibilityLevel
        Slider({
          value: this.value2,
          min: 0,
          max: 100,
          step: 1,
          style: SliderStyle.InSet
        } as SliderOptions)
          .id('sliderLevel')
          .width('90%')
          .prefix(this.preNode1, {
            accessibilityLevel: 'auto'
          })
          .onChange((value: number) => {
            this.value2 = value;
          })
      }
      .justifyContent(FlexAlign.Start)
      .width('100%')
      .padding({ top: 10, bottom: 10, left: 10, right: 10 })
    }
    .width('100%')
    .height('100%')
  }
}
