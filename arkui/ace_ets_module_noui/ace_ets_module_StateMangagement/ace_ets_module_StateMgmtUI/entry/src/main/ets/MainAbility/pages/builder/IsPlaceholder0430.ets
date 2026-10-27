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

class TMP0430 {
  public msg: string = 'HelloBuilder'
}

@Builder({ isPlaceholder: true })
function placeholderBuilderParam0430() {
  Text('HelloBuilderParam')
    .id('tvIsPlaceholder0430BuilderParam')
    .height('5%')
}

@Builder({ isPlaceholder: true })
function placeholderWrapBuilder0430() {
  Text('HelloWrapBuilder')
    .id('tvIsPlaceholder0430WrapBuilder')
    .height('5%')
}

@Builder({ isPlaceholder: false })
function refreshWrapBuilder0430(params: TMP0430) {
  Text(params.msg)
    .id('tvIsPlaceholder0430WrapRefresh')
    .height('5%')
}

@Builder({ isPlaceholder: true })
function placeholderMutableBuilder0430A() {
  Text('HelloMutableA')
    .id('tvIsPlaceholder0430MutableA')
    .height('5%')
}

@Builder({ isPlaceholder: true })
function placeholderMutableBuilder0430B() {
  Text('HelloMutableB')
    .id('tvIsPlaceholder0430MutableB')
    .height('5%')
}

const wrappedPlaceholder0430: WrappedBuilder<[]> = wrapBuilder(placeholderWrapBuilder0430);
const wrappedRefresh0430: WrappedBuilder<[TMP0430]> = wrapBuilder(refreshWrapBuilder0430);

@Component
struct ChildIsPlaceholder0430 {
  @State message: string = 'HelloChild'

  @Builder
  doNothingBuilder() {
  }

  @BuilderParam builderParam: () => void = this.doNothingBuilder;

  build() {
    Column() {
      this.builderParam()
      Text(this.message)
        .id('tvIsPlaceholder0430ChildMessage')
        .height('5%')
      Button('Change Message')
        .id('btnIsPlaceholder0430ChildChange')
        .height('5%')
        .onClick(() => {
          this.message = 'HelloWorld'
        })
    }
  }
}

@Entry
@Component
struct IsPlaceholder0430 {
  @State tmp: TMP0430 = new TMP0430()
  @State mutableBuilderVar: MutableBuilder<[]> = mutableBuilder(placeholderMutableBuilder0430A)

  build() {
    Column() {
      ChildIsPlaceholder0430({ builderParam: placeholderBuilderParam0430 })
      wrappedPlaceholder0430.builder()
      wrappedRefresh0430.builder({ msg: this.tmp.msg })
      this.mutableBuilderVar.builder()
      Button('Change Msg')
        .id('btnIsPlaceholder0430WrapChange')
        .height('5%')
        .onClick(() => {
          this.tmp.msg = 'HelloWorld'
        })
      Button('Change Builder')
        .id('btnIsPlaceholder0430MutableChange')
        .height('5%')
        .onClick(() => {
          this.mutableBuilderVar = mutableBuilder(placeholderMutableBuilder0430B)
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}
