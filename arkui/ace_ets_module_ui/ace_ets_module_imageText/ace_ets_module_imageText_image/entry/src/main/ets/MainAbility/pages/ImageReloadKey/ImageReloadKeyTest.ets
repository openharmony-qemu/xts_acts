/**

 * Copyright (c) 2026 Huawei Device Co., Ltd.

 * Licensed under the Apache License, Version 2.0 (the 'License');

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



import { asReloadKeyParam, imageReloadKeyModifier } from '../../common/ImageReloadKeyCompat';



@Entry

@Component

struct ImageReloadKeyTest {

  build() {

    Scroll() {

      Column() {

        Text('Image reloadKey Test - Default')

          .fontSize(16)

          .margin({ top: 10, bottom: 5 })

        Image($r('app.media.icon'))

          .id('imageReloadKeyDefaultId')

          .key('imageReloadKeyDefaultId')

          .width(100)

          .height(100)



        Text('Image reloadKey Test - String')

          .fontSize(16)

          .margin({ top: 10, bottom: 5 })

        Image($r('app.media.icon'), asReloadKeyParam('key1'))

          .id('imageReloadKeyStringId')

          .key('imageReloadKeyStringId')

          .width(100)

          .height(100)



        Text('Image reloadKey Test - Empty String')

          .fontSize(16)

          .margin({ top: 10, bottom: 5 })

        Image($r('app.media.icon'), asReloadKeyParam(''))

          .id('imageReloadKeyEmptyStringId')

          .key('imageReloadKeyEmptyStringId')

          .width(100)

          .height(100)



        Text('Image reloadKey Test - Undefined')

          .fontSize(16)

          .margin({ top: 10, bottom: 5 })

        Image($r('app.media.icon'))

          .attributeModifier(imageReloadKeyModifier(undefined))

          .id('imageReloadKeyUndefinedId')

          .key('imageReloadKeyUndefinedId')

          .width(100)

          .height(100)



        Text('Image reloadKey Test - Null')

          .fontSize(16)

          .margin({ top: 10, bottom: 5 })

        Image($r('app.media.icon'))

          .attributeModifier(imageReloadKeyModifier(null))

          .id('imageReloadKeyNullId')

          .key('imageReloadKeyNullId')

          .width(100)

          .height(100)

      }

      .justifyContent(FlexAlign.Start)

      .alignItems(HorizontalAlign.Center)

    }

    .width('100%')

    .height('100%')

  }

}


