'use static'

import {
  Entry, Text, Column, Component, Button, ClickEvent
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

class Calc {
  native add(arg1: int, arg2: int): int;
}

@Entry
@Component
struct Index {
  @State stateVar: string = "state var";
  message: string = "var";

  changeValue() {
    this.stateVar += "~"
  }

  build() {
    Column(undefined) {
      Text("Hello World").fontSize(20)
      Button(this.message).backgroundColor("#FFFF00FF")
        .onClick((e: ClickEvent) => {
          hilog.info(0x0000, 'testTag', 'On Click');
          this.changeValue()
          try {
            loadLibrary("hsplibrary")
          } catch (e) {
            hilog.error(0x0000, 'testTag', 'loadFailed', e.message);
          }

          let cls = new Calc();
          let result = cls.add(1, 2);
          if (result == 3) {
            hilog.info(0x0000, 'testTag', 'Calc add result 3');
          }
        })
      Text(this.stateVar).fontSize(20)
      Child({ stateVar: this.stateVar })
    }
  }
}

@Component
struct Child {
  @State stateVar: string = "Child";

  build() {
    Text(this.stateVar).fontSize(50)
  }
}