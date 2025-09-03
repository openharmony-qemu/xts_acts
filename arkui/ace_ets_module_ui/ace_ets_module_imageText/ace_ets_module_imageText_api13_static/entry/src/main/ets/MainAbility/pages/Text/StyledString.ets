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
import promptAction from '@ohos.promptAction';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage,State} from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { ResourceColor, Entry, Component,RichEditorOptions,Column,RichEditor,FlexAlign,BarState,Row,Button,ClickEvent,TextInput,TextArea,
  Search,Text,TextStyle,MutableStyledString,TextController,TextController,UrlStyle,TextController,StyledStringKey,Color,TextOptions,ColumnOptions,CopyOptions,
  FontStyle,Margin,StyleOptions
} from '@ohos.arkui.component';


@Entry
@Component
struct styled_string_StyleString {
    
    
    
    
    
    
    
    
    
    @State fontColor1: ResourceColor = Color.Red;
    controller: TextController = new TextController();
    options: TextOptions = { controller: this.controller } as TextOptions;
    controller2: TextController = new TextController();
    @State styledKey1: StyledStringKey = StyledStringKey.DECORATION

   onPageShow() {
        
    }

    build() {
        Column() {
            Column({ space: 10 } as ColumnOptions) {
                
                Text(this.styledKey1 + '').fontSize(12).id('urlId')

                Text(undefined, this.options)
                    .fontColor(this.fontColor1)
                    .font({ size: 20, weight: 500, style: FontStyle.Normal })

                Text(undefined, { controller: this.controller2 })
                    .fontSize(30)
                    .copyOption(CopyOptions.InApp)
                    .draggable(true)

                Button('查询文本样式').id('searchStyle')
                    .onClick((e:ClickEvent) => {
                        
                        
                    })
                    .margin({ top: 10 } as Margin)
            }.width('100%')

        }
    }
}