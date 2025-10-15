/**
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { Entry, Component, Column, Flex, FlexDirection, ItemAlign, FlexAlign, Text, Alignment, TextAlign, TextOverflow, ClickEvent } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import common from '@ohos.app.ability.common';
import Log from '../../common/Log';

const TAG = 'ets_apiLack_add';

@Entry
@Component
struct FeatureAbilityStartAbility {
  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear FeatureAbilityStartAbility start`)
  }

  aboutToDisappear() {
    Log.showInfo(TAG, `aboutToDisAppear FeatureAbilityStartAbility end`)
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {

      Text("featureAbility-StartAbility")
        .width(320)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("startAbilityText")
        .onClick((e: ClickEvent) => {
          let context: common.UIAbilityContext = this.getUIContext().getHostContext() as common.UIAbilityContext;
          context.startAbility({
            bundleName: "com.example.testapp",
            abilityName: "com.example.testApp.MainAbility"
          })
        })

      Text("featureAbility-StartAbilityForResult")
        .width(320)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("startAbilityForResultText")
        .onClick((e: ClickEvent) => {
          let context: common.UIAbilityContext = this.getUIContext().getHostContext() as common.UIAbilityContext;
          context.startAbilityForResult({
            bundleName: "com.example.testapp",
            abilityName: "com.example.testApp.MainAbility"
          })
        })

      Text("featureAbility-FinishWithResult")
        .width(320)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("finishWithResultText")
        .onClick((e: ClickEvent) => {
          
        })

      Text("featureAbility-GetDeviceList")
        .width(320)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("getDeviceListText")
        .onClick((e: ClickEvent) => {
          
        })

      Text("featureAbility-CallAbility")
        .width(320)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("callAbilityText")
        .onClick((e: ClickEvent) => {
          
          
          
          
          
          
        })

      Text("featureAbility-ContinueAbility")
        .width(320)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("continueAbilityText")
        .onClick((e: ClickEvent) => {
          
        })

      Text("featureAbility-SubscribeAbilityEvent")
        .width(320)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("subscribeAbilityEventText")
        .onClick((e: ClickEvent) => {
          
          
          
          
          
          
          
        })

      Text("featureAbility-UnsubscribeAbilityEvent")
        .width(320)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("unsubscribeAbilityEventText")
        .onClick((e: ClickEvent) => {
          
          
          
          
          
          
        })

      Text("featureAbility-SendMsg")
        .width(320)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("sendMsgText")
        .onClick((e: ClickEvent) => {
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
        })

      Text("featureAbility-SubscribeMsg")
        .width(320)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("subscribeMsgText")
        .onClick((e: ClickEvent) => {
          
          
          
          
          
          
          
          
        })

      Text("featureAbility-UnsubscribeMsg")
        .width(320)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("unsubscribeMsgText")
        .onClick((e: ClickEvent) => {
          
        })

      Text("featureAbility-StartAbility")
        .width(320)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("featureAbility-StartAbility")
        .onClick((e: ClickEvent) => {
          
          
          
          
          
          
          
          
          
          
          
        })

      Text("featureAbility-startAbilityForResult")
        .width(320)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("featureAbility-startAbilityForResult")
        .onClick((e: ClickEvent) => {
          
          
          
          
          
          
          
          
          
          
        })

      Text("featureAbility-finishWithResult")
        .width(320)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("featureAbility-finishWithResult")
        .onClick((e: ClickEvent) => {
          
          
          
          
          
          
        })

      Text("featureAbility-getDeviceList")
        .width(320)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("featureAbility-finishWithResult")
        .onClick((e: ClickEvent) => {
          
          
          
        })

      Text("featureAbility-getDeviceList")
        .width(320)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("featureAbility-finishWithResult")
        .onClick((e: ClickEvent) => {
          
          
          
        })

      Text("featureAbility-callAbility")
        .width(320)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("featureAbility-callAbility")
        .onClick((e: ClickEvent) => {
          
          
          
          
          
          
          
          
        })

      Text("featureAbility-continueAbility")
        .width(320)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("featureAbility-continueAbility")
        .onClick((e: ClickEvent) => {
          
          
          
        })
      Text("featureAbility-subscribeAbilityEvent")
        .width(320)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("featureAbility-subscribeAbilityEvent")
        .onClick((e: ClickEvent) => {
          
          
          
          
          
          
          
          
          
          
          
        })
      Text("featureAbility-unsubscribeAbilityEvent")
        .width(320)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("featureAbility-unsubscribeAbilityEvent")
        .onClick((e: ClickEvent) => {
        
        
        
        
        
        
        
        
        
        })

    }
    .width("100%")
    .height("100%")
  }
}

