'use static';
/**
  * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import router from '@ohos.router'
import { BusinessError } from '@ohos.base';
import { Entry,Component,FlexDirection,ItemAlign, Button, FlexAlign, Margin, ClickEvent, Flex, Alignment, ButtonType, FontWeight, TextOverflow, TextAlign, Text } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import Log from '../../common/Log';

const TAG = 'ets_apiLack_add';

class JsonObject implements jsonx.JsonElementDeserializable, jsonx.JsonElementSerializable {
  text: string;
  data: int[];

  constructor() {
    this.text = '';
    this.data = [0];
  }

  constructor(a: string, b: Array<int>) {
    this.text = a;
    this.data = b;
  }

  toJSON(): jsonx.JsonElement {
    let root: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>();
    root.set('text', jsonx.JsonElement.createString(this.text));
    let arr = new Array<jsonx.JsonElement>();
    for (let i = 0; i < this.data.length; ++i) {
      arr.push(jsonx.JsonElement.createInteger(this.data[i]));
    }
    let arrJson = jsonx.JsonElement.createArray(arr);
    root.set('data', arrJson);
    return jsonx.JsonElement.createObject(root)
  }

  fromJSON(jsonElem: jsonx.JsonElement) {
    this.text = jsonElem.tryGetString('text');
    let arr = new Array<int>();
    let arrJson = jsonElem.tryGetArray('data');
    for (let i = 0; i < arrJson!.length; i++) {
      let val = arrJson![i].tryAsInteger();
      if (val) {
        arr.push(val);
      }
    }
    this.data = arr;
  }
}

@Entry
@Component
struct RouterStandard {
  async routePage() {
    let options: router.RouterOptions = {
      url: 'pages/ohosRouter/page1',
      params: (new JsonObject('这是第一页的值', [12, 45, 78])).toJSON()
    }
    try {
      this.getUIContext().getRouter().pushUrl(options)
    } catch (err) {
      console.info(`Standard Page fail callback, code: ${(err as BusinessError).code}, msg: ${(err as BusinessError).message}`)
    }
  }

  async routeSinglePage() {
    let options: router.RouterOptions = {
      url: 'pages/ohosRouter/page2',
      params: (new JsonObject('这是第二页的值', [13, 46, 79])).toJSON()
    }
    try {
      this.getUIContext().getRouter().pushUrl(options)
    } catch (err) {
      console.info(`Single Page fail callback, code: ${(err as BusinessError).code}, msg: ${(err as BusinessError).message}`)
    }
  }

  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear RouterStandard start`)
  }

  aboutToDisappear() {
    Log.showInfo(TAG, `aboutToDisAppear RouterStandard end`)
  }

  build() {

    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {

      Text("router-Standard")
        .width(100)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("StandardText")
        .onClick((e: ClickEvent) => {
          this.routePage()
        })

      Text("router-Single")
        .width(100)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("SingleText")
        .onClick((e: ClickEvent) => {
          this.routeSinglePage()
        })

      Text('这是第一页')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
      Button('') {
        Text('next page')
          .fontSize(25)
          .fontWeight(FontWeight.Bold)
      }.type(ButtonType.Capsule)
      .margin({ top: 20 } as Margin)
      .backgroundColor('#ccc')
      .onClick((e: ClickEvent) => {
        this.routePage()
      })
    }
    .width("100%")
    .height("100%")
  }
}

