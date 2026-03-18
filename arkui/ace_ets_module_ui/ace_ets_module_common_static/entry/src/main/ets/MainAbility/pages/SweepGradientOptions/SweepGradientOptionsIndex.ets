'use static';
import { Entry, Component, Column, Text } from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';
import { ColorMetrics, ColorSpace } from '@kit.ArkUI';

@Entry
@Component
struct SweepGradientOptionsIndex {
  @State p3Green: ColorMetrics = ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, 0, 1, 0, 1);

  aboutToAppear() {
    try {
      let router: Router = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', router);
    } catch (error) {
      console.error('SweepGradientOptionsIndex aboutToAppear error: ' + error);
    }
  }

  build() {
    Column() {
      Text('SweepGradientOpticmetricsColors')
        .id('SweepGradientOpticmetricsColors')
        .key('SweepGradientOpticmetricsColors')
        .width(220)
        .height(40)
        .sweepGradient({
          center: ['50%', '50%'],
          start: 0,
          end: 359,
          metricsColors: [[this.p3Green, 0.0], [this.p3Green, 0.5], [this.p3Green, 1.0]],
          colors: []
        });
    }
    .width('100%')
    .height('100%');
  }
}
