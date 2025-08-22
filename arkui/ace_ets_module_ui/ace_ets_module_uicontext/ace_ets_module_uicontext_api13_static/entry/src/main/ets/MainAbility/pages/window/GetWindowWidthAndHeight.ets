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

import { UIContext, Router } from '@ohos.arkui.UIContext';
import window from '@ohos.window';
import {
  Entry, Component,
  Column, ColumnOptions, Row,
  Text, Button, FontWeight, ClickEvent, Margin, WidthBreakpoint, HeightBreakpoint,
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
const uiContext = new UIContext()
@Entry
@Component
struct Index {
    @State message:string = 'Hello World';
    @State widthBp: WidthBreakpoint = -1 as WidthBreakpoint
    @State heightBp: HeightBreakpoint = -1 as HeightBreakpoint

    @State windowWidthBreakpoint: number = -1
    @State windowHeightBreakpoint: number = -1

    build(){
        Row(){
            Column(){
                Text(this.message)
                .fontSize(30)
                .fontWeight(FontWeight.Bold)
                Button('getWindowWidthBreakpoint').key('getWindowWidthBreakpointButton')
                .onClick((e:ClickEvent)=>{
                    let uiContext:UIContext = this.getUIContext();
                    this.widthBp = uiContext.getWindowWidthBreakpoint();
                    console.log(`sally----Window getWindowWidthBreakpoint is ${this.widthBp}`)
                }).margin({top:4} as Margin)

                Button('getWindowHeightBreakpoint').key('getWindowHeightBreakpointButton')
                .onClick((e:ClickEvent)=>{
                    let uiContext:UIContext = this.getUIContext();
                    this.heightBp = uiContext.getWindowHeightBreakpoint();
                    console.log(`sally----Window getWindowHeightBreakpoint is ${this.heightBp}`)
                }).margin({top:4} as Margin)

                Button('getWindowWidth').key('getWindowWidth')
                .onClick((e:ClickEvent)=>{
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    

                }).margin({top:4} as Margin)

                Text(this.windowWidthBreakpoint + '').key('windowWidthBreakpoint')
                Text(this.widthBp + '').key('widthBpValue')

                Text(this.heightBp + '').key('heightBpValue')
                Text(this.windowHeightBreakpoint + '').key('windowHeightBreakpoint')
            }
            .width('100%')
        }
        .height('100%')
    }
}