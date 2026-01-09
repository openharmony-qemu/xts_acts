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
import {
  Alignment,
  AlignRuleOption,
  Axis,
  BlurStyle,
  Builder,
  Button,
  ClickEvent,
  Color,
  Column,
  CommonMethod,
  Component,
  Configuration,
  ConstraintSizeOptions,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  FontWeight,
  ForEach,
  GeometryInfo,
  GradientDirection,
  HitTestMode,
  HorizontalAlign,
  HoverEffect,
  Image,
  ItemAlign,
  KeyEvent,
  KeyType,
  Layoutable,
  List,
  ListItem,
  LocalizedAlignRuleOptions,
  Margin,
  Measurable,
  MeasureResult,
  Navigation,
  NavigationTitleMode,
  RepeatMode,
  Row,
  Search,
  SizeResult,
  Stack,
  TapGesture,
  Text,
  TextAlign,
  TextOverflow,
  VerticalAlign
} from '@ohos.arkui.component';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage, State } from '@ohos.arkui.stateManagement';

class RouterDataParam implements jsonx.JsonElementDeserializable, jsonx.JsonElementSerializable {
  data3: number[] | undefined;

  constructor() {
    this.data3 = undefined;
  }

  constructor(arr: number[]) {
    this.data3 = arr;
  }

  toJSON(): jsonx.JsonElement {
    let root: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>();
    if (!this.data3) {
      return jsonx.JsonElement.createObject(root)
    }
    let arr = new Array<jsonx.JsonElement>();
    for (let i = 0; i < this.data3!.length; ++i) {
      arr.push(jsonx.JsonElement.createDouble(this.data3![i]));
    }
    let arrJson = jsonx.JsonElement.createArray(arr);
    root.set('data3', arrJson);
    return jsonx.JsonElement.createObject(root)
  }

  fromJSON(jsonElem: jsonx.JsonElement) {
    let arrJson = jsonElem.tryAsArray();
    if (!arrJson) {
      this.data3 = undefined;
      return;
    }
    let arr = new Array<number>();
    for (let i = 0; i < arrJson!.length; i++) {
      let val = arrJson![i].tryAsDouble();
      if (val) {
        arr.push(val);
      }
    }
    this.data3 = arr;
  }
}

class RouterData implements jsonx.JsonElementDeserializable, jsonx.JsonElementSerializable {
  data: string | undefined;
  data1: string | undefined;
  data2: RouterDataParam | undefined;

  constructor() {
    this.data = undefined;
    this.data1 = undefined;
    this.data2 = undefined;
  }

  constructor(data: string, isData1: boolean = false) {
    if (isData1) {
      this.data1 = data;
    } else {
      this.data = data;
    }
  }

  constructor(data1: string, data2: RouterDataParam) {
    this.data1 = data1;
    this.data2 = data2;
  }

  toJSON(): jsonx.JsonElement {
    let root: Map<string, jsonx.JsonElement> = new Map<string, jsonx.JsonElement>();
    if (this.data) {
      root.set('data', jsonx.JsonElement.createString(this.data!))
    }
    if (this.data1) {
      root.set('data1', jsonx.JsonElement.createString(this.data1!))
    }
    if (this.data2) {
      root.set('data2', this.data2!.toJSON());
    }
    return jsonx.JsonElement.createObject(root)
  }

  fromJSON(jsonElem: jsonx.JsonElement)
  {
    let data = jsonElem.tryGetElement('data');
    if (data) {
      this.data = data!.tryAsString();
    }
    let data1 = jsonElem.tryGetElement('data1');
    if (data1) {
      this.data1 = data1!.tryAsString();
    }
    let data2 = jsonElem.tryGetElement('data2');
    if (data2) {
      this.data2 = new RouterDataParam();
      this.data2!.fromJSON(data2!);
    }
  }
}

@Entry
@Component
struct OhosRouterA {
  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Text('A Page')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
      Button('Push')
        .key('pushButtonA')
        .backgroundColor('#FF0B8FE2')
        .fontSize(20)
        .margin({ top: 20 } as Margin)
        .onClick((e: ClickEvent) => {

          const routerInstance = AppStorage.get<Router>("router") as Router
          routerInstance.pushUrl({
            url: 'pages/ohosRouterBg', //1.1要跳转ohosRouterB，单没有ohosRouterB页面，只有ohosRouterBg页面
            params: (new RouterData('B Page')).toJSON()
          });
        });
      Button('back')
        .key('pushButtonA')
        .backgroundColor('#FF0B8FE2')
        .fontSize(20)
        .margin({ top: 20 } as Margin)
        .onClick((e: ClickEvent) => {
          const routerInstance = AppStorage.get<Router>("router") as Router
          routerInstance.pushUrl({
            url: 'pages/ohosRouterB',
            params: (new RouterData('B Page')).toJSON()
          });
        });
      Button('clear')
        .key('pushButtonA')
        .backgroundColor('#FF0B8FE2')
        .fontSize(20)
        .margin({ top: 20 } as Margin)
        .onClick((e: ClickEvent) => {
          const routerInstance = AppStorage.get<Router>("router") as Router
          routerInstance.pushUrl({
            url: 'pages/ohosRouterB',
            params: (new RouterData('B Page')).toJSON()
          });
        });
      Button('getLength')
        .key('pushButtonA')
        .backgroundColor('#FF0B8FE2')
        .fontSize(20)
        .margin({ top: 20 } as Margin)
        .onClick((e: ClickEvent) => {
          const routerInstance = AppStorage.get<Router>("router") as Router
          routerInstance.pushUrl({
            url: 'pages/ohosRouterB',
            params: (new RouterData('B Page')).toJSON()
          });
        });
      Button('enableAlertBeforeBackPage')
        .key('pushButtonA')
        .backgroundColor('#FF0B8FE2')
        .fontSize(20)
        .margin({ top: 20 } as Margin)
        .onClick((e: ClickEvent) => {
          const routerInstance = AppStorage.get<Router>("router") as Router
          routerInstance.pushUrl({
            url: 'pages/ohosRouterB',
            params: (new RouterData('B Page')).toJSON()
          });
        });
      Button('disableAlertBeforeBackPage')
        .key('pushButtonA')
        .backgroundColor('#FF0B8FE2')
        .fontSize(20)
        .margin({ top: 20 } as Margin)
        .onClick((e: ClickEvent) => {
          const routerInstance = AppStorage.get<Router>("router") as Router
          routerInstance.pushUrl({
            url: 'pages/ohosRouterB',
            params: (new RouterData('B Page')).toJSON()
          });
        });

      Button('pushurl1')
        .key('pushurlButton1')
        .backgroundColor('#FF0B8FE2')
        .fontSize(20)
        .margin({ top: 20 } as Margin)
        .onClick((e: ClickEvent) => {
          const routerInstance = AppStorage.get<Router>("router") as Router
          routerInstance.pushUrl({
            url: 'pages/ohosRouterB',
            params: (new RouterData('B Page')).toJSON()
          });
        });

      Button('Pushurl2')
        .key('pushurlButton1A')
        .backgroundColor('#FF0B8FE2')
        .fontSize(20)
        .margin({ top: 20 } as Margin)
        .onClick((e: ClickEvent) => {
          const routerInstance = AppStorage.get<Router>("router") as Router
          routerInstance.pushUrl(
            {
              url: 'pages/ohosRouterB',
              params: (new RouterData('B Page')).toJSON()
            });
        }, router.RouterMode.Standard);

      Button('replaceurl1')
        .key('replaceurl1A')
        .backgroundColor('#FF0B8FE2')
        .fontSize(20)
        .margin({ top: 20 } as Margin)
        .onClick((e: ClickEvent) => {
          const routerInstance = AppStorage.get<Router>("router") as Router
          routerInstance.replaceUrl({
            url: 'pages/ohosRouterB',
            params: (new RouterData('B Page')).toJSON()
          });
        });

      Button('replaceurl2')
        .key('replaceurl1')
        .backgroundColor('#FF0B8FE2')
        .fontSize(20)
        .margin({ top: 20 } as Margin)
        .onClick((e: ClickEvent) => {
          const routerInstance = AppStorage.get<Router>("router") as Router
          routerInstance.replaceUrl({
            url: 'pages/ohosRouterB',
            params: (new RouterData('B Page')).toJSON()
          });
        }, router.RouterMode.Standard);
    }.width('100%').height('100%')
  }
}