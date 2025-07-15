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
import web_webview from '@ohos.web.webview'
import { BusinessError } from '@ohos.base';
import {
  Entry,
  Column,
  Component,
  Flex,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Text,
  Button,
  FontWeight,
  ButtonType,
  ClickEvent,
  Margin,
  FlexOptions,
  ColumnOptions,
  TextAlign,
  Scroll,
  Image,
// RemoteWindow
// FormError
// ,FormComponent
// WindowAnimationTarget
// FormDimension
// FormCallbackInfo
  $r,
  $$,
  SheetType,
  BindOptions,
  SheetOptions,
  Alignment,
  Color,
  Row,
  Scroller,
  PatternLockController,
  SearchController,
  XComponentController,
  List,
  Grid,
  Stack,
  Blank,
  Toggle,
  Checkbox,
  DataPanel,
  DatePicker,
  DatePickerResult,
  Divider,
  Gauge,
  Marquee,
  PatternLock,
  Progress,
  QRCode,
  Radio,
  Rating,
  RichText,
  Search,
  Slider,
  SliderChangeMode,
  TimePicker,
  TimePickerResult,
  XComponent,
  ForEach,
  Axis,
  EdgeEffect,
  ListOptions,
  ListItem,
  Visibility,
  ProgressOptions,
  GridItem,
  AlphabetIndexer,
  ToggleType,
  AlphabetIndexerOptions,
  IndexerAlign,
  Padding,
  DataPanelType,
  StyleOptions,
  SizeOptions,
  MarqueeOptions,
  ProgressStyleOptions,
  ProgressType,
  RadioOptions,
  RatingOptions,
  Position,
  SliderStyle,
  XComponentOptions,
  DatePickerOptions
} from '@ohos.arkui.component'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage, Link } from '@ohos.arkui.stateManagement';
import { Hypium } from '../../../../hypium/index';
import { State } from '@ohos.arkui.stateManagement'

const uiContext = new UIContext();

@Entry
@Component
struct noBarrierComponents {
  scroller: Scroller = new Scroller();
  private arr: Array<number> = [0, 1] as Array<number>;
  @State Number: Array<string> = ['0', '1'] as Array<string>;
  private arrayA: Array<string> = ['安'] as Array<string>;
  private arrayB: Array<string> = ['卜', '白', '包', '毕', '丙'] as Array<string>;
  private arrayC: Array<string> = ['曹', '成', '陈', '催'] as Array<string>;
  private arrayL: Array<string> = ['刘', '李', '楼', '梁', '雷', '吕', '柳', '卢'] as Array<string>;
  private value: Array<string> =
    ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V',
      'W', 'X', 'Y', 'Z'] as Array<string>;
  public valueArr: Array<number> = [10, 10] as Array<number>;
  @State isLunar: boolean = false;
  private selectedDate: Date = new Date('2021-08-08');
  @State formId: number = 0;
  @State start: boolean = false;
  private fromStart: boolean = true;
  private step: number = 50;
  private loop: number = Infinity;
  private src: string = "Running Marquee starts rolling";
  @State passwords: Array<number> = [] as Array<number>;
  @State message: string = 'please input password!';
  private patternLockController: PatternLockController = new PatternLockController();
  private value1: string = 'hello world';
  @State rating: number = 3.5;
  // @State target?: WindowAnimationTarget = undefined;
  @State data: string = '<h1 style="text-align: center;">h1标题</h1>';
  @State changeValue: string = '';
  @State submitValue: string = '';
  controller: SearchController = new SearchController();
  @State outSetValueOne: number = 40;
  @State isMilitaryTime: boolean = false;
  private selectedTime: Date = new Date('2022-07-22T08:00:00');
  controller1: web_webview.WebviewController = new web_webview.WebviewController();
  private surfaceId: string = '';
  xcomponentController: XComponentController = new XComponentController();

  build() {
    Scroll(this.scroller) {
      Column() {
        Text('textAlign1')
          .key('textAlign1')
          .fontSize(20)
          .fontColor(0xCCCCCC)
          .accessibilityText("我是无障碍组件")

        Text('textAlign2')
          .key('textAlign2')
          .fontSize(20)
          .fontColor(0xCCCCCC)
          .accessibilityText("")

        Text('textAlign3')
          .key('textAlign3')
          .fontSize(20)
          .fontColor(0xCCCCCC)
          .accessibilityText("我是无障碍组件我是无障碍组件我是无障碍组件我是无障碍组件我是无障碍组件我是无障碍组件我是无障碍组件我是无障碍组件我是无障碍组件我是无障碍组件我是无障碍组件我是无障碍组件我是无障碍组件我是无障碍组件我是无障碍组件我是无障碍组件我是无障碍组件我是无障碍组件我是无障碍组件我是无障碍组件我是无障碍组件我是无障碍组件我是无障碍组件我是无障碍组件我是无障碍组件我是无障碍组件我是无障碍组件我是无障碍组件我是无障碍组件我是无障碍组件我是无障碍组件我是无障碍组件我是无障碍组件我是无障碍组件我是无障碍组件我是无障碍组件")

        List({ space: 20, initialIndex: 0 } as ListOptions) {
          ForEach(this.arr, (item: number, index: number) => {
            ListItem() {
              Text('' + item)
                .width('100%')
                .height(100)
                .fontSize(16)
                .textAlign(TextAlign.Center)
                .borderRadius(10)
                .backgroundColor(0xFFFFFF)
            }
          }, (item: number, index: number) => item + '')
        }
        .key("list")
        .listDirection(Axis.Vertical)
        .divider({
          strokeWidth: 2,
          color: 0xFFFFFF,
          startMargin: 20,
          endMargin: 20
        })
        .edgeEffect(EdgeEffect.Spring)
        .onScrollIndex((firstIndex: number, lastIndex: number): void => {
          console.info('first' + firstIndex)
          console.info('last' + lastIndex)
        })
        .accessibilityText("我是无障碍组件")
        .width('90%')

        Grid() {
          ForEach(this.Number, (day: string) => {
            ForEach(this.Number, (day: string) => {
              GridItem() {
                Text(day)
                  .fontSize(16)
                  .backgroundColor(0xF9CF93)
                  .width('100%')
                  .height('100%')
                  .textAlign(TextAlign.Center)
              }
            }, (day: string) => day)
          }, (day: string) => day)
        }
        .key("Grid")
        .columnsTemplate('1fr 1fr ')
        .rowsTemplate('1fr 1fr ')
        .columnsGap(10)
        .rowsGap(10)
        .width('90%')
        .backgroundColor(0xFAEEE0)
        .accessibilityText("我是无障碍组件")
        .height(300)

        Stack({ alignContent: Alignment.Start }) {
          Row() {
            List({ space: 20, initialIndex: 0 }) {
              ForEach(this.arrayA, (item: string) => {
                ListItem() {
                  Text(item)
                    .width('80%')
                    .height('5%')
                    .fontSize(30)
                    .textAlign(TextAlign.Center)
                }
              }, (item: string) => item)

              ForEach(this.arrayB, (item: string) => {
                ListItem() {
                  Text(item)
                    .width('80%')
                    .height('5%')
                    .fontSize(30)
                    .textAlign(TextAlign.Center)
                }
              }, (item: string) => item)

              ForEach(this.arrayC, (item: string) => {
                ListItem() {
                  Text(item)
                    .width('80%')
                    .height('5%')
                    .fontSize(30)
                    .textAlign(TextAlign.Center)
                }
              }, (item: string) => item)

              ForEach(this.arrayL, (item: string) => {
                ListItem() {
                  Text(item)
                    .width('80%')
                    .height('5%')
                    .fontSize(30)
                    .textAlign(TextAlign.Center)
                }
              }, (item: string) => item)
            }
            .width('50%')
            .height('100%')

            AlphabetIndexer({ arrayValue: this.value, selected: 0 } as AlphabetIndexerOptions)
              .selectedColor(0xFFFFFF)
              .popupColor(0xFFFAF0)
              .selectedBackgroundColor(0xCCCCCC)
              .popupBackground(0xD2B48C)
              .usingPopup(true)
              .selectedFont({ size: 16, weight: FontWeight.Bolder })
              .popupFont({ size: 30, weight: FontWeight.Bolder })
              .itemSize(28)
              .alignStyle(IndexerAlign.Left)
              .onSelect((index: number): void => {
                console.info(this.value[index] + ' Selected!')
              })
              .onRequestPopupData((index: Double): Array<String> => {
                if (this.value[index] == 'A') {
                  return this.arrayA
                } else if (this.value[index] == 'B') {
                  return this.arrayB
                } else if (this.value[index] == 'C') {
                  return this.arrayC
                } else if (this.value[index] == 'L') {
                  return this.arrayL
                } else {
                  return []
                }
              })
              .onPopupSelect((index: number): void => {
                console.info('onPopupSelected:' + index)
              })
          }
          .width('100%')
          .height('100%')
        }
        .key("AlphabetIndexer")
        .accessibilityText("我是无障碍组件")

        Column() {
          Row() {
            Text('Bluetooth').fontSize(18)
            Blank()
            Toggle({ type: ToggleType.Switch })
              .margin({
                top: 14,
                bottom: 14,
                left: 6,
                right: 6
              } as Margin)
          }.width('100%').backgroundColor(0xFFFFFF).borderRadius(15).padding({ left: 12 } as Padding)
        }
        .backgroundColor(0xEFEFEF)
        .padding(20)
        .key("Blank")
        .accessibilityText("我是无障碍组件")


        Button('OK', { type: ButtonType.Normal, stateEffect: true })
          .borderRadius(8)
          .backgroundColor(0x317aff)
          .width(90)
          .key("Button")
          .accessibilityText("我是无障碍组件")
          .onClick((e: ClickEvent) => {
            console.log('ButtonType.Normal')
          })

        Checkbox({ name: 'checkbox1', group: 'checkboxGroup' })
          .select(true)
          .selectedColor(0xed6f21)
          .onChange((value: boolean): void => {
            console.info('Checkbox1 change is' + value)
          })
          .key("Checkbox")
          .accessibilityText("我是无障碍组件")

        DataPanel({ values: this.valueArr, max: 100, type: DataPanelType.Line })
          .width(300)
          .height(10)
          .key("DataPanel")
          .accessibilityText("我是无障碍组件")

        DatePicker({
          start: new Date('1970-1-1'),
          end: new Date('2100-1-1'),
          selected: this.selectedDate
        } as DatePickerOptions)
          .lunar(this.isLunar)// .onChange((value: DatePickerResult):void => {
            //   this.selectedDate.setFullYear(value.year!, value.month, value.day)
            //   console.info('select current date is: ' + JSON.stringify(value))
            // })
          .key("DatePicker")
          .accessibilityText("我是无障碍组件")

        Divider().strokeWidth(8).color('#F1F3F5').key("Divider").accessibilityText("我是无障碍组件")

        // FormComponent({
        //   id: this.formId,
        //   name: "Form1",
        //   bundle: "com.example.cardexample",
        //   ability: "FormAbility",
        //   module: "entry",
        //   dimension: FormDimension.Dimension_2_2,
        //   temporary: false
        // } )
        //   .allowUpdate(true)
        //   .size({ width: 360, height: 360 } as SizeOptions)
        //   .visibility(Visibility.Visible)
        //   .onAcquired((form: FormCallbackInfo):void => {
        //     console.log(`form info : ${JSON.stringify(form)}`);
        //     this.formId = form.id;
        //   })
        //   .onError((err: FormError):void => {
        //     console.log(`fail to add form, err: ${JSON.stringify(err)}`);
        //   })
        //   .key("FormComponent")
        //   .accessibilityText("我是无障碍组件")

        Gauge({ value: 75 })
          .width(200)
          .height(200)
          .colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])
          .key("Gauge")
          .accessibilityText("我是无障碍组件")

        Image($r('app.media.icon'))
          .width(110)
          .height(110)
          .border({ width: 1 })
          .overlay('png', { align: Alignment.Bottom, offset: { x: 0, y: 20 } })
          .key("Image")
          .accessibilityText("我是无障碍组件")

        Marquee({
          start: this.start,
          step: this.step,
          loop: this.loop,
          fromStart: this.fromStart,
          src: this.src
        } as MarqueeOptions)
          .width(360)
          .height(80)
          .fontColor('#FFFFFF')
          .fontSize(48)
          .fontWeight(700)
          .backgroundColor('#182431')
          .key("Marquee")
          .accessibilityText("我是无障碍组件")
          .margin({ bottom: 40 } as Margin)
          .onStart(() => {
            console.info('Marquee animation complete onStart')
          })
          .onBounce(() => {
            console.info('Marquee animation complete onBounce')
          })
          .onFinish(() => {
            console.info('Marquee animation complete onFinish')
          })

        PatternLock(this.patternLockController)
          .sideLength(200)
          .circleRadius(9)
          .pathStrokeWidth(18)
          .activeColor('#B0C4DE')
          .selectedColor('#228B22')
          .pathColor('#90EE90')
          .backgroundColor('#F5F5F5')
          .key("PatternLock")
          .accessibilityText("我是无障碍组件")
          .autoReset(true)
          .onPatternComplete((input: Array<number>) => {
            if (input === null || input === undefined || input.length < 5) {
              this.message = 'The password length needs to be greater than 5, please enter again.'
              return
            }
            if (this.passwords.length > 0) {
              if (this.passwords.toString() === input.toString()) {
                this.passwords = input
                this.message = 'Set password successfully: ' + this.passwords.toString()
              } else {
                this.message = 'Inconsistent passwords, please enter again.'
              }
            } else {
              this.passwords = input
              this.message = "Please enter again."
            }
          })

        Progress({ value: 20, total: 150, type: ProgressType.ScaleRing } as ProgressOptions)
          .color(Color.Grey)
          .value(50)
          .width(100)
          .style({ strokeWidth: 20, scaleCount: 20, scaleWidth: 5 } as ProgressStyleOptions)
          .key("Progress")
          .accessibilityText("我是无障碍组件")

        QRCode(this.value1)
          .width(200)
          .height(200)
          .key("QRCode")
          .accessibilityText("我是无障碍组件")

        Radio({ value: 'Radio1', group: 'radioGroup' } as RadioOptions)
          .checked(true)
          .height(50)
          .width(50)
          .key("Radio")
          .accessibilityText("我是无障碍组件")
          .onChange((isChecked: boolean): void => {
            console.log('Radio1 status is ' + isChecked)
          })

        Rating({ rating: this.rating, indicator: false } as RatingOptions)
          .stars(5)
          .stepSize(0.5)
          .margin({ top: 24 } as Margin)
          .key("Rating")
          .accessibilityText("我是无障碍组件")
          .onChange((value: number): void => {
            this.rating = value
          })

        // RemoteWindow(this.target as WindowAnimationTarget)
        //   .translate({ x: 100, y: 200 })
        //   .scale({ x: 0.5, y: 0.5 })
        //   .opacity(0.8)
        //   .position({ x: uiContext.px2vp(this.target?.windowBounds.left??0), y: uiContext.px2vp(this.target?.windowBounds.top??0) } as Position)
        //   .width(uiContext.px2vp(this.target?.windowBounds.width??0))
        //   .height(uiContext.px2vp(this.target?.windowBounds.height??0))
        //   .key("RemoteWindow")
        //   .accessibilityText("我是无障碍组件")

        RichText(this.data)
          .onStart(() => {
            console.info('RichText onStart');
          })
          .onComplete(() => {
            console.info('RichText onComplete');
          })
          .width(500)
          .height(400)
          .backgroundColor(0XBDDB69)
          .key("RichText")
          .accessibilityText("我是无障碍组件")

        Search({ value: this.changeValue, placeholder: 'Type to search...', controller: this.controller })
          .searchButton('SEARCH')
          .width(400)
          .height(40)
          .backgroundColor('#F5F5F5')
          .key("Search")
          .accessibilityText("我是无障碍组件")
          .placeholderColor(Color.Grey)
          .placeholderFont({ size: 14, weight: 400 })
          .textFont({ size: 14, weight: 400 })
          .onSubmit((value: string): void => {
            this.submitValue = value
          })
          .onChange((value: string): void => {
            this.changeValue = value
          })
          .margin(20)
        Slider({
          value: this.outSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.OutSet
        })
          .showTips(true)
          .onChange((value: number, mode: SliderChangeMode) => {
            this.outSetValueOne = value
            console.info('value:' + value + 'mode:' + mode.toString())
          })
          .key("Slider")
          .accessibilityText("我是无障碍组件")

        TimePicker({
          selected: this.selectedTime,
        })
          .useMilitaryTime(this.isMilitaryTime)
          .onChange((value: TimePickerResult): void => {
            this.selectedTime.setHours(value.hour, value.minute)
            console.info('select current date is: ' + JSON.stringify(value))
          })
          .key("TimePicker")
          .accessibilityText("我是无障碍组件")

        Toggle({ type: ToggleType.Switch, isOn: false })
          .selectedColor('#007DFF')
          .switchPointColor('#FFFFFF')
          .onChange((isOn: boolean) => {
            console.info('Component status:' + isOn)
          })
          .key("Toggle")
          .accessibilityText("我是无障碍组件")

        // XComponent({
        //   id: 'xcomponent',
        //   type: 'surface',
        //   controller: this.xcomponentController
        // } as XComponentOptions)
        //   .onLoad(():void => {
        //     this.xcomponentController.setXComponentSurfaceSize({ surfaceWidth: 1920, surfaceHeight: 1080 });
        //     this.surfaceId = this.xcomponentController.getXComponentSurfaceId()
        //   })
        //   .width('640px')
        //   .height('480px')
        //   .key("XComponent")
        //   .accessibilityText("我是无障碍组件")

      }
    }
  }
}