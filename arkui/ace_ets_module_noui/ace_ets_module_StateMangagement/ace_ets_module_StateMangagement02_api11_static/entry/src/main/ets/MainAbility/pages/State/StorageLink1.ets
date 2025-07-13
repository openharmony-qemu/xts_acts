/**
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
import {
  Entry,
  Column,
  Component,
  Button,
  ClickEvent,
  ForEach,
  Text,
  Row,
  Flex,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Builder,
  NavPathStack,
  FontWeight,
  Navigation,
  NavDestination,
  NavigationMode,
  ButtonType,
  Color,
  DatePicker
} from '@ohos.arkui.component'
import {
  State,
  Watch,
  Link,
  Provide,
  Prop,
  ObjectLink,
  Observed,
  Consume,
  StorageProp,
  StorageLink,
  LocalStorage,
  LocalStorageProp,
  LocalStorageLink,
  Observed,
} from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from "@ohos.hilog";
import common from '@ohos.app.ability.common';
AppStorage.clear()

enum ABC{A= 1,B=2,C=3}

class ModelLink1Person {
  name: string = ''
  age: number = 1
  sex: string = ''
  constructor(name: string,age: number,sex: string) {
    this.name = name
    this.age = age
    this.sex = sex
  }
}

interface ModelLink1 {
  value: string
}
class Model {
  value: string = ''

  constructor(value: string) {
    this.value = value
  }
}
 let aAnu: ABC = ABC.B
 let aAlass1: Model = new Model('Title:Hello World')
 let aAbj: ModelLink1Person =new ModelLink1Person('zs',12,'m')
 let aAtrArray: Array<string> =new Array<string>('zs','ls')
 let aAumArray: Array<number> =new Array<number>(1,2)
 let aAoolArray: Array<boolean> =new Array<boolean>(true,false)
 let aAlassArray: Array<Model> =new Array<Model>(new Model('hello world'),new Model('hello music'))
 let aAbjArray: Array<ModelLink1Person> =new Array<ModelLink1Person>(new ModelLink1Person('zs',18,'m'),new ModelLink1Person('ls',18,'m'))
 let aAenuArray: Array<ABC> =new Array<ABC>(ABC.A,ABC.B)
AppStorage.setOrCreate('Prop1', 47, Type.from<common.Context>());
AppStorage.setOrCreate('Prop2', 'aaa', Type.from<common.Context>());
AppStorage.setOrCreate('Prop3', false, Type.from<common.Context>());
AppStorage.setOrCreate('Prop4', aAnu, Type.from<common.Context>());
AppStorage.setOrCreate('Prop5', aAlass1, Type.from<common.Context>());
AppStorage.setOrCreate('Prop6', aAbj, Type.from<common.Context>());
AppStorage.setOrCreate('Prop7', aAtrArray, Type.from<common.Context>());
AppStorage.setOrCreate('Prop8', aAumArray, Type.from<common.Context>());
AppStorage.setOrCreate('Prop9', aAoolArray, Type.from<common.Context>());
AppStorage.setOrCreate('Prop10', aAlassArray, Type.from<common.Context>());
AppStorage.setOrCreate('Prop11', aAbjArray, Type.from<common.Context>());
AppStorage.setOrCreate('Prop12', aAenuArray, Type.from<common.Context>());

@Entry
@Component
struct StorageLink1 {
  @StorageLink('Prop1') son1: number = 1;
  @StorageLink('Prop2') son2: string = 'aaa';
  @StorageLink('Prop3') son3: Boolean = false;
  @StorageLink('Prop4') son4: ABC = ABC.A;
  @StorageLink('Prop5') son5: Model = new Model('Title:Hello World')
  @StorageLink('Prop6') son6: ModelLink1Person = new ModelLink1Person('zs',12,'m')
  @StorageLink('Prop7') son7: Array<string> = new Array<string>('zs','ls')
  @StorageLink('Prop8') son8: Array<number> = new Array<number>(1,2)
  @StorageLink('Prop9') son9: Array<boolean> = new Array<boolean>(true,false)
  @StorageLink('Prop10') son10: Array<Model> =  new Array<Model>(new Model('hello world'),new Model('hello music'))
  @StorageLink('Prop11') son11: Array<ModelLink1Person> = new Array<ModelLink1Person>(new ModelLink1Person('zs',12,'m'),new ModelLink1Person('ls',12,'m'))
  @StorageLink('Prop12') son12: Array<ABC> = new Array<ABC>(ABC.A,ABC.B)

  @State num: number| undefined = 0
  @State string1: string| undefined = 'aaa'
  @State boolean1: boolean| undefined = false
  @State enu: ABC| undefined = ABC.B
  @State class1: Model| undefined = new Model('Title:Hello World')
  @State obj: ModelLink1Person| undefined = new ModelLink1Person('zs',12,'m')
  @State strArray: Array<string>| undefined =new Array<string>('zs','ls')
  @State numArray: Array<number>| undefined =new Array<number>(1,2)
  @State boolArray: Array<boolean>| undefined =new Array<boolean>(true,false)
  @State classArray: Array<Model>| undefined =new Array<Model>(new Model('hello world'),new Model('hello music'))
  @State objArray: Array<ModelLink1Person>| undefined = new Array<ModelLink1Person>(new ModelLink1Person('zs',12,'m'),new ModelLink1Person('ls',12,'m'))
  @State menuArray: Array<ABC>| undefined =new Array<ABC>(ABC.A,ABC.B)
  aboutToAppear() {
    let uiContext = this.getUIContext();
    try {
      let router = uiContext.getRouter();
      AppStorage.setOrCreate<Router>('StorageLink1', router, Type.from<common.Context>());
    } catch (error: Error) {
      console.log('error ' + error);
    }
  }

  build() {
    Column() {
      Button(`num: ${this.num}`).width("100%").height('5%')
        .key("button_son1")
        .onClick((e: ClickEvent) => {
          // AppStorage.set('PropA', this.num)
          this.son1 = 11111
          this.num = AppStorage.get<number>('Prop1', Type.from<common.Context>());
        })

      Button(`string: ${this.string1}`).width("100%").height('5%')
        .key("button_son2")
        .onClick((e: ClickEvent) => {
          this.son2 = 'sss'
          this.string1 = AppStorage.get<string>('Prop2', Type.from<common.Context>());
        })

      Button(`boolean: ${this.boolean1}`).width("100%").height('5%')
        .key("button_son3")
        .onClick((e: ClickEvent) => {
          this.son3 = true
          this.boolean1 = AppStorage.get<boolean>('Prop3', Type.from<common.Context>());
        })

      Button(`enu: ${this.enu}`).width("100%").height('5%')
        .key("button_son4")
        .onClick((e: ClickEvent) => {
          this.son4 = ABC.C
          this.enu = AppStorage.get<ABC>('Prop4', Type.from<common.Context>());
        })

      Button(`class: ${this.class1?.value}`).width("100%").height('5%')
        .key("button_son5")
        .onClick((e: ClickEvent) => {
          this.son5 = new Model('Title:Hello C')
          this.class1 = AppStorage.get<Model>('Prop5', Type.from<common.Context>());
        })

      Button(`obj: ${JSON.stringify(this.obj)}`).width("100%").height('5%')
        .key("button_son6")
        .onClick((e: ClickEvent) => {
          this.son6 = new ModelLink1Person('ls',13,'')
          this.obj = AppStorage.get<ModelLink1Person>('Prop6', Type.from<common.Context>())
        })

      Button(`strArray: ${this.strArray}`).width("100%").height('5%')
        .key("button_son7")
        .onClick((e: ClickEvent) => {
          this.son7 = ['ls','zs']
          this.strArray = AppStorage.get<Array<string>>('Prop7', Type.from<common.Context>())
        })

      Button(`numArray: ${this.numArray}`).width("100%").height('5%')
        .key("button_son8")
        .onClick((e: ClickEvent) => {
          this.son8 = [2,3]
          this.numArray = AppStorage.get<Array<number>>('Prop8', Type.from<common.Context>())
        })

      Button(`boolArray: ${this.boolArray}`).width("100%").height('5%')
        .key("button_son9")
        .onClick((e: ClickEvent) => {
          this.son9 = [false,true]
          this.boolArray = AppStorage.get<Array<boolean>>('Prop9', Type.from<common.Context>())
        })

      Button(`classArray: ${JSON.stringify(this.classArray)}`).width("100%").height('5%')
        .key("button_son10")
        .onClick((e: ClickEvent) => {
          this.son10 = new Array<Model>(new Model('hello world'),new Model('hello C'))
          this.classArray = AppStorage.get<Array<Model>>('Prop10', Type.from<common.Context>())
        })

      Button(`objArray: ${JSON.stringify(this.objArray)}`).width("100%").height('5%')
        .key("button_son11")
        .onClick((e: ClickEvent) => {
          this.son11 = new Array<ModelLink1Person>(new ModelLink1Person('ls',12,'m'),new ModelLink1Person('zs',12,'m'))
          this.objArray = AppStorage.get<Array<ModelLink1Person>>('Prop11', Type.from<common.Context>())
        })

      Button(`menuArray: ${this.menuArray}`).width("100%").height('5%')
        .key("button_son12")
        .onClick((e: ClickEvent) => {
          this.son12 = [ABC.B,ABC.C]
          this.menuArray = AppStorage.get<Array<ABC>>('Prop12', Type.from<common.Context>())
        })

    }
  }
}