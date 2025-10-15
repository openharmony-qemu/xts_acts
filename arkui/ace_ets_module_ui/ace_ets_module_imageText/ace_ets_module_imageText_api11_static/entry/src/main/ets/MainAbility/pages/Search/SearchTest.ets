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

import events_emitter from '@ohos.events.emitter';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import hilog from '@ohos.hilog';
import { MessageManager, Callback, Message } from '../../common/MessageManager';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import {
  Entry,
  Component,
  Column,
  Search,
  SearchType,
  Resource,
  Color,
  CancelButtonStyle,
  Font,
  IconOptions,
  CancelButtonOptions,
  $r,
  FontWeight
} from '@ohos.arkui.component';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import common from '@ohos.app.ability.common';

export class SliderExampleManager {
  name: string = ''
  message: MessageManager = new MessageManager()
}

@Entry
@Component
struct SliderExample {
  @State caretWidthNumber: undefined | number = 5
  @State caretWidthString: undefined | string = '15px'
  @State caretWidthResource: undefined | Resource = $r('sys.float.ohos_id_text_margin_vertical')
  @State caretColorColor: undefined | Color = Color.Red
  @State caretColorNumber: undefined | int = 0x000000
  @State caretColorString: undefined | string = '#ff9a35'
  @State caretColorResource: undefined | Resource = $r('sys.color.ohos_id_color_connected')
  @State leftSearchIconSizeNumber: undefined | number = 20
  @State leftSearchIconSizeString: undefined | string = '50px'
  @State leftSearchIconSizeResource: undefined | Resource = $r('sys.float.ohos_id_text_paragraph_margin_m')
  @State leftSearchIconColorColor: undefined | Color = Color.Red
  @State leftSearchIconColorNumber: undefined | int = 0x000000
  @State leftSearchIconColorString: undefined | string = '#ff9a35'
  @State leftSearchIconColorResource: undefined | Resource = $r('sys.color.ohos_id_color_connected')
  @State searchSrcPath: undefined | string = 'common/icon.png'
  @State searchSrcPathResource: undefined | Resource = $r('sys.media.ohos_app_icon')
  @State rightButtonStyleParam: undefined | CancelButtonStyle = CancelButtonStyle.INPUT
  @State rightCancelIconSizeNumber: undefined | number = 20
  @State rightCancelIconSizeString: undefined | string = '50px'
  @State rightCancelIconSizeResource: undefined | Resource = $r('sys.float.ohos_id_text_paragraph_margin_m')
  @State rightCancelIconColorColor: undefined | Color = Color.Red
  @State rightCancelIconColorNumber: undefined | int = 0x000000
  @State rightCancelIconColorString: undefined | string = '#ff9a35'
  @State rightCancelIconColorResource: undefined | Resource = $r('sys.color.ohos_id_color_connected')
  @State rightIconSrcPath: undefined | string = 'common/icon.png'
  @State rightIconSrcPathResource: undefined | Resource = $r('sys.media.ohos_app_icon')
  @State searchButtonFontSizeNumber: undefined | number = 20
  @State searchButtonFontSizeString: undefined | string = '10vp'
  @State searchButtonFontSizeResource: undefined | Resource = $r('sys.float.ohos_id_text_paragraph_margin_m')
  @State searchButtonFontColorColor: undefined | Color = Color.Blue
  @State searchButtonFontColorNumber: undefined | int = 0x000000
  @State searchButtonFontColorString: undefined | string = '#ff9a35'
  @State searchButtonFontColorResource: undefined | Resource = $r('sys.color.ohos_id_color_connected')
  @State textColorColor: undefined | Color = Color.Red
  @State textColorNumber: undefined | int = 0x000000
  @State textColorString: undefined | string = '#ff9a35'
  @State textColorResource: undefined | Resource = $r('sys.color.ohos_id_color_connected')
  @State placeholderFont: undefined | Font = { size: '16sp', weight: FontWeight.Normal } as Font
  @State textFont: undefined | Font = { size: '16sp', weight: FontWeight.Normal } as Font
  private stateChangCallBack: (eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {
    console.info("search page state change called:" + JSON.stringify(eventData));
    if (eventData.data === null || eventData.data === undefined) {
      return
    }
    this.caretWidthNumber =
      ((eventData.data) as ESObject).getProperty('caretWidthNumber') === -1 ? undefined : ((eventData.data) as ESObject).getProperty('caretWidthNumber').toNumber();
    this.caretWidthString = ((eventData.data) as ESObject).getProperty('caretWidthString').toString();
    this.caretWidthResource = ((eventData.data) as ESObject).getProperty('caretWidthResource').toStaticObject() as Resource;
    this.caretColorColor = ((eventData.data) as ESObject).getProperty('caretColorColor') .toStaticObject() as Color;
    this.caretColorNumber =
      ((eventData.data) as ESObject).getProperty('caretColorNumber') === -1 ? undefined : Double.toInt(((eventData.data) as ESObject).getProperty('caretColorNumber').toNumber());
    this.caretColorString = ((eventData.data) as ESObject).getProperty('caretColorString').toString();
    this.caretColorResource = ((eventData.data) as ESObject).getProperty('caretColorResource').toStaticObject() as Resource;
    this.leftSearchIconSizeNumber =
      ((eventData.data) as ESObject).getProperty('leftSearchIconSizeNumber') ? undefined : ((eventData.data) as ESObject).getProperty('leftSearchIconSizeNumber').toNumber();
    this.leftSearchIconSizeString = ((eventData.data) as ESObject).getProperty('leftSearchIconSizeString').toString();
    this.leftSearchIconSizeResource = ((eventData.data) as ESObject).getProperty('leftSearchIconSizeResource').toStaticObject() as Resource;
    this.leftSearchIconColorColor = ((eventData.data) as ESObject).getProperty('leftSearchIconColorColor') .toStaticObject() as Color;
    this.leftSearchIconColorNumber = ((eventData.data) as ESObject).getProperty('leftSearchIconColorNumber') === -1 ? undefined :
      Double.toInt(((eventData.data) as ESObject).getProperty('leftSearchIconColorNumber') .toNumber());
    this.leftSearchIconColorString = ((eventData.data) as ESObject).getProperty('leftSearchIconColorString').toString();
    this.leftSearchIconColorResource = ((eventData.data) as ESObject).getProperty('leftSearchIconColorResource').toStaticObject() as Resource;
    this.searchSrcPath =
      ((eventData.data) as ESObject).getProperty('searchSrcPath') === -1 ? undefined : ((eventData.data) as ESObject).getProperty('searchSrcPath').toString();
    this.searchSrcPathResource = ((eventData.data) as ESObject).getProperty('searchSrcPathResource').toStaticObject() as Resource;
    this.rightButtonStyleParam = ((eventData.data) as ESObject).getProperty('rightButtonStyleParam') === -1 ? undefined :
    ((eventData.data) as ESObject).getProperty('rightButtonStyleParam') .toStaticObject() as CancelButtonStyle;
    this.rightCancelIconSizeNumber = ((eventData.data) as ESObject).getProperty('rightCancelIconSizeNumber') === -1 ? undefined :
      ((eventData.data) as ESObject).getProperty('rightCancelIconSizeNumber') .toNumber();
    this.rightCancelIconSizeString = ((eventData.data) as ESObject).getProperty('rightCancelIconSizeString').toString();
    this.rightCancelIconSizeResource = ((eventData.data) as ESObject).getProperty('rightCancelIconSizeResource').toStaticObject() as Resource;
    this.rightCancelIconColorColor = ((eventData.data) as ESObject).getProperty('rightCancelIconColorColor') .toStaticObject() as Color;
    this.rightCancelIconColorNumber = ((eventData.data) as ESObject).getProperty('rightCancelIconColorNumber') === -1 ? undefined :
      Double.toInt(((eventData.data) as ESObject).getProperty('rightCancelIconColorNumber').toNumber());
    this.rightCancelIconColorString = ((eventData.data) as ESObject).getProperty('rightCancelIconColorString').toString();
    this.rightCancelIconColorResource = ((eventData.data) as ESObject).getProperty('rightCancelIconColorResource').toStaticObject() as Resource;
    this.rightIconSrcPath =
      ((eventData.data) as ESObject).getProperty('rightIconSrcPath') === -1 ? undefined : ((eventData.data) as ESObject).getProperty('rightIconSrcPath').toString();
    this.rightIconSrcPathResource = ((eventData.data) as ESObject).getProperty('rightIconSrcPathResource').toStaticObject() as Resource;
    this.searchButtonFontSizeNumber = ((eventData.data) as ESObject).getProperty('searchButtonFontSizeNumber') .toNumber();
    this.searchButtonFontSizeString = ((eventData.data) as ESObject).getProperty('searchButtonFontSizeString') === -1 ? undefined :
      ((eventData.data) as ESObject).getProperty('searchButtonFontSizeString').toString();
    this.searchButtonFontSizeResource = ((eventData.data) as ESObject).getProperty('searchButtonFontSizeResource').toStaticObject() as Resource;
    this.searchButtonFontColorColor = ((eventData.data) as ESObject).getProperty('searchButtonFontColorColor') .toStaticObject() as Color;
    this.searchButtonFontColorNumber = ((eventData.data) as ESObject).getProperty('searchButtonFontColorNumber') === -1 ? undefined :
      Double.toInt(((eventData.data) as ESObject).getProperty('searchButtonFontColorNumber').toNumber());
    this.searchButtonFontColorString = ((eventData.data) as ESObject).getProperty('searchButtonFontColorString').toString();
    this.searchButtonFontColorResource = ((eventData.data) as ESObject).getProperty('searchButtonFontColorResource').toStaticObject() as Resource;
    this.textColorColor = ((eventData.data) as ESObject).getProperty('textColorColor') .toStaticObject() as Color;
    this.textColorNumber =
      ((eventData.data) as ESObject).getProperty('textColorNumber') === -1 ? undefined : Double.toInt(((eventData.data) as ESObject).getProperty('textColorNumber').toNumber());
    this.textColorString = ((eventData.data) as ESObject).getProperty('textColorString').toString();
    this.textColorResource = ((eventData.data) as ESObject).getProperty('textColorResource').toStaticObject() as Resource;
  }
  messageManager: MessageManager = new MessageManager()

  onPageShow() {
    console.info('search onPageShow')
 
    const sliderExampleManager = new SliderExampleManager();
    sliderExampleManager.message = this.messageManager;
    sliderExampleManager.name = 'messageManager'
    AppStorage.setOrCreate<SliderExampleManager>('sliderExampleManager', sliderExampleManager)
    let callback: Callback = (message: Message) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'caretWidthResource') {
        this.caretWidthResource = message.value as Resource
      }
      if (message.name == 'caretColorResource') {
        this.caretColorResource = message.value as Resource
      }
      if (message.name == 'leftSearchIconColorResource') {
        this.leftSearchIconColorResource = message.value as Resource
      }
      if (message.name == 'searchSrcPathResource') {
        this.searchSrcPathResource = message.value as Resource
      }
      if (message.name == 'rightCancelIconColorResource') {
        this.rightCancelIconColorResource = message.value as Resource
      }
      if (message.name == 'rightIconSrcPathResource') {
        this.rightIconSrcPathResource = message.value as Resource
      }
      if (message.name == 'searchButtonFontSizeResource') {
        this.searchButtonFontSizeResource = message.value as Resource
      }
      if (message.name == 'searchButtonFontColorResource') {
        this.searchButtonFontColorResource = message.value as Resource
      }
      if (message.name == 'textColorResource') {
        this.textColorResource = message.value as Resource
      }
    }
    this.messageManager.registerCallback(callback)
  }

  aboutToAppear() {
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 183,
      priority: events_emitter.EventPriority.LOW
    }

    events_emitter.on(stateChangeEvent, this.stateChangCallBack);

    let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
    let abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
    hilog.info(0x0000, 'testTag', '%{public}s', 'start run testcase!!!');
  }

  build() {
    Column() {
      Search({ value: '', placeholder: 'Type to search...' })
        .searchButton('Search')
        .key('searchTestDefault')

      Search({ value: '', placeholder: 'Type to search...' })
        .caretStyle({
          color: $r('app.color.Caretcolor'),
          width: $r('app.float.Caretwidth')
        })
        .searchIcon({
          color: $r('sys.color.ohos_id_color_secondary'),
        } as IconOptions)
        .cancelButton({
          icon: {
            color: $r('sys.color.ohos_id_color_secondary'),
          } as IconOptions
        } as CancelButtonOptions)
        .searchButton(
          'Search',
          {
            fontSize: $r('sys.float.ohos_id_text_size_body1'),
            fontColor: $r('sys.color.ohos_id_color_text_primary_activated')
          }
        )
        .fontColor($r('sys.color.ohos_id_color_text_primary'))
        .key('searchTestDefaultapp')

      Search({ value: '', placeholder: 'Type to search...' })
        .caretStyle({
          color: $r('app.color.Caretcolor'),
          width: $r('app.string.Caretwidth001')
        })
        .searchIcon({
          color: $r('sys.color.ohos_id_color_secondary'),
        } as IconOptions)
        .cancelButton({
          icon: {
            color: $r('sys.color.ohos_id_color_secondary'),
          } as IconOptions
        } as CancelButtonOptions)
        .searchButton(
          'Search',
          {
            fontSize: $r('sys.float.ohos_id_text_size_body1'),
            fontColor: $r('sys.color.ohos_id_color_text_primary_activated')
          }
        )
        .fontColor($r('sys.color.ohos_id_color_text_primary'))
        .key('searchTestDefaultapp001')

      Search({ value: '', placeholder: 'Type to search...' })
        .caretStyle({
          color: $r('app.color.Caretcolor'),
          width: $r('app.integer.Caretwidth')
        })
        .searchIcon({
          color: $r('sys.color.ohos_id_color_secondary'),
        } as IconOptions)
        .cancelButton({
          icon: {
            color: $r('sys.color.ohos_id_color_secondary'),
          } as IconOptions
        } as CancelButtonOptions)
        .searchButton(
          'Search',
          {
            fontSize: $r('sys.float.ohos_id_text_size_body1'),
            fontColor: $r('sys.color.ohos_id_color_text_primary_activated')
          }
        )
        .fontColor($r('sys.color.ohos_id_color_text_primary'))
        .key('searchTestDefaultapp002')

      Search({ value: '', placeholder: 'Type to search...' })
        .width(300)
        .height(40)
        .margin(5)
        .searchIcon({
          size: this.leftSearchIconSizeNumber,
          color: this.leftSearchIconColorNumber,
          src: this.searchSrcPath
        } as IconOptions)
        .cancelButton({
          style: this.rightButtonStyleParam,
          icon: {
            size: this.rightCancelIconSizeNumber,
            color: this.rightCancelIconColorNumber,
            src: this.rightIconSrcPath
          } as IconOptions
        } as CancelButtonOptions)
        .searchButton(
          'Search',
          {
            fontSize: this.searchButtonFontSizeNumber,
            fontColor: this.searchButtonFontColorNumber
          }
        )
        .placeholderFont(this.placeholderFont)
        .textFont(this.textFont)
        .fontColor(this.textColorNumber)
        .key('searchTestfontcaretcolor')

      Search({ value: '', placeholder: 'Type to search...' })
        .caretStyle({
          color: $r('sys.color.ohos_id_color_text_primary_activated')
        })
        .searchIcon({
          color: $r('sys.color.search_icon_color'),
        } as IconOptions)
        .cancelButton({
          icon: {
            color: $r('sys.color.search_icon_color'),
          } as IconOptions
        } as CancelButtonOptions)
        .searchButton(
          'Search',
          {
            fontSize: $r('sys.float.Body_M'),
            fontColor: $r('sys.color.ohos_id_color_text_primary_activated')
          }
        )
        .fontColor($r('sys.color.ohos_id_color_text_primary'))
        .key('searchTestDefaultValue')

      Search({ value: '', placeholder: 'Type to search...' })
        .width(300)
        .height(40)
        .margin(5)
        .caretStyle({
          width: this.caretWidthNumber,
          color: this.caretColorNumber
        })
        .searchIcon({
          size: this.leftSearchIconSizeNumber,
          color: this.leftSearchIconColorNumber,
          src: this.searchSrcPath
        } as IconOptions)
        .cancelButton({
          style: this.rightButtonStyleParam,
          icon: {
            size: this.rightCancelIconSizeNumber,
            color: this.rightCancelIconColorNumber,
            src: this.rightIconSrcPath
          } as IconOptions
        } as CancelButtonOptions)
        .searchButton(
          'Search',
          {
            fontSize: this.searchButtonFontSizeNumber,
            fontColor: this.searchButtonFontColorNumber
          }
        )
        .placeholderFont(this.placeholderFont)
        .textFont(this.textFont)
        .fontColor(this.textColorNumber)
        .key('searchTestNumber')

      Search({ value: '', placeholder: 'Type to search...' })
        .width(300)
        .height(40)
        .margin(5)
        .caretStyle({
          width: this.caretWidthString,
          color: this.caretColorString
        })
        .searchIcon({
          size: this.leftSearchIconSizeString,
          color: this.leftSearchIconColorString,
          src: this.searchSrcPath
        } as IconOptions)
        .cancelButton({
          style: this.rightButtonStyleParam,
          icon: {
            size: this.rightCancelIconSizeString,
            color: this.rightCancelIconColorString,
            src: this.rightIconSrcPath
          } as IconOptions
        } as CancelButtonOptions)
        .searchButton(
          'Search',
          {
            fontSize: this.searchButtonFontSizeString,
            fontColor: this.searchButtonFontColorString
          }
        )
        .placeholderFont(this.placeholderFont)
        .textFont(this.textFont)
        .fontColor(this.textColorString)
        .key('searchTestString')

      Search({ value: '', placeholder: 'Type to search...' })
        .width(300)
        .height(40)
        .margin(5)
        .caretStyle({
          width: this.caretWidthResource,
          color: this.caretColorResource
        })
        .searchIcon({
          size: this.leftSearchIconSizeResource,
          color: this.leftSearchIconColorResource,
          src: this.searchSrcPathResource
        } as IconOptions)
        .cancelButton({
          style: this.rightButtonStyleParam,
          icon: {
            size: this.rightCancelIconSizeResource,
            color: this.rightCancelIconColorResource,
            src: this.rightIconSrcPathResource
          } as IconOptions
        } as CancelButtonOptions)
        .searchButton(
          'Search',
          {
            fontSize: this.searchButtonFontSizeResource,
            fontColor: this.searchButtonFontColorResource
          }
        )
        .placeholderFont(this.placeholderFont)
        .textFont(this.textFont)
        .fontColor(this.textColorResource)
        .key('searchTestResource')

      Search({ value: '', placeholder: 'Type to search...' })
        .width(300)
        .height(40)
        .margin(5)
        .caretStyle({
          width: this.caretWidthResource,
          color: $r('sys.color.ohos_id_color_connected')
        })
        .searchIcon({
          size: this.leftSearchIconSizeResource,
          color: $r('sys.color.ohos_id_color_connected'),
          src: this.searchSrcPathResource
        } as IconOptions)
        .cancelButton({
          style: this.rightButtonStyleParam,
          icon: {
            size: this.rightCancelIconSizeResource,
            color: $r('sys.color.ohos_id_color_connected'),
            src: this.rightIconSrcPathResource
          } as IconOptions
        } as CancelButtonOptions)
        .searchButton(
          'Search',
          {
            fontSize: this.searchButtonFontSizeResource,
            fontColor: $r('sys.color.ohos_id_color_connected')
          }
        )
        .placeholderFont(this.placeholderFont)
        .textFont(this.textFont)
        .fontColor($r('sys.color.ohos_id_color_connected'))
        .key('searchTestResource2')

      Search({ value: '', placeholder: 'Type to search...' })
        .width(300)
        .height(40)
        .margin(5)
        .caretStyle({
          width: this.caretWidthNumber,
          color: this.caretColorColor
        })
        .searchIcon({
          size: this.leftSearchIconSizeNumber,
          color: this.leftSearchIconColorColor,
          src: this.searchSrcPath
        } as IconOptions)
        .cancelButton({
          style: this.rightButtonStyleParam,
          icon: {
            size: this.rightCancelIconSizeNumber,
            color: this.rightCancelIconColorColor,
            src: this.rightIconSrcPath
          } as IconOptions
        } as CancelButtonOptions)
        .searchButton(
          'Search',
          {
            fontSize: this.searchButtonFontSizeNumber,
            fontColor: this.searchButtonFontColorColor
          }
        )
        .placeholderFont(this.placeholderFont)
        .textFont(this.textFont)
        .fontColor(this.textColorColor)
        .key('searchTestColor')
    }
    .width('100%')
    .height('100%')
  }
}
