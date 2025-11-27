import { App, SwiperContentInfo } from '@kit.ArkUI';

// 定义监听回调函数
function callbackFunc(info: SwiperContentInfo) {
  console.info('swiperContentUpdate', info?.id);
  AppStorage.setOrCreate('swiperContentInfo', info)
}

@Entry
@Component
struct SwiperContentUpdateTwo {
  private swiperController: SwiperController = new SwiperController();

  build() {
    Column({ space: 5 }) {
      Button('on').onClick(() => {
        console.log('swiperContentUpdateT')
        this.getUIContext().getUIObserver().onSwiperContentUpdate({ id: 'swiperId' }, callbackFunc);
      })
      Button('off').onClick(() => {
        this.getUIContext().getUIObserver().offSwiperContentUpdate({ id: 'swiperId' }, callbackFunc);
      })
      Swiper(this.swiperController) {
        Column() {
          Text("SwiperItem1")
        }.width('100%').height('100%').backgroundColor('#00CB87')

        Column() {
          Text("SwiperItem2")
        }.width('100%').height('100%').backgroundColor('#007DFF')

        Column() {
          Text("SwiperItem3")
        }.width('100%').height('100%').backgroundColor('#FFBF00')

        Column() {
          Text("SwiperItem4")
        }.width('100%').height('100%').backgroundColor('#E67C92')
      }
      .id("swiperId")
      .width('100%')
      .height('80%')
    }
  }
}