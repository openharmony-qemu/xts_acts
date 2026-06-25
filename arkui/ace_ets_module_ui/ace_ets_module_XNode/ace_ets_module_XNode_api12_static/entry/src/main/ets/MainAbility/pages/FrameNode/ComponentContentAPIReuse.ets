'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { ComponentContent } from "@ohos.arkui.node";
import {
  Entry,
  Column,
  Component,
  Flex,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Text,
  Button,
  FontWeight,
  ButtonType,
  ClickEvent,
  Margin,
  Color,
  Builder,
  Row,
  NodeContainer,
  wrapBuilder,
  CustomBuilderT,
  ReuseObject
} from '@ohos.arkui.component'
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { UIContext } from '@ohos.arkui.UIContext';
export class Params2 {
  text: string = ""
  constructor(text: string) {
    this.text = text;
  }
}
@Builder
function buildText(params: Params2) {
  CReusableChildComponent2({ text: params.text });
}
@Component
struct CReusableChildComponent2 {
  @State text: string = "false";

  aboutToReuse(params: ReuseObject) {
    console.log("ReusableChildComponent2 Reusable " + JSON.stringify(params));
  }

  aboutToRecycle(): void {
    console.log("ReusableChildComponent2 aboutToRecycle " + this.text);
  }
  build() {
    Column() {
      Text(this.text).id('ComponentContentAPIReuse_Text')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 36 } as Margin)
    }.backgroundColor('#FFF0F0F0')
  }
}

@Entry
@Component
struct ComponentContentAPIReuse {
  @State message: string = "hello"
  build() {
    Row() {
      Column() {
        Button("click me").id('ComponentContentAPIReuse_Button')
          .onClick((e:ClickEvent) => {
            let uiContext = this.getUIContext();
            let promptAction = uiContext.getPromptAction();
            let contentNode = new ComponentContent<Params2>(uiContext, wrapBuilder<CustomBuilderT<Params2>>(buildText), new Params2(this.message));
            promptAction.openCustomDialog(contentNode);
            setTimeout(() => {
              contentNode.recycle();
              contentNode.reuse(new Params2("new message"));
            }, 2000); //2秒后自动更新弹窗内容文本
          })
        Button('fdhjkfshfjkfhsd').id('ComponentContentAPIReuse_Button02')
      }
      .width('100%')
      .height('100%')
    }
    .height('100%')
  }
}