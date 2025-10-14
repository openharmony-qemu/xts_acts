/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
  Component,
  Column,
  Flex,
  Row,
  Text,
  Color,
  ListScroller,
  Builder,
  Margin,
  List,
  VisibleListContentInfo,
  ScrollState,
  Button,
  ClickEvent,
  Scroller,
  Padding,
  ForEach,
  Axis,
  BarState,
  EdgeEffect,
  ScrollAlign,
  ColumnOptions,
  ListItem,
  TextAlign,
  Stack,
  ListItemStyle,
  ListItemGroup,
  Divider
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

class WordGroup {
  title: string;
  words: string[];

  constructor(title: string, words: string[]) {
    this.title = title;
    this.words = words;
  }
}

@Entry
@Component
struct WordListSample {
  wordsGroup: WordGroup[] = [
    new WordGroup('A', ['Apple', 'App', 'An', 'Ace']),
    new WordGroup('B', ['Banana', 'Blackberry', 'Blue']),
    new WordGroup('C', ['Cake', 'Chicken', 'Class']),
    new WordGroup('D', ['Dark', 'Dress', 'Dance', 'Dear', 'Date', 'Department', 'Dog', 'Damage', 'Decade',
      'Drum', 'Daisy', 'Deity'])
  ]
  illegalGroupNo: number[] = [this.wordsGroup.length + 1, 0] as number[];
  illegalIndexNo: number[] = [0, -5] as number[];
  scrollAlignStyle: ScrollAlign[] = [
    ScrollAlign.START,
    ScrollAlign.CENTER,
    ScrollAlign.END,
    ScrollAlign.AUTO
  ]
  listScroller: ListScroller = new ListScroller()

  @Builder
  itemHead(text: string) {
    Text(text)
      .fontSize(20)
      .backgroundColor('#fff1f3f5')
      .width('100%')
      .padding(5)
  }

  @Builder
  itemFoot(num: number) {
    Text('ItemCount:' + num)
      .fontSize(16)
      .backgroundColor(0xAABBCC)
      .width("100%")
      .padding(5)
  }

  build() {
    Column({ space: 10 } as ColumnOptions) {
      List({ space: 5 }) {
        ForEach(this.wordsGroup, (item: WordGroup) => {
          ForEach(item.words, (word: string) => {
            ListItem({ style: ListItemStyle.NONE }) {
              Button('Item_' + item.title + "_" + word)
                .backgroundColor(Color.Green)
                .onClick((e: ClickEvent) => {
                  console.info('WordListSample group:' + this.wordsGroup.indexOf(item) + ' ' +
                    'index:' + item.words.indexOf(word))
                  this.listScroller.scrollToItemInGroup(
                    Double.toInt(this.wordsGroup.indexOf(item)),
                    Double.toInt(item.words.indexOf(word)), true,
                    this.scrollAlignStyle[this.wordsGroup.indexOf(item).toInt()])
                })
                .key('Btn_' + this.wordsGroup.indexOf(item) + '_' + item.words.indexOf(word))
            }
          })
        })
        
        ListItem({ style: ListItemStyle.NONE }) {
          Button('Item_GroupNo_Not' + "_" + "Exsit")
            .backgroundColor(Color.Red)
            .onClick((e: ClickEvent) => {
              this.listScroller.scrollToItemInGroup(
                Double.toInt(this.illegalGroupNo[0]),
                Double.toInt(this.illegalGroupNo[1]), true,
                ScrollAlign.AUTO)
            })
            .key('Btn_' + 'Err_' + 'Group')
        }

        
        ListItem({ style: ListItemStyle.NONE }) {
          Button('Item_IndexNo_Not' + "_" + "Exsit")
            .backgroundColor(Color.Red)
            .onClick((e: ClickEvent) => {
              this.listScroller.scrollToItemInGroup(
                Double.toInt(this.illegalIndexNo[0]),
                Double.toInt(this.illegalIndexNo[1]), true,
                ScrollAlign.AUTO)
            })
            .key('Btn_' + 'Err_' + 'Index')
        }
      }.lanes(4)

      Text("words-table")
        .textAlign(TextAlign.Start)
        .width('100%')
        .fontSize(25)
        .backgroundColor('#fff1f3f5')
        .borderRadius(10)

      Stack() {
        List({ initialIndex: 0, scroller: this.listScroller }) {
          ForEach(this.wordsGroup, (item: WordGroup, index: int) => {
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
          })
        }
        .key('MyList1')
        .scrollBar(BarState.On)
        .divider({
          strokeWidth: 4,
          color: '#ff0000ff'
        })

        Divider().strokeWidth(1).backgroundColor(Color.Red).key('CenterLine')
      }
    }
    .width('100%').height('100%').backgroundColor(0xDCDCDC).padding({ top: 5 } as Padding)
  }
}