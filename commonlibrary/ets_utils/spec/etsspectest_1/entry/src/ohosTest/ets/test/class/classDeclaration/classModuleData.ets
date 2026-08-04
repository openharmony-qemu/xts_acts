/*
 * Copyright (c) 2026 SwanLink (Jiangsu) Technology Development Co., LTD.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

export class InnerData {
  public id: number
  public name: string

  constructor(id: number, name: string) {
    this.id = id
    this.name = name
  }
}

export class DataProcessor {
  public process(data: InnerData): string {
    return 'Processed: ' + data.id + ' - ' + data.name
  }

  public static transform(data: InnerData): InnerData {
    return new InnerData(data.id * 2, data.name + '_transformed')
  }
}

export class ItemContainer {
  public items: InnerData[]
  private count: number = 0

  constructor(items: InnerData[]) {
    this.items = items
    this.count = items.length
  }

  public getCount(): number {
    return this.count
  }

  public add(item: InnerData): void {
    this.items.push(item)
    this.count = this.count + 1
  }

  public findByName(name: string): InnerData | null {
    for (let i: number = 0; i < this.items.length; i++) {
      if (this.items[i].name === name) {
        return this.items[i]
      }
    }
    return null
  }
}
