'use static';
import {
  Entry,
  Text,
  Column,
  Component,
  Button,
  ClickEvent,
  LengthMetrics,
  WaterFlow,
  LazyForEach,
  Color,
  TextAlign,
  Builder,
  Row,
  Blank,
  Scroller,
  ScrollState,
  OnScrollFrameBeginHandlerResult,
  ColumnOptions,
  Edge,
  EdgeEffect,
  FlexDirection,
  ConstraintSizeOptions,
  NestedScrollMode,
  NestedScrollOptions,
  Scroll,
  ForEach,
  FlowItem,
  AttributeModifier,
  WaterFlowAttribute
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
import { MyDataSource } from './MyDataSource'

@Observed
export class MyPointModifier implements AttributeModifier<WaterFlowAttribute> {
  public message: string = 'Hello World';
  public onScrollFrameBeginValue: boolean = true;
  public onScrollIndexValue: boolean = false;
  public onReachStartValue: boolean = true;
  public onReachEndValue: boolean = true;
  public frictionValue: boolean = true;
  public enableScrollInteractionValue: boolean = true;
  public layoutDirectionValue: boolean = true;
  public rowsGapValue: boolean = true;
  public columnsGapValue: boolean = true;
  public rowsTemplateValue: boolean = true;
  public columnsTemplateValue: boolean = true;
  public itemConstraintSizeValue: boolean = true;
  public nestedScrollValue: boolean = true;
  public cachedCountValue: boolean = true;

  applyNormalAttribute(instance: WaterFlowAttribute): void {
    instance
      .columnsTemplate(this.columnsTemplateValue ? '1fr 1fr' : undefined)
      .rowsTemplate(this.rowsTemplateValue ? '1fr 1fr' : undefined)
      .friction(this.frictionValue ? 20.0 : undefined)
      .enableScrollInteraction(this.enableScrollInteractionValue ? false : undefined)
      .layoutDirection(this.layoutDirectionValue ? FlexDirection.Row : undefined)
      .rowsGap(this.rowsGapValue ? 10.0 : undefined)
      .columnsGap(this.columnsGapValue ? 10.0 : undefined)
      .itemConstraintSize(this.itemConstraintSizeValue ? {
        minWidth: 100,
        maxWidth: 100,
        minHeight: 100,
        maxHeight: 100
      } as ConstraintSizeOptions : undefined)
      .nestedScroll(this.nestedScrollValue ? {
        scrollForward: NestedScrollMode.SELF_FIRST,
        scrollBackward: NestedScrollMode.SELF_FIRST
      } as NestedScrollOptions : undefined)
      .cachedCount(this.cachedCountValue ? 2 : undefined, true)
      .onScrollFrameBegin(this.onScrollFrameBeginValue ? (offset: number, state: ScrollState) => {
        this.message = 'onScrollFrameBegin';
        console.log(this.message);
        return { offsetRemain: offset } as OnScrollFrameBeginHandlerResult;
      } : undefined)
      .onScrollIndex(this.onScrollIndexValue ? (first: int, last: int) => {
        this.message = 'onScrollIndex';
        console.log(this.message);
      } : undefined)
      .onReachStart(this.onReachStartValue ? () => {
        this.message = 'onReachStart';
        console.log(this.message);
      } : undefined)
      .onReachEnd(this.onReachEndValue ? () => {
        this.message = 'onReachEnd';
        console.log(this.message);
      } : undefined)
      .padding(10)
      .height('20%')
  }
}

@Entry
@Component
struct WaterFlowModifierEventPage {
  scroller: Scroller = new Scroller();
  private arr: MyDataSource<Int> = new MyDataSource<Int>();
  @State modifier: MyPointModifier = new MyPointModifier()

  private sleep(time: int): Promise<string> {
    return new Promise<string>((resolve) => {
      setTimeout(() => {
        resolve('ok')
      }, time)
    });
  }

  build() {
    Column() {
      Text(this.modifier.message)
        .id('WaterFlowM_text')

      Column() {
        WaterFlow({ scroller: this.scroller }) {
          LazyForEach(this.arr, (item: int, index: int) => {
            Text('item' + item.toString())
              .height(64)
              .width('100%')
              .borderRadius(5)
              .backgroundColor('#ffe77e7e')
              .textAlign(TextAlign.Center)
          })
        }
        .id('WaterFlowM')
        .attributeModifier(this.modifier)
      }

      Blank().height(5)
      Column({ space: 1 } as ColumnOptions) {
        Row() {
          Button('toBottom').width('20%')
            .id('WaterFlowM_toBottom')
            .onClick((e: ClickEvent) => {
              console.log('scrollToBottom')
              this.scroller.scrollEdge(Edge.Bottom)
            })
          Button('toTop').width('20%')
            .id('WaterFlowM_toTop')
            .onClick((e: ClickEvent) => {
              console.log('scrollToBottom')
              this.scroller.scrollEdge(Edge.Top)
            })
          Button('Top').width('20%')
            .id('WaterFlowM_flingTop')
            .onClick((e: ClickEvent) => {
              this.scroller.fling(10000);
            })
          Button('Bot').width('20%')
            .id('WaterFlowM_flingBottom')
            .onClick((e: ClickEvent) => {
              this.scroller.fling(-10000);
            })
          Button('reset').width('20%')
            .id('WaterFlowM_resetText')
            .onClick((e: ClickEvent) => {
              this.modifier.message = 'Hello World';
            })
        }.height('5%')

        Row() {
          Button('onSFB').width('16%')
            .id('WaterFlowM_onScrollFrameBeginValue')
            .onClick((e: ClickEvent) => {
              this.modifier.onScrollFrameBeginValue = !this.modifier.onScrollFrameBeginValue
            })
          Button('onSI').width('16%')
            .id('WaterFlowM_onScrollIndexValue')
            .onClick((e: ClickEvent) => {
              this.modifier.onScrollIndexValue = !this.modifier.onScrollIndexValue
            })

          Button('onRS').width('16%')
            .id('WaterFlowM_onReachStart')
            .onClick((e: ClickEvent) => {
              this.modifier.onReachStartValue = !this.modifier.onReachStartValue
            })
          Button('onRE').width('16%')
            .id('WaterFlowM_onReachEnd')
            .onClick((e: ClickEvent) => {
              this.modifier.onReachEndValue = !this.modifier.onReachEndValue
            })
          Button('fri').width('16%')
            .id('WaterFlowM_friction')
            .onClick((e: ClickEvent) => {
              this.modifier.frictionValue = !this.modifier.frictionValue
            })
          Button('enable').width('16%')
            .id('WaterFlowM_enableScrollInteraction')
            .onClick((e: ClickEvent) => {
              this.modifier.enableScrollInteractionValue = !this.modifier.enableScrollInteractionValue
            })
        }.height('5%')

        Row() {
          Button('layout').width('16%')
            .id('WaterFlowM_layoutDirection')
            .onClick((e: ClickEvent) => {
              this.modifier.layoutDirectionValue = !this.modifier.layoutDirectionValue
            })
          Button('RG').width('16%')
            .id('WaterFlowM_rowsGapValue')
            .onClick((e: ClickEvent) => {
              this.modifier.rowsGapValue = !this.modifier.rowsGapValue
            })
          Button('CG').width('16%')
            .id('WaterFlowM_columnsGapValue')
            .onClick((e: ClickEvent) => {
              this.modifier.columnsGapValue = !this.modifier.columnsGapValue
            })
          Button('rowsT').width('16%')
            .id('WaterFlowM_rowsTemplateValue')
            .onClick((e: ClickEvent) => {
              this.modifier.rowsTemplateValue = !this.modifier.rowsTemplateValue
            })
          Button('colT').width('16%')
            .id('WaterFlowM_columnsTemplateValue')
            .onClick((e: ClickEvent) => {
              this.modifier.columnsTemplateValue = !this.modifier.columnsTemplateValue
            })
          Button('itemCS').width('16%')
            .id('WaterFlowM_itemConstraintSizeValue')
            .onClick((e: ClickEvent) => {
              this.modifier.itemConstraintSizeValue = !this.modifier.itemConstraintSizeValue
            })
        }.height('5%')

        Row() {
          Button('nes').width('50%')
            .id('WaterFlowM_nestedScrollValue')
            .onClick((e: ClickEvent) => {
              this.modifier.nestedScrollValue = !this.modifier.nestedScrollValue
            })
          Button('cache').width('50%')
            .id('WaterFlowM_cachedCountValue')
            .onClick((e: ClickEvent) => {
              this.modifier.cachedCountValue = !this.modifier.cachedCountValue
            })
        }.height('5%')
      }
    }
  }

  aboutToAppear(): void {
    for (let i = 0; i < 4; i++) {
      this.arr.pushData(i);
    }
  }
}