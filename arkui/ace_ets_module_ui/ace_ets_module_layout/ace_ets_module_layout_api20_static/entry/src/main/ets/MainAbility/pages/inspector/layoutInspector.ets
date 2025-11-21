import fs from '@ohos.file.fs';
import common from '@ohos.app.ability.common';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext } from '@ohos.arkui.UIContext';
// import { UIContext } from '@kit.ArkUI';
import {
  Entry,
  Column,
  Component,
  Button,
  Text,
  Row,
  Color,
  Scroll,
  Image,
  ColumnOptions,
  ClickEvent,
  $r
} from '@ohos.arkui.component';

@Component
struct ChildComponent {
  build() {
    Column() {
      Button(`Hello World`).onClick((e: ClickEvent) => {
        console.log('layoutinspector Hello World')
      })
      Image($r('app.media.icon')).height(20).focusable(true)
    }
  }
}

@Entry
@Component
struct ComponentPage {
  // private context= getContext(this) as common.UIAbilityContext;

  loopConsole(testStr: string, i: string) {
    console.log(`layoutinspector ${i}| type: ${JSON.parseJsonElement(testStr)
      .getElement("$type")}, ID: ${JSON.parseJsonElement(testStr).getElement("$ID")}`)

    if (JSON.parseJsonElement(testStr).getElement("$children")) {
      i += '-'
      for (let index = 0; index < JSON.parseJsonElement(testStr).getElement("$children").getDouble("length"); index++) {
        this.loopConsole(JSON.stringify(JSON.parseJsonElement(testStr).getArray("$children")[index]), i)
      }
    }
  }

  onPageShow(): void {
    // globalThis.context= this.getUIContext()
    let UIContext: UIContext = this.getUIContext()
    AppStorage.setOrCreate<UIContext>("UIContext", UIContext);
  }

  @State str: string = ''

  build() {
    Scroll() {
      Column({ space: 5 } as ColumnOptions) {
        Text('Hello World').fontSize(20).fontColor(Color.Black)
        ChildComponent()
      }
      .id('Test_Column')
      .width('100%')
    }
    .height('100%')
  }
}

