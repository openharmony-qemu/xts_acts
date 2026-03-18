'use static';
import { Entry, Component, Column, Button, Text } from '@ohos.arkui.component';
import { ResponseRegionSupportedTool } from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';
import { LengthMetrics } from '@kit.ArkUI';

@Entry
@Component
struct ResponseRegionIndex {
  @State text: string = '';

  aboutToAppear() {
    try {
      let router: Router = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', router);
      AppStorage.setOrCreate<string>('click1', '');
      AppStorage.setOrCreate<string>('click2', '');
      AppStorage.setOrCreate<string>('click3', '');
      AppStorage.setOrCreate<string>('click4', '');
      AppStorage.setOrCreate<string>('click5', '');
    } catch (error) {
      console.error('ResponseRegionIndex aboutToAppear error: ' + error);
    }
  }

  build() {
    Column() {
      Text('left part of button1')
        .height('5%');
      Button('button1')
        .height('5%')
        .id('button1')
        .responseRegionList([])
        .onClick(() => {
          this.text = 'button1 clicked';
          AppStorage.setOrCreate<string>('click1', 'button1 clicked');
        });

      Text('one button size right of button2,\n one button size below button2')
        .height('5%');
      Button('button2')
        .height('5%')
        .id('button2')
        .responseRegionList([{
          x: LengthMetrics.percent(1),
          y: LengthMetrics.vp(0),
          width: LengthMetrics.percent(1),
          height: LengthMetrics.percent(1),
        }, {
          tool: ResponseRegionSupportedTool.FINGER,
          x: LengthMetrics.vp(0),
          y: LengthMetrics.percent(1),
          width: 'calc(100% + 0vp)',
          height: 'calc(100% - 0px)',
        }])
        .onClick(() => {
          this.text = 'button2 clicked';
          AppStorage.setOrCreate<string>('click2', 'button2 clicked');
        });

      Button('button3')
        .height('5%')
        .id('button3')
        .responseRegionList([{
          tool: ResponseRegionSupportedTool.ALL
        }])
        .onClick(() => {
          this.text = 'button3 clicked';
          AppStorage.setOrCreate<string>('click3', 'button3 clicked');
        });

      Button('button4')
        .height('5%')
        .id('button4')
        .responseRegionList([{
          tool: ResponseRegionSupportedTool.PEN && ResponseRegionSupportedTool.ALL
        }])
        .onClick(() => {
          this.text = 'button4 clicked';
          AppStorage.setOrCreate<string>('click4', 'button4 clicked');
        });

      Button('button5')
        .height('5%')
        .id('button5')
        .responseRegionList([{
          tool: ResponseRegionSupportedTool.MOUSE && ResponseRegionSupportedTool.ALL
        }])
        .onClick(() => {
          this.text = 'button5 clicked';
          AppStorage.setOrCreate<string>('click5', 'button5 clicked');
        });

      Text(this.text)
        .margin({ top: '3%' })
        .height('5%');
    }
    .width('100%')
    .margin({ top: '3%' })
    .height('90%');
  }
}
