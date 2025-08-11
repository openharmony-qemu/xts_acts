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
  Entry,Component,$r,Scroll,Builder,List,ListItem,Resource,animateTo,AnimateParam,Search,TextAlign,Axis,NavDestinationInfo,
  NavigationTitleMode,Image,NavigationMode,Column,Navigation,ButtonType,NavDestination,Stack,ColumnOptions,ToggleType,NavigationTitleOptions,
  Position,EffectType,EffectComponent,Text,Color,Flex,FlexDirection,ItemAlign,Row,Button,ClickEvent,NavDestinationCommonTitle,NavigationCommonTitle,
  FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle, CalendarAlign,ShadowOptions,FontStyle, Date,FlexAlign,Padding,Toggle
,NavPathStack} from '@ohos.arkui.component';
import {
  State,
  Link,
  Prop,Provide
} from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { LengthMetrics } from '@kit.ArkUI';
import { TextModifier } from '@ohos.arkui.modifier';

class MainTitleTextModifier extends TextModifier {
  applyNormalAttribute(instance: TextModifier): void {
      console.log(`testTag mainTitle use style1`);
      instance.fontColor('#FFFFC000')
      instance.fontSize(35)
      instance.fontWeight(FontWeight.Bolder)
      instance.fontStyle(FontStyle.Normal)
      instance.textShadow({radius: 5, offsetX: 9} as ShadowOptions)
  }
}

class SubTitleTextModifier extends TextModifier {
  applyNormalAttribute(instance: TextModifier): void {
      console.log(`testTag subTitle use style1`);
      instance.fontColor('#FFFFCEEE')
      instance.fontSize(15)
      instance.fontWeight(FontWeight.Bolder)
      instance.fontStyle(FontStyle.Normal)
      instance.textShadow({radius: 5, offsetX: 9} as ShadowOptions)
  }
}

@Entry
@Component
struct NavigationTitleTextModifier {
  private navPathStack: NavPathStack = new NavPathStack();
  // 初始化标题栏起始端内间距
  @State paddingStart: LengthMetrics = LengthMetrics.vp(10);
  // 初始化标题栏结束端内间距
  @State paddingEnd: LengthMetrics = LengthMetrics.vp(10);
  // 主标题样式修改器
  @State mainTitleModifier: MainTitleTextModifier = new MainTitleTextModifier();
  // 副标题样式修改器
  @State subTitleModifier: SubTitleTextModifier = new SubTitleTextModifier();
  @State applyModifier: boolean = false;

  build() {
    Navigation(this.navPathStack) {
      Column() {
        Row() {
          Text(`apply Modifier`)
          Toggle({isOn: this.applyModifier, type: ToggleType.Switch}).onChange((isOn: boolean) => {
            this.applyModifier = isOn;
          }).id('applyModifier_toggleId')
        }
        .padding({ top: 95, left: 5, right: 5 } as Padding)
        .width(180)
        .justifyContent(FlexAlign.SpaceBetween)
        .padding({ top: 40, left: 5, right: 5 } as Padding)
        .width(180)
        .justifyContent(FlexAlign.SpaceBetween)
      }
      .width('100%')
      .height('100%')
    }
    .titleMode(NavigationTitleMode.Full)
    .title(
      {main: 'Title', sub: 'subTitle'} as NavigationCommonTitle,
      this.applyModifier ?
        {
          paddingStart: this.paddingStart,
          paddingEnd: this.paddingEnd,
          mainTitleModifier: this.mainTitleModifier,
          subTitleModifier: this.subTitleModifier,
        } as NavigationTitleOptions : {
        paddingStart: this.paddingStart,
        paddingEnd: this.paddingEnd
      } as NavigationTitleOptions)
  }
}