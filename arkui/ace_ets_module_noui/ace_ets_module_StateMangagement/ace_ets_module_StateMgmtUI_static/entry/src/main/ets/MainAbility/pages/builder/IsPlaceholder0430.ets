'use static';
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
import {
  Builder, BuilderParam, Button, ClickEvent, Column, Component, ComponentV2, CustomBuilderT,
  Entry, FlexAlign, Local, State, Text, UIUtils, Binding,
  WrappedBuilder, wrapBuilder
} from '@kit.ArkUI';

@Builder({ isPlaceholder: true })
function placeholderBuilderParam0430(): void {
  Text('HelloBuilderParam')
    .id('tvIsPlaceholder0430BuilderParam')
    .height('5%')
}

@Builder({ isPlaceholder: true })
function placeholderWrapBuilder0430(): void {
  Text('HelloWrapBuilder')
    .id('tvIsPlaceholder0430WrapBuilder')
    .height('5%')
}

@Builder({ isPlaceholder: false })
function refreshWrapBuilder0430(msg: Binding<string>): void {
  Text(msg.value)
    .id('tvIsPlaceholder0430WrapRefresh')
    .height('5%')
}


const wrappedPlaceholder0430: WrappedBuilder<@Builder () => void> =
  new WrappedBuilder<@Builder () => void>(placeholderWrapBuilder0430);
const wrappedRefresh0430: WrappedBuilder<CustomBuilderT<Binding<string>>> =
  wrapBuilder<CustomBuilderT<Binding<string>>>(refreshWrapBuilder0430);

@Component
struct ChildIsPlaceholder0430 {
  @State message: string = 'HelloChild'

  @Builder
  doNothingBuilder(): void {
    Text('DefaultBuilder')
      .height('5%')
  }

  @BuilderParam builderParam: () => void = this.doNothingBuilder;

  build(): void {
    Column() {
      this.builderParam()
      Text(this.message)
        .id('tvIsPlaceholder0430ChildMessage')
        .height('5%')
      Button('Change Message')
        .id('btnIsPlaceholder0430ChildChange')
        .height('5%')
        .onClick((e: ClickEvent) => {
          this.message = 'HelloWorld'
        })
    }
  }
}

@Entry
@ComponentV2
struct IsPlaceholder0430 {
  @Local tmp: string = 'HelloBuilder'
  @Local mutableBuilderVar: MutableBuilder<@Builder () => void> = mutableBuilder(placeholderMutableBuilder0430A)

  build(): void {
    Column() {
      ChildIsPlaceholder0430({ builderParam: placeholderBuilderParam0430 })
      wrappedPlaceholder0430.builder()
      wrappedRefresh0430.builder(UIUtils.makeBinding(() => this.tmp))
      Button('Change Msg')
        .id('btnIsPlaceholder0430WrapChange')
        .height('5%')
        .onClick((e: ClickEvent) => {
          this.tmp = 'HelloWorld'
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}
