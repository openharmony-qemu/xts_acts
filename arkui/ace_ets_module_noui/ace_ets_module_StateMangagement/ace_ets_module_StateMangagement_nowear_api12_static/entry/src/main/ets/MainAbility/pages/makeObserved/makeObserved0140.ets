/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { UIUtils } from '@kit.ArkUI';
import {
  DataReloadOperation,
  DataOperationType,
  Entry,
  Text,
  TextAttribute,
  Column,
  Component,
  Stack,
  WaterFlow,
  LazyForEach,
  FlowItem,
  DataOperation,
  Color,
  TextAlign,
  DataChangeListener,
  IDataSource,
  Button,
  ButtonAttribute,
  ClickEvent,
  Image,
  Search,
  Row,
  Column,
  SearchController,ComponentV2,ForEach,
  ColumnOptions,WaterFlowSections,Scroller,SectionOptions
} from '@ohos.arkui.component'
import { State, Link, PropRef, } from '@ohos.arkui.stateManagement'
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import common from '@ohos.app.ability.common';

@Entry
@ComponentV2
struct makeObserved0140 {
  colors: Array<number> = [0XFFC0CB, 0XDA70D6, 0X6B8E23, 0X6A5ACD, 0x00FFF, 0X00FF7F] as Array<number>
  sections: WaterFlowSections = UIUtils.makeObserved(new WaterFlowSections())
  scroller: Scroller = new Scroller()
  
  oneColumnSection: SectionOptions = {
    itemsCount: 3,
    crossCount: 1,
  } as SectionOptions
  twoColumnSection: SectionOptions = {
    itemsCount: 2,
    crossCount: 2,
  } as SectionOptions
  lastSection: SectionOptions = {
    itemsCount: 3,
    crossCount: 3
  } as SectionOptions

  aboutToAppear(): void {
    let sectionOptions: Array<SectionOptions> = [this.oneColumnSection, this.twoColumnSection, this.lastSection] as Array<SectionOptions>
    this.sections.splice(0, 0, sectionOptions)
  }

  build() {
    Column() {
      
      Button('push option').height('5%').onClick(():void => {
        
        
        
        
        let section: SectionOptions = { itemsCount: 4, crossCount: 2 } as SectionOptions
        this.sections.push(section)
      }).id('buttonPush')
      Button('splice option').height('5%').onClick(():void => {
        let section: SectionOptions = { itemsCount: 12, crossCount: 3 } as SectionOptions
        
      }).id('buttonSplice')
      Button('update option').height('5%').onClick(():void => {
        let section: SectionOptions = { itemsCount: 12, crossCount: 4 } as SectionOptions
        this.sections.update(0, section)
      }).id('buttonUpdate')
      WaterFlow({ scroller: this.scroller, sections: this.sections }) {
        
        
        
        
        
        
        
        
        
      }.id('waterFlowTest')
    }
  }
}