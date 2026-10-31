/**
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
async function loadDynamicWrapped(): Promise<WrappedBuilder<[string]>> {
  return wrapBuilder((await import('./wrapBuilderModule02')).dynamicBuilder);
}

async function loadIdentifierBoundWrapped(): Promise<WrappedBuilder<[string]>> {
  const builderModule2 = await import('./wrapBuilderModule02');
  return wrapBuilder(builderModule2.namespaceBuilder);
}

@Entry
@Component
struct WrapBuilder0040 {
  @State message: string = 'Hello World';
  @BuilderParam aa: (param: string) => void;
  @BuilderParam bb: (param: string) => void;

  async aboutToAppear() {
    this.aa = (await loadDynamicWrapped()).builder;
    this.bb = (await loadIdentifierBoundWrapped()).builder;
  }


  build() {
    Column() {
      this.aa('AA');
      this.bb('BB');
    }
    .height('100%')
    .width('100%')
    .justifyContent(FlexAlign.Center)
  }
}