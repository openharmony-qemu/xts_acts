'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import router from '@ohos.router';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { Entry,Component,Column,Margin,Text, Button, ButtonType, ClickEvent, Scroll, FontWeight } from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { JsonObject, JsonObject1 } from '../../common/Utils';

@Entry
@Component
struct RouterPushThree {

  build() {
    Scroll() {
      Column() {
        Text("RouterThree")
          .fontSize(20)
          .fontWeight(FontWeight.Bold)

        Button("turn_RouterPushUrlOne_null")
          .type(ButtonType.Capsule)
          .margin({
            top: 10
          } as Margin)
          .id("turn_RouterPushUrlOne_null")
          .onClick((e: ClickEvent) => {
            AppStorage.get<Router>("router")!.replaceUrl({
              url: 'MainAbility/pages/State/RouterPushOne',
              // params: null
            })
          })

        Button("turn_RouterPushUrlOne_string_number")
          .type(ButtonType.Capsule)
          .margin({
            top: 10
          } as Margin)
          .id("turn_RouterPushUrlOne_string_number")
          .onClick((e: ClickEvent) => {
            AppStorage.get<Router>("router")!.replaceUrl({
              url: 'MainAbility/pages/State/RouterPushOne',
              params: (new JsonObject(new JsonObject1("message", 12345))).toJSON()
            })
          })

        Button("turn_RouterPushThree_stringArray")
          .type(ButtonType.Capsule)
          .margin({
            top: 10
          } as Margin)
          .id("turn_RouterPushThree_stringArray")
          .onClick((e: ClickEvent) => {
            AppStorage.get<Router>("router")!.replaceUrl({
              url: 'MainAbility/pages/State/RouterPushOne',
              params: (new JsonObject(new JsonObject1(["message", "message1"]))).toJSON()
            })
          })

        Button("turn_RouterPushUrlOne_string_number1")
          .type(ButtonType.Capsule)
          .margin({
            top: 10
          } as Margin)
          .id("turn_RouterPushUrlOne_string_number1")
          .onClick((e: ClickEvent) => {
            AppStorage.get<Router>("router")!.replaceUrl({
              url: 'MainAbility/pages/State/RouterPushOne',
              params: (new JsonObject2("message", 12345)).toJSON()
            })
          })

        Button("turn_RouterPushUrlOne_string_numArray")
          .type(ButtonType.Capsule)
          .margin({
            top: 10
          } as Margin)
          .id("turn_RouterPushUrlOne_string_numArray")
          .onClick((e: ClickEvent) => {
            AppStorage.get<Router>("router")!.replaceUrl({
              url: 'MainAbility/pages/State/RouterPushOne',
              params: (new JsonObject2("message", [1, 2, 3, 4, 5])).toJSON()
            })
          })

        Button("turn_RouterPushUrlOne_string_number_push")
          .type(ButtonType.Capsule)
          .margin({
            top: 10
          } as Margin)
          .id("turn_RouterPushUrlOne_string_number_push")
          .onClick((e: ClickEvent) => {
            AppStorage.get<Router>("router")!.pushUrl({
              url: 'MainAbility/pages/State/RouterPushOne',
              params: (new JsonObject(new JsonObject1("message", 12345))).toJSON()
            })
          })

        Button("turn_RouterPushUrlOne_null_push")
          .type(ButtonType.Capsule)
          .margin({
            top: 10
          } as Margin)
          .id("turn_RouterPushUrlOne_null_push")
          .onClick((e: ClickEvent) => {
            AppStorage.get<Router>("router")!.pushUrl({
              url: 'MainAbility/pages/State/RouterPushOne',
              // params: null
            })
          })
      }
    }
  }
}

export class JsonObject2 implements jsonx.JsonElementDeserializable, jsonx.JsonElementSerializable {
  data1: string;
  data2: int | int[];

  constructor() {
    this.data1 = '';
    this.data2 = 0;
  }

  constructor(a: string, b: int) {
    this.data1 = a;
    this.data2 = b;
  }

  constructor(a: string, b: Array<int>) {
    this.data1 = a;
    this.data2 = b;
  }

  toJSON(): jsonx.JsonElement {
    let root: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>();
    root.set('data1', jsonx.JsonElement.createString(this.data1));
    if (this.data2 instanceof int) {
      root.set('data2', jsonx.JsonElement.createInteger(this.data2 as int));
    } else {
      let arr = new Array<jsonx.JsonElement>();
      for (let i = 0; i < (this.data2 as Array<int>).length; ++i) {
        arr.push(jsonx.JsonElement.createInteger((this.data2 as Array<int>)[i]));
      }
      let arrJson = jsonx.JsonElement.createArray(arr);
      root.set('data2', arrJson);
    }
    return jsonx.JsonElement.createObject(root)
  }

  fromJSON(jsonElem: jsonx.JsonElement) {
    this.data1 = jsonElem.tryGetString('data1');
    let data2Json = jsonElem.tryGetElement('data2');
    if (!data2Json) {
      this.data2 = 0;
    } else if (data2Json.jsonType == jsonx.JsonType.JsonNumber) {
      this.data2 = jsonElem.tryGetInteger('data2');
    } else {
      let arr = new Array<int>();
      let arrJson = jsonElem.tryGetArray('data2');
      for (let i = 0; i < arrJson!.length; i++) {
        let val = arrJson![i].tryAsInteger();
        if (val) {
          arr.push(val);
        }
      }
      this.data2 = arr;
    }
  }
}
