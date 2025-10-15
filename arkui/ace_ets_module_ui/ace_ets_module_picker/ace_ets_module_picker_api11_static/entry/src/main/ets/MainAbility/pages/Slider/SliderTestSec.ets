/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import hilog from '@ohos.hilog';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import events_emitter from '@ohos.events.emitter';
import {
  Entry,
  Component,
  $r,
  Column,
  ColumnOptions,
  Text,
  Color,
  Flex,
  FlexDirection,
  ItemAlign,
  Row,
  Button,
  ClickEvent,
  Week,
  FontWeight,
  Axis,
  Margin,
  PickerTextStyle, CalendarAlign, Date, CalendarPicker,Slider,SliderChangeMode,SliderStyle,
  ArrowPosition, Select,BlurStyle,MenuAlignType,TextInputController,FlexAlign,Rating
} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,
} from '@ohos.arkui.stateManagement';
@Entry
@Component
struct Index {
  onPageShow(){
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId:10,
      priority:events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent,this.valueChangeCallBack)
    console.info("key==>pages res : onPageShow")
  }
  private valueChangeCallBack:(eventData: events_emitter.EventData) => void =(eventData: events_emitter.EventData)=> {
    console.info("key==> page valueChangeCallBack");
    if (eventData != null && eventData.data != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      const data = eventData.data as ESObject                        //需要先获取并声明类型之后  再访问成员属性
      if(data.getProperty('value').toString() =="true"){
        if( data.getProperty('content').toString() =="no") {
          this.valueNo = true;
        }
        if( data.getProperty('content').toString() =="null") {
          this.value = true
          this.isStr = false
          this.isNum = false
          this.isNUll = true
        }
        if( data.getProperty('content').toString() =="undefined") {
          this.value = true
          this.isStr = false
          this.isNum = false
          this.isNUll = false
        }
        if( data.getProperty('content').toString() =="ResourceTest") {
          this.style = SliderStyle.InSet
          this.resFalg = true
        }
      }
      if(data.getProperty('value').toString() =="false"){
        if( data.getProperty('content').toString() =="no") {
          this.valueNo = false;
        }
        if( data.getProperty('content').toString() =="null") {
          this.value = false
          this.isStr = false
          this.isNum = false
          this.isNUll = true
        }
        if( data.getProperty('content').toString() =="undefined") {
          this.value = false
          this.isStr = false
          this.isNum = false
          this.isNUll = false
        }
        if( data.getProperty('content').toString() =="ResourceTest") {
          this.style = SliderStyle.OutSet
          this.resFalg = false
        }
      }
      if(data.getProperty('value').toString() =="trueStr") {
        this.style = SliderStyle.InSet
        this.isStr = true
        this.value = true
        this.content = data.getProperty('content').toString();
      }
      if(data.getProperty('value').toString() =="falseStr") {
        this.style = SliderStyle.OutSet
        this.value = false
        this.isStr = true
        this.content = data.getProperty('content').toString();
      }
      if(data.getProperty('value').toString() =="trueNum") {
        this.isStr = false
        this.isNum = true
        this.value = true
        this.num = Number(data.getProperty('content').toString()) as double;
      }
      if(data.getProperty('value').toString() =="falseNum") {
        this.value = false
        this.isStr = false
        this.isNum = true
        this.num = Number(data.getProperty('content').toString()) as double;
      }
    }

  }
  aboutToAppear() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility index aboutToAppear');
  }

  @State ValueOne: double = 40;
  @State ValueTwo: double = 40;
  @State ValueThi: double = 40;
  @State ValueFour: double = 40;
  @State value:boolean = false;
  @State isStr:boolean = false;
  @State isNum:boolean = false;
  @State isNUll:boolean = false;
  @State valueNo:boolean = false;
  @State resFalg:boolean = false;
  @State content:string = "";
  @State style:SliderStyle = SliderStyle.InSet;
  @State direction_:Axis =Axis.Vertical;
  @State num: double = 0;

  build() {
    Row() {
      Column() {
        Slider({
          value: this.ValueOne,
          min: 0,
          max: 100,
          style: this.style
        })
          .showTips(this.value,this.isStr?this.content:fakeString(this.isNum?this.num:(this.isNUll? null:undefined)))
          .onChange((value: double, mode: SliderChangeMode) => {
            this.ValueOne = value
            console.info('value:' + value + 'mode:' + mode.toString())
          })
          .key('Slider')
        Slider({
          value: this.ValueTwo,
          min: 0,
          max: 100,
          style: this.style
        })
          .showTips(this.valueNo)
          .onChange((value: double, mode: SliderChangeMode) => {
            this.ValueTwo = value
            console.info('value:' + value + 'mode:' + mode.toString())
          })
          .key('SliderNoContent')
          Row(){
            Slider({
              value: this.ValueThi,
              step: 10,
              style: this.style,
              direction:Axis.Vertical
            })
              .height(300)
              .showSteps(true)
              .showTips(this.resFalg,$r("app.string.sliderTest"))
              .onChange((value: double, mode: SliderChangeMode) => {
                this.ValueThi = value
                console.info('value:' + value + 'mode:' + mode.toString())
              })
              .key('SliderResourceTest')
            Slider({
              value: this.ValueFour,
              step: 10,
              style: this.style,
              direction:Axis.Vertical
            })
              .height(300)
              .showSteps(true)
              .onChange((value: double, mode: SliderChangeMode) => {
                this.ValueFour = value
                console.info('value:' + value + 'mode:' + mode.toString())
              })
              .key('SliderNoShowTips')
          }
      }
      .width('100%')
    }
    .height('100%')
  }
}

function fakeString(val: string|double|null|undefined) {
  return val as string
}