'use static';
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
  Entry, Text, Column, Row, Component, Button, ClickEvent, List, ListItem,
  Scroller, Scroll, Stack, ScrollState, Edge, FlexAlign, ForEach, TextAlign,
  Alignment, Margin, Color, EdgeEffect, ScrollDirection, BarState, OffsetResult,
  ScrollSnapOptions, ScrollSnapAlign, OnScrollFrameBeginHandlerResult, NestedScrollOptions,
  NestedScrollMode, AttributeModifier, ScrollAttribute
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import { Observed } from '@ohos.arkui.stateManagement'

@Observed
export class MyModifier implements AttributeModifier<ScrollAttribute> {
  public isEdgeEffect: boolean = true;
  public isEnablePaging: boolean = true;
  public isScrollSnap: boolean = true;
  public eventValue: string = 'value';
  public isOnWillScroll: boolean = false;
  public isOnDidScroll: boolean = false;
  public isOnScrollFrameBegin: boolean = false;
  public isOnScrollStop: boolean = false;
  public isOnScrollStart: boolean = false;
  public isOnScrollEdge: boolean = false;
  public isNestedScroll: boolean = false;
  public isEnableScrollInteraction: boolean = false;
  public isFriction: boolean = false;
  public isScrollable: boolean = false;
  public isScrollBar: boolean = false;
  public isScrollBarColor: boolean = false;
  public isScrollBarWidth: boolean = false;
  applyNormalAttribute(instance: ScrollAttribute): void {
    instance
      .width('80%')
      .height('70%')
      .initialOffset(undefined)
      .enablePaging(this.isEnablePaging ? true : undefined)
      .edgeEffect(this.isEdgeEffect ? EdgeEffect.Spring : undefined)
      .scrollSnap(this.isScrollSnap ?
        {snapAlign:ScrollSnapAlign.CENTER,
          snapPagination:100,
          enableSnapToStart:false,
          enableSnapToEnd:false} as ScrollSnapOptions : undefined)
      .onWillScroll( this.isOnWillScroll ? (xOffset: number, yOffset: number): OffsetResult => {
        this.eventValue = 'onWillScrollValue';
        return { xOffset: xOffset, yOffset: yOffset};
      } : undefined)
      .onDidScroll(this.isOnDidScroll ? () => {
        this.eventValue = 'onDidScrollValue';
      } : undefined)
      .onScrollFrameBegin(this.isOnScrollFrameBegin ?
        (offset: number, state: ScrollState): OnScrollFrameBeginHandlerResult => {
          this.eventValue = 'onScrollFrameBeginValue';
          return { offsetRemain: offset };
        } : undefined)
      .onScrollStop(this.isOnScrollStop ? () => {
        this.eventValue = 'onScrollStopValue';
      } : undefined)
      .onScrollStart(this.isOnScrollStart ? () => {
        this.eventValue = 'onScrollStartValue';
      } : undefined)
      .onScrollEdge(this.isOnScrollEdge ? () => {
        this.eventValue = 'onScrollEdgeValue';
      } : undefined)
      .nestedScroll(this.isNestedScroll ? {
        scrollForward: NestedScrollMode.PARENT_FIRST,
        scrollBackward: NestedScrollMode.SELF_FIRST
      } as NestedScrollOptions : undefined)
      .enableScrollInteraction(this.isEnableScrollInteraction ? false : undefined)
      .friction(this.isFriction ? 100.0 : undefined)
      .scrollable(this.isScrollable ? ScrollDirection.None : undefined)
      .scrollBar(this.isScrollBar ? BarState.On : undefined)
      .scrollBarColor(this.isScrollBarColor ? '#FFFF0000' : undefined)
      .scrollBarWidth(this.isScrollBarWidth ? 10.0 : undefined)
  }
}

@Entry
@Component
struct ScrollUndefinedModifier1 {
  scroller: Scroller = new Scroller();
  private arr: Array<number> = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
  @State modifier: MyModifier = new MyModifier();

  build() {
    Column() {
      Column() {
        Text('Scroll')
          .fontSize(12)
        Scroll(this.scroller) {
          Column() {
            ForEach(this.arr, (item: number) => {
              Text('Item ' + item)
                .width('90%')
                .height('20%')
                .backgroundColor(0xFFFFFF)
                .borderRadius(10)
                .fontSize(16)
                .textAlign(TextAlign.Center)
                .margin({ top: 10 } as Margin)
            })
          }
        }
        .id('scroll_action')
        .attributeModifier(this.modifier)
      }
      .width('100%')
      .height('30%')

      Text(this.modifier.eventValue)
        .id('eventValue')

      Row() {
        Button('toTop').onClick((event: ClickEvent) => {
          this.scroller.fling(3000);
        }).id('toTop').width('30%')
        Button('toBottom').onClick((event: ClickEvent) => {
          this.scroller.fling(-3000);
        }).id('toBottom').width('30%')
        Button('resetValue').onClick((event: ClickEvent) => {
          this.modifier.eventValue = 'value';
        }).id('resetValue').width('30%')
      }.height('10%')

      Row() {
        Button('scrollEdgeTop').onClick((event: ClickEvent) => {
          this.scroller.scrollEdge(Edge.Top);
        }).id('scrollUndefinedModifier_scrollEdgeTop').width('40%')
        Button('scrollEdgeBottom').onClick((event: ClickEvent) => {
          this.scroller.scrollEdge(Edge.Bottom);
        }).id('scrollUndefinedModifier_scrollEdgeBottom').width('40%')
      }.height('10%')

      Row() {
        Button('0' + this.modifier.isEdgeEffect).onClick((event: ClickEvent) => {
          this.modifier.isEdgeEffect = !this.modifier.isEdgeEffect;
        }).id('edgeEffect_action').width('25%')
        Button('2' + this.modifier.isEnablePaging).onClick((event: ClickEvent) => {
          this.modifier.isEnablePaging = !this.modifier.isEnablePaging;
        }).id('enablePaging_action').width('25%')
        Button('3' + this.modifier.isScrollSnap).onClick((event: ClickEvent) => {
          this.modifier.isScrollSnap = !this.modifier.isScrollSnap;
        }).id('scrollSnap_action').width('25%')
        Button('4' + this.modifier.isOnWillScroll).onClick((event: ClickEvent) => {
          this.modifier.isOnWillScroll = !this.modifier.isOnWillScroll;
        }).id('onWillScroll_action').width('25%')
      }.height('10%')

      Row() {
        Button('5' + this.modifier.isOnDidScroll).onClick((event: ClickEvent) => {
          this.modifier.isOnDidScroll = !this.modifier.isOnDidScroll;
        }).id('onDidScroll_action').width('25%')
        Button('6' + this.modifier.isOnScrollFrameBegin).onClick((event: ClickEvent) => {
          this.modifier.isOnScrollFrameBegin = !this.modifier.isOnScrollFrameBegin;
        }).id('onScrollFrameBegin_action').width('25%')
        Button('7' + this.modifier.isOnScrollStop).onClick((event: ClickEvent) => {
          this.modifier.isOnScrollStop = !this.modifier.isOnScrollStop;
        }).id('onScrollStop_action').width('25%')
        Button('8' + this.modifier.isOnScrollStart).onClick((event: ClickEvent) => {
          this.modifier.isOnScrollStart = !this.modifier.isOnScrollStart;
        }).id('onScrollStart_action').width('25%')
      }.height('10%')

      Row() {
        Button('9' + this.modifier.isOnScrollEdge).onClick((event: ClickEvent) => {
          this.modifier.isOnScrollEdge = !this.modifier.isOnScrollEdge;
        }).id('onScrollEdge_action').width('25%')
        Button('10' + this.modifier.isNestedScroll).onClick((event: ClickEvent) => {
          this.modifier.isNestedScroll = !this.modifier.isNestedScroll;
        }).id('nestedScroll_action').width('25%')
        Button('11' + this.modifier.isEnableScrollInteraction).onClick((event: ClickEvent) => {
          this.modifier.isEnableScrollInteraction = !this.modifier.isEnableScrollInteraction;
        }).id('enableScrollInteraction_action').width('25%')
        Button('12' + this.modifier.isFriction).onClick((event: ClickEvent) => {
          this.modifier.isFriction = !this.modifier.isFriction;
        }).id('friction_action').width('25%')
      }.height('10%')

      Row() {
        Button('13' + this.modifier.isScrollable).onClick((event: ClickEvent) => {
          this.modifier.isScrollable = !this.modifier.isScrollable;
        }).id('scrollable_action').width('25%')
        Button('14' + this.modifier.isScrollBar).onClick((event: ClickEvent) => {
          this.modifier.isScrollBar = !this.modifier.isScrollBar;
        }).id('scrollBar_action').width('25%')
        Button('15' + this.modifier.isScrollBarColor).onClick((event: ClickEvent) => {
          this.modifier.isScrollBarColor = !this.modifier.isScrollBarColor;
        }).id('scrollBarColor_action').width('25%')
        Button('16' + this.modifier.isScrollBarWidth).onClick((event: ClickEvent) => {
          this.modifier.isScrollBarWidth = !this.modifier.isScrollBarWidth;
        }).id('scrollBarWidth_action').width('25%')
      }.height('10%')
    }
    .width('100%')
    .height('100%')
  }
}