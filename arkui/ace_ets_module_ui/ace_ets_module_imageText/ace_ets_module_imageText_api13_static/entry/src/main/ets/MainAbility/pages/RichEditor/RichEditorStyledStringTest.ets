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

import { LengthMetrics, LengthUnit } from '@ohos.arkui.node'

import {Entry,Component,TextStyle,GestureStyle,Color,MutableStyledString,DecorationStyle,TextShadowStyle,BaselineOffsetStyle,LetterSpacingStyle,UrlStyle,
  ResourceColor,RichEditorStyledStringController,RichEditorStyledStringOptions,ResourceColor,StyledStringKey,Column,Text,RichEditor,Button,
  ColumnOptions,StyleOptions,TextDecorationType,ShadowOptions,ShadowType, Margin
} from '@ohos.arkui.component';
import { PromptAction } from '@ohos.arkui.UIContext';
import { ClickEvent } from '@ohos.arkui.component';

import {
  State,
  AppStorage
} from '@ohos.arkui.stateManagement'

@Entry
@Component
struct RichEditorStyledStringTest {
  
  clickGestureAttr: GestureStyle = new GestureStyle({
    onClick: () => {
      const promptAction = new PromptAction()
      promptAction.showToast({ message: 'clickGestureAttr object trigger click event' })
      this.backgroundColor1 = Color.Yellow
    }
  })
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  @State fontColor1: ResourceColor = Color.Red;
  controller: RichEditorStyledStringController = new RichEditorStyledStringController();
  options: RichEditorStyledStringOptions = {controller: this.controller} as RichEditorStyledStringOptions;
  controller2: RichEditorStyledStringController = new RichEditorStyledStringController();
  @State backgroundColor1: ResourceColor | undefined = undefined;
  @State styledKey1: StyledStringKey = StyledStringKey.DECORATION
  @State styledKey2: StyledStringKey = StyledStringKey.DECORATION
  @State styledKey3: StyledStringKey = StyledStringKey.DECORATION
  @State styledKey4: StyledStringKey = StyledStringKey.DECORATION
  @State styledKey5: StyledStringKey = StyledStringKey.DECORATION
  @State styledKey6: StyledStringKey = StyledStringKey.DECORATION

  onPageShow():void{
    
  }

  build(){
    Column() {
      Column({ space: 10 } as  ColumnOptions) {
        Text(this.styledKey1 + '').fontSize(12).id('gestureId')
        Text(this.styledKey2 + '').fontSize(12).id('decorationId')
        Text(this.styledKey3 + '').fontSize(12).id('textShadowId')
        Text(this.styledKey4 + '').fontSize(12).id('baselineOffsetId')
        Text(this.styledKey5 + '').fontSize(12).id('letterSpacingId')
        Text(this.styledKey6 + '').fontSize(12).id('urlId')
        RichEditor(this.options).onReady(():void => {
          
        }).padding(0)
          .height('20%')
          .width('100%')
          .borderWidth(1)
          .borderColor(Color.Black)
        Button('SearchOtherTextStyles').id('searchStyle')
          .onClick((e:ClickEvent):void=> {
            
            
            
            
            
            
            
          })
          .margin({ top: 10 } as Margin)
      }.width('100%')
    }
  }
}