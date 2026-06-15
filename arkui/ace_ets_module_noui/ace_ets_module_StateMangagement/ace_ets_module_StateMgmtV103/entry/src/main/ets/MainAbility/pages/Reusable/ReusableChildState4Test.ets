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
@ComponentV2
struct ReusableChildState4 {
  @Local switchReuse: boolean = true;
  build() {
    Column() {
      Button('Switch')
        .onClick(() => {
          this.switchReuse = !this.switchReuse;
        })
      if (this.switchReuse) {
        ReusableChildState4Parent()
      }
    }
  }
}

@ReusableV2
@ComponentV2
struct ReusableChildState4Parent {
  @Local propB: string = 'b';
  build() {
    ReusableChildState4Child({
      paramB: this.propB,
    })
  }
}

@ReusableV2
@ComponentV2
struct ReusableChildState4Child {
  @Local localA: number = 0;
  @Param paramB: string = 'b';
  @Provider() providerD: number = 1;
  @Consumer() consumerE: string = 'e';
  build() {
    Text(`${this.localA} ${this.paramB} ${this.providerD} ${this.consumerE}`)
  }
}