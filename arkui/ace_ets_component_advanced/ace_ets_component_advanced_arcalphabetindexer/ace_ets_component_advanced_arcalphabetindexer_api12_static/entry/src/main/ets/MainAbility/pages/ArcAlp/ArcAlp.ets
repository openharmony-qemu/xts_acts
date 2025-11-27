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
import { ComponentContent, ColorMetrics, LengthMetrics } from '@ohos.arkui.node';
import { UIContext, PromptAction } from '@ohos.arkui.UIContext';
// import { ArcAlphabetIndexer } from '@ohos.arkui.ArcAlphabetIndexer';
import events_emitter from '@ohos.events.emitter';
import {Callback} from '@ohos.base';
// import prompt from '@ohos.prompt'
import { Builder, Entry, Component, Scroller, FontStyle, Color, BlurStyle, Column, Stack, Row } from '@ohos.arkui.component'
import { State  } from '@ohos.arkui.stateManagement';
const commonFamily = 'HarmonyOS Sans'

// @Builder
// function buildText() {
//   Stack() {
//     Text('head')
//       .fontSize(30)
//       .padding(10)
//       .backgroundColor(0xF9CF93)
//       .border({ width: '1px', color: Color.Black })
//
//     Divider().width('100%').height('1px')
//   }
//   .alignContent(Alignment.Bottom)
// }

@Entry
@Component
struct ArcListAndIndexer {
  context: UIContext = this.getUIContext()
  // tabBar1: ComponentContent<Object> = new ComponentContent<Object>(this.context, wrapBuilder(buildText));
  private scrollerForList: Scroller = new Scroller()
  @State onSelectStatus: boolean = false;
  @State indexerIndex: number = 0;
  @State usePopup: boolean = false;
  private itemSize: number = 24;
  @State color:string = '#FFFAFA';
  @State selectedColor:Color = Color.Red;
  @State popupColor:string = '#00FF7F';
  @State selectedBackgroundColor:Color = Color.Blue;
  @State usePopupOne:boolean = true;
  @State selectedFontSize:string='10.00fp';
  @State selectedFontStyle:FontStyle = FontStyle.Italic
  @State selectedFontWeight:number = 200;
  @State family:string = commonFamily;
  @State fontSize:string = '15.00fp';
  @State fontStyle:FontStyle = FontStyle.Italic
  @State fontWeight:number = 300;
  @State popupFontSize:string = '20.00fp';
  @State popupFontStyle:FontStyle = FontStyle.Italic
  @State popupFontWeight:number = 300;
  @State itemSizeOne:number=20;
  @State selected:number=1;
  @State autoCollapse:boolean= false;
  @State popupBackground:Color=Color.Green;
  @State popupBackgroundBlurStyle:BlurStyle = BlurStyle.BACKGROUND_THIN;
  private fullValue: string[] = [
    '#', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N',
    'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'
  ]
  private singleValue: string[] = [
    '#', 'A', 'B', 'C', 'D'
  ]
  private arrName: string[] = [
    '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20',
    '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31', '32', '33', '34', '35', '36', '37', '38',
    '39', '40', '41', '42',
  ];

  private valueChangeCallBack:(eventData: events_emitter.EventData) =>void  = (eventData: events_emitter.EventData) : void => {
    console.info('webViewMediaOption page valueChangeCallBack');
    if(eventData != null){
      console.info('valueChangeCallBack:'+   JSON.stringify(eventData));
      if(eventData.data != null){
        const data = eventData.data as Record<String,undefined|null|Object>
        this.color = data['color'] as string;
        this.selectedColor = data['selectedColor'] as Color;
        this.popupColor = data["popupColor"] as string;
        this.selectedBackgroundColor = data["selectedBackgroundColor"] as Color;
        this.usePopupOne =  data["usePopup"] as boolean;
        this.selectedFontSize = data["selectedFontSize"] as string
        this.selectedFontStyle = data["selectedFontStyle"] as FontStyle;
        this.selectedFontWeight = data["selectedFontWeight"] as double;
        this.family = data["family"] as string;
        this.fontSize = data["fontSize"] as string;
        this.fontStyle = data["fontStyle"] as FontStyle;
        this.fontWeight = data["fontWeight"] as double;
        this.popupFontSize = data["popupFontSize"] as string;
        this.popupFontStyle = data["popupFontStyle"] as FontStyle;
        this.popupFontWeight = data["popupFontWeight"] as double;
        this.itemSizeOne = data["itemSize"] as double;
        this.selected = data["selected"] as double;
        this.autoCollapse = data["autoCollapse"] as Boolean;
        this.popupBackground = data["popupBackground"] as Color;
        this.popupBackgroundBlurStyle = data["popupBackgroundBlurStyle"] as BlurStyle;
      }
    }
  }

  onPageShow(){
    let valueChangeEvent:events_emitter.InnerEvent={
      eventId:10,
      priority:events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent,this.valueChangeCallBack)
  }

  showToast(message: string) {
    // PromptAction.showToast({
    //   message: message,
    //   duration: 2000
    // });
  }
  build() {
    Column() {
      Row() {
        Stack() {
          // ArcAlphabetIndexer({ arrayValue: this.fullValue, selected: 0 })
          //   .key('arcAlphabetIndex01')
          //   .autoCollapse(true)
          //   .width('100%')
          //   .height('100%')
          //   .borderWidth(1)

          // ArcAlphabetIndexer({ arrayValue: this.singleValue, selected: 0 })
          //   .key('arcAlphabetIndex02')
          //   .width(100)
          //   .height(100)
          //   .color(ColorMetrics.resourceColor('#FFFAFA'))
          //   .selectedColor(ColorMetrics.resourceColor(Color.Red))
          //   .popupColor(ColorMetrics.resourceColor('#00FF7F'))
          //   .selectedBackgroundColor(ColorMetrics.resourceColor(Color.Blue))
          //   .popupBackground(ColorMetrics.resourceColor('#FF1F71FF'))
          //   .popupBackgroundBlurStyle(BlurStyle.BACKGROUND_THIN)
          //   .usePopup(true)
          //   .selectedFont({
          //     size: '10.00fp',
          //     style: FontStyle.Italic,
          //     weight: 200,
          //     family: commonFamily
          //   })
          //   .font({
          //     size: '15.00fp',
          //     style: FontStyle.Italic,
          //     weight: 300,
          //     family: commonFamily
          //   })
          //   .popupFont({
          //     size: '20.00fp',
          //     style: FontStyle.Italic,
          //     weight: 400,
          //     family: commonFamily
          //   })
          //   .itemSize(LengthMetrics.vp(20))
          //   .selected(1)
          //   .autoCollapse(false)

          // ArcAlphabetIndexer({ arrayValue: this.singleValue, selected: 0 })
          //   .key('arcAlphabetIndex03')
          //   .width('100%')
          //   .height('100%')
          //   .color(ColorMetrics.resourceColor('#FFFAFA'))
          //   .selectedColor(ColorMetrics.resourceColor(Color.Red))
          //   .popupColor(ColorMetrics.resourceColor('#00FF7F'))
          //   .selectedBackgroundColor(ColorMetrics.resourceColor(Color.Blue))
          //   .popupBackground(ColorMetrics.resourceColor('#FF1F71FF'))
          //   .popupBackgroundBlurStyle(BlurStyle.BACKGROUND_THIN)
          //   .selectedFont({
          //     size: '-10.00fp',
          //     style: FontStyle.Italic,
          //     weight: -200,
          //     family: commonFamily
          //   })
          //   .font({
          //     size: '-15.00fp',
          //     style: FontStyle.Italic,
          //     weight: -300,
          //     family: commonFamily
          //   })
          //   .popupFont({
          //     size: '-20.00fp',
          //     style: FontStyle.Italic,
          //     weight: -400,
          //     family: commonFamily
          //   })
          //   .itemSize(LengthMetrics.vp(-20))
          //   .selected(-1)
          //
          // ArcAlphabetIndexer({ arrayValue: this.singleValue, selected: 0 })
          //   .key('arcAlphabetIndex04')
          //   .autoCollapse(true)
          //   .width('100%')
          //   .height('100%')
          //   .borderWidth(1)
          //
          // ArcAlphabetIndexer({ arrayValue: this.singleValue, selected: 0 })
          //   .key('arcAlphabetIndex05')
          //   .width('100%')
          //   .height('100%')
          //   .color(ColorMetrics.resourceColor(this.color))
          //   .selectedColor(ColorMetrics.resourceColor(this.selectedColor))
          //   .popupColor(ColorMetrics.resourceColor(this.popupColor))
          //   .selectedBackgroundColor(ColorMetrics.resourceColor(this.selectedBackgroundColor))
          //   .popupBackground(ColorMetrics.resourceColor(this.popupBackground))
          //   .popupBackgroundBlurStyle(this.popupBackgroundBlurStyle)
          //   .usePopup(this.usePopupOne)
          //   .selectedFont({
          //     size: this.selectedFontSize,
          //     style: this.selectedFontStyle,
          //     weight: this.selectedFontWeight,
          //     family: this.family
          //   })
          //   .font({
          //     size: this.fontSize,
          //     style: this.fontStyle,
          //     weight: this.fontWeight,
          //     family: this.family
          //   })
          //   .popupFont({
          //     size: this.popupFontSize,
          //     style: this.popupFontStyle,
          //     weight: this.popupFontWeight,
          //     family: this.family
          //   })
          //   .itemSize(LengthMetrics.vp(this.itemSizeOne))
          //   .selected(this.selected)
          //   .autoCollapse(this.autoCollapse)
        // .onSelect((index: number) => {
        //   console.info(this.singleValue[index] + 'on onSelect')
        //   this.showToast('onSelect() ' + index)
        //   this.onSelectStatus = true;
        //   try {
        //     let backData: events_emitter.EventData = {
        //       data: {
        //         'STATUS': this.onSelectStatus
        //       }
        //     }
        //     let backEvent: events_emitter.InnerEvent = {
        //       eventId: 60201,
        //       priority: events_emitter.EventPriority.LOW
        //     }
        //     console.info('onSelect start to emit action state')
        //     events_emitter.emit(backEvent, backData)
        //   } catch (err) {
        //     console.info('onSelect emit action state err: ' + JSON.stringify((err as Error)?.message))
        //   }
        // })
        }.width('100%').height('100%')
      }.width('100%').height('100%')
    }
  }
}