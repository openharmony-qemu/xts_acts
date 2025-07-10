/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
@Entry
@Component
struct ImageOrientation {
  @State orientation: ImageRotateOrientation | null | undefined | number = ImageRotateOrientation.UP
  @State resource: Resource = $r('app.media.ImageOrientation')

  build() {
    Column() {
      Image(this.resource)
        .width(100)
        .height(100)
        .orientation(this.orientation)
        .margin(5)
        .objectFit(ImageFit.Fill)
        .id('imageOrientation')

      Flex({wrap: FlexWrap.Wrap}) {
        Button('AUTO').height('8%').fontSize(12)
          .onClick(() => {
            this.orientation = ImageRotateOrientation.AUTO
            setTimeout(() => {
              let strJson = getInspectorByKey('imageOrientation');
              let obj: ESObject = JSON.parse(strJson);
              console.info('ImageOrientationTest_0100 ImageRotateOrientation.AUTO component obj is: ' + obj.$attrs.orientation);
            },1000)

            // this.orientation = ImageRotateOrientation.AUTO
          })
          .id('AutoID')

        Button('UP').height('8%').fontSize(12)
          .onClick(() => {
            this.orientation = ImageRotateOrientation.UP
            setTimeout(() => {
              let strJson = getInspectorByKey('imageOrientation');
              let obj: ESObject = JSON.parse(strJson);
              console.info('ImageOrientationTest_0200 ImageRotateOrientation.UP component obj is: ' + obj.$attrs.orientation);
            },1000)

          })
          .id('UpID')

        Button('DOWN').height('8%').fontSize(12)
          .onClick(() => {
            this.orientation = ImageRotateOrientation.DOWN
            let strJson = getInspectorByKey('imageOrientation');
            let obj: ESObject = JSON.parse(strJson);
            console.info('ImageOrientationTest_0300 ImageRotateOrientation.DOWN component obj is: ' + obj.$attrs.orientation);
          })
          .id('DownID')

        Button('RIGHT').height('8%').fontSize(12)
          .onClick(() => {
            this.orientation = ImageRotateOrientation.RIGHT
            let strJson = getInspectorByKey('imageOrientation');
            let obj: ESObject = JSON.parse(strJson);
            console.info('ImageOrientationTest_0400 ImageRotateOrientation.RIGHT component obj is: ' + obj.$attrs.orientation);
          })
          .id('RightID')

        Button('LEFT').height('8%').fontSize(12)
          .onClick(() => {
            this.orientation = ImageRotateOrientation.LEFT
            let strJson = getInspectorByKey('imageOrientation');
            let obj: ESObject = JSON.parse(strJson);
            console.info('ImageOrientationTest_0500 ImageRotateOrientation.LEFT component obj is: ' + obj.$attrs.orientation);
          })
          .id('LeftID')

        Button('null').height('8%').fontSize(12)
          .onClick(() => {
            this.orientation = null
            setTimeout(() => {
              let strJson = getInspectorByKey('imageOrientation');
              let obj: ESObject = JSON.parse(strJson);
              console.info('ImageOrientationTest_1000 null component obj is: ' + obj.$attrs.orientation);
            },1000)
          })
          .id('nullID')

        Button('undefined').height('8%').fontSize(12)
          .onClick(() => {
            this.orientation = undefined
            setTimeout(() => {
              let strJson = getInspectorByKey('imageOrientation');
              let obj: ESObject = JSON.parse(strJson);
              console.info('ImageOrientationTest_1100 undefined component obj is: ' + obj.$attrs.orientation);
            },1000)
          })
          .id('undefinedID')

        Button('LEFT_MIRRORED').height('8%').fontSize(12)
          .onClick(() => {
            this.orientation = ImageRotateOrientation.LEFT_MIRRORED
            let strJson = getInspectorByKey('imageOrientation');
            let obj: ESObject = JSON.parse(strJson);
            console.info('ImageOrientationTest_0600 ImageRotateOrientation.LEFT_MIRRORED component obj is: ' + obj.$attrs.orientation);
          })
          .id('LEFT_MIRRORED_ID')

        Button('RIGHT_MIRRORED').height('8%').fontSize(12)
          .onClick(() => {
            this.orientation = ImageRotateOrientation.RIGHT_MIRRORED
            let strJson = getInspectorByKey('imageOrientation');
            let obj: ESObject = JSON.parse(strJson);
            console.info('ImageOrientationTest_0700 ImageRotateOrientation.RIGHT_MIRRORED component obj is: ' + obj.$attrs.orientation);
          })
          .id('RIGHT_MIRRORED_ID')

        Button('UP_MIRRORED').height('8%').fontSize(12)
          .onClick(() => {
            this.orientation = ImageRotateOrientation.UP_MIRRORED
            let strJson = getInspectorByKey('imageOrientation');
            let obj: ESObject = JSON.parse(strJson);
            console.info('ImageOrientationTest_0800 ImageRotateOrientation.UP_MIRRORED component obj is: ' + obj.$attrs.orientation);
          })
          .id('UP_MIRRORED_ID')

        Button('DOWN_MIRRORED').height('8%').fontSize(12)
          .onClick(() => {
            this.orientation = ImageRotateOrientation.DOWN_MIRRORED
            let strJson = getInspectorByKey('imageOrientation');
            let obj: ESObject = JSON.parse(strJson);
            console.info('ImageOrientationTest_0900 ImageRotateOrientation.DOWN_MIRRORED component obj is: ' + obj.$attrs.orientation);
          })
          .id('DOWN_MIRRORED_ID')
      }.width('100%')
    }
    .width('100%')
    .height('100%')
  }
}