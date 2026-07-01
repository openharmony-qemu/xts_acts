'use static';
import { Entry, Text, TextAttribute, Column, Component, Button, ClickEvent} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Entry
@Component
struct Index {
  @State stateVar: string = 'BusManager Serial Static Test';
  build() {
    Column(undefined) {
      Text('BusManager Serial Static Test').fontSize(20)
      Text(this.stateVar).fontSize(20)
    }
  }
}
