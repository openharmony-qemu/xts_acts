/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

@Entry
@Component
struct DoubleSidedNullAndUndefined {
  @State resultText: string = 'Init';
  @State doubleSidedValue: boolean = true;

  build() {
    Column() {
      Text('doubleSided Property Test')
        .fontWeight(FontWeight.Bold)
        .width('100%')
        .textAlign(TextAlign.Center)

      Text(this.resultText)
        .id('resultText')
        .width('90%')
        .height('5%')

      Scroll() {
        Column() {
          Row() {
            Column() {
              Stack() {
                Text('Front')
                  .fontSize(12)
                  .fontColor(Color.White)
              }
              .id('doubleSidedTrue')
              .width(80)
              .height(80)
              .backgroundColor(Color.Blue)
              .doubleSided(true)
            }
            .width('40%')
            .height('100%')

            Column() {
              Text('True')
                .id('targetDoubleSidedTrue')
                .width('100%')
                .height('100%')
                .backgroundColor('#FF0000FF')
                .textAlign(TextAlign.Center)
                .fontSize(9)
            }
            .width('20%')
            .height('100%')
          }
          .width('100%')
          .height('20%')

          Row() {
            Column() {
              Stack() {
                Text('Front')
                  .fontSize(12)
                  .fontColor(Color.White)
              }
              .id('doubleSidedFalse')
              .width(80)
              .height(80)
              .backgroundColor(Color.Green)
              .doubleSided(false)
            }
            .width('40%')
            .height('100%')

            Column() {
              Text('False')
                .id('targetDoubleSidedFalse')
                .width('100%')
                .height('100%')
                .backgroundColor('#FF0000FF')
                .textAlign(TextAlign.Center)
                .fontSize(9)
            }
            .width('20%')
            .height('100%')
          }
          .width('100%')
          .height('20%')

          Row() {
            Column() {
              Stack() {
                Text('Front')
                  .fontSize(12)
                  .fontColor(Color.White)
              }
              .id('doubleSidedUndefined')
              .width(80)
              .height(80)
              .backgroundColor(Color.Orange)
              .doubleSided(undefined)
            }
            .width('40%')
            .height('100%')

            Column() {
              Text('Undef')
                .id('targetDoubleSidedUndefined')
                .width('100%')
                .height('100%')
                .backgroundColor('#FF0000FF')
                .textAlign(TextAlign.Center)
                .fontSize(9)
            }
            .width('20%')
            .height('100%')
          }
          .width('100%')
          .height('20%')

          Row() {
            Column() {
              Stack() {
                Text('Front')
                  .fontSize(12)
                  .fontColor(Color.White)
              }
              .id('doubleSidedDefault')
              .width(80)
              .height(80)
              .backgroundColor(Color.Pink)
            }
            .width('40%')
            .height('100%')

            Column() {
              Text('Default')
                .id('targetDoubleSidedDefault')
                .width('100%')
                .height('100%')
                .backgroundColor('#FF0000FF')
                .textAlign(TextAlign.Center)
                .fontSize(9)
            }
            .width('20%')
            .height('100%')
          }
          .width('100%')
          .height('20%')

          Row() {
            Column() {
              Stack() {
                Text('Chained')
                  .fontSize(12)
                  .fontColor(Color.White)
              }
              .id('doubleSidedChained')
              .width(80)
              .height(80)
              .backgroundColor(Color.Red)
              .doubleSided(true)
              .opacity(0.8)
            }
            .width('40%')
            .height('100%')

            Column() {
              Text('Chain')
                .id('targetDoubleSidedChained')
                .width('100%')
                .height('100%')
                .backgroundColor('#FF0000FF')
                .textAlign(TextAlign.Center)
                .fontSize(9)
            }
            .width('20%')
            .height('100%')

            Column() {
              Text('Chain')
                .id('null')
                .width('100%')
                .height('100%')
                .backgroundColor('#FF0000FF')
                .textAlign(TextAlign.Center)
                .fontSize(9)
                .doubleSided(null)
            }
            .width('20%')
            .height('100%')
          }
          .width('100%')
          .height('20%')
        }
      }
      .width('100%')
      .height('85%')
    }
    .width('100%')
    .height('100%')
  }
}
