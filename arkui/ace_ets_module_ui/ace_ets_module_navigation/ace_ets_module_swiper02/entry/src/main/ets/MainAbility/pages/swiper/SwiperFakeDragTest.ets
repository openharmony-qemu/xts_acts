/**
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
struct SwiperFakeDragTest {
  private swiperController1: SwiperController = new SwiperController();
  private swiperController2: SwiperController = new SwiperController();

  build() {
    Scroll() {
      Column({ space: 20 }) {
        Button('FakeDrag 0100')
          .id('btn_fakeDrag_0100')
          .onClick(() => {
            let ret = this.swiperController1.isFakeDragging();
            console.info('SwiperFakeDrag 0100 isFakeDragging ret = ', ret);
            AppStorage.setOrCreate('isFakeDraggingFlag', ret);
            ret = this.swiperController1.fakeDragBy(0);
            console.info('SwiperFakeDrag 0100 fakeDragBy ret = ', ret);
            AppStorage.setOrCreate('fakeDragByFlag', ret);
            ret = this.swiperController1.stopFakeDrag();
            console.info('SwiperFakeDrag 0100 stopFakeDrag ret = ', ret);
            AppStorage.setOrCreate('stopFakeDragFlag', ret);
          })

        Button('isFakeDragging 0200')
          .id('btn_isFakeDragging_0200')
          .onClick(() => {
            let ret = this.swiperController2.isFakeDragging();
            console.info('SwiperFakeDrag 0200 isFakeDragging ret = ', ret);
            AppStorage.setOrCreate('isFakeDraggingFlag', ret);
          })

        Button('startFakeDrag 0200')
          .id('btn_startFakeDrag_0200')
          .onClick(() => {
            let ret = this.swiperController2.startFakeDrag();
            console.info('SwiperFakeDrag 0200 startFakeDrag ret = ', ret);
            AppStorage.setOrCreate('startFakeDragFlag', ret);
          })

        Button('fakeDragBy 0200')
          .id('btn_fakeDragBy_0200')
          .onClick(() => {
            let ret = this.swiperController2.fakeDragBy(100);
            console.info('SwiperFakeDrag 0200 fakeDragBy ret = ', ret);
            AppStorage.setOrCreate('fakeDragByFlag', ret);
          })

        Button('stopFakeDrag 0200')
          .id('btn_stopFakeDrag_0200')
          .onClick(() => {
            let ret = this.swiperController2.stopFakeDrag();
            console.info('SwiperFakeDrag 0200 stopFakeDrag ret = ', ret);
            AppStorage.setOrCreate('stopFakeDragFlag', ret);
          })

        Swiper(this.swiperController1) {
          Column() {
            Text('可消费拖动事件的内层组件1')
          }
          .justifyContent(FlexAlign.Center)
          .backgroundColor('#D5D5D5')

          Column()
            .backgroundColor('#E3F8F9')
        }
        .width('90%')
        .height('50%')
        .id('swiper1')
        Swiper(this.swiperController2) {
          Column() {
            Text('可消费拖动事件的内层组件2')
          }
          .id('column2')
          .justifyContent(FlexAlign.Center)
          .backgroundColor('#D5D5D5')

          Column()
            .backgroundColor('#E3F8F9')
        }
        .width('90%')
        .height('50%')
        .id('swiper2')
      }
      .width('100%')
    }
  }
}