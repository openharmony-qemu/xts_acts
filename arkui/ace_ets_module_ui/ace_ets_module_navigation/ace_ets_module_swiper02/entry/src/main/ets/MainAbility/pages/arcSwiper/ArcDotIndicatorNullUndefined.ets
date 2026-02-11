// xxx.ets
import {
  CircleShape,
  ArcSwiper,
  ArcSwiperAttribute,
  ArcDotIndicator,
  ArcDirection,
  ArcSwiperController
} from '@kit.ArkUI';
// 从API version 22开始，无需手动导入ArcSwiperAttribute。具体请参考ArcSwiper的导入模块说明

class MyDataSource implements IDataSource {
  private list: Color[] = [];

  constructor(list: Color[]) {
    this.list = list;
  }

  totalCount(): number {
    return this.list.length;
  }

  getData(index: number): Color {
    return this.list[index];
  }

  registerDataChangeListener(listener: DataChangeListener): void {
  }

  unregisterDataChangeListener() {
  }
}

@Entry
@Component
struct ArcDotIndicatorNullUndefined {
  private wearableSwiperController: ArcSwiperController = new ArcSwiperController();
  private arcDotIndicator: ArcDotIndicator = new ArcDotIndicator();
  private data: MyDataSource = new MyDataSource([]);
  @State backgroundColors: Color[] =
    [Color.Green, Color.Blue, Color.Yellow, Color.Pink, Color.White, Color.Gray, Color.Orange, Color.Transparent];

  aboutToAppear(): void {
    this.data = new MyDataSource(this.backgroundColors);
    AppStorage.SetOrCreate('arcDirectionNull', this.arcDotIndicator.arcDirection(null))
    AppStorage.SetOrCreate('arcDirectionUndefined', this.arcDotIndicator.arcDirection(undefined))
    AppStorage.SetOrCreate('itemColorNull', this.arcDotIndicator.itemColor(null))
    AppStorage.SetOrCreate('itemColorUndefined', this.arcDotIndicator.itemColor(undefined))
    AppStorage.SetOrCreate('selectedItemColorNull', this.arcDotIndicator.selectedItemColor(null))
    AppStorage.SetOrCreate('selectedItemColorUndefined', this.arcDotIndicator.selectedItemColor(undefined))
    AppStorage.SetOrCreate('backgroundColorNull', this.arcDotIndicator.backgroundColor(null))
    AppStorage.SetOrCreate('backgroundColorUndefined', this.arcDotIndicator.backgroundColor(undefined))
    AppStorage.SetOrCreate('maskColorColorNull', this.arcDotIndicator.maskColor(null))
    AppStorage.SetOrCreate('maskColorColorUndefined', this.arcDotIndicator.maskColor(undefined))
    console.log('yangrong test arcDirection', this.arcDotIndicator.arcDirection(null));
    console.log('yangrong test itemColor', this.arcDotIndicator.itemColor(null));
    console.log('yangrong test selectedItemColor', this.arcDotIndicator.selectedItemColor(null));
    console.log('yangrong test backgroundColor', this.arcDotIndicator.backgroundColor(null));
    console.log('yangrong test maskColor', this.arcDotIndicator.maskColor(null));
  }

  build() {
    Column() {
      Row() {
        // ========== arcDirection with null ==========
        ArcSwiper(this.wearableSwiperController) {
          LazyForEach(this.data, (backgroundColor: Color, index: number) => {
            Text(index.toString())
              .width(233)
              .height(233)
              .backgroundColor(backgroundColor)
              .textAlign(TextAlign.Center)
              .fontSize(30)
          })
        }
        .id('arcSwiper_arcDirection_null')
        .clipShape(new CircleShape({ width: 233, height: 233 }))
        .effectMode(EdgeEffect.None)
        .indicator(this.arcDotIndicator.arcDirection(null))
        .disableSwipe(false)

        // ========== arcDirection with undefined ==========
        ArcSwiper(this.wearableSwiperController) {
          LazyForEach(this.data, (backgroundColor: Color, index: number) => {
            Text(index.toString())
              .width(233)
              .height(233)
              .backgroundColor(backgroundColor)
              .textAlign(TextAlign.Center)
              .fontSize(30)
          })
        }
        .id('arcSwiper_arcDirection_undefined')
        .clipShape(new CircleShape({ width: 233, height: 233 }))
        .effectMode(EdgeEffect.None)
        .indicator(this.arcDotIndicator.arcDirection(undefined))
        .disableSwipe(false)

        // ========== itemColor with null ==========
        ArcSwiper(this.wearableSwiperController) {
          LazyForEach(this.data, (backgroundColor: Color, index: number) => {
            Text(index.toString())
              .width(233)
              .height(233)
              .backgroundColor(backgroundColor)
              .textAlign(TextAlign.Center)
              .fontSize(30)
          })
        }
        .id('arcSwiper_itemColor_null')
        .clipShape(new CircleShape({ width: 233, height: 233 }))
        .effectMode(EdgeEffect.None)
        .indicator(this.arcDotIndicator.itemColor(null))
        .disableSwipe(false)

        // ========== itemColor with undefined ==========
        ArcSwiper(this.wearableSwiperController) {
          LazyForEach(this.data, (backgroundColor: Color, index: number) => {
            Text(index.toString())
              .width(233)
              .height(233)
              .backgroundColor(backgroundColor)
              .textAlign(TextAlign.Center)
              .fontSize(30)
          })
        }
        .id('arcSwiper_itemColor_undefined')
        .clipShape(new CircleShape({ width: 233, height: 233 }))
        .effectMode(EdgeEffect.None)
        .indicator(this.arcDotIndicator.itemColor(undefined))
        .disableSwipe(false)

        // ========== selectedItemColor with null ==========
        ArcSwiper(this.wearableSwiperController) {
          LazyForEach(this.data, (backgroundColor: Color, index: number) => {
            Text(index.toString())
              .width(233)
              .height(233)
              .backgroundColor(backgroundColor)
              .textAlign(TextAlign.Center)
              .fontSize(30)
          })
        }
        .id('arcSwiper_selectedItemColor_null')
        .clipShape(new CircleShape({ width: 233, height: 233 }))
        .effectMode(EdgeEffect.None)
        .indicator(this.arcDotIndicator.selectedItemColor(null))
        .disableSwipe(false)

        // ========== selectedItemColor with undefined ==========
        ArcSwiper(this.wearableSwiperController) {
          LazyForEach(this.data, (backgroundColor: Color, index: number) => {
            Text(index.toString())
              .width(233)
              .height(233)
              .backgroundColor(backgroundColor)
              .textAlign(TextAlign.Center)
              .fontSize(30)
          })
        }
        .id('arcSwiper_selectedItemColor_undefined')
        .clipShape(new CircleShape({ width: 233, height: 233 }))
        .effectMode(EdgeEffect.None)
        .indicator(this.arcDotIndicator.selectedItemColor(undefined))
        .disableSwipe(false)

        // ========== backgroundColor with null ==========
        ArcSwiper(this.wearableSwiperController) {
          LazyForEach(this.data, (backgroundColor: Color, index: number) => {
            Text(index.toString())
              .width(233)
              .height(233)
              .backgroundColor(backgroundColor)
              .textAlign(TextAlign.Center)
              .fontSize(30)
          })
        }
        .id('arcSwiper_backgroundColor_null')
        .clipShape(new CircleShape({ width: 233, height: 233 }))
        .effectMode(EdgeEffect.None)
        .indicator(this.arcDotIndicator.backgroundColor(null))
        .disableSwipe(false)

        // ========== backgroundColor with undefined ==========
        ArcSwiper(this.wearableSwiperController) {
          LazyForEach(this.data, (backgroundColor: Color, index: number) => {
            Text(index.toString())
              .width(233)
              .height(233)
              .backgroundColor(backgroundColor)
              .textAlign(TextAlign.Center)
              .fontSize(30)
          })
        }
        .id('arcSwiper_backgroundColor_undefined')
        .clipShape(new CircleShape({ width: 233, height: 233 }))
        .effectMode(EdgeEffect.None)
        .indicator(this.arcDotIndicator.backgroundColor(undefined))
        .disableSwipe(false)

        // ========== maskColor with null ==========
        ArcSwiper(this.wearableSwiperController) {
          LazyForEach(this.data, (backgroundColor: Color, index: number) => {
            Text(index.toString())
              .width(233)
              .height(233)
              .backgroundColor(backgroundColor)
              .textAlign(TextAlign.Center)
              .fontSize(30)
          })
        }
        .id('arcSwiper_maskColor_null')
        .clipShape(new CircleShape({ width: 233, height: 233 }))
        .effectMode(EdgeEffect.None)
        .indicator(this.arcDotIndicator.maskColor(null))
        .disableSwipe(false)

        // ========== maskColor with undefined ==========
        ArcSwiper(this.wearableSwiperController) {
          LazyForEach(this.data, (backgroundColor: Color, index: number) => {
            Text(index.toString())
              .width(233)
              .height(233)
              .backgroundColor(backgroundColor)
              .textAlign(TextAlign.Center)
              .fontSize(30)
          })
        }
        .id('arcSwiper_maskColor_undefined')
        .clipShape(new CircleShape({ width: 233, height: 233 }))
        .effectMode(EdgeEffect.None)
        .indicator(this.arcDotIndicator.maskColor(undefined))
        .disableSwipe(false)
      }.height('100%')
    }
    .width('100%')
    .height('100%')
  }
}
