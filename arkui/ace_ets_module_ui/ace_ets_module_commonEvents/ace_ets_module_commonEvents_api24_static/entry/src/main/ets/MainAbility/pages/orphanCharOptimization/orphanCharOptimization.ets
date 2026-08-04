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

      import {
 	   Entry,
 	   Row,
 	   Column,
 	   Component,
 	   Button,
 	   ClickEvent,
 	   AttributeModifier,
 	   RichEditorAttribute,
 	   RichEditor,
 	   RichEditorParagraphResult,
 	   RichEditorController,
 	   RichEditorStyledStringController,
 	   RichEditorStyledStringOptions,
 	   StyleOptions,
 	   RichEditorOptions,
 	   Divider,
 	   RichEditorTextSpanOptions,
 	   ResourceStr,
 	   RichEditorParagraphStyle,
 	   WordBreak,
 	   TextStyleInterface,
 	   FontWeight,
 	   Color,
 	   FontStyle,
 	   TextAlign,
 	   TextOverflow,
 	   ParagraphStyle,
 	   TextStyle,
 	   StyledString,
 	   MutableStyledString,
 	   StyledStringKey,
 	   Text, TextArea, TextInput,
 	   Optional,LineBreakStrategy,
 	   Margin, 
 	   DecorationStyleInterface, 
 	   TextDecorationType, 
 	   TextDecorationStyle, 
 	   TextDecorationOptions, 
 	   TextInputStyle, VoidCallback
 	 } from '@ohos.arkui.component'
 	 import { State, Observed } from '@ohos.arkui.stateManagement'
 	 import hilog from '@ohos.hilog'
 	 @Entry
 	 @Component
 	 struct orphanCharOptimizationExample{
 	   @State message: string = '凤舞龙飞凤舞龙飞凤舞';
 	   @State orphanCharOptimizationXTS: (Optional<boolean>) = true;
 	   controller: RichEditorController = new RichEditorController();
 	 
 	   build() {
 	     Column() {
 	       Row() {
 	         Text(this.message)
 	           .fontSize(20)
 	           .width('38%')
 	           .orphanCharOptimization(this.orphanCharOptimizationXTS)
 	           .id('jsText')
 	         TextArea({ text: this.message })
 	           .fontSize(20)
 	           .width('38%')
 	           .orphanCharOptimization(this.orphanCharOptimizationXTS)
 	           .id('jsTextArea')
 	       }
 	 
 	       Row() {
 	         TextInput({ text: this.message })
 	           .fontSize(20)
 	           .width('38%')
 	           .orphanCharOptimization(this.orphanCharOptimizationXTS)
 	           .id('jsTextInput')
 	         RichEditor({ controller: this.controller })
 	           .onReady(() => {
 	             this.controller.addTextSpan('凤舞龙飞凤舞龙飞凤舞',
 	               {
 	                 style: {
 	                   fontColor: Color.Black,
 	                   fontSize: '20'
 	                 },
 	               })
 	           })
 	           .id('jsRichEditor')
 	           .width('38%')
 	           .orphanCharOptimization(this.orphanCharOptimizationXTS)
 	       }
 	 
 	       Row() {
 	         Button('T')
 	           .onClick(() => {
 	             this.orphanCharOptimizationXTS = true;
 	           })
 	           .id('true')
 	         Button('F')
 	           .onClick(() => {
 	             this.orphanCharOptimizationXTS = false;
 	           })
 	           .id('false')
 	         Button('Un')
 	           .onClick(() => {
 	             this.orphanCharOptimizationXTS = undefined;
 	           })
 	           .id('undefined')
 	       }
 	     }.height('100%').width('100%')
 	   }
 	 }