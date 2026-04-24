import { hiTraceMeter } from '@kit.PerformanceAnalysisKit';

import { BasicDataSource } from './BasicDataSource';

class MyDataSource extends BasicDataSource {
  private dataArray: string[] = [];

  public totalCount(): number {
    return this.dataArray.length;
  }

  public getData(index: number): string {
    return this.dataArray[index];
  }

  public pushData(data: string): void {
    this.dataArray.push(data);
    this.notifyDataAdd(this.dataArray.length - 1);
  }

  // 删除数据
  public deleteData(index: number, count: number): void {
    this.dataArray.splice(index, count);
    this.notifyDatasetChange([
      { type: DataOperationType.DELETE, index: index, count: count }
    ]);
  }

  public modifyAllData(): void {
    this.dataArray = this.dataArray.map((item: string) => {
      return 'Changed ' + item;
    });
    this.notifyDataReload();
  }
}

@Entry
@Component
struct MyComponent {
  private data: MyDataSource = new MyDataSource();
  scroller: Scroller = new Scroller();
  @State h: number = 50

  aboutToAppear() {
    for (let i = 0; i <= 10000; i++) {
      this.data.pushData(`Hello ${i}`);
    }
  }

  build() {
    Column({ space: 5 }) {

      Button('ScrollToIndex 20')
        .onClick(() => {
          this.scroller.scrollToIndex(20); // 滑动场景
        })

      Button('modifyAllData')
        .onClick(() => {
          this.data.modifyAllData(); //
        })

      Button('deleteData(0, 5)')
        .onClick(() => {
          this.data.deleteData(0, 5); //
        })

      Button('height(50)')
        .onClick(() => {
          this.h = 50
        })

      Button('height(20)')
        .onClick(() => {
          this.h = 20
        })

      List({ space: 3, scroller: this.scroller }) {
        LazyForEach(this.data, (item: string) => {
          ListItem() {
            ListItemComponent({ item: item, h: this.h }).borderWidth(1)
          }
        }, (item: string) => {
          return item;
        }, { releaseStrategy: LazyForEachReleaseStrategy.PROGRESSIVE })
      }.cachedCount(5)
      .height(300)
      .borderWidth(1)
      .id('LazyForEach_Item_0')

      List({ space: 3, scroller: this.scroller }) {
        LazyForEach(this.data, (item: string) => {
          ListItem() {
            ListItemComponent({ item: item, h: this.h }).borderWidth(1)
          }
        }, (item: string) => {
          return item;
        }, { releaseStrategy: LazyForEachReleaseStrategy.BATCH })
      }.cachedCount(5)
      .height(300)
      .borderWidth(1)
      .id('LazyForEach_Item_1')
    }
  }
}
// @Reusable
@Component
struct ListItemComponent {
  @Prop item: string;
  @Prop h: number;

  aboutToDisappear() {
    // 模拟耗时操作（实际开发中应避免阻塞主线程）
    hiTraceMeter.startTrace(`trace1, ${this.item}`, 1);
    console.log(`jyy Item ${this.item} disappeared with delay`);
    hiTraceMeter.finishTrace(`trace1, ${this.item}`, 1);
  }

  aboutToReuse(params: Record<string, Object | null | undefined>): void {
    console.log(`jyy abouttoreuse ${this.item}`);
  }

  aboutToAppear() {
    console.log(`jyy aboutToAppear: ${this.item}`);
  }

  aboutToRecycle(): void {
    console.log(`jyy aboutToRecycle`);
  }

  build() {
    Text(this.item)
      .fontSize(20)
      .height(this.h)
  }
}
