'use static';
import {
  Entry,
  Flex,
  FlexAlign,
  ItemAlign,
  FlexDirection,
  Column,
  Component,
  Button,
  ClickEvent,
  Color,
  TextClock,
  Optional,
  DateTimeOptions,
  Callback,
  FontWeight,
  CrownSensitivity,
  PickerTextStyle,
  ColumnOptions,
  RowOptions,
  Row,
  Text,
  AttributeModifier,
  TextClockController,
  TextClockAttribute,
  FontStyle,
  ShadowOptions,
  Margin
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'
import inspector from '@ohos.arkui.inspector'

@Observed
export class MyModifier1 implements AttributeModifier<TextClockAttribute> {
  public dateTimeOptionsMFlag: boolean = true;
  public fontFeatureFlag: boolean = true;
  public fontFamilyFlag: boolean = true;
  public fontWeightFlag: boolean = true;
  public fontStyleFlag: boolean = true;
  public fontSizeFlag: boolean = true;
  public fontColorFlag: boolean = true;
  public textShadowMFlag: boolean = true;

  applyNormalAttribute(instance: TextClockAttribute): void {
    instance
      .dateTimeOptions(this.dateTimeOptionsMFlag ?
        undefined : { hour: '2-digit' } as DateTimeOptions)
      .fontFeature(this.fontFeatureFlag ? undefined : '\"sinf\" on')
      .fontFamily(this.fontFamilyFlag ? undefined : 'sans-serif')
      .fontWeight(this.fontWeightFlag ? undefined : FontWeight.Bold)
      .fontStyle(this.fontStyleFlag ? undefined : FontStyle.Italic)
      .fontSize(this.fontSizeFlag ? undefined : 50.0)
      .fontColor(this.fontColorFlag ? undefined : Color.Red)
      .textShadow(this.textShadowMFlag ? undefined : [{
        radius: 10,
        color: Color.Red
      }] as Array<ShadowOptions>)
  }
}

@Observed
export class MyModifier2 implements AttributeModifier<TextClockAttribute> {
  public onDateChangeFlag: boolean = true;
  public accumulateTime: Long = 0;

  applyNormalAttribute(instance: TextClockAttribute): void {
    instance
      .onDateChange(this.onDateChangeFlag ? undefined : (value: Long) => {
        if (value !== 0) {
          this.accumulateTime = 1;
        }
      })
  }
}

@Entry
@Component
struct Index {
  controller: TextClockController = new TextClockController();
  controller2: TextClockController = new TextClockController();
  @State myModifier1: MyModifier1 = new MyModifier1();
  @State myModifier2: MyModifier2 = new MyModifier2();

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      TextClock({ timeZoneOffset: -8, controller: this.controller })
        .id('textClockM_1')
        .width('100%')
        .height('8%')
        .attributeModifier(this.myModifier1)
      TextClock({ timeZoneOffset: -8, controller: this.controller2 })
        .id('textClockM_2')
        .width('100%')
        .height('8%')
        .attributeModifier(this.myModifier2)
      TextClock()
        .fontColor(undefined)
        .id('textClock_originModifier')
        .width('100%')
        .height('8%')
      Text('Current milliseconds is ' + this.myModifier2.accumulateTime)
        .id('textClock_onDateChangeM_Text')
        .width('100%')
        .height('4%')
      Button('切换 dateTimeOptions → ' + (this.myModifier1.dateTimeOptionsMFlag ? 'undefined' : '2-digit'))
        .id('dateTimeOptionsM_Btn')
        .width('100%')
        .height('5%')
        .onClick((e: ClickEvent) => {
          this.myModifier1.dateTimeOptionsMFlag = !this.myModifier1.dateTimeOptionsMFlag
        }).margin({ top: '1%' } as Margin)
      Button('切换 fontFeature → ' + (this.myModifier1.fontFeatureFlag ? 'undefined' : '\"sinf\" on'))
        .id('fontFeatureM_Btn')
        .width('100%')
        .height('5%')
        .onClick((e: ClickEvent) => {
          this.myModifier1.fontFeatureFlag = !this.myModifier1.fontFeatureFlag
        }).margin({ top: '1%' } as Margin)
      Button('切换 fontFamily → ' + (this.myModifier1.fontFamilyFlag ? 'undefined' : 'sans-serif'))
        .id('fontFamilyM_Btn')
        .width('100%')
        .height('5%')
        .onClick((e: ClickEvent) => {
          this.myModifier1.fontFamilyFlag = !this.myModifier1.fontFamilyFlag
        }).margin({ top: '1%' } as Margin)
      Button('切换 fontWeight → ' + (this.myModifier1.fontWeightFlag ? 'undefined' : 'FontWeight.Bold'))
        .id('fontWeightM_Btn')
        .width('100%')
        .height('5%')
        .onClick((e: ClickEvent) => {
          this.myModifier1.fontWeightFlag = !this.myModifier1.fontWeightFlag
        }).margin({ top: '1%' } as Margin)
      Button('切换 fontStyle → ' + (this.myModifier1.fontStyleFlag ? 'undefined' : 'FontStyle.Italic'))
        .id('fontStyleM_Btn')
        .width('100%')
        .height('5%')
        .onClick((e: ClickEvent) => {
          this.myModifier1.fontStyleFlag = !this.myModifier1.fontStyleFlag
        }).margin({ top: '1%' } as Margin)
      Button('切换 fontSize → ' + (this.myModifier1.fontSizeFlag ? 'undefined' : '50.0'))
        .id('fontSizeM_Btn')
        .width('100%')
        .height('5%')
        .onClick((e: ClickEvent) => {
          this.myModifier1.fontSizeFlag = !this.myModifier1.fontSizeFlag
        }).margin({ top: '1%' } as Margin)
      Button('切换 fontColor → ' + (this.myModifier1.fontColorFlag ? 'undefined' : 'Red'))
        .id('fontColorM_Btn')
        .width('100%')
        .height('5%')
        .onClick((e: ClickEvent) => {
          this.myModifier1.fontColorFlag = !this.myModifier1.fontColorFlag
        }).margin({ top: '1%' } as Margin)
      Button('切换 textShadow → ' + (this.myModifier1.textShadowMFlag ? 'undefined' : 'true'))
        .id('textShadowM_Btn')
        .width('100%')
        .height('5%')
        .onClick((e: ClickEvent) => {
          this.myModifier1.textShadowMFlag = !this.myModifier1.textShadowMFlag
        }).margin({ top: '1%' } as Margin)
      Button('切换 onDateChange → ' + (this.myModifier2.onDateChangeFlag ? 'undefined' : 'true'))
        .id('onDateChangeM_Btn')
        .width('100%')
        .height('5%')
        .onClick((e: ClickEvent) => {
          this.myModifier2.onDateChangeFlag = !this.myModifier2.onDateChangeFlag
        }).margin({ top: '1%' } as Margin)
      Button('reset_Text')
        .id('TextClock_textM_resetBtn')
        .width('100%')
        .height('5%')
        .onClick((e: ClickEvent) => {
          this.myModifier2.accumulateTime = 0;
        }).margin({ top: '1%' } as Margin)
    }
    .width('100%')
    .height('90%')
    .padding('1%')
  }
}
