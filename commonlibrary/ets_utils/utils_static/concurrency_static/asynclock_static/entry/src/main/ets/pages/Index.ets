'use static'
import hilog from '@ohos.hilog'
import { Entry, Text, Column, Component, Button } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct MyStateSample {
  @State stateVar: string = 'state var';
  message: string = 'var';
  changeValue(): void {
    this.stateVar += '~';
  }
  build() {
    Column() {
      Text('Hello World').fontSize($r('app.float.page_text_font_size'))
      Button(this.message).backgroundColor('#FFFF00FF')
        .onClick(() => {
          hilog.info(0x0000, 'testTag', 'On Click');
          this.changeValue();
        })
      Text(this.stateVar).fontSize($r('app.float.page_text_font_size'))
      Child({ stateVar: this.stateVar })
    }
  }
}

@Component
struct Child {
  stateVar: string = 'Child';
  build() {
    Text(this.stateVar).fontSize($r('app.float.page_text_font_size'))
  }
}
