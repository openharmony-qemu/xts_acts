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

@Observed
class ObservedObject {
  public message: string = 'j';
}

@Entry
@Component
struct ReusableChildState1 {
  @State switchReuse: boolean = true;
  build() {
    Column() {
      Button('Switch')
        .onClick(() => {
          this.switchReuse = !this.switchReuse;
        })
      if (this.switchReuse) {
        ReusableChildState1Parent()
      }
    }
  }
}

@Reusable
@Component
struct ReusableChildState1Parent {
  @State stateA: number = 0;
  @State propB: string = 'b';
  @State linkC: boolean = true;
  @State provideD: number = 1;
  @State observedJ: ObservedObject = new ObservedObject();
  build() {
    ReusableChildState1Child({
      stateA: this.stateA,
      propB: this.propB,
      linkC: this.linkC,
      provideD: this.provideD,
      objectLinkJ: this.observedJ
    })
  }
}

@Component
struct ReusableChildState1Child {
  @State stateA: number = 0;
  @Prop propB: string = 'b';
  @Link linkC: boolean;
  @Provide provideD: number = 1;
  @Consume consumeE: string = 'e';
  @LocalStorageProp('lsPropF') lsPropF: boolean = true;
  @LocalStorageLink('lsLinkG') lsLinkG: number = 2;
  @StorageProp('sPropH') sPropH: string = 'h';
  @StorageLink('sLinkI') sLinkI: boolean = true;
  @ObjectLink objectLinkJ: ObservedObject;
  build() {
    Text(`${this.stateA} ${this.propB} ${this.linkC} ${this.provideD} ${this.consumeE} ${this.lsPropF} ${this.lsLinkG} ${this.sPropH} ${this.sLinkI} ${this.objectLinkJ.message}`)
  }
}