/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
struct Monitor_Null {
  @Local class001: Moniton_Null_001 = new Moniton_Null_001();
  aboutToAppear(): void {
    this.class001.class002 = null;
  }
  @Monitor ('class001.class002.class003.x')
  onChange(mon: IMonitor) {
    mon.dirty.forEach((path: string) => {
      console.info(onChange: User property ${path} change from ${mon.value(path)?.before} to ${mon.value(path)?.now});
    });
  }
  build() {
    Text(${this.class001.class002 === null ? 'null' : 'ww'})
    .id('Monitor_Null_001')
  }
}

@ObservedV2
class Moniton_Null_001{
  @Trace class002:Moniton_Null_002 | null = new Moniton_Null_002();
}

@ObservedV2
class Moniton_Null_002{
  @Trace class003:Moniton_Null_003 = new Moniton_Null_003();
}

@ObservedV2
class Moniton_Null_003{
  @Trace x: number = 0;
}